//
// Created by Hoanui on 2018-04-30.
//

#include "Distortion.h"

Distortion::Distortion() {
    controls.mode = 1;
    controls.drive = 10.0;
    controls.mix = 1.0;
    controls.threshold = 0.8;
}

Distortion::~Distortion() {}

double Distortion::processSample(double sample)
{
    input = sample;
    output = input * controls.drive;

    switch (controls.mode) {
        case 1:
            output = softClip(output);
            break;
        case 2:
            output = hardClip(output);
            break;
        case 3:
            output = cubicWaveShaper(output);
            break;
        default:
            output = input;
            break;
    }

    return (1.f - controls.mix) * input + controls.mix * output;
}

// soft-clip
double Distortion::softClip(double sample)
{
    if (sample < -1.f) {
        return -softClipThreshold;
    }
    else if (sample > 1.f) {
        return softClipThreshold;
    }
    else {
        return sample - ((sample * sample * sample) / 3.f);
    }
}

// Hard-clip
double Distortion::hardClip(double sample)
{
    if (sample < -1.f) {
        return -1.f;
    }
    else if (sample > 1.f) {
        return 1.f;
    }
    else {
        return sample;
    }
}
// CubicWaveShaper
double Distortion::cubicWaveShaper(double sample)
{
    return 1.5f * sample - 0.5f * sample * sample * sample;
}

void Distortion::setMode(int mode)
{
    controls.mode = mode;
}
void Distortion::setDrive(double drive)
{
    controls.drive = drive;
}
void Distortion::setTreshold(double threshold)
{
    controls.threshold = threshold;
}
void Distortion::setMix(double mix)
{
    controls.mix = mix;
}