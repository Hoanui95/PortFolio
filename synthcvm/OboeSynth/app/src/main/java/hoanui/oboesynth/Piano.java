package hoanui.oboesynth;
/**
 * Created by Hoanui.
 */
import android.content.Context;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.ScaleDrawable;
import android.support.v4.content.ContextCompat;
import android.view.Gravity;

import com.google.gson.annotations.SerializedName;

import java.util.ArrayList;
/*
* Classe qui modelise le piano*/

public class Piano {

  private final static int Octaves = 1;
  private ArrayList<PianoKey[]> blackPianoKeys = new ArrayList<>(Octaves);
  private ArrayList<PianoKey[]> whitePianoKeys = new ArrayList<>(Octaves);
  private int blackKeyWidth;
  private int blackKeyHeight;
  private int whiteKeyWidth;
  private int whiteKeyHeight;
  private int pianoWith = 0;
  private float scale = 0;
  private Context context;
  private int octave = 3;

  public enum PianoKeyType {
    @SerializedName("0")
    BLACK(0), @SerializedName("1")
    WHITE(1);
    private int value;

    PianoKeyType(int value) {
      this.value = value;
    }

    public int getValue() {
      return value;
    }

    @Override public String toString() {
      return "PianoKeyType{" + "value=" + value + '}';
    }
  }

  private enum BlackKeyPosition {
    LEFT, LEFT_RIGHT, RIGHT
  }

  public Piano(Context context, float scale) {
    this.context = context;
    this.scale = scale;
    initPiano();
  }

