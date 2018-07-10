


//
// Created by Hoanui on 2018-02-25.
//

#include <inttypes.h>

#include "AudioEngine.h"
#include "logging_macros.h"

constexpr int64_t kNanosPerMillisecond = 1000000;
constexpr int32_t kDefaultChannelCount = 1;


PlayAudioEngine::PlayAudioEngine(int mFrameRate, int mFramesPerBuffer) {

    mChannelCount = kDefaultChannelCount;
    mSampleRate = (uint32_t) mFrameRate;
    bufferSize = (uint32_t) mFramesPerBuffer;

    createPlaybackStream();


}

PlayAudioEngine::~PlayAudioEngine() {

    closeOutputStream();
}

/**
 * Creation d'un audiostream
 */
void PlayAudioEngine::createPlaybackStream() {

    oboe::AudioStreamBuilder builder;
    setupPlaybackStreamParameters(&builder);

    oboe::Result result = builder.openStream(&mPlayStream);

    if (result == oboe::Result::OK && mPlayStream != nullptr) {

        mFramesPerBurst = mPlayStream->getFramesPerBurst();

        int channelCount = mPlayStream->getChannelCount();
        if (channelCount != mChannelCount){
            LOGW("Requested %d channels but received %d", mChannelCount, channelCount);
        }
        mPlayStream->setBufferSizeInFrames(mFramesPerBurst);

        // TODO: Implement Oboe_convertStreamToText
        prepareOscillators();


        mLatencyTuner = std::unique_ptr<oboe::LatencyTuner>(new oboe::LatencyTuner(*mPlayStream));
        result = mPlayStream->requestStart();
        if (result != oboe::Result::OK) {
            LOGE("Error starting stream. %s", oboe::convertToText(result));
        }

        mIsLatencyDetectionSupported = (mPlayStream->getTimestamp(CLOCK_MONOTONIC, 0, 0) !=
                                        oboe::Result::ErrorUnimplemented);

    } else {
        LOGE("Failed to create stream. Error: %s", oboe::convertToText(result));
    }
}

void PlayAudioEngine::prepareOscillators() {

    double frequency = 0;
    constexpr double interval = 110.0;
    constexpr float amplitude = 0.25;

    for (Oscillator &osc : mOscillators){
        osc.setup(frequency, mSampleRate, amplitude);
        frequency += interval;
    }

    for (EnvelopeGenerator &env : mEnvelopeGenerator){
        env.setSampleRate(mSampleRate);
    }

}

void PlayAudioEngine::setupPlaybackStreamParameters(oboe::AudioStreamBuilder *builder) {
    builder->setAudioApi(mAudioApi);
    builder->setDeviceId(mPlaybackDeviceId);
    builder->setChannelCount(mChannelCount);

    builder->setSharingMode(oboe::SharingMode::Exclusive);
    builder->setPerformanceMode(oboe::PerformanceMode::LowLatency);
    builder->setCallback(this);
}

void PlayAudioEngine::closeOutputStream() {

    if (mPlayStream != nullptr) {
        oboe::Result result = mPlayStream->requestStop();
        if (result != oboe::Result::OK) {
            LOGE("Error stopping output stream. %s", oboe::convertToText(result));
        }

        result = mPlayStream->close();
        if (result != oboe::Result::OK) {
            LOGE("Error closing output stream. %s", oboe::convertToText(result));
        }
    }
}

//met en marche ou éteint l'oscillateur
void PlayAudioEngine::setToneOn(bool isToneOn, double frequency) {

    if(isToneOn)
    {
        isPlaying = true;
        freq = frequency;
        constexpr double interval = 110.0;
        for (Oscillator &osc : mOscillators){
            osc.reset();
            osc.setup(frequency);
            osc.setMuted(false);
            frequency += interval;
        }

        for (EnvelopeGenerator &env : mEnvelopeGenerator){
            env.enterStage(static_cast<EnvelopeGenerator::EnvelopeStage>(1));
        }

    }
    else
    {
        isPlaying = false;
        freq = 0;
        for (EnvelopeGenerator &env : mEnvelopeGenerator){
            env.enterStage(static_cast<EnvelopeGenerator::EnvelopeStage>(4));
        }

    }
}


oboe::DataCallbackResult
PlayAudioEngine::onAudioReady(oboe::AudioStream *audioStream, void *audioData, int32_t numFrames) {

    int32_t underrunCount = audioStream->getXRunCount();

    int32_t channelCount = audioStream->getChannelCount();


    for (int i = 0; i < channelCount; ++i)
    {
        mOscillators[i].render(static_cast<int16_t *>(audioData) + i, channelCount, numFrames, &mEnvelopeGenerator[i], &mFilter[i], &mDistortion[i]);
    }

    if (mIsLatencyDetectionSupported) {
        calculateCurrentOutputLatencyMillis(audioStream, &mCurrentOutputLatencyMillis);
    }

    return oboe::DataCallbackResult::Continue;
}

