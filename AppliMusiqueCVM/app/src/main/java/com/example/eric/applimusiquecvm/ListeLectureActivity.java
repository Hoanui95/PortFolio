package com.example.eric.applimusiquecvm;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import java.io.IOException;
import java.util.Vector;

/*
 * Activité qui affiche les listes de lectures
 */
public class ListeLectureActivity extends AppCompatActivity {

    //Variables
    private Button CreerListe;
    private ListView listeLecture;
    private EnsembleChanson ensemble;

    private Vector<String> nomListe;//vecteur contenant les noms des listes qui existe déjà
    private int positionSupprime = 0;//Sert a savoir la liste que l'usager veut supprimer
    private Ecouteur ec;//Ecouteur

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_liste_lecture);

        //Récupère les id des widgets
        CreerListe = (Button) findViewById(R.id.boutonCreerListe);
        listeLecture = (ListView) findViewById(R.id.listeLecture);

        //Obtenir l'instance du singleton et rechercher les listes déja exisatant dans le fichier texte
        ensemble = EnsembleChanson.getInstance();
        ensemble.rechecherListeLecture();

        //Ecoueur
        ec = new Ecouteur();
        CreerListe.setOnClickListener(ec);
        listeLecture.setOnItemClickListener(ec);
        listeLecture.setOnItemLongClickListener(ec);//Utiliser pour supprimer une liste de lecture, si l'usager maintient
                                                    //un élément du listView
    }

    //Affiche les liste de lecture, même quand l'usager a fini de créer sa liste
    protected void onResume()
    {
        super.onResume();

        //Recher et affiche les noms des listes de lecture
        nomListe = new Vector<String>();
        for(int i = 0; i < ensemble.getVecteurNomListeLecture().size(); i++)
        {
            nomListe.add(ensemble.getVecteurNomListeLecture().get(i).getNom());
        }

        ArrayAdapter adapter = new ArrayAdapter(this, android.R.layout.simple_list_item_1, nomListe);
        listeLecture.setAdapter(adapter);
    }

    //Interface dialogue pour demander à l'usager si il souhaite supprimer une liste de lecture
    public void creerAlertDialogAvecEditText ( String message)
    {
        AlertDialog.Builder builder = new AlertDialog.Builder(ListeLectureActivity.this);
        builder.setMessage(message)
                .setTitle("Supprimer!");

        builder.setPositiveButton("OK", ec);
        builder.setNegativeButton("Annuler",ec);
        AlertDialog dialog = builder.create();
        dialog.show();
    }

    //Ecrit dans le fichier texte les listes de lecture à la fin de l'activité
    protected void onDestroy()
    {
        try {
            ensemble.ecrire();
        } catch (IOException e) {
            e.printStackTrace();
        }
        super.onDestroy();
    }

    //Classe Ecouteur
    private class Ecouteur implements AdapterView.OnItemClickListener, View.OnClickListener, AdapterView.OnItemLongClickListener, DialogInterface.OnClickListener
    {
        @Override
        public void onClick(View v) {
            //On veut créer une nouvelle liste
            Intent i = new Intent(ListeLectureActivity.this, CreerListeActivity.class);
            startActivity(i);

            //Transition par fondu entre deux activités
            overridePendingTransition(R.transition.fondu_debut, R.transition.fondu_fin);
        }

        @Override
        public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

            //On affiche les chasons de la liste pour diffuser
            ensemble.ajouterChansonLecture(ensemble.getVecteurNomListeLecture().get(position).getNom());
            Intent i = new Intent (ListeLectureActivity.this, EnsembleChansonActivity.class);
            i.putExtra("Activité", "Lecture");
            startActivity(i);

            //Transition par fondu entre deux activités
            overridePendingTransition(R.transition.fondu_debut, R.transition.fondu_fin);

        }

        @Override
        public boolean onItemLongClick(AdapterView<?> parent, View view, int position, long id) {
            //Demande à l'usager si il veut supprimer cette liste;
            positionSupprime = position;
            creerAlertDialogAvecEditText("Voulez-vous supprimez cette liste ?");
            return true;
        }

        @Override
        public void onClick(DialogInterface dialog, int which) {

            //On supprime ou pas selon la r.ponse de l'usager
            if(which == DialogInterface.BUTTON_POSITIVE)
            {
                ensemble.supprimerListeLecture(positionSupprime);
                onResume();
            }
            else if(which == DialogInterface.BUTTON_NEGATIVE)
            {
                dialog.cancel();
            }

        }
    }

}
