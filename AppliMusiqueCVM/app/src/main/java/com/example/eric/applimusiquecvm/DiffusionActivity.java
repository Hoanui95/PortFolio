package com.example.eric.applimusiquecvm;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.os.Handler;
import android.os.IBinder;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.ToggleButton;
/*
 * Activité qui Diffuse une chanson
 */

public class DiffusionActivity extends AppCompatActivity {

    //Variables
    private Intent playIntent;
    private MusicService musicSrv;
    private Boolean musicBound;

    private Handler handler = new Handler(); //Utiliser pour le track bar

    private Button play, suivant, precedent;
    private ToggleButton boutonAleatoire;
    private ImageButton boutonVolume;
    private TextView titre;
    private ImageView imagePochette;
    private SeekBar pisteMusique;
    private TextView timer;

    //Variables pour régler le volume
    private SeekBar seekbarVolume;
    private AudioManager audioManager = null;

    private Ecouteur ec;
    private EnsembleChanson ensemble;
    private boolean toucheBar = false;//Utiliser pour savoir si l'usager touche au seekbar, change a la position où le seekbar est

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setVolumeControlStream(AudioManager.STREAM_MUSIC);
        setContentView(R.layout.activity_diffusion);

        //Récupère les id des widgets
        play = (Button) findViewById(R.id.boutonPlay);
        suivant = (Button) findViewById(R.id.boutonNext);
        precedent = (Button) findViewById(R.id.boutonPrevious);
        titre = (TextView) findViewById(R.id.titre);
        imagePochette = (ImageView) findViewById(R.id.pochette);
        pisteMusique = ( SeekBar) findViewById(R.id.seekBar);
        timer = (TextView) findViewById(R.id.timer);
        boutonAleatoire = (ToggleButton) findViewById(R.id.boutonAleatoire);
        boutonVolume = (ImageButton) findViewById(R.id.boutonVolume);
        seekbarVolume = (SeekBar) findViewById(R.id.seekbarVolume);

        //Obtenir l'instance du widget
        ensemble = EnsembleChanson.getInstance();

        //Mode aléatoire ou en boucle
        boutonAleatoire.setChecked(ensemble.isAleatoire());
        if(boutonAleatoire.isChecked())
        {
            changerImageDrawable(boutonAleatoire, R.drawable.aleatoire);
        }
        else
        {
            changerImageDrawable(boutonAleatoire, R.drawable.boucle);
        }