oboe::Result
PlayAudioEngine::calculateCurrentOutputLatencyMillis(oboe::AudioStream *stream,
                                                     double *latencyMillis) {


    int64_t existingFrameIndex;
    int64_t existingFramePresentationTime;
    oboe::Result result = stream->getTimestamp(CLOCK_MONOTONIC,
                                               &existingFrameIndex,
                                               &existingFramePresentationTime);

    if (result == oboe::Result::OK) {

        int64_t writeIndex = stream->getFramesWritten();
        int64_t frameIndexDelta = writeIndex - existingFrameIndex;
        int64_t frameTimeDelta = (frameIndexDelta * oboe::kNanosPerSecond) / mSampleRate;
        int64_t nextFramePresentationTime = existingFramePresentationTime + frameTimeDelta;


        using namespace std::chrono;
        int64_t nextFrameWriteTime =
                duration_cast<nanoseconds>(steady_clock::now().time_since_epoch()).count();

        *latencyMillis = (double) (nextFramePresentationTime - nextFrameWriteTime)
                         / kNanosPerMillisecond;
    } else {
        LOGE("Error calculating latency: %s", oboe::convertToText(result));
    }

    return result;
}

void PlayAudioEngine::onErrorAfterClose(oboe::AudioStream *oboeStream, oboe::Result error) {
    if (error == oboe::Result::ErrorDisconnected) restartStream();
}

void PlayAudioEngine::restartStream() {

    LOGI("Restarting stream");

    if (mRestartingLock.try_lock()) {
        closeOutputStream();
        createPlaybackStream();
        mRestartingLock.unlock();
    } else {
        LOGW("Restart stream operation already in progress - ignoring this request");
    }
}

//fonctions qui change les paramètres dy synthétiseur
void PlayAudioEngine::changeWave(int value)
{
    for (Oscillator &osc : mOscillators){
        osc.changeWave(value);
    }
}
void PlayAudioEngine::changeFilter(int value)
{
    if(value == 0)
    {
        for(Filter &fil : mFilter)
        {
            fil.setFilterMode(static_cast<Filter::FilterMode>(0));
        }

    }
    else if(value == 1)
    {
        for(Filter &fil : mFilter)
        {
            fil.setFilterMode(static_cast<Filter::FilterMode>(1));
        }
    }
    else if(value == 2)
    {
        for(Filter &fil : mFilter)
        {
            fil.setFilterMode(static_cast<Filter::FilterMode>(2));
        }
    }
}
void PlayAudioEngine::paramKnob(double value, int indexKnob)
{
    if(indexKnob == 0)
    {
        for (EnvelopeGenerator &env : mEnvelopeGenerator){
            env.setStageValue(static_cast<EnvelopeGenerator::EnvelopeStage>(1), value);
        }
    }
    else if(indexKnob == 1)
    {
        for (EnvelopeGenerator &env : mEnvelopeGenerator){
            env.setStageValue(static_cast<EnvelopeGenerator::EnvelopeStage>(2), value);
        }
    }
    else if(indexKnob == 2)
    {
        for (EnvelopeGenerator &env : mEnvelopeGenerator){
            env.setStageValue(static_cast<EnvelopeGenerator::EnvelopeStage>(3), value);
        }
    }
    else if(indexKnob == 3)
    {
        for (EnvelopeGenerator &env : mEnvelopeGenerator){
            env.setStageValue(static_cast<EnvelopeGenerator::EnvelopeStage>(4), value);
        }
    }
    else if(indexKnob == 4)
    {

        for(Filter &fil : mFilter)
        {
            fil.setCutoff(value);
        }
    }
    else if(indexKnob == 5)
    {
        for(Filter &fil : mFilter)
        {
            fil.setResonance(value);
        }
    }

}

void PlayAudioEngine::setPitch(double pitch, double frequency)
{
    for(Oscillator &osc : mOscillators)
    {
        osc.setup(frequency + pitch);
        pitch += 110.0;
    }
}


void PlayAudioEngine::setDistortion(bool state)
{
    for(Oscillator &osc : mOscillators)
    {
        osc.reset();
        osc.setDistortion(state);
    }
}

void PlayAudioEngine::setParameterDistortion(int index, double value)
{
    if(index == 1)
    {
        for(Distortion &dis : mDistortion)
        {
            dis.setMode((int)value);
        }
    }
    else if(index == 2)
    {
        for(Distortion &dis : mDistortion)
        {
            dis.setDrive(value);
        }
    }
    else if(index == 3)
    {
        for(Distortion &dis : mDistortion)
        {
            dis.setTreshold(value);
        }
    }
    else if(index == 4)
    {
        for(Distortion &dis : mDistortion)
        {
            dis.setMix(value);
        }
    }
}

//Savoir si l'engin audio est utilisé
bool PlayAudioEngine::getPlay()
{
    return isPlaying;
}

//retourne la frequence (sert pour l'identification de l'oscillateur qui est deja joué)
double PlayAudioEngine::getFreq()
{
    return freq;
}

