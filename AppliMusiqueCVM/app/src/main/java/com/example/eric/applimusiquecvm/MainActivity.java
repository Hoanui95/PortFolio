package com.example.eric.applimusiquecvm;

import android.content.Intent;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.ImageView;
import java.util.concurrent.atomic.AtomicBoolean;
/*
 * Activité du menu au démarrage
 */

public class MainActivity extends AppCompatActivity {

    //Variables
    private Button boutonChanson;
    private Button boutonArtiste;
    private Button boutonLecture;
    private EnsembleChanson ensemble;
    private ImageView img;
    private Ecouteur ec;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu);

        boutonChanson = (Button) findViewById(R.id.boutonChanson);
        boutonArtiste = (Button) findViewById(R.id.boutonArtiste);
        boutonLecture = (Button) findViewById(R.id.boutonLecture);
        img = (ImageView) findViewById(R.id.logo) ;

        ensemble = EnsembleChanson.getInstance();
        ensemble.ajouterEnsembleChanson(MainActivity.this);

        ec = new Ecouteur();
        boutonChanson.setOnClickListener(ec);
        boutonArtiste.setOnClickListener(ec);
        boutonLecture.setOnClickListener(ec);
    }

    private class Ecouteur implements View.OnClickListener
    {

        @Override
        public void onClick(View v) {

            if(v == boutonChanson)
            {
                Intent i = new Intent(MainActivity.this, EnsembleChansonActivity.class);
                i.putExtra("Activité", "Chanson");
                startActivity(i);
                overridePendingTransition(R.transition.fondu_debut, R.transition.fondu_fin);

            }
            else if(v == boutonArtiste)
            {
                ensemble.ajouterNomArtiste();
                Intent i = new Intent(MainActivity.this, ListeArtisteActivity.class);
                startActivity(i);
                overridePendingTransition(R.transition.fondu_debut, R.transition.fondu_fin);
            }
            else if(v == boutonLecture)
            {
                Intent i = new Intent(MainActivity.this, ListeLectureActivity.class);
                startActivity(i);
                overridePendingTransition(R.transition.fondu_debut, R.transition.fondu_fin);
            }
        }
    }
}
