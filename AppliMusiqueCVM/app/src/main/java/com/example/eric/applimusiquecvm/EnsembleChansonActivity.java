package com.example.eric.applimusiquecvm;

import android.content.Intent;
import android.support.v4.app.ActivityOptionsCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import java.util.Hashtable;
import java.util.Vector;

/*
 * Activité qui affiche les chansons que l'on veut diffusées
 */
public class EnsembleChansonActivity extends AppCompatActivity {

    //Variables
    private ListView liste;
    private Vector<Hashtable<String,String>> vect = new Vector<Hashtable<String,String>>();
    private Ecouteur ec;//Ecouteur
    private EnsembleChanson ensemble;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ensemble_chanson);

        //Recherche id des widgets
        liste = (ListView) findViewById(R.id.listeChanson);

        //Obtenir l'instance du Singleton
        ensemble = EnsembleChanson.getInstance();

        //Reconnait si on veut afficher toutes les chansons, celles d'un artiste ou celles d'une liste de lecture
        Bundle b = getIntent().getExtras();
        ensemble.ajouterChansonUtilise((String)b.get("Activité"));

        //Ajoute au ListView les chansons a diffusées
        for(int i = 0; i < ensemble.getVecteurChansonUtilise().size(); i++) {
            Hashtable<String,String> temp = new Hashtable<String, String>();
            temp.put("pochette", ensemble.getVecteurChansonUtilise().get(i).getPochette());
            temp.put("titre", ensemble.getVecteurChansonUtilise().get(i).getTitre());
            temp.put("artiste", ensemble.getVecteurChansonUtilise().get(i).getArtiste());
            vect.add(temp);
        }
        SimpleAdapter monAdapter = new SimpleAdapter(this, vect, R.layout.unitem, new String[]{ "pochette", "titre", "artiste"}, new int []{ R.id.imagePochette,R.id.textTitre, R.id.textArtiste});
        liste.setAdapter(monAdapter);

        //Ecouteur
        ec = new Ecouteur();
        liste.setOnItemClickListener(ec);
    }

    //Classe Ecouteur
    private class Ecouteur implements AdapterView.OnItemClickListener
    {
        @Override
        public void onItemClick(AdapterView<?> parent, View itemSel, int position, long id) {

            //On recher la chasons et on l'a diffuse
            ensemble.setPositionCourante(position);
            Intent i = new Intent(EnsembleChansonActivity.this, DiffusionActivity.class);
            startActivity(i);
        }
    }
}