        //Initialise le max du seekbar avec le volume max, et le positionne à la position du volume en cours
        seekbarVolume.setVisibility(View.INVISIBLE);
        audioManager = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
        seekbarVolume.setMax(audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC));
        seekbarVolume.setProgress(audioManager.getStreamVolume(AudioManager.STREAM_MUSIC));

        //Ecouteur
        ec = new Ecouteur();
        play.setOnClickListener(ec);
        suivant.setOnClickListener(ec);
        precedent.setOnClickListener(ec);
        pisteMusique.setOnSeekBarChangeListener(ec);
        pisteMusique.setOnTouchListener(ec);//Sert pour savoir si l'usager touche le seekbar
        boutonAleatoire.setOnCheckedChangeListener(ec);
        boutonVolume.setOnClickListener(ec);
        seekbarVolume.setOnSeekBarChangeListener(ec);
    }

    //Changer le titre et l'image de la chanson courante
    public void definirTitreEtImage()
    {
        titre.setText(ensemble.getVecteurChansonUtilise().get(ensemble.getPositionCourante()).getTitre());
        if(ensemble.getVecteurChansonUtilise().get(ensemble.getPositionCourante()).getAvecPochette())
        {
            Bitmap bitmap = BitmapFactory.decodeFile(ensemble.getVecteurChansonUtilise().get(ensemble.getPositionCourante()).getPochette());
            imagePochette.setImageBitmap(bitmap);
        }
        else
        {
            Drawable myDrawable = getResources().getDrawable(Integer.parseInt(ensemble.getVecteurChansonUtilise().get(ensemble.getPositionCourante()).getPochette()));
            imagePochette.setImageDrawable(myDrawable);
        }
    }

    //Changer les images des boutons
    public void changerImageDrawable(Button bouton, int drawable)
    {
        Drawable image = getResources().getDrawable(drawable);
        bouton.setBackground(image);
    }

    //Réinitialise le seekbar
    public void réinitialiseBarMusique()
    {
        pisteMusique.setProgress(0);
        timer.setText("0:00");
        timer.setX(pisteMusique.getX() + pisteMusique.getThumbOffset() / 2);
    }

    //Runnable pour gérer la piste des chansons
    Runnable run = new Runnable() {
        @Override
        public void run()
        {
            if(musicSrv != null && musicSrv.diffuseActuellement())
            {
                avancerPiste();
            }
        }
    };

    //Methode qui avance le seekbar toutes les secondes
    public void avancerPiste()
    {
        if(toucheBar)//si c'est l'Usager qui change lui même la piste du temps de la chanson
        {
            toucheBar= false;
        }
        else//Sinon cela avance tou seul
        {
            pisteMusique.setMax(musicSrv.getDuree());
            pisteMusique.setProgress(musicSrv.getPosition());
        }
        handler.postDelayed(run, 1000);

    }

    //Classe Ecouteur
    private class Ecouteur implements View.OnClickListener, SeekBar.OnSeekBarChangeListener, View.OnTouchListener, CompoundButton.OnCheckedChangeListener
    {
        @Override
        public void onClick(View v) {
            if (v == play)//Bouton play ou pause
            {
                if(!musicSrv.diffuseActuellement())//on met en marche la musique et le runnable
                {
                    changerImageDrawable(play, R.drawable.pause);
                    musicSrv.demarre();
                    avancerPiste();
                }
                else//On arrête la musique et le runnable
                {
                    changerImageDrawable(play, R.drawable.play);
                    musicSrv.pause();
                }
            }
            else if (v == suivant)//Bouton suivant
            {
                ensemble.avancer();//On avance la position de la chanson
                musicSrv.diffuserChanson();//on joue la chanson

                //Reinitialise le titre, la pochette, la piste et le volume
                seekbarVolume.setVisibility(View.INVISIBLE);
                changerImageDrawable(play, R.drawable.pause);
                definirTitreEtImage();
                réinitialiseBarMusique();

                //Met en marche le runnable
                avancerPiste();
            }
            else if (v == precedent)//Bouton précédent
            {
                ensemble.reculer();//On recule la position de la chanson
                musicSrv.diffuserChanson();//on joue la chanson

                //Reinitialise le titre, la pochette, la piste et le vol
                seekbarVolume.setVisibility(View.INVISIBLE);
                changerImageDrawable(play, R.drawable.pause);
                definirTitreEtImage();
                réinitialiseBarMusique();

                //Met en marche le runnable
                avancerPiste();
            }
            else if (v == boutonVolume)//Bouton volume
            {
                //On rend visible ou invisible le seekbar du volume
                if(seekbarVolume.getVisibility() == View.INVISIBLE)
                {
                    seekbarVolume.setVisibility(View.VISIBLE);
                }
                else
                {
                    seekbarVolume.setVisibility(View.INVISIBLE);
                }
            }
        }

        @Override
        public void onProgressChanged(SeekBar seekBar, int progress, boolean b) {
            if(seekBar == seekbarVolume)//On change le volume
            {
                audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, progress, 0);
            }
            else if(seekBar == pisteMusique)
            {
                if(toucheBar == true)//l'usager change la position du temps de la musique
                {
                    musicSrv.cherche(progress);
                }

                int positionBoutonSeekbar = (musicSrv.getPosition() * (pisteMusique.getWidth() - 2 * pisteMusique.getThumbOffset())) / pisteMusique.getMax();

                int dureeMusicSeconde= musicSrv.getPosition() / 1000;
                int minute = dureeMusicSeconde / 60;
                int seconde = dureeMusicSeconde % 60;

                //Afficher le texte du temps de la musique en cours(appeler toute les secondes avec le runnable)
                if(seconde > 9)
                {
                    timer.setText(minute + ":" + seconde);
                    timer.setX(pisteMusique.getX() + positionBoutonSeekbar + pisteMusique.getThumbOffset() / 2);
                }
                else
                {
                    timer.setText(minute + ":0" + seconde);
                    timer.setX(pisteMusique.getX() + positionBoutonSeekbar + pisteMusique.getThumbOffset() / 2);
                }

                //Si on arrive à la fin de la chanson, on change ensuite le titre et la pochette
                if(ensemble.getVecteurChansonUtilise().get(ensemble.getPositionCourante()).getTitre() != titre.getText().toString())
                {
                    changerImageDrawable(play, R.drawable.pause);
                    definirTitreEtImage();
                }
            }
        }

        @Override
        public void onStartTrackingTouch(SeekBar seekBar) {}

        @Override
        public void onStopTrackingTouch(SeekBar seekBar) {}

        @Override
        public boolean onTouch(View v, MotionEvent event) {
            //Si l'usager veut changer lui même le temps de la chanson
            toucheBar = true;
            return false;
        }

        @Override
        public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
            //Met en mode aléatoire ou en boucle
            if(buttonView == boutonAleatoire)
            {
                if(isChecked)
                {
                    ensemble.setAleatoire(true);
                    changerImageDrawable(boutonAleatoire, R.drawable.aleatoire);
                }
                else
                {
                    ensemble.setAleatoire(false);
                    changerImageDrawable(boutonAleatoire, R.drawable.boucle);
                }
            }
        }
    }

    //Méthode qui  sert à se connecter au service MusicService
    private ServiceConnection musicConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder service) {

            MusicService.MusicBinder binder = (MusicService.MusicBinder) service;
            musicSrv = binder.getService();
            musicBound = true;

            //On commence à jouer la musiques
            changerImageDrawable(play, R.drawable.pause);
            definirTitreEtImage();
            réinitialiseBarMusique();
            avancerPiste();
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
            musicBound=false;
        }
    };

    //On créer le service MusicService
    protected void onStart()
    {
        super.onStart();
        if ( playIntent == null)
        {
            playIntent = new Intent(this, MusicService.class);
            bindService ( playIntent, musicConnection, Context.BIND_AUTO_CREATE);
            startService(playIntent);
        }
    }

    //On arrète le service
    protected  void onDestroy()
    {
        musicSrv = null;
        stopService(playIntent);
        super.onDestroy();
    }

}