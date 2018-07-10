package com.example.eric.applimusiquecvm;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckedTextView;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;
import java.util.Vector;

/*
 * Activié pour créer une liste de lecture
 */
public class CreerListeActivity extends AppCompatActivity {

    //Variables
    private Button creer;
    private EditText nom;
    private ListView listeChoisi;
    private Vector<String> titreChansons;//Sert à ajouter les titres des chansons de la carte à afficher
    private Vector<Chanson> chansonsChoisies;

    private EnsembleChanson ensemble;
    private Vector<String> listeLectureDejaCréé; //Sert à vérifier si le nom de liste existe déja

    private Ecouteur ec;//Ecouteur

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_creer_liste);

        //Recherche id des widgets
        creer = (Button) findViewById(R.id.creerListe);
        nom = (EditText) findViewById(R.id.nomListe);
        listeChoisi = (ListView) findViewById(R.id.listeChansonChoisir);

        //Obtenir l'instance du Singleton
        ensemble = EnsembleChanson.getInstance();

        //Contient tout les noms de liste de lecture déjà créés
        listeLectureDejaCréé = new Vector<String>();
        for(int i = 0; i < ensemble.getVecteurNomListeLecture().size(); i++)
        {
            listeLectureDejaCréé.add(ensemble.getVecteurNomListeLecture().get(i).getNom());
        }

        //Contient tout les titres des chansons de la carte sd
        titreChansons = new Vector<String>();
        chansonsChoisies = new Vector<Chanson>();
        for(int i = 0; i < ensemble.getVecteurChanson().size(); i++)
        {
            titreChansons.add(ensemble.getVecteurChanson().get(i).getTitre());
        }

        //Envoi les infos au ListView
        ArrayAdapter adapter = new ArrayAdapter(this, android.R.layout.simple_list_item_checked, titreChansons);
        listeChoisi.setAdapter(adapter);

        //Ecouteur
        ec= new Ecouteur();
        creer.setOnClickListener(ec);
        listeChoisi.setOnItemClickListener(ec);
    }

    //Classe Ecouteur
    private class Ecouteur implements View.OnClickListener, AdapterView.OnItemClickListener
    {
        @Override
        public void onClick(View v) {

            if(nom.getText().toString().equals("")) //Si il n'y a pas de nom de liste
            {
                Toast.makeText(getApplicationContext(), "Veuillez entrez un nom de liste", Toast.LENGTH_LONG).show();

            } else if (listeLectureDejaCréé.contains(nom.getText().toString()))//Si il le nom existe déjà
            {
                Toast.makeText(getApplicationContext(), "Ce nom existe déjà!", Toast.LENGTH_LONG).show();
            }
            else
            {
                ensemble.creerListeLecture(nom.getText().toString(), chansonsChoisies);//ajoute la nouvelle liste
                Toast.makeText(getApplicationContext(), "La liste est créée!", Toast.LENGTH_LONG).show();
                finish();
            }
        }

        @Override
        public void onItemClick(AdapterView<?> parent, View itemSel, int position, long id) {

            //On ajoute ou enlève la chanson choisie
            ((CheckedTextView) itemSel).setChecked(true);
            CheckedTextView titreSel = (CheckedTextView) itemSel;

            if(titreSel.isChecked())
            {
                chansonsChoisies.add(ensemble.getVecteurChanson().get(position));
            }
            else
            {
                chansonsChoisies.remove(ensemble.getVecteurChanson().get(position));
            }
        }
    }
}
