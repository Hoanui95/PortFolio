package hoanui.oboesynth;
/**
 * Created by Hoanui.
 */
import android.content.Context;
import android.media.AudioManager;
import android.media.SoundPool;
import android.util.Log;
import android.util.SparseIntArray;

import java.util.ArrayList;
import java.util.concurrent.CopyOnWriteArrayList;

/*
* Classe qui sert a relier le c++ et le code java
* */
public class AudioUtils {


  private final static int MAX_STREAM = 11;
  private final static int MAX_ENGINE = 12;
  private static AudioUtils instance = null;
  private Context context;
  private ArrayList <Double>freqs = new ArrayList<Double>();
  private double frequency = 0;


  static ArrayList<Long> engins = new ArrayList<Long>(MAX_ENGINE);

  static {
    System.loadLibrary("native-lib");
  }


  // Recupère les méthodes créer en c++
  private static native long native_createEngine(int mFrameRate, int mFramesPerBuffer);
  private static native void native_deleteEngine(long engineHandle);
  private static native void native_setToneOn(long engineHandle, boolean isToneOn,double frequency);
  private static native void native_changeWave(long engineHandle, int value);
  private static native void native_paramKnob(long engineHandle, double value, int indexKnob);
  private static native void native_changeFilter(long engineHandle, int value);
  private static native void native_setPicth(long engineHandle, double pitch, double frequency);
  private static native void native_setDistortion(long engineHandle, boolean state);
  private static native void native_setParameterDistortion(long engineHandle, int index, double value);
  private static native boolean native_getPlay(long engineHandle);
  private static native double native_getFreq(long engineHandle);

  //constructeur
  private AudioUtils(Context context, int maxStream) {
    this.context = context;
    AudioManager am = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
    String frameRateString = am.getProperty(AudioManager.PROPERTY_OUTPUT_SAMPLE_RATE);
    String framesPerBufferString = am.getProperty(AudioManager.PROPERTY_OUTPUT_FRAMES_PER_BUFFER);
    int mFrameRate = Integer.parseInt(frameRateString);
    int mFramesPerBuffer = Integer.parseInt(framesPerBufferString);

    //Creation des engins audio
    for (int i = 0; i < MAX_ENGINE; i++)
    {
      engins.add(native_createEngine(mFrameRate, mFramesPerBuffer));
    }

  }

  //Singleton
  public static AudioUtils getInstance(Context context) {
    return getInstance(context, MAX_STREAM);
  }

  public static AudioUtils getInstance(Context context,
      int maxStream) {
    if (instance == null || engins.get(0) == 0) {
      synchronized (AudioUtils.class) {
        if (instance == null || engins.get(0) == 0) {
          instance = new AudioUtils(context, maxStream);
        }
      }
    }
    return instance;
  }

  //jouer son
  public void playMusic(final PianoKey key) {
    Log.i("f", "playMusic: ");
    if (key != null) {
      frequency = key.getFrequence();
      playSound(frequency);
    }

  }

  //areter le son
  public void stopMusic(final PianoKey key) {
    Log.i("f", "stopMusic : ");
    if (key != null) {
      frequency = key.getFrequence();
      StopSound(key.getFrequence());
    }

  }

  //envoie info au code c++
  private void playSound(double frequence) {

    for (int i = 0; i < MAX_ENGINE; i++)
    {
      if(!native_getPlay(engins.get(i)) && native_getFreq(engins.get(i)) != frequence)
      {
        native_setToneOn(engins.get(i), true, frequence);
        break;
      }
    }
  }
  private void StopSound(double frequence) {

    for (int i = 0; i < MAX_ENGINE; i++)
    {
      if(native_getPlay(engins.get(i)) && native_getFreq(engins.get(i)) == frequence)
      {
        native_setToneOn(engins.get(i), false, frequence);
        break;
      }

    }
  }

  public void stop() {
    context = null;
  }

  //fonctions pour changer les paramètres, envoie les info au code c++
  public void changeWave(int value)
  {
    for (int i = 0; i < MAX_ENGINE; i++)
    {
        native_changeWave(engins.get(i), value);
    }
  }

  public void changeFilter(int value){
    for (int i = 0; i < MAX_ENGINE; i++)
    {
        native_changeFilter(engins.get(i), value);
    }
  }

  public void paramKnob(double value, int indexKnob)
  {
    for (int i = 0; i < MAX_ENGINE; i++)
    {
        native_paramKnob(engins.get(i), value, indexKnob);
    }

  }

  public void setPitch(double pitch)
  {
    for (int i = 0; i < MAX_ENGINE; i++)
    {
        native_setPicth(engins.get(i), pitch, frequency);
    }
  }
  public void setDistortion(boolean state)
  {
    for (int i = 0; i < MAX_ENGINE; i++)
    {
        native_setDistortion(engins.get(i), state);
    }

  }
  public void setParameterDistortion(int index, double value)
  {
    for (int i = 0; i < MAX_ENGINE; i++)
    {
        native_setParameterDistortion(engins.get(i), index, value);
    }
  }
}