  public void setOctave(int value)
  {
    octave = value;
    for (int j = 0; j < blackPianoKeys.get(0).length; j++) {
      switch (j) {
        case 0:
          blackPianoKeys.get(0)[j].setFrequence(34.65 * (Math.pow(2, octave)));
          break;
        case 1:
          blackPianoKeys.get(0)[j].setFrequence(38.89 * (Math.pow(2, octave)));
          break;
        case 2:
          blackPianoKeys.get(0)[j].setFrequence(46.25 * (Math.pow(2, octave)));
          break;
        case 3:
          blackPianoKeys.get(0)[j].setFrequence(51.91 * (Math.pow(2, octave)));
          break;
        case 4:
          blackPianoKeys.get(0)[j].setFrequence(58.27 * (Math.pow(2, octave)));
          break;
      }
    }

    for (int j = 0; j < whitePianoKeys.get(0).length; j++) {
      switch (j) {
        case 0:
          whitePianoKeys.get(0)[j].setFrequence(32.70 * (Math.pow(2, octave)));
          break;
        case 1:
          whitePianoKeys.get(0)[j].setFrequence(36.71 * (Math.pow(2, octave)));
          break;
        case 2:
          whitePianoKeys.get(0)[j].setFrequence(41.20 * (Math.pow(2, octave)));
          break;
        case 3:
          whitePianoKeys.get(0)[j].setFrequence(43.65 * (Math.pow(2, octave)));
          break;
        case 4:
          whitePianoKeys.get(0)[j].setFrequence(49.00 * (Math.pow(2, octave)));
          break;
        case 5:
          whitePianoKeys.get(0)[j].setFrequence(55.00 * (Math.pow(2, octave)));
          break;
        case 6:
          whitePianoKeys.get(0)[j].setFrequence(61.74 * (Math.pow(2, octave)));
          break;
        case 7:
          whitePianoKeys.get(0)[j].setFrequence(32.70 * (Math.pow(2, octave + 1)));
          break;
      }
    }
  }
  public void changeOctave(int change)
  {
    int temp = octave;
    if(change == 1)
    {
      temp = temp + 1;
    }
    else if(change == 0)
    {
      temp = temp - 1;
    }
    if(  temp >= 2 && temp <= 7)
    {
      setOctave(temp);
    }

  }
  private void ajouterTouchePiano()
  {


    for (int i = 0; i < Octaves; i++)
    {

      PianoKey keys[];
      keys = new PianoKey[5];
      for (int j = 0; j < keys.length; j++) {
        Rect areaOfKey[] = new Rect[1];
        keys[j] = new PianoKey(PianoKeyType.BLACK, i, j, false);

        keys[j].setKeyDrawable(
                new ScaleDrawable(ContextCompat.getDrawable(context, R.drawable.black_piano_key),
                        Gravity.NO_GRAVITY, 1, scale).getDrawable());
        setBlackKeyDrawableBounds(i, j, keys[j].getKeyDrawable());
        areaOfKey[i] = keys[j].getKeyDrawable().getBounds();
        keys[j].setAreaOfKey(areaOfKey);

        switch (j) {
          case 0:
            keys[j].setFrequence(34.65 * (Math.pow(2, octave)));
            break;
          case 1:
            keys[j].setFrequence(38.89 * (Math.pow(2, octave)));
            break;
          case 2:
            keys[j].setFrequence(46.25 * (Math.pow(2, octave)));
            break;
          case 3:
            keys[j].setFrequence(51.91 * (Math.pow(2, octave)));
            break;
          case 4:
            keys[j].setFrequence(58.27 * (Math.pow(2, octave)));
            break;
        }
      }
      blackPianoKeys.add(keys);

      PianoKey[] mKeys;
      mKeys = new PianoKey[8];

      for (int j = 0; j < mKeys.length; j++) {
        mKeys[j] = new PianoKey(PianoKeyType.WHITE, i, j, false);
        mKeys[j].setKeyDrawable(
                new ScaleDrawable(ContextCompat.getDrawable(context, R.drawable.white_piano_key),
                        Gravity.NO_GRAVITY, 1, scale).getDrawable());
        setWhiteKeyDrawableBounds(i, j, mKeys[j].getKeyDrawable());
        pianoWith += whiteKeyWidth;
        switch (j) {
          case 0:
            mKeys[j].setAreaOfKey(getWhitePianoKeyArea(i, j, BlackKeyPosition.RIGHT));
            mKeys[j].setFrequence(32.70 * (Math.pow(2, octave)));
            mKeys[j].setNom("do");
            break;
          case 1:
            mKeys[j].setAreaOfKey(getWhitePianoKeyArea(i, j, BlackKeyPosition.LEFT_RIGHT));
            mKeys[j].setFrequence(36.71 * (Math.pow(2, octave)));
            mKeys[j].setNom("re");
            break;
          case 2:
            mKeys[j].setAreaOfKey(getWhitePianoKeyArea(i, j, BlackKeyPosition.LEFT));
            mKeys[j].setFrequence(41.20 * (Math.pow(2, octave)));
            mKeys[j].setNom("mi");
            break;
          case 3:
            mKeys[j].setAreaOfKey(getWhitePianoKeyArea(i, j, BlackKeyPosition.RIGHT));
            mKeys[j].setFrequence(43.65 * (Math.pow(2, octave)));
            mKeys[j].setNom("fa");
            break;
          case 4:
            mKeys[j].setAreaOfKey(getWhitePianoKeyArea(i, j, BlackKeyPosition.LEFT_RIGHT));
            mKeys[j].setFrequence(49.00 * (Math.pow(2, octave)));
            mKeys[j].setNom("sol");
            break;
          case 5:
            mKeys[j].setAreaOfKey(getWhitePianoKeyArea(i, j, BlackKeyPosition.LEFT_RIGHT));
            mKeys[j].setFrequence(55.00 * (Math.pow(2, octave)));
            mKeys[j].setNom("la");
            break;
          case 6:
            mKeys[j].setAreaOfKey(getWhitePianoKeyArea(i, j, BlackKeyPosition.LEFT));
            mKeys[j].setFrequence(61.74 * (Math.pow(2, octave)));
            mKeys[j].setNom("si");
            break;
          case 7:
            mKeys[j].setAreaOfKey(getWhitePianoKeyArea(i, j, BlackKeyPosition.RIGHT));
            mKeys[j].setFrequence(32.70 * (Math.pow(2, octave + 1)));
            mKeys[j].setNom("do");
            break;
        }
      }
      whitePianoKeys.add(mKeys);
    }

  }

  private void initPiano() {
    if (scale > 0) {
      Drawable blackDrawable = ContextCompat.getDrawable(context, R.drawable.black_piano_key);
      Drawable whiteDrawable = ContextCompat.getDrawable(context, R.drawable.white_piano_key);
      blackKeyWidth = blackDrawable.getIntrinsicWidth();
      blackKeyHeight = (int) ((float) blackDrawable.getIntrinsicHeight() * scale);
      whiteKeyWidth = whiteDrawable.getIntrinsicWidth();
      whiteKeyHeight = (int) ((float) whiteDrawable.getIntrinsicHeight() * scale);

      ajouterTouchePiano();
    }
  }

