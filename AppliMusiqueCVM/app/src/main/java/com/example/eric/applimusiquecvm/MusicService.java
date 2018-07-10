package com.example.eric.applimusiquecvm;

import android.app.Service;
import android.content.ContentUris;
import android.content.Intent;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Binder;
import android.os.IBinder;
import android.os.PowerManager;
import android.provider.MediaStore;
import android.util.Log;
import java.io.IOException;

/*
 *Classe de service pour musique
 */
public class MusicService extends Service  {

    private MediaPlayer diffuseur; //diffuseur

    private Ecouteur ec;
    private final IBinder musicBind = new MusicBinder();
    private boolean aCommence;
    private boolean debut = true;// permet de savoir si la diffusion a commencé

    EnsembleChanson ensemble; //ajouter référence à votre singleton

    public MediaPlayer getDiffuseur() {
        return diffuseur;
    }



    public void onCreate(){
        super.onCreate();
        //obtenir instance de votre singleton

        ensemble = EnsembleChanson.getInstance();
        diffuseur= new MediaPlayer();
        ec = new Ecouteur();
        diffuseur.setOnPreparedListener(ec);
        diffuseur.setOnCompletionListener(ec);
        diffuseur.setOnErrorListener(ec);
        initMusicPlayer();
    }

    //Initialise le mediaplayer
    public void initMusicPlayer()
    {
        diffuseur.setWakeMode(getApplicationContext(), PowerManager.PARTIAL_WAKE_LOCK);
        diffuseur.setAudioStreamType(AudioManager.STREAM_MUSIC);
    }
    //Cela relie le mediaplayer à une activité
    @Override
    public IBinder onBind(Intent intent) {
        return musicBind;
    }

    //Cela délie le mediaplayer à une activité
    public boolean onUnbind( Intent intent)
    {
        diffuseur.stop();
        diffuseur.release();
        return false;
    }

    //Methode qui fait jouer la chanson courante
    public void diffuserChanson(){
        diffuseur.reset();
        // passer id de la chanson courante provenant du Vecteur de votre singleton
        long id = ensemble.getVecteurChansonUtilise().get(ensemble.getPositionCourante()).getId() ;// à remplacer

        Uri trackUri = ContentUris.withAppendedId( MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, id /* remplacer par id chanson*/);

        try {
            diffuseur.setDataSource(getApplicationContext(), trackUri);
        } catch (IOException e) {
            Log.e("MUSIC SERVICE", "problème", e);
        }
        diffuseur.prepareAsync();
    }

    //Position du temps de la chanson
    public int getPosition()
    {
        return diffuseur.getCurrentPosition();
    }

    //Duree de la chanson
    public int getDuree()
    {
        return diffuseur.getDuration();
    }

    //Sert a savoir si la musique est jouer ou pas
    public boolean diffuseActuellement()
    {
        return diffuseur.isPlaying();
    }

    //Sert à atteindre un certain moment de la chanson
    public void cherche(int position)
    {
        diffuseur.seekTo(position);
    }

    //met sur pause le mediaplayer
    public void pause()
    {
        diffuseur.pause();
    }

    //met sur play le mediaplayer
    public void demarre(){

        diffuseur.start();

    }
    //Classe qui retour le Service
    public class MusicBinder extends Binder {
        MusicService getService() {
            return MusicService.this;
        }
        }

    //Classe Ecouteur
    private class Ecouteur implements MediaPlayer.OnPreparedListener, MediaPlayer.OnErrorListener, MediaPlayer.OnCompletionListener {

        @Override
        public void onCompletion(MediaPlayer mp)//Si la musique est terminer
        {
            if (diffuseur.getCurrentPosition() > 0)
            {
                if(!debut)
                {
                    if(ensemble.getPositionCourante() < ensemble.getVecteurChansonUtilise().size() - 1)
                        ensemble.avancer();
                }
                else if(debut)
                {
                    debut = false;
                }
                mp.stop();
                diffuserChanson();
            }
        }

        @Override
        public boolean onError(MediaPlayer mp, int what, int extra)//Erreur du mediaplayer
        {
            mp.reset();
            return false;
        }

        @Override
        public void onPrepared(MediaPlayer mp)//prepare la diffusion de la chanson
        {
            mp.start();
            aCommence=true;
        }
    }

    public boolean isaCommence() {
        return aCommence;
    }

}
