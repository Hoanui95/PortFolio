

#include <jni.h>
#include "AudioEngine.h"
#include "logging_macros.h"

extern "C" {

/**
 * Création de l'engin audio
 */
JNIEXPORT jlong JNICALL
Java_hoanui_oboesynth_AudioUtils_native_1createEngine(
        JNIEnv *env,
        jclass, jint mFrameRate, jint mFramesPerBuffer) {

    PlayAudioEngine *engine = new(std::nothrow) PlayAudioEngine(mFrameRate, mFramesPerBuffer);
    return (jlong) engine;
}

/**
 * Supprimer l'engin audio
 */

JNIEXPORT void JNICALL
Java_hoanui_oboesynth_AudioUtils_native_1deleteEngine(
        JNIEnv *env,
        jclass,
        jlong engineAlreadyCreate) {

    delete (PlayAudioEngine *) engineAlreadyCreate;
}

/**
 * jouer ou arreter le son de l'engin audio
 */

JNIEXPORT void JNICALL
Java_hoanui_oboesynth_AudioUtils_native_1setToneOn(
        JNIEnv *env,
        jclass,
        jlong engineAlreadyCreate,
        jboolean isToneOn, jdouble frequency) {

    PlayAudioEngine *engine = (PlayAudioEngine *) engineAlreadyCreate;
    engine->setToneOn(isToneOn, frequency);
}

/**
 * changer forme du signal
 */

JNIEXPORT void JNICALL
Java_hoanui_oboesynth_AudioUtils_native_1changeWave(
        JNIEnv *env,
        jclass,
        jlong engineAlreadyCreate, jint wave) {

    PlayAudioEngine *engine = (PlayAudioEngine *) engineAlreadyCreate;
    engine->changeWave(wave);
}
/**
 * changer le mode du filtre
 */
JNIEXPORT void JNICALL
Java_hoanui_oboesynth_AudioUtils_native_1changeFilter(
        JNIEnv *env,
        jclass,
        jlong engineAlreadyCreate, jint filter) {

    PlayAudioEngine *engine = (PlayAudioEngine *) engineAlreadyCreate;
    engine->changeFilter(filter);
}
/**
 * changer les parametres de l'enveloppe sonore, du cutOff et de la resonnance
 */
JNIEXPORT void JNICALL
Java_hoanui_oboesynth_AudioUtils_native_1paramKnob(
        JNIEnv *env,
        jclass,
        jlong engineAlreadyCreate, jdouble value, jint indexKnob) {

    PlayAudioEngine *engine = (PlayAudioEngine *) engineAlreadyCreate;
    engine->paramKnob(value, indexKnob);
}
/**
 * changer la frequence avec la molette pitch bend
 */
JNIEXPORT void JNICALL
Java_hoanui_oboesynth_AudioUtils_native_1setPicth(
        JNIEnv *env,
        jclass,
        jlong engineAlreadyCreate, jdouble pitch, jdouble frequency) {

    PlayAudioEngine *engine = (PlayAudioEngine *) engineAlreadyCreate;
    engine->setPitch(pitch, frequency);
}

/**
 * activer ou desactiver la distorsion
 */
JNIEXPORT void JNICALL
Java_hoanui_oboesynth_AudioUtils_native_1setDistortion(
        JNIEnv *env,
        jclass,
        jlong engineAlreadyCreate, jboolean state) {

    PlayAudioEngine *engine = (PlayAudioEngine *) engineAlreadyCreate;
    engine->setDistortion(state);
}

/**
 * changer le drive de la distorsion
 */
JNIEXPORT void JNICALL
Java_hoanui_oboesynth_AudioUtils_native_1setParameterDistortion(
        JNIEnv *env,
        jclass,
        jlong engineAlreadyCreate, jint index, jdouble value) {

    PlayAudioEngine *engine = (PlayAudioEngine *) engineAlreadyCreate;
    engine->setParameterDistortion(index, value);
}
/**
 * savoir si un engin audio est deja utilisé ou pas
 */
JNIEXPORT jboolean JNICALL
Java_hoanui_oboesynth_AudioUtils_native_1getPlay(
        JNIEnv *env,
        jclass, jlong engineAlreadyCreate) {

    PlayAudioEngine *engine = (PlayAudioEngine *) engineAlreadyCreate;
    return (jboolean) engine->getPlay();
}

/**
 * savoir la note de l'engin audio
 */
JNIEXPORT jdouble JNICALL
Java_hoanui_oboesynth_AudioUtils_native_1getFreq(
        JNIEnv *env,
        jclass, jlong engineAlreadyCreate) {

    PlayAudioEngine *engine = (PlayAudioEngine *) engineAlreadyCreate;
    return (jdouble) engine->getFreq();
}

}
