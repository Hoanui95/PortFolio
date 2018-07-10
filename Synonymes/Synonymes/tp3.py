#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import re
import random
import numpy as np
import cx_Oracle
from collections import OrderedDict
from math import sqrt
import time
from Clustering import Cluster
from Clustering_random import Cluster_Random


#fonction qui lit un fichier texte		
def lireTexte(path, enc):
	f = open(path, 'r', encoding=enc)
	corpus = f.read()	
	if corpus[0] == '\ufeff':
		corpus=corpus[1:]
	f.close()	
	return corpus

#fonciton pour envoyer touts les mots des textes dans une liste
def parseMot(corpus):	
	corpus = corpus.lower()
	p = re.compile('[ ,\n\'’«».:;\?!""#%$*/\-@|<>+_`{}&¨=°()^\[\]]+')
	liste1 = p.split(corpus)
	del liste1[len(liste1) - 1]	
	return liste1

#fonction qui donne pour chaque mot de la liste une valeur unique
def accesDictionnaireBD(connexion):
	dictionnaireBD = {}
	cur = connexion.cursor()	
	selectIndexDico = "Select id, motv from vocabulaire"
	cur.execute(selectIndexDico)
	for rangee in cur.fetchall():
		mot = rangee[1]
		id = rangee[0]
		dictionnaireBD[mot]=id	
	return dictionnaireBD

		
def accesMatriceCooc(connexion, tailleDico, tailleFenetre ):
	matrice = np.zeros((tailleDico, tailleDico))
	
	cur = connexion.cursor()
	tf = int(tailleFenetre)	
	selectIndexListe = "Select id_gauche, id_droite, resultat from matrice where TF = :1 "
	cur.execute(selectIndexListe, {'1': tf})	
	for rangee in cur.fetchall():
		id_gauche = rangee[0]
		id_droite = rangee[1]
		resultat = rangee[2]
		matrice[id_gauche][id_droite] = resultat	
	return matrice

def accesDictionnaireAncien(connexion):
	dictionnaire = {}
	cur = connexion.cursor()	
	select = "Select id_gauche, id_droite, tf from matrice"
	cur.execute(select)	
	for rangee in cur.fetchall():
		dictionnaire[(rangee[0], rangee[1], rangee[2])] = 0	
	return dictionnaire
	
	
def indexMotDictionnaire1(liste, dicitonnaireBD):	
	motarajouterDico = []
	for i in liste:
		if i not in motarajouterDico and i not in dicitonnaireBD:
			motarajouterDico.append(i)	
	return motarajouterDico	
	
#fonction qui insert les mots sans doublon dans la base des donnnees
def insertionDictionnaire(connexion,motarajouterDico):
	cur = connexion.cursor()
	liste = []	
	selectIndexDico = "Select count(*) from vocabulaire"
	cur.execute(selectIndexDico)
	for rangee in cur.fetchall():
		index = rangee[0]
		index = int(index)
		break
	start = index
	for i in range(0, len(motarajouterDico)):
		tuple = (index, motarajouterDico[i])
		liste.append(tuple)
		index += 1
	insertBD = "INSERT INTO vocabulaire VALUES(:1,:2)"
	cur.executemany(insertBD,liste )
	connexion.commit()
	return start
#fonction qui calcule la matrice de coocurence

def connexionOracle():
	PATH_ORACLE = 'C:\Oracle\client\product\12.2.0\client_1\bin'
	sys.path.append(PATH_ORACLE)
	mdp = 'Mataihau98'
	dns_tns = cx_Oracle.makedsn('delta', 1521, 'decinfo')
	chaineConnexion = 'e1593274' + '/' + mdp + '@' + dns_tns
	connexion = cx_Oracle.connect(chaineConnexion)
	return connexion;	

def deconnexionOracle(connexion):
	connexion.close()
	
def aggrandirmatriceBD(connexion, taillefentre, liste):
	cur = connexion.cursor()
	listeA = []
	listeB = []
	tf = int(taillefentre)
	dicAncien = liste[0]
	dicNouveau = liste[1]
	for cle, valeur in dicNouveau.items():
		listeA.append(( cle[0], cle[1] , valeur, cle[2]))
	for cle, valeur in dicAncien.items():
		listeB.append(( valeur, cle[0], cle[1] , cle[2]))
	insertBD = "INSERT INTO matrice VALUES(:1,:2, :3, :4)"
	cur.executemany(insertBD,listeA )
	updateBD = "UPDATE matrice SET resultat = resultat + :1 where id_gauche = :2 and id_droite = :3 and TF = :4"
	cur.executemany(updateBD,listeB)
	connexion.commit()	
	
