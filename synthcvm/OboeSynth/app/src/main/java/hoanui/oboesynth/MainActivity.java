package hoanui.oboesynth;
/**
 * Created by Hoanui.
 */
import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.app.Activity;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.ViewAnimationUtils;
import android.view.ViewTreeObserver;
import android.view.animation.AccelerateInterpolator;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.RadioGroup;
import android.widget.SeekBar;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.ToggleButton;
import android.view.Window;
import android.view.WindowManager;

import java.lang.reflect.Array;


public class MainActivity extends Activity implements OnPianoListener {


    private PianoView pianoView;
    private KnobView attackKnob;
    private KnobView decayKnob;
    private KnobView sustainKnob;
    private KnobView releaseKnob;

    private KnobView cutoffKnob;
    private KnobView resonanceKnob;


    private Button boutonWave;
    private Button boutonFilter;
    private Button boutonDist;

    private enum modeWave {
        SINE, SAW, TRIANGULAR
    };
    private enum modeFilter {
        LOW, HIGH, BAND
    };
    private enum modeDist {
       SOFTCLIP, ARCTANGENT, HARDCLIP, SQUARELOW,
        CUBICWAVESHAPER, FOLDBACK, GLOUBIAPPROX, GLOUBIBOULGA
    };


    private Switch distortion;
    private KnobView drive;

    private SeekBar pitch;
    private Spinner preset;
    private Button octaveUp;
    private Button octaveDown;

    private Ecouteur ec;
    private AudioUtils utils = null;
    private modeWave lastModeWave = modeWave.SINE;
    private modeFilter lastModeFilter = modeFilter.LOW;
    private modeDist lastModeDist = modeDist.SOFTCLIP;

    public static final String EXTRA_CIRCULAR_REVEAL_X = "EXTRA_CIRCULAR_REVEAL_X";
    public static final String EXTRA_CIRCULAR_REVEAL_Y = "EXTRA_CIRCULAR_REVEAL_Y";

    View mainLayout;

    private int revealX;
    private int revealY;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Intent intent = getIntent();
        mainLayout = findViewById(R.id.activity_main);

