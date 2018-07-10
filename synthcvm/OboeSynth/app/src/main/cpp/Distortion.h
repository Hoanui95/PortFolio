//
// Created by Hoanui on 2018-04-30.
//

#ifndef OBOESYNTH_DISTORTION_H
#define OBOESYNTH_DISTORTION_H

#include <cmath>

class Distortion
{
public:
    struct Controls {
        int mode;
        double drive;
        double threshold;
        double mix;
    } controls;

    Distortion();
    ~Distortion();
    double processSample(double sample);
    void setMode(int mode);
    void setDrive(double drive);
    void setTreshold(double threshold);
    void setMix(double mix);

private:

    double input, output = 0.f;
    double softClipThreshold = 2.f / 3.f;


    double softClip(double sample);
    double hardClip(double sample);
    double cubicWaveShaper(double sample);
};

#endif //OBOESYNTH_DISTORTION_H
