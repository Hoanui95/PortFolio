
#include "Oscillator.h"

constexpr int kDefaultFrameRate = 48000;
constexpr float kDefaultAmplitude = 0.01;
constexpr float kDefaultFrequency = 440.0;
constexpr double kTwoPi = M_PI * 2;

Oscillator::Oscillator() {
    setup(kDefaultFrequency, kDefaultFrameRate, kDefaultAmplitude);
}

void Oscillator::setup(double frequency, int32_t frameRate) {
    mFrameRate = frameRate;
    mPhaseIncrement = getPhaseIncremement(frequency);
}

void Oscillator::setup(double frequency, int32_t frameRate, float amplitude) {
    setup(frequency, frameRate);
    mAmplitude = amplitude;
}

void Oscillator::setup(double frequency) {
    mPhaseIncrement = getPhaseIncremement(frequency);
    mFrequency = frequency;
    isMuted = false;
}

void Oscillator::render(int16_t *buffer, int32_t channelStride, int32_t numFrames, EnvelopeGenerator *mEnveloppe, Filter *mFilter, Distortion* dist)
{
    int sampleIndex = 0;
    switch (mWave)
    {
        case 0:
            for (int i = 0; i < numFrames; i++) {
                if(distortion)
                {
                    buffer[sampleIndex] = (int16_t) (INT16_MAX * dist->processSample(mFilter->process(sinf(mPhase)) * mAmplitude * mEnveloppe->nextSample()));
                } else
                {
                    buffer[sampleIndex] = (int16_t) (INT16_MAX * mFilter->process(sinf(mPhase) * mAmplitude * mEnveloppe->nextSample()));
                }
                sampleIndex += channelStride;
                advancePhase();

            }
            break;
        case 1:
            for (int i = 0; i < numFrames; i++) {
                if(distortion)
                {
                    buffer[sampleIndex] = (int16_t) (INT16_MAX *  dist->processSample(mFilter->process((1.0 - (2.0 * mPhase / kTwoPi))) * mAmplitude * mEnveloppe->nextSample()));

                } else
                {
                    buffer[sampleIndex] = (int16_t) (INT16_MAX *  mFilter->process((1.0 - (2.0 * mPhase / kTwoPi)) * mAmplitude * mEnveloppe->nextSample()));
                }

                sampleIndex += channelStride;
                advancePhase();

            }
            break;
        case 2:
            for (int i = 0; i < numFrames; i++) {
                double value = -1.0 + (2.0 * mPhase / kTwoPi) ;
                if(distortion)
                {
                    buffer[sampleIndex] = (int16_t) (INT16_MAX * dist->processSample(mFilter->process((2.0 * (fabs(value) - 0.5)) * mAmplitude * mEnveloppe->nextSample())));
                }
                else
                {
                    buffer[sampleIndex] = (int16_t) (INT16_MAX * mFilter->process((2.0 * (fabs(value) - 0.5)) * mAmplitude * mEnveloppe->nextSample()));
                }

                sampleIndex += channelStride;
                advancePhase();
            }
            break;

    }
}

void Oscillator::advancePhase() {
    mPhase += mPhaseIncrement;
    while (mPhase >= kTwoPi) {
        mPhase -= kTwoPi;
    }
    if (mSweeping) {
        if (mGoingUp) {
            mPhaseIncrement *= mUpScaler;
            if (mPhaseIncrement > mPhaseIncrementHigh) {
                mGoingUp = false;
            }
        } else {
            mPhaseIncrement *= mDownScaler;
            if (mPhaseIncrement < mPhaseIncrementLow) {
                mGoingUp = true;
            }
        }
    }
}

double Oscillator::getPhaseIncremement(double frequency) {
    return frequency * kTwoPi / mFrameRate;
}

void Oscillator::changeWave(int value)
{
    mWave = value;
}


void Oscillator::setDistortion(bool state) {
    distortion = state;
}