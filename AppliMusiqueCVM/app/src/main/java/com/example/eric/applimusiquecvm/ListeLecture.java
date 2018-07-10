package com.example.eric.applimusiquecvm;

import java.util.Vector;

/**
 * Created by Hoanui on 20/05/2017.
 * Classe Liste Lecture
 */

public class ListeLecture {

    //Variables
    private Vector<Chanson> chansons;
    private String nom;

    //Constructeur
    public ListeLecture(String nom, Vector<Chanson> chansons)
    {
        this.nom = nom;
        this.chansons = new Vector<Chanson>();
        this.chansons = chansons;
    }

    //Méthodes d'accès
    public Vector<Chanson> getChansons() {
        return chansons;
    }

    public String getNom() {
        return nom;
    }

}
