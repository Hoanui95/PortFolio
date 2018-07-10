package hoanui.oboesynth;
/**
 * Created by Hoanui.
 */
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
/*
* classe qui modelise une touche de piano*/

public class PianoKey {

  private Piano.PianoKeyType type;
  private int octave;
  private int positionDansOctave;
  private Drawable keyDrawable;
  private double frequence;
  private boolean isPressed;
  private Rect[] areaOfKey;
  private int fingerID = -1;
  private String nom;

  public String getNom() {
    return nom;
  }

  public void setNom(String nom) {
    this.nom = nom;
  }

  public PianoKey(Piano.PianoKeyType type, int octave, int positionDansOctave, boolean isPressed) {
    this.type = type;
    this.octave = octave;
    this.positionDansOctave = positionDansOctave;
    this.isPressed = isPressed;
  }

  public Piano.PianoKeyType getType() {
    return type;
  }

  public void setType(Piano.PianoKeyType type) {
    this.type = type;
  }

  public int getOctave() {
    return octave;
  }

  public void setOctave(int octave) {
    this.octave = octave;
  }

  public int getPositionDansOctave() {
    return positionDansOctave;
  }

  public void setPositionDansOctave(int positionDansOctave) {
    this.positionDansOctave = positionDansOctave;
  }

  public Drawable getKeyDrawable() {
    return keyDrawable;
  }

  public void setKeyDrawable(Drawable keyDrawable) {
    this.keyDrawable = keyDrawable;
  }

  public double getFrequence() {
    return frequence;
  }

  public void setFrequence(double frequence) {
    this.frequence = frequence;
  }

  public boolean isPressed() {
    return isPressed;
  }

  public void setPressed(boolean pressed) {
    isPressed = pressed;
  }

  public Rect[] getAreaOfKey() {
    return areaOfKey;
  }

  public void setAreaOfKey(Rect[] areaOfKey) {
    this.areaOfKey = areaOfKey;
  }

  public boolean contains(int x, int y) {
    boolean isContain = false;
    Rect[] areas = getAreaOfKey();
    int length = getAreaOfKey().length;
    for (int i = 0; i < length; i++) {
      if (areas[i] != null && areas[i].contains(x, y)) {
        isContain = true;
        break;
      }
    }
    return isContain;
  }

  public void resetFingerID() {
    fingerID = -1;
  }

  public void setFingerID(int fingerIndex) {
    this.fingerID = fingerIndex;
  }

  public int getFingerID() {
    return fingerID;
  }
}