        if (savedInstanceState == null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP &&
                intent.hasExtra(EXTRA_CIRCULAR_REVEAL_X) &&
                intent.hasExtra(EXTRA_CIRCULAR_REVEAL_Y)) {
            mainLayout.setVisibility(View.INVISIBLE);

            revealX = intent.getIntExtra(EXTRA_CIRCULAR_REVEAL_X, 0);
            revealY = intent.getIntExtra(EXTRA_CIRCULAR_REVEAL_Y, 0);


            ViewTreeObserver viewTreeObserver = mainLayout.getViewTreeObserver();
            if (viewTreeObserver.isAlive()) {
                viewTreeObserver.addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
                    @Override
                    public void onGlobalLayout() {
                        revealActivity(revealX, revealY);
                        mainLayout.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                    }
                });
            }
        } else {
            mainLayout.setVisibility(View.VISIBLE);
        }

        //view
        utils = AudioUtils.getInstance(this);
        cutoffKnob = findViewById(R.id.cutoffKnob);
        resonanceKnob = findViewById(R.id.resonanceKnob);
        attackKnob = findViewById(R.id.attackKnob);
        decayKnob = findViewById(R.id.decayKnob);
        sustainKnob = findViewById(R.id.sustainKnob);
        releaseKnob = findViewById(R.id.realeaseKnob);
        pitch =  findViewById(R.id.pitch);
        preset = findViewById(R.id.preset);

        distortion = findViewById(R.id.switchDist);
        drive = findViewById(R.id.distDrive);
        boutonWave = findViewById(R.id.boutonWave);
        boutonFilter = findViewById(R.id.boutonFilter);
        boutonDist = findViewById(R.id.modeDist);
        pianoView = findViewById(R.id.pv);

        //listener
        pianoView.setPianoListener(this);
        ec = new Ecouteur();
        boutonWave.setOnClickListener(ec);
        boutonFilter.setOnClickListener(ec);
        boutonDist.setOnClickListener(ec);
        pitch.setOnSeekBarChangeListener(ec);
        octaveUp = findViewById(R.id.octaveUp);
        octaveDown = findViewById(R.id.octaveDown);

        attackKnob.setKnobListener(new KnobListener() {
            public void onKnobChanged(double newValue) {
                utils.paramKnob(newValue, 0);
            }
        });
        decayKnob.setKnobListener(new KnobListener() {
            public void onKnobChanged(double newValue) {
                utils.paramKnob(newValue, 1);
            }
        });
        sustainKnob.setKnobListener(new KnobListener() {
            public void onKnobChanged(double newValue) {
                utils.paramKnob(newValue, 2);
            }
        });
        releaseKnob.setKnobListener(new KnobListener() {
            public void onKnobChanged(double newValue) {
                utils.paramKnob(newValue, 3);
            }
        });
        cutoffKnob.setKnobListener(new KnobListener() {
            public void onKnobChanged(double newValue) {
                utils.paramKnob(newValue, 4);
            }
        });
        resonanceKnob.setKnobListener(new KnobListener() {
            public void onKnobChanged(double newValue) {
                utils.paramKnob(newValue, 5);
            }
        });
        drive.setKnobListener(new KnobListener() {
            public void onKnobChanged(double newValue) {
                utils.setParameterDistortion(2, newValue);
            }
        });
        distortion.setOnCheckedChangeListener(ec);


        ArrayAdapter<String> ar = new ArrayAdapter<String>(MainActivity.this, android.R.layout.simple_list_item_1, getResources().getStringArray(R.array.preset));
        ar.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        preset.setAdapter(ar);
        preset.setOnItemSelectedListener(ec);
        octaveUp.setOnClickListener(ec);
        octaveDown.setOnClickListener(ec);
    }

    protected void revealActivity(int x, int y) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            float finalRadius = (float) (Math.max(mainLayout.getWidth(), mainLayout.getHeight()) * 1.1);
            Animator circularReveal = ViewAnimationUtils.createCircularReveal(mainLayout, x, y, 0, finalRadius);
            circularReveal.setDuration(1000);
            circularReveal.setInterpolator(new AccelerateInterpolator());
            mainLayout.setVisibility(View.VISIBLE);
            circularReveal.start();
        } else {
            finish();
        }
    }

    @Override public void onPianoInitFinish() {

    }

    @Override public void onPianoClick(Piano.PianoKeyType type, String nomNote, int group,
                                       int positionOfGroup) {
    }

    private class Ecouteur implements AdapterView.OnItemSelectedListener, Button.OnClickListener,SeekBar.OnSeekBarChangeListener, CompoundButton.OnCheckedChangeListener{

        @Override
        public void onClick(View v) {
            Button bouton = (Button) v;
            int value = 0;
            if(bouton.getId() == R.id.boutonWave)
            {
                if(lastModeWave == modeWave.SINE)
                {
                    boutonWave.setBackground(getResources().getDrawable(R.drawable.sawtooth_wave));
                    lastModeWave = modeWave.SAW;
                    value = 1;
                }
                else if(lastModeWave == modeWave.SAW)
                {
                    boutonWave.setBackground(getResources().getDrawable(R.drawable.triangular_wave));
                    lastModeWave = modeWave.TRIANGULAR;
                    value = 2;
                }
                else if(lastModeWave == modeWave.TRIANGULAR)
                {
                    boutonWave.setBackground(getResources().getDrawable(R.drawable.sine_wave));
                    lastModeWave = modeWave.SINE;
                    value = 0;
                }

                utils.changeWave(value);
            }
            else if(bouton.getId() == R.id.octaveUp)
            {
                pianoView.octaveUp();
            }
            else if(bouton.getId() == R.id.octaveDown)
            {
                pianoView.octaveDown();
            }
            else if(bouton.getId() == R.id.modeDist)
            {
                if(lastModeDist == modeDist.SOFTCLIP)
                {
                    boutonDist.setText("HardClip");
                    lastModeDist = modeDist.HARDCLIP;
                    value = 2;
                }
                else if(lastModeDist == modeDist.HARDCLIP)
                {
                    boutonDist.setText("CubicWave");
                    lastModeDist = modeDist.CUBICWAVESHAPER;
                    value = 3;
                }

                else if(lastModeDist == modeDist.CUBICWAVESHAPER)
                {
                    boutonDist.setText("SoftClip");
                    lastModeDist = modeDist.SOFTCLIP;
                    value = 1;
                }

                utils.setParameterDistortion(1
                        , value);
            }
            else if(bouton.getId() == R.id.boutonFilter)
            {

                if(lastModeFilter == modeFilter.LOW)
                {
                    boutonFilter.setBackground(getResources().getDrawable(R.drawable.highpass));
                    lastModeFilter = modeFilter.HIGH;
                    value = 1;
                }
                else if(lastModeFilter == modeFilter.HIGH)
                {
                    boutonFilter.setBackground(getResources().getDrawable(R.drawable.bandpass));
                    lastModeFilter = modeFilter.BAND;
                    value = 2;
                }
                else if(lastModeFilter == modeFilter.BAND)
                {
                    boutonFilter.setBackground(getResources().getDrawable(R.drawable.lowpass));
                    lastModeFilter = modeFilter.LOW;
                    value = 0;
                }
                utils.changeFilter(value);
            }



        }

        @Override
        public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
            if(progress < 20)
            {
                utils.setPitch(Double.valueOf(progress)- 20);
            }
            else if(progress> 20)
            {
                utils.setPitch(Double.valueOf(progress) - 20);
            }
            else
            {
                utils.setPitch(20 - Double.valueOf(progress));
            }
        }

        @Override
        public void onStartTrackingTouch(SeekBar seekBar) {


        }

        @Override
        public void onStopTrackingTouch(SeekBar seekBar) {
            while(pitch.getProgress() < 20)
            {
                pitch.setProgress(pitch.getProgress() + 1);
            }
            while(pitch.getProgress() > 20)
            {
                pitch.setProgress(pitch.getProgress() - 1);
            }
        }

        @Override
        public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
            if(buttonView == distortion)
            {
                if(isChecked)
                {
                    utils.setDistortion(true);
                }
                else
                {
                    utils.setDistortion(false);
                }
            }
        }


        @Override
        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {

            if(position == 1) //guitar eledtrique
            {
                boutonWave.setBackground(getResources().getDrawable(R.drawable.triangular_wave));
                lastModeWave = modeWave.TRIANGULAR;
                boutonFilter.setBackground(getResources().getDrawable(R.drawable.lowpass));
                lastModeFilter = modeFilter.LOW;
                boutonDist.setText("HardClip");
                lastModeDist = modeDist.HARDCLIP;

                cutoffKnob.setValue(0.74);
                resonanceKnob.setValue(0.41);
                releaseKnob.setValue(0.13);
                sustainKnob.setValue(0.55);
                decayKnob.setValue(0.50);
                attackKnob.setValue(0.01);
                distortion.setChecked(true);
                drive.setValue(8.51);

                utils.changeWave(2);
                utils.changeFilter(0);
                utils.paramKnob(0.01, 0);
                utils.paramKnob(0.5, 1);
                utils.paramKnob(0.55, 2);
                utils.paramKnob(0.13, 3);
                utils.paramKnob(0.74, 4);
                utils.paramKnob(0.41, 5);
                utils.setParameterDistortion(1
                        , 2);
                utils.setParameterDistortion(2, 8.51);
                pianoView.setOctave(3);
            }
            else if(position == 2) // flute
            {
                boutonWave.setBackground(getResources().getDrawable(R.drawable.sine_wave));
                lastModeWave = modeWave.SINE;
                boutonFilter.setBackground(getResources().getDrawable(R.drawable.lowpass));
                lastModeFilter = modeFilter.LOW;

                cutoffKnob.setValue(0.98);
                resonanceKnob.setValue(0.5);
                releaseKnob.setValue(0.95);
                sustainKnob.setValue(0.40);
                decayKnob.setValue(0.30);
                attackKnob.setValue(0.13);
                distortion.setChecked(false);

                utils.changeWave(0);
                utils.changeFilter(0);
                utils.paramKnob(0.13, 0);
                utils.paramKnob(0.30, 1);
                utils.paramKnob(0.40, 2);
                utils.paramKnob(0.95, 3);
                utils.paramKnob(0.98, 4);
                utils.paramKnob(0.5, 5);
                pianoView.setOctave(4);
            }
            else if(position == 3) //sax
            {
                boutonWave.setBackground(getResources().getDrawable(R.drawable.sawtooth_wave));
                lastModeWave = modeWave.SAW;
                boutonFilter.setBackground(getResources().getDrawable(R.drawable.lowpass));
                lastModeFilter = modeFilter.LOW;

                cutoffKnob.setValue(0.46);
                resonanceKnob.setValue(0.33);
                releaseKnob.setValue(0.5);
                sustainKnob.setValue(0.40);
                decayKnob.setValue(0.30);
                attackKnob.setValue(0.11);
                distortion.setChecked(false);

                utils.changeWave(1);
                utils.changeFilter(0);
                utils.paramKnob(0.11, 0);
                utils.paramKnob(0.30, 1);
                utils.paramKnob(0.40, 2);
                utils.paramKnob(0.5, 3);
                utils.paramKnob(0.46, 4);
                utils.paramKnob(0.33, 5);
                pianoView.setOctave(3);
            }
            else if(position == 4) //mario
            {
                boutonWave.setBackground(getResources().getDrawable(R.drawable.triangular_wave));
                lastModeWave = modeWave.TRIANGULAR;
                boutonFilter.setBackground(getResources().getDrawable(R.drawable.highpass));
                lastModeFilter = modeFilter.HIGH;

                cutoffKnob.setValue(0.36);
                resonanceKnob.setValue(0.34);
                releaseKnob.setValue(0.72);
                sustainKnob.setValue(0.54);
                decayKnob.setValue(0.58);
                attackKnob.setValue(0.01);
                distortion.setChecked(false);

                utils.changeWave(2);
                utils.changeFilter(1);
                utils.paramKnob(0.01, 0);
                utils.paramKnob(0.58, 1);
                utils.paramKnob(0.54, 2);
                utils.paramKnob(0.72, 3);
                utils.paramKnob(0.36, 4);
                utils.paramKnob(0.34, 5);
                pianoView.setOctave(4);
            }

        }

        @Override
        public void onNothingSelected(AdapterView<?> parent) {

        }
    }
}
