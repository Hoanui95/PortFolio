package com.example.eric.applimusiquecvm;

/**
 * Created by Hoanui on 13/05/2017.
 * Classe Chanson
 */

public class Chanson {

    //Variables
    private Long id;
    private String titre;
    private String artiste;
    private int duree;
    private String album;
    private String pochette;
    private boolean avecPochette;

    //Constructeur
    public Chanson(Long id, String titre, String artiste, int duree, String album, String pochette, Boolean avecPochette)
    {

        this.id = id;
        this.titre = titre;
        this.artiste = artiste;
        this.duree = duree;
        this.album = album;
        this.pochette = pochette;
        this.avecPochette = avecPochette;

    }

    //Méthodes d'accès et de mutation nécéssaires

    public boolean getAvecPochette() {
        return avecPochette;
    }

    public void setAvecPochette(boolean avecPochette) {
        this.avecPochette = avecPochette;
    }

    public void ajouterPochette(String pochette) {
        this.pochette = pochette;
    }

    public String getPochette() {
        return pochette;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitre() {
        return titre;
    }

    public String getArtiste() {
        return artiste;
    }

    public String getAlbum() {
        return album;
    }
}

