package com.example.eric.applimusiquecvm;

import android.app.Activity;
import android.content.ContentResolver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Environment;
import android.provider.MediaStore;
import android.util.Log;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;
import java.util.Vector;

/**
 * Created by Hoanui on 13/05/2017.
 * Singleton
 */

public class EnsembleChanson {

    //Variables
    private static EnsembleChanson instance;
    private Vector<String> vecteurArtiste;//vecteur contenant les noms d'artiste
    private Vector<ListeLecture> vecteurListeLecture;//vecteur contenant toute les listes de lectures créées
    private Vector<Chanson> vecteurChanson;//vecteur de toutes les chanson de la carte sd
    private Vector<Chanson> vecteurChansonArtiste;//vecteur contenant les chansons d'un artiste
    private Vector<Chanson> vecteurChansonLecture;//vecteur contenant les chansons d'une liste de lecture
    private Vector<Chanson> vecteurChansonUtilise; //Vecteur contenant les chansons qu'on veut utiliser pour la diffusion
    private int positionCourante;//sert a connaître quel chansonest jouée en ce moment
    private ContentResolver c;

    //Servira pour le mode aléatoire
    private boolean aleatoire=false;
    private Random random = new Random();

    //Constructeur
    private EnsembleChanson(){

        vecteurChanson = new Vector <Chanson> ();
        vecteurArtiste = new Vector<String>();
        vecteurListeLecture = new Vector<ListeLecture>();
        vecteurChansonArtiste = new Vector <Chanson>();
        vecteurChansonUtilise = new Vector <Chanson> ();
        vecteurChansonLecture = new Vector <Chanson> ();
        positionCourante = 0;
    }

    //Obtrenir l'instance du singleton
    public static EnsembleChanson getInstance(){
        if(instance == null) {
            instance = new EnsembleChanson();
        }
        return instance;
    }

    //Avance la chanson courante
    public void avancer()
    {
        //Mode aléatoire
        if(aleatoire)
        {
            int nouvellePosition = positionCourante;
            while(nouvellePosition==positionCourante)
            {
                nouvellePosition=random.nextInt(vecteurChansonUtilise.size());
            }
            positionCourante=nouvellePosition;
        }
        //Mode en boucle
        else
            {
            if(positionCourante == vecteurChansonUtilise.size() - 1)
            {positionCourante = 0;}
            else
            {positionCourante++;}
        }
    }

    public void reculer()
    {
        //Mode aléatoire
        if(aleatoire)
        {
            int nouvellePosition = positionCourante;
            while(nouvellePosition==positionCourante)
            {
                nouvellePosition=random.nextInt(vecteurChansonUtilise.size());
            }
            positionCourante=nouvellePosition;
        }
        //Mode en boucle
        else
        {
            if(positionCourante == 0)
            {positionCourante = vecteurChansonUtilise.size() - 1;}
            else
            {positionCourante--;}
        }
    }

    //Supprimer et crééer une liste de lecture
    public void supprimerListeLecture(int position)
    {
        vecteurListeLecture.remove(position);
    }
    public void creerListeLecture(String nomListe, Vector<Chanson> titreChoisi) {vecteurListeLecture.add(new ListeLecture(nomListe, titreChoisi));}

    //Lire le fichier texte ListeLecture.txt pour accéder aux info des liste de lecture déjà créées
    public void rechecherListeLecture()
    {
        vecteurListeLecture = new Vector<ListeLecture>();
        File fichier = new File(Environment.getExternalStorageDirectory(), "ListeLecture.txt");

        if(fichier.exists())//fichier existe
        {
            try
            {
                BufferedReader lire = new BufferedReader(new FileReader(fichier));
                while(lire.ready()){

                    String infoTemporaire = lire.readLine();
                    String infoNom = "";
                    Vector<Chanson> vecteurInfoChanson = new Vector<Chanson>();

                    String lireInfo = "";

                    for(int i = 0; i < infoTemporaire.length(); i++)
                    {
                        if(infoTemporaire.charAt(i) == '.')//On accède au nom
                        {
                            infoNom = lireInfo;
                            lireInfo = "";
                        }
                        else if(infoTemporaire.charAt(i) == ',')//On accède aux chansons
                        {
                            for(int j = 0; j < vecteurChanson.size(); j++)
                            {
                                if(vecteurChanson.get(j).getId() == Long.parseLong(lireInfo))//Vérifie quel chanson a été mis dans la liste de lecture
                                {
                                    vecteurInfoChanson.add(vecteurChanson.get(j));
                                    lireInfo = "";
                                    break;
                                }
                            }

                        }
                        else
                        {
                            lireInfo = lireInfo + infoTemporaire.charAt(i);//On continue a lire les info du fichier texte
                        }

                    }
                    vecteurListeLecture.add(new ListeLecture(infoNom, vecteurInfoChanson));//ajoute le nom et les chanson de la liste de lecture
                }
                lire.close();
            } catch(IOException ioe)
            {
                ioe.printStackTrace();
            }
        }
    }