def matriceCoocurence(connexion,dictionnaireBD, dictionnaireAncien, liste, tailleFenetre):
	dicAncien = dictionnaireAncien
	dicNouveau = {}	
	#Initialisation des valeurs 
	TF =  int(tailleFenetre) #taille fenetre
	tailleDico = len(dictionnaireBD)
	tailleCorpus = len(liste)
	d = 0 
	m = TF//2
	F = TF	
	matrice = np.zeros((tailleDico,tailleDico))
	iMot = 0
	iccooc = 0
	#Calcul
	while F <= tailleCorpus:
		i = d
		motM = liste[m]
		iccooc = dictionnaireBD[motM]#id_g
		while i < F:
			if i != m:
				motI = liste[i]
				iMot = dictionnaireBD[motI]#id_g
				if((iMot, iccooc, TF) in dicAncien):
					dicAncien[(iMot, iccooc, TF)] += 1
				else:
					if((iMot, iccooc, TF) not in dicNouveau):
						dicNouveau[(iMot, iccooc, TF)] = 1
					else:
						dicNouveau[(iMot, iccooc, TF)] += 1				
				matrice[iMot][iccooc] +=  1
			i+= 1 
		d += 1
		m += 1
		F += 1
	list = []
	list.append(dicAncien)
	list.append(dicNouveau)
	return list
	

def stopListe():
    f = open('StopListe.txt','r',encoding = 'utf-8')
    stopList = f.read()
    f.close()    
    return stopList

def main():
	entrainement = False
	tailleFenetre = ""
	recherche = False
	connexion = connexionOracle()
	for i in range(1, len(sys.argv)):
		if(sys.argv[i] == "-e"):
			entrainement = True
			enc = ""
			chemin = []
			break
			
	if(entrainement == True):		
		for i in range(1, len(sys.argv)):
			if(sys.argv[i] == "-e"):
				continue
			elif(sys.argv[i] == "-t"):
				tailleFenetre = sys.argv[i + 1]
			elif(sys.argv[i] == "-enc"):
				enc = sys.argv[i + 1]
			elif(sys.argv[i] == "-cc"):
				for j in range (i+1, len(sys.argv)):
					if(sys.argv[j] != "-cc" and sys.argv[j] != "-enc" and sys.argv[j] != "-t" and sys.argv[j] != "-e"):
						chemin.append(sys.argv[j])
					else:
						break						
		listeMot = []		
		#On va chercher tous les mots de tout les textes pour les mettre dans une liste
		for i in range(0, len(chemin)):
			texte = lireTexte(chemin[i], enc)
			listeTemp = parseMot(texte)
			listeMot.extend(listeTemp)		
		dictionnaireAncien = accesDictionnaireAncien(connexion)
		dictionnaireBD = accesDictionnaireBD(connexion)
		listeDictionnaireMot = indexMotDictionnaire1(listeMot, dictionnaireBD)
		start = insertionDictionnaire(connexion, listeDictionnaireMot)		
		dictionnaireBD = accesDictionnaireBD(connexion)
		liste = matriceCoocurence(connexion, dictionnaireBD, dictionnaireAncien, listeMot, tailleFenetre)
		aggrandirmatriceBD(connexion, tailleFenetre, liste)				
		print("entrainement fini")
	else:
		startTime = time.clock()
		listeMot=[]
		mode=""
		n = 0
		nc = 0
		for i in range(1, len(sys.argv)):			
			if(sys.argv[i] == "-t"):
				tailleFenetre = sys.argv[i + 1]
				
			elif(sys.argv[i] == "-m"):
				mode = sys.argv[i]
				for j in range (i+1, len(sys.argv)):
					if(sys.argv[j] != "-n" and sys.argv[j] != "-t"):
						listeMot.append(sys.argv[j])
					else:
						break
			elif(sys.argv[i] == "-nc"):	
				mode = sys.argv[i]
				nbRandom = int(sys.argv[i + 1])
			elif(sys.argv[i] == "-n"):
				n = int(sys.argv[i + 1])
				
		
		#listePoints = pointRandom(len(accesDictionnaireBD(connexion)), nc)
		
		dictionnaireBD = accesDictionnaireBD(connexion)
		matrice = accesMatriceCooc(connexion, len(dictionnaireBD) , tailleFenetre)
		
		if(mode == "-nc"):
			c = Cluster_Random(matrice, nbRandom, dictionnaireBD, n, stopListe())
			c.Clustering()
		else:
			c = Cluster(matrice, listeMot, dictionnaireBD, n,stopListe())
			c.Clustering()
		
			
		endTime = (time.clock() - startTime)
		print("Temps utilise: ", endTime)
		
		
		
	
	deconnexionOracle(connexion)	
if __name__ == '__main__':
	main()