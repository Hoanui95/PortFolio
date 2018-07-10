package com.example.eric.applimusiquecvm;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
/*
 * Activité qui affiche les noms d'artistes
 */
public class ListeArtisteActivity extends AppCompatActivity {

    //Variables
    private  ListView listeArtiste;
    private Ecouteur ec;
    private EnsembleChanson ensemble;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_liste_artiste);

        //Recherche les id des widgets
        listeArtiste = (ListView) findViewById(R.id.listeArtiste);

        //Obtenir l'instance du singleton
        ensemble = EnsembleChanson.getInstance();

        //Ajoute au ListView les noms d'artiste
        ArrayAdapter adapter = new ArrayAdapter(this, android.R.layout.simple_expandable_list_item_1, ensemble.getVecteurArtiste());
        listeArtiste.setAdapter(adapter);

        //Ecouteur
        ec = new Ecouteur();
        listeArtiste.setOnItemClickListener(ec);


    }

    //Classe Ecouteur
    private class Ecouteur implements AdapterView.OnItemClickListener
    {
        @Override
        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

            //On recherche les chansons de l'artiste et on les affiches dans l'activité EnsembleChansonActivity
            ensemble.ajouterChansonArtiste(ensemble.getVecteurArtiste().get(position));
            Intent i = new Intent (ListeArtisteActivity.this, EnsembleChansonActivity.class);
            i.putExtra("Activité", "Artiste");
            startActivity(i);

            //Transition par fondu entre deux activités
            overridePendingTransition(R.transition.fondu_debut, R.transition.fondu_fin);
        }
    }
}
