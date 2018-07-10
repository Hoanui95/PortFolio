import numpy as np
import os
from collections import OrderedDict
	
class Cluster():
	def __init__(self, matrice, listeMot, dictionnaire, nbSynonyme, stopliste):
		self.matrice = matrice
		self.dictionnaire = dictionnaire
		self.listeMot = listeMot
		self.nbSynonyme = nbSynonyme
		self.stopliste = stopliste
		
		self.listeResult = []
		self.ResultIte = ""
		self.nbMotCluster = []
		self.groupe = ""
		self.listSynnonyme = []
		
	def predictionLeastSquare(self, matrice, vecteurMot):
		
		dictionnaireResultat = {}
	
		for cle, value in self.dictionnaire.items():
				vecteurCle = matrice[value]
				score = np.square(np.subtract(vecteurMot, vecteurCle))
				score = np.sum(score)
				
				
				dictionnaireResultat[cle] = np.sum(score)
		return dictionnaireResultat;
	
	
	
	def Clustering(self): 
	
		begin = True
		ancienneListe = []
		nouvelleListe = []
		change = 1
		ite = 0
		tupleMatrice = ()
		
		matriceCentroide = np.zeros((len(self.listeMot),len(self.dictionnaire)))
		
		for i in range(0, len(self.listeMot)):
			matriceCentroide[i] = self.matrice[self.dictionnaire[self.listeMot[i]]]	
		
		
		
		while(change != 0):
			
			ancienneListe = nouvelleListe
			nouvelleListe = []
			listeResultat = []
			
			if (begin != True):
				matriceCentroide = self.barycentre(ancienneListe, len(self.listeMot))
				
			
				
			for i in range(0, len(matriceCentroide)):
				listeResultat.append(self.predictionLeastSquare(self.matrice,matriceCentroide[i]))
				
			
			for cle, value in self.dictionnaire.items():
				plusPetit = 0
				indiceCluster = 0
				valeurMots = []		
				
				for j in listeResultat:
					for mot, score in j.items():
						if(mot == cle):
							valeurMots.append(score)
							break	
				
				t = (valeurMots.index(min(valeurMots)),cle)
				nouvelleListe.append(t)
			
			
			ite += 1
			change = self.nbChangementClusters(ancienneListe,nouvelleListe, begin)
			begin = False
				
			self.Resultat( ite, change)
			self.EcrireResultat()
			
		listeResultatTrie = []
		for Dictionnaire in listeResultat:
			listeResultatTrie.append(OrderedDict(sorted(Dictionnaire.items(), key=lambda x: x[1])))
		print("fin order")	
		
		self.affichageResultats(nouvelleListe, listeResultatTrie)		
		
		return 0
	
	
	def barycentre(self, ancienneListe, nbCentroides):
		tuple = ()
		
		
		#vecteurMot = self.matrice[self.dictionnaire[self.listeMot[i]]]	
		
		matrice = np.zeros((nbCentroides, len(self.dictionnaire)))
		liste = np.zeros(nbCentroides)		
		
		for i in ancienneListe:			
			tuple = i 
			centroide = tuple[0]
			Mot = tuple[1]
			matrice[centroide] += self.matrice[self.dictionnaire[Mot]]
			liste[centroide] += 1
			
		for j in range (0, len(matrice)):
			matrice[j] = matrice[j]/liste[j]
		
		
		return matrice
		

				
	def nbChangementClusters(self, ancienneListe, nouvelleListe, debut):
		
		nbChangement = 0
		self.nbMotCluster = np.zeros(len(self.listeMot))
		
		for i in nouvelleListe:
				tuple = i 
				centroide = tuple[0]
				self.nbMotCluster[centroide] += 1
		
		if (debut == True):
			nbChangement = len(nouvelleListe)
			
		else:
			for i in range(0, len(ancienneListe)):
				if ancienneListe[i][0] != nouvelleListe[i][0]:
					nbChangement += 1
					
		return nbChangement
		
	def affichageResultats(self, listeClusterMot, listeResultat):	
		
		for tour in range(0,len(self.listeMot)):
			self.listSynnonyme = []
			temp = ""
			self.groupe = "Groupe : " + str(tour)
			indexSynonyme = 1
			
			for mot, score in listeResultat[tour].items():
				if(mot in  self.stopliste):
								continue
				if(indexSynonyme == self.nbSynonyme + 1):
								break
				for tuple in listeClusterMot:
					cluster = tuple[0]
					motTuple = tuple[1]
					if(cluster == tour):
						if(motTuple == mot):
							temp = (mot + "--> " + str(listeResultat[tour][mot]) + "\n" )
							self.listSynnonyme.append(temp)
							indexSynonyme += 1
				
			self.EcrireResultatFin()
			
		
	def Resultat(self, iteration, changementCluster):
		temp = ""
		self.listeResult = []
		for i in range(0, len(self.nbMotCluster)):
			temp = "Il y a " + str(self.nbMotCluster[i]) + " points (mots) regroupes autour du centroïde no " + str(i) + "\n"
			self.listeResult.append(temp)

		self.ResultIte = "Iteration " + str(iteration) + " terminee. " + str(changementCluster) + " changements de clusters."+ "\n\n"
		
	
	def EcrireResultat(self):
		fichier = open("Resultat.txt", "a")
		
		for i in range(0, len(self.listeResult)):
			fichier.write(self.listeResult[i])
		
	
	
		fichier.write("\n============================================\n")
		fichier.write(self.ResultIte)
	
		
		fichier.close()
	
	def EcrireResultatFin(self):
		fichier = open("Resultat.txt", "a")
		
		
		fichier.write("\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n")
		fichier.write(self.groupe)
		fichier.write("\n\n")
		
		for i in range(0, len(self.listSynnonyme)):
			fichier.write(self.listSynnonyme[i])
			
		fichier.close()
		
	
