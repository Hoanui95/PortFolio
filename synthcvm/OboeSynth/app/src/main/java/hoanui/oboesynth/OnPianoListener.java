package hoanui.oboesynth;
/**
 * Created by Hoanui.
 */

/*
* Interface pour les touches du piano*/
public interface OnPianoListener {

  void onPianoInitFinish();

  void onPianoClick(Piano.PianoKeyType type, String nomNote, int group,
                    int positionOfGroup);
}
