# coding:  utf-8
import random

class AnalyseDTOJoueur(object):
    def __init__(self, dtoJoueur):
        self.dtoJoueur = dtoJoueur
        self.qualifA = {
            "vie" : ["le fougeux", "le pétulant", "l'immortel"],
            "force" : ["le crossfiter", "le hulk", "le tout puissant"],
            "agilite" : ["le prompt", "le lynx", "le foudroyant"],
            "dexterite" : ["le précis", "l'habile", "le chirurgien"]
        }
        self.qualifB = {
            "vie" : ["le fougeux", "pétulant", "immortel"],
            "force" : ["qui fait du crossfit", "brutal", "Marc-André"],
            "agilite" : ["prompt", "lynx", "foudroyant"],
            "dexterite" : ["précis", "habile", "chirurgien"]
        }

    def nomCalcule(self):
        nomCalcule = ""
        listAttribut = [self.dtoJoueur.vie, self.dtoJoueur.force,  self.dtoJoueur.agilite, self.dtoJoueur.dexterite]
        listAttribut.sort()

        somme = 0
        for num in listAttribut:
            somme += num
        
        if(somme > 0):
            if(listAttribut[0] >= 25 and listAttribut[1] >= 25 and listAttribut[2] >= 25 and listAttribut[3] >= 25):
                nomCalcule = self.dtoJoueur.nom + " le Dominateur"
            elif(somme > listAttribut[3]): #au moins 2 attribut sont plus grand que 0
                nomCalcule = self.dtoJoueur.nom + " " + self.qualificatif(listAttribut[3], "A")
                nomCalcule = nomCalcule + " " +  self.qualificatif(listAttribut[2], "B")
            else: #un seul attribut est plus grand que 0
                nomCalcule = self.dtoJoueur.nom + " " +  self.qualificatif(listAttribut[3], "A")
        else:
            nomCalcule = self.dtoJoueur.nom


        return nomCalcule

    def qualificatif(self, attribut, categorie):
        qualif = ""
        if(categorie == "A"):
            if(attribut == self.dtoJoueur.vie):
                qualif = self.nomQualif(attribut, categorie, "vie")
                self.premierQualif = "vie"
            elif(attribut == self.dtoJoueur.force):
                qualif = self.nomQualif(attribut, categorie, "force")
                self.premierQualif = "force"
            elif(attribut == self.dtoJoueur.agilite):
                qualif = self.nomQualif(attribut, categorie, "agilite")
                self.premierQualif = "agilite"
            elif(attribut == self.dtoJoueur.dexterite):
                qualif = self.nomQualif(attribut, categorie, "dexterite")
                self.premierQualif = "dexterite"
        else:
            if(attribut == self.dtoJoueur.vie and self.premierQualif != "vie"):
                qualif = self.nomQualif(attribut, categorie, "vie")
            elif(attribut == self.dtoJoueur.force and self.premierQualif != "force"):
                qualif = self.nomQualif(attribut, categorie, "force")
            elif(attribut == self.dtoJoueur.agilite and self.premierQualif != "agilite"):
                qualif = self.nomQualif(attribut, categorie, "agilite")
            elif(attribut == self.dtoJoueur.dexterite and self.premierQualif != "dexterite"):
                qualif = self.nomQualif(attribut, categorie, "dexterite")


        return qualif
    
    
    def nomQualif(self, attribut, categorie, nomAttribut):
        nom = ""
        if(categorie == "A"):
            if(attribut >= 10):
                nom = self.qualifA[nomAttribut][2]
            elif(attribut >= 5):
                nom = self.qualifA[nomAttribut][1]
            elif(attribut >= 1):
                nom = self.qualifA[nomAttribut][0]
        elif(categorie == "B"):
            if(attribut >= 10):
                nom = self.qualifB[nomAttribut][2]
            elif(attribut >= 5):
                nom = self.qualifB[nomAttribut][1]
            elif(attribut >= 1):
                nom = self.qualifB[nomAttribut][0]
                
        return nom
        

    
    