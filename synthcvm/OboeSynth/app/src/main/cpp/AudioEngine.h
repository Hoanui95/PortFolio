//
// Created by Hoanui on 2018-02-25.
//

#ifndef OBOESYNTH_AUDIOENGINE_H
#define OBOESYNTH_AUDIOENGINE_H

#include <thread>
#include <array>
#include <oboe/Oboe.h>
#include "Oscillator.h"
#include "EnvelopeGenerator.h"
#include "Filter.h"
#include "Distortion.h"
#include <mutex>


constexpr int32_t kBufferSizeAutomatic = 0;
constexpr int32_t kMaximumChannelCount = 1;
;

class PlayAudioEngine : oboe::AudioStreamCallback {

public:
    PlayAudioEngine(int mFrameRate, int mFramesPerBuffer);

    ~PlayAudioEngine();

    void setToneOn(bool isToneOn, double frequency);


    oboe::DataCallbackResult
    onAudioReady(oboe::AudioStream *audioStream, void *audioData, int32_t numFrames);

    void onErrorAfterClose(oboe::AudioStream *oboeStream, oboe::Result error);

    void paramKnob(double value, int indexKnob);
    void changeWave(int value);
    void changeFilter(int value);
    void setPitch(double pitch, double frequency);
    void setDistortion(bool state);
    void setParameterDistortion(int index, double value);
    bool getPlay();
    double getFreq();

private:
    oboe::AudioApi mAudioApi = oboe::AudioApi::Unspecified;
    int32_t mPlaybackDeviceId = oboe::kUnspecified;
    int32_t mSampleRate;
    int32_t bufferSize;
    int32_t mChannelCount;
    int32_t mFramesPerBurst;
    double mCurrentOutputLatencyMillis = 0;
    bool mIsLatencyDetectionSupported = false;
    oboe::AudioStream *mPlayStream;
    std::unique_ptr<oboe::LatencyTuner> mLatencyTuner;
    std::mutex mRestartingLock;


    std::array<Oscillator, kMaximumChannelCount> mOscillators;
    std::array<EnvelopeGenerator, kMaximumChannelCount> mEnvelopeGenerator;
    std::array<Filter, kMaximumChannelCount> mFilter;
    std::array<Distortion, kMaximumChannelCount> mDistortion;
    double freq = 0;
    bool isPlaying = false;
    void createPlaybackStream();

    void closeOutputStream();

    void restartStream();

    void setupPlaybackStreamParameters(oboe::AudioStreamBuilder *builder);

    void prepareOscillators();

    oboe::Result calculateCurrentOutputLatencyMillis(oboe::AudioStream *stream, double *latencyMillis);


};

#endif //OBOESYNTH_AUDIOENGINE_H
