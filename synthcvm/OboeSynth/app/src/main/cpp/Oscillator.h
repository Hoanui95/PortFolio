
#ifndef OBOESYNTH_OSCILLATOR_H
#define OBOESYNTH_OSCILLATOR_H

#include <math.h>
#include <cstdint>
#include "Filter.h"
#include "EnvelopeGenerator.h"
#include "Distortion.h"

class Oscillator
{
public:
    Oscillator();
    ~Oscillator() = default;

    void setup(double frequency, int32_t frameRate);

    void setup(double frequency, int32_t frameRate, float amplitude);
   
    void setup(double frequency);

    void render(int16_t *buffer, int32_t channelStride, int32_t numFrames, EnvelopeGenerator* mEnveloppe, Filter* mFilter, Distortion* dist);

    void changeWave(int value);

    inline void reset() { mPhase = 0.0; isMuted = true; mFrequency = 0.0;};
    inline void setMuted(bool mute){isMuted = mute;};
    void setDistortion(bool state);


private:
    double mAmplitude;
    double mPhase = 0.0;
    int32_t mFrameRate;
    double mFrequency = 0.0;
    double mPhaseIncrement;
    double mPhaseIncrementLow;
    double mPhaseIncrementHigh;
    double mUpScaler = 1.0;
    double mDownScaler = 1.0;
    bool   mGoingUp = false;
    bool   mSweeping = false;
    bool isMuted = true;
    int mWave = 0;
    bool distortion = false;


    void advancePhase();

    double getPhaseIncremement(double frequency);
};


#endif //PART1_OSCILLATOR_H