    //On écrit les information des listes de lecture créées dans le fichier ListeLecture.txt
    public void ecrire() throws IOException {

        File fichier = new File(Environment.getExternalStorageDirectory(), "ListeLecture.txt");

        //On réécrit sur le fichier existant
        if(fichier.exists())
        {
            fichier.delete();
        }

        try {
            fichier.createNewFile();
            BufferedWriter ecrire = new BufferedWriter(new FileWriter(fichier, true));

            //On identifie les id de chanson de chaque liste de lecture
            for(int j = 0; j < vecteurListeLecture.size(); j++)
             {
                String idChansons = "";
                for(int i = 0; i < vecteurListeLecture.get(j).getChansons().size(); i++)
                {
                    idChansons = idChansons  + vecteurListeLecture.get(j).getChansons().get(i).getId() + ",";
                }

                //On écrit le nom et les id des chansons de la liste de lecture
                String infoListeLecture = vecteurListeLecture.get(j).getNom() + "." + idChansons + "\n";
                 ecrire.write(infoListeLecture);
            }
            ecrire.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //Ajoute toutes les chansons de la carte sd
    public void ajouterEnsembleChanson(Activity activity)
    {
        vecteurChanson = new Vector <Chanson> ();
        c = activity.getContentResolver();

        //Variables pour les requêtes
        Cursor cursorM, cursorA;
        Uri musicUri = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI;
        Uri imageUri = MediaStore.Audio.Albums.EXTERNAL_CONTENT_URI;

        //Requêtes
        cursorM = c.query(musicUri, new String[] { "*" }, null, null, "title");
        cursorA = c.query(imageUri,new String [] { "*" },null,null, null );

        //Ajoute les infos des chansons
        if (cursorM != null)
        {
            if (cursorM.moveToFirst())
            {
                do {
                    Long id = cursorM.getLong(cursorM.getColumnIndex(MediaStore.Audio.Media._ID));
                    String titre = cursorM.getString(cursorM.getColumnIndex(MediaStore.Audio.Media.TITLE));
                    String nomAlbum = cursorM.getString(cursorM.getColumnIndex(MediaStore.Audio.Media.ALBUM));
                    String artiste = cursorM.getString(cursorM.getColumnIndex(MediaStore.Audio.Media.ARTIST));
                    int duree = cursorM.getInt(cursorM.getColumnIndex(MediaStore.Audio.Media.DURATION));

                    vecteurChanson.add(new Chanson(id,titre,artiste, duree, nomAlbum, String.valueOf(R.drawable.note), false));//On met une pochettte par défaut, qui sera changée plus tard
                } while (cursorM.moveToNext());
            }
        }

        //Ajoute les infos de la pochette de l'album
        if (cursorA != null)
        {
            if (cursorA.moveToFirst())
            {
                do {
                    String album = cursorA.getString(cursorA.getColumnIndex(MediaStore.Audio.Albums.ALBUM));
                    String pochette = cursorA.getString(cursorA.getColumnIndex(MediaStore.Audio.Albums.ALBUM_ART));

                    for(int i = 0; i < vecteurChanson.size(); i++)
                    {
                        if(vecteurChanson.get(i).getAlbum().equals(album))
                        {
                            if(pochette != null)//Si il y a une pochette, on l'ajoute
                            {
                                vecteurChanson.get(i).ajouterPochette(pochette);
                                vecteurChanson.get(i).setAvecPochette(true);
                                break;
                            }
                        }
                    }
                }while(cursorA.moveToNext());
            }
        }
        cursorM.close();
        cursorA.close();
    }

    //Ajoute les chansons selon le nom d'artiste
    public void ajouterChansonArtiste(String artiste)
    {
        vecteurChansonArtiste = new Vector<Chanson>();

        //On ajoute les chanson de l'artiste à partir de toutes les chansons de la carte sd
        for(int i = 0; i < vecteurChanson.size(); i++)
        {
            if(vecteurChanson.get(i).getArtiste().equals(artiste))
            {
                vecteurChansonArtiste.add(vecteurChanson.get(i));
            }
        }
    }

    //Ajoute les chansons selon le nom de la liste de lecture
    public void ajouterChansonLecture(String nomListe)
    {
        vecteurChansonLecture = new Vector<Chanson>();

        //On ajoute les chanson de la liste à partir de toutes les chansons de la carte sd
        for(int i = 0; i < vecteurListeLecture.size(); i++)
        {
            if(vecteurListeLecture.get(i).getNom().equals(nomListe))
            {
                vecteurChansonLecture = vecteurListeLecture.get(i).getChansons();
            }
        }
    }

    //On ajoute les noms de tout les artistes
    public void ajouterNomArtiste()
    {
        vecteurArtiste = new Vector<String>();
        for(int i = 0; i < vecteurChanson.size(); i++)
        {
            if(!vecteurArtiste.contains(vecteurChanson.get(i).getArtiste()))
            {
                vecteurArtiste.add(vecteurChanson.get(i).getArtiste());
            }
        }
    }

    //On ajoute toutes les chansons que l'on veut diffusé, selon le cas voulu
    public void ajouterChansonUtilise(String cas)
    {
        vecteurChansonUtilise = new Vector<Chanson>();
        if(cas.equals("Chanson"))
        {
            vecteurChansonUtilise = vecteurChanson;
        }
        else if(cas.equals("Artiste"))
        {
            vecteurChansonUtilise = vecteurChansonArtiste;
        }
        else if(cas.equals("Lecture"))
        {
            vecteurChansonUtilise = vecteurChansonLecture;
        }
    }

    //Méthodes d'accès et de mutation
    public Vector<Chanson> getVecteurChanson() {
        return vecteurChanson;
    }

    public int getPositionCourante() {
        return positionCourante;
    }

    public void setPositionCourante(int indice) {
        this.positionCourante = indice;
    }

    public boolean isAleatoire() {
        return aleatoire;
    }

    public Vector<ListeLecture> getVecteurNomListeLecture() {
        return vecteurListeLecture;
    }

    public void setAleatoire(boolean shuffle) {
        this.aleatoire = shuffle;
    }

    public Vector<String> getVecteurArtiste() {
        return vecteurArtiste;
    }

    public Vector<Chanson> getVecteurChansonUtilise() {
        return vecteurChansonUtilise;
    }

}