  private Rect[] getWhitePianoKeyArea(int group, int positionOfGroup,
      BlackKeyPosition blackKeyPosition) {
    int offset = 0;
    if (group == 0) {
      offset = 5;
    }
    switch (blackKeyPosition) {
      case LEFT:
        Rect left[] = new Rect[2];
        left[0] =
            new Rect((7 * group - 5 + offset + positionOfGroup) * whiteKeyWidth, blackKeyHeight,
                (7 * group - 5 + offset + positionOfGroup) * whiteKeyWidth + blackKeyWidth / 2,
                whiteKeyHeight);
        left[1] =
            new Rect((7 * group - 5 + offset + positionOfGroup) * whiteKeyWidth + blackKeyWidth / 2,
                0, (7 * group - 4 + offset + positionOfGroup) * whiteKeyWidth, whiteKeyHeight);
        return left;
      case LEFT_RIGHT:
        Rect leftRight[] = new Rect[3];
        leftRight[0] =
            new Rect((7 * group - 5 + offset + positionOfGroup) * whiteKeyWidth, blackKeyHeight,
                (7 * group - 5 + offset + positionOfGroup) * whiteKeyWidth + blackKeyWidth / 2,
                whiteKeyHeight);
        leftRight[1] =
            new Rect((7 * group - 5 + offset + positionOfGroup) * whiteKeyWidth + blackKeyWidth / 2,
                0, (7 * group - 4 + offset + positionOfGroup) * whiteKeyWidth - blackKeyWidth / 2,
                whiteKeyHeight);
        leftRight[2] =
            new Rect((7 * group - 4 + offset + positionOfGroup) * whiteKeyWidth - blackKeyWidth / 2,
                blackKeyHeight, (7 * group - 4 + offset + positionOfGroup) * whiteKeyWidth,
                whiteKeyHeight);
        return leftRight;
      case RIGHT:
        Rect right[] = new Rect[2];
        right[0] = new Rect((7 * group - 5 + offset + positionOfGroup) * whiteKeyWidth, 0,
            (7 * group - 4 + offset + positionOfGroup) * whiteKeyWidth - blackKeyWidth / 2,
            whiteKeyHeight);
        right[1] =
            new Rect((7 * group - 4 + offset + positionOfGroup) * whiteKeyWidth - blackKeyWidth / 2,
                blackKeyHeight, (7 * group - 4 + offset + positionOfGroup) * whiteKeyWidth,
                whiteKeyHeight);
        return right;
    }
    return null;
  }

  private void setWhiteKeyDrawableBounds(int group, int positionOfGroup, Drawable drawable) {
    int offset = 0;
    if (group == 0) {
      offset = 5;
    }
    drawable.setBounds((7 * group - 5 + offset + positionOfGroup) * whiteKeyWidth, 0,
        (7 * group - 4 + offset + positionOfGroup) * whiteKeyWidth, whiteKeyHeight);
  }

  private void setBlackKeyDrawableBounds(int group, int positionOfGroup, Drawable drawable) {
    int whiteOffset = 0;
    int blackOffset = 0;
    if (group == 0) {
      whiteOffset = 5;
    }
    if (positionOfGroup == 2 || positionOfGroup == 3 || positionOfGroup == 4) {
      blackOffset = 1;
    }
    drawable.setBounds((7 * group - 4 + whiteOffset + blackOffset + positionOfGroup) * whiteKeyWidth
            - blackKeyWidth / 2, 0,
        (7 * group - 4 + whiteOffset + blackOffset + positionOfGroup) * whiteKeyWidth
            + blackKeyWidth / 2, blackKeyHeight);
  }

  public ArrayList<PianoKey[]> getWhitePianoKeys() {
    return whitePianoKeys;
  }

  public ArrayList<PianoKey[]> getBlackPianoKeys() {
    return blackPianoKeys;
  }

  public int getPianoWith() {
    return pianoWith;
  }
}
