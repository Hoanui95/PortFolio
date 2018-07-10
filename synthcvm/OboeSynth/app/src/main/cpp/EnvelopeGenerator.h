//
// Created by Hoanui on 2018-04-22.
//

#ifndef OBOESYNTH_ENVELOPEGENERATOR_H
#define OBOESYNTH_ENVELOPEGENERATOR_H
#include <cmath>
#include <oboe/Oboe.h>

class EnvelopeGenerator {
public:
    enum EnvelopeStage {
        ENVELOPE_STAGE_OFF = 0,
        ENVELOPE_STAGE_ATTACK,
        ENVELOPE_STAGE_DECAY,
        ENVELOPE_STAGE_SUSTAIN,
        ENVELOPE_STAGE_RELEASE,
        kNumEnvelopeStages
    };
    void enterStage(EnvelopeStage newStage);
    double nextSample();
    void setSampleRate(int32_t newSampleRate);
    inline EnvelopeStage getCurrentStage() const { return currentStage; };
    const double minimumLevel;

    EnvelopeGenerator() :
            minimumLevel(0.0001),
            currentStage(ENVELOPE_STAGE_OFF),
            currentLevel(minimumLevel),
            multiplier(1.0),
            sampleRate(48000.0),
            currentSampleIndex(0),
            nextStageSampleIndex(0) {
        stageValue[ENVELOPE_STAGE_OFF] = 0.0;
        stageValue[ENVELOPE_STAGE_ATTACK] = 0.01;
        stageValue[ENVELOPE_STAGE_DECAY] = 0.5;
        stageValue[ENVELOPE_STAGE_SUSTAIN] = 0.1;
        stageValue[ENVELOPE_STAGE_RELEASE] = 1.0;
    };

    void setStageValue(EnvelopeStage stage, double value);
    inline void reset() {
        currentStage = ENVELOPE_STAGE_OFF;
        currentLevel = minimumLevel;
        multiplier = 1.0;
        currentSampleIndex = 0;
        nextStageSampleIndex = 0;};


private:
    EnvelopeStage currentStage;
    double currentLevel;
    double multiplier;
    int32_t sampleRate;
    double stageValue[kNumEnvelopeStages];
    void calculateMultiplier(double startLevel, double endLevel, unsigned long long lengthInSamples);
    unsigned long long currentSampleIndex;
    unsigned long long nextStageSampleIndex;
};
#endif //OBOESYNTH_ENVELOPEGENERATOR_H
