import random

import math
from helper import Helper as hlp
import sys

import random


class Pulsar():
    def __init__(self, parent, x, y):
        self.parent = parent
        self.id = parent.parent.createurId.prochainid()
        self.proprietaire = "inconnu"
        self.x = x
        self.y = y
        self.periode = random.randrange(20, 50, 5)
        self.moment = 0
        self.phase = 1 
        self.mintaille = self.taille = random.randrange(2, 4)
        self.maxtaille = self.mintaille + +random.randrange(1, 3)
        self.pas = self.maxtaille / self.periode
        self.taille = self.mintaille
        
    def evoluer(self):
        self.moment = self.moment + self.phase
        if self.moment == 0:
            self.taille = self.mintaille
            self.phase = 1
        elif self.moment == self.periode:
            self.taille = self.mintaille + self.maxtaille
            self.phase = -1
        else:
            self.taille = self.mintaille + (self.moment * self.pas)
 
class MarchePublique():
    def __init__(self): 
        # la value est le prix en credit
        self.prix_ressources = {'or':100,
                           'bois':10,
                           'mineraux':50,
                           'petrole':100,
                           'pierre':10,
                           'nourriture':50,
                           'energie':200,
                           }
        self.ratio_vente = 0.75
        
    def acheter_au_marche(self, nom_ressource, quantite, joueur):
        cout = self.prix_ressources[nom_ressource] * quantite
        joueur.ressources['credit'] -= cout
        joueur.ressources[nom_ressource] += quantite
    
    def vendre_au_marche(self, nom_ressource, quantite, joueur):
        revenu = math.floor(self.prix_ressources[nom_ressource] * quantite * self.ratio_vente)
        joueur.ressources['credit'] += revenu
        joueur.ressources[nom_ressource] -= quantite
    
    def assez_de_credits(self, nom_ressource, quantite, joueur):
        cout = self.prix_ressources[nom_ressource] * quantite
        if joueur.ressources['credit'] >= cout:
            print("assez de credit")
            return True
        return False
    
    def assez_de_ressources(self, nom_ressource, quantite, joueur):
        if joueur.ressources[nom_ressource] >= quantite:
            return True
        return False
    
    def acheter_billet_loterie(self, mise, joueur):
        
        resultat = random.random()
        
        if resultat == 1.0:
            joueur.ressources['credit'] += (mise * 10)
        elif resultat >= 0.6:
            joueur.ressources['credit'] += (mise * 2)
        else:
            joueur.ressources['credit'] -= mise
 
class Ville():
    def __init__(self, parent, joueurId, x=1000, y=1000):
        self.parent = parent
        self.id = self.parent.parent.parent.createurId.prochainid()
        self.x = x
        self.y = y
        self.proprietaire = joueurId
        self.taille = 500
        self.level = 1
        self.infrastructures = []
        self.name = "placeholder"
        self.image = "images/img_orion/ville_1.png"
        
        self.soldats = []
        self.chars = []
        
    def creerInfrastructure(self, joueur, inf, x, y, nom):
        id = None
        if inf:
            batiment = None
            if inf == 'mine':
                batiment = Mine(self,x,y)
            elif inf == 'scierie':
                batiment = Scierie(self,x,y)
            elif inf == 'theatre':
                pass
                # batiment = Theatre(self,x,y)
            elif inf == 'universite':
                batiment = Universite(self,x,y)    
            elif inf == 'centrale':
                batiment = CentraleNucleaire(self,x,y)
                
            elif inf == 'ferme':
                batiment = Ferme(self,x,y)
                
            elif inf == 'eglise':
                batiment = Eglise(self,x,y)
               
            elif inf == 'habitation':
                batiment = Habitation(self,x,y)
                
            elif inf == 'base-lancement':
                batiment = BaseLancement(self,x,y)
                
            elif inf == 'base-militaire':
                batiment = BaseMilitaire(self,x,y)
               
            if(batiment.ressourveValide(joueur.ressources)):
                joueur.retirerRessource(batiment.coutRessource)
                self.infrastructures.append(batiment)
                id = batiment.id
        return id
        
    def upgrade(self):
        self.level += 1
        
    def update(self, joueur):        
        for inf in self.infrastructures:
            inf.update(joueur)
            joueur.ressources['nourriture'] -= joueur.nourritureConsommer

class Infrastructure():  # #CLASSE MERE DE TOUTES LES INFRASTRUCTURES PRÃ‰SENTENT DANS LA VILLE
    def __init__(self, parent, x, y):
        self.parent = parent
        self.id = self.parent.parent.parent.parent.createurId.prochainid()
        self.x = x
        self.y = y
        self.level = 1
        
class Unite(): #CLASSE MERE DE TOUTES LES UTITÉS PRÉSENTES DANS LA VILLE
    def __init__(self, parent, x, y):
        self.parent = parent
        self.id=self.parent.parent.parent.parent.parent.parent.createurId.prochainid()
        self.x = x
        self.y = y
        self.level = 1              
               
class Mine(Infrastructure):
    def __init__(self, parent, x, y):
        super(Mine, self).__init__(parent, x, y)
        
        self.vitesse = 1
        self.vitesseParLvl = 2
        self.entrepotMax = 100
        self.entrepotParLvl = 50
        self.entrepot = 5
        self.image = "images/img_orion/mine_1.png"
        
        self.coutRessource = {'or':100,
                              'bois':200,
                              'mineraux':0,
                              'pierre':200
                              }
        
        self.updateRessource = {
                              'or':self.entrepot * self.vitesse * self.level *2,
                              'petrole':self.entrepot * self.vitesse * self.level *4, 
                              'mineraux':self.entrepot * self.vitesse * self.level *4,
                              'pierre':self.entrepot * self.vitesse * self.level *4
            }
        
    def ressourveValide(self, ressourcesJoueur):
        Valide = False
        if(ressourcesJoueur['or'] >= self.coutRessource['or'] and ressourcesJoueur['bois'] >= self.coutRessource['bois'] and ressourcesJoueur['mineraux'] >= self.coutRessource['mineraux'] and ressourcesJoueur['pierre'] >= self.coutRessource['pierre'] ):
            Valide = True
        return Valide
    
    def update(self, joueur):
        #AJOUT DES RESSOURCES AU JOUEUR PAR SECONDE
        #print(self.parent.parent.parent.parent.joueurs)
       joueur.ressources['or'] += self.updateRessource['or'] * (joueur.moral/50)
       joueur.ressources['petrole'] += self.updateRessource['petrole']* (joueur.moral/50) 
       joueur.ressources['mineraux'] += self.updateRessource['mineraux']* (joueur.moral/50)
       joueur.ressources['pierre'] += self.updateRessource['pierre']* (joueur.moral/50)
       
       
    
    def upgrade(self, Joueur):
        #AUGEMENTATION DU LEVEL
        self.level += 1
        
        # AUGEMENTATION DE LA QUANTITÃ‰ POSSIBLE 
        self.entrepotMax += self.entrepotParLvl
        
        # AUGEMENTATION DE LA VITESSE 
        self.vitesse += self.vitesseParLvl
        
    
        # LE COUT DE L'UPGRADE EN FONCTION DU LEVEL DU JOUEUR 
        Joueur.ressources["or"] -= 200 * self.level
        Joueur.ressources["credit"] -= 200 * self.level
        Joueur.ressources["energie"] -= 200 * self.level
        Joueur.ressources["bois"] -= 200 * self.level
                
class Habitation(Infrastructure):
    def __init__(self, parent, x, y):
        super(Habitation, self).__init__(parent, x, y)  # va chercher l'init du parent, soit infrastructure
       
        self.habitantsMax = 10  # valeur de dÃ©part
        self.habitantParLvl = 5
        
        self.coutRessource = {'or':100,
                              'bois':200,
                              'mineraux':0,
                              'pierre':200
                              }
        
        
    def ressourveValide(self, ressourcesJoueur):
        Valide = False
        if(ressourcesJoueur['or'] >= self.coutRessource['or'] and ressourcesJoueur['bois'] >= self.coutRessource['bois'] and ressourcesJoueur['mineraux'] >= self.coutRessource['mineraux'] and ressourcesJoueur['pierre'] >= self.coutRessource['pierre'] ):
            Valide = True
        return Valide
        
    def upgrade(self):
        # AUGEMENTATION DU LEVEL
        self.level += 1
        
        # AUGEMENTATION DE LA LIMITE DE LA POPULATION POSSIBLE 
        self.habitantsMax += self.habitantParLvl
        
        # LE COUT DE L'UPGRADE EN FONCTION DU LEVEL DU JOUEUR 
        Joueur.ressources["or"] -= 200 * self.level
        Joueur.ressources["credit"] -= 200 * self.level
        Joueur.ressources["pierre"] -= 200 * self.level
        Joueur.ressources["nourriture"] -= 200 * self.level
        Joueur.ressources["energie"] -= 200 * self.level
        Joueur.ressources["bois"] -= 200 * self.level
    
    def update(self, joueur):
        pass               

class Scierie(Infrastructure):
    def __init__(self, parent, x, y):
        super(Scierie, self).__init__(parent, x, y) 
        
        self.vitesse = 1
        self.entrepotMax = 100
        self.entrepotParLvl = 50
        self.entrepot = 5
        self.image = "images/img_orion/scierie_1.png"

        
        self.coutRessource = {'or':100,
                              'bois':300,
                              'mineraux':0,
                              'pierre':300
                              }
        self.boisAjouter = self.entrepot * self.vitesse * self.level * 10
                              
            
    def ressourveValide(self, ressourcesJoueur):
        Valide = False
        if(ressourcesJoueur['or'] >= self.coutRessource['or'] and ressourcesJoueur['bois'] >= self.coutRessource['bois'] and ressourcesJoueur['mineraux'] >= self.coutRessource['mineraux'] and ressourcesJoueur['pierre'] >= self.coutRessource['pierre'] ):
            Valide = True
        return Valide
    
    def update(self, joueur):
       #AJOUT DES RESSOURCES AU JOUEUR PAR SECONDE
       joueur.ressources['bois'] += self.boisAjouter * (joueur.moral/50)
       
    def upgrade(self):
        # AUGEMENTATION DU LEVEL
        self.level += 1
        
        # AUGEMENTATION DE LA QUANTITÃ‰ POSSIBLE 
        self.entrepotMax += self.entrepotParLvl
        
        # AUGEMENTATION DE LA VITESSE 
        self.vitesse += self.vitesseParLvl
        
        # LE COUT DE L'UPGRADE EN FONCTION DU LEVEL DU JOUEUR 
        Joueur.ressources["or"] -= 50 * self.level
        Joueur.ressources["credit"] -= 200 * self.level
        Joueur.ressources["pierre"] -= 50 * self.level
        Joueur.ressources["energie"] -= 100 * self.level
        
class Ferme(Infrastructure):

    def __init__(self, parent, x, y):
        super(Ferme, self).__init__(parent, x, y)
        
        self.vitesse = 1
        self.entrepotMax = 100
        self.entrepotParLvl = 50
        self.entrepot = 5
        self.image = "images/img_orion/ferme_1.png"
        self.coutRessource = {'or':100,
                              'bois':200, 
                              'mineraux':100,
                              'pierre':200
                              }
        
        self.nourritureAjouter = self.entrepot * self.vitesse * self.level * 20
            
    def ressourveValide(self, ressourcesJoueur):
        Valide = False
        if(ressourcesJoueur['or'] >= self.coutRessource['or'] and ressourcesJoueur['bois'] >= self.coutRessource['bois'] and ressourcesJoueur['mineraux'] >= self.coutRessource['mineraux'] and ressourcesJoueur['pierre'] >= self.coutRessource['pierre'] ):
            Valide = True
        return Valide
    
    def upgrade(self):
        # AUGEMENTATION DU LEVEL
        self.level += 1
        
        # AUGEMENTATION DE LA QUANTITÃ‰ POSSIBLE 
        self.entrepotMax += self.entrepotParLvl
        
        # AUGEMENTATION DE LA VITESSE 
        self.vitesse += self.vitesseParLvl
        
        # LE COUT DE L'UPGRADE EN FONCTION DU LEVEL DU JOUEUR 
        Joueur.ressources["or"] -= 50 * self.level
        Joueur.ressources["energie"] -= 100 * self.level
        Joueur.ressources["bois"] -= 100 * self.level
        Joueur.ressources["nourriture"] -= 200 * self.level
    

    def update(self, joueur):
       #AJOUT DES RESSOURCES AU JOUEUR PAR SECONDE

       joueur.ressources['nourriture'] += self.nourritureAjouter * (joueur.moral/2)

class CentraleNucleaire(Infrastructure):
    def __init__(self, parent, x, y):
        super(CentraleNucleaire, self).__init__(parent, x, y)
        self.image = "images/img_orion/centrale_1.png"
        self.coutRessource = {'or':20, 
                              }
        self.energieAjouter = 100
        
    def ressourveValide(self, ressourcesJoueur):
        return True
    
    def upgrade(self):
        self.level = self.level + 1
    
    def update(self, joueur):
        joueur.ressources['energie'] += self.energieAjouter * (joueur.moral/5)
    
class BaseMilitaire(Infrastructure):
    def __init__(self,parent,x,y):
        super(BaseMilitaire, self).__init__(parent,x,y)
        self.taille=150
        self.image = "images/img_orion/base_mil_1.png"
        self.coutRessource = {'or':0,
                              'bois':0, 
                              'mineraux':0,
                              'pierre':0,
                              'petrole': 0,
                              'connaissance': 0
                              }
    
    def ressourveValide(self, ressourcesJoueur):
        Valide = False
        if(ressourcesJoueur['or'] >= self.coutRessource['or'] and ressourcesJoueur['bois'] >= self.coutRessource['bois'] and ressourcesJoueur['mineraux'] >= self.coutRessource['mineraux'] and ressourcesJoueur['pierre'] >= self.coutRessource['pierre'] and ressourcesJoueur['petrole'] >= self.coutRessource['petrole'] and ressourcesJoueur['connaissance'] >= self.coutRessource['connaissance'] ):
            Valide = True
        return Valide
    
    def upgrade(self):
        self.level = self.level + 1
    
    def creerUnite(self, uni, x, y):
        id = None
        if uni:
            if uni == 'soldat':
                item = Soldat(self,x,y)
                self.parent.parent.parent.parent.joueurs[self.parent.proprietaire].unitesterrestres.append(item)
                id = item.id
            elif uni == 'char':
                item = Char(self,x,y)
                self.parent.parent.parent.parent.joueurs[self.parent.proprietaire].unitesterrestres.append(item)
                id = item.id
    
    def creerChar(self, inf, x, y):
        self.chars.append(inf(self, x, y))
    
    def creerSoldat(self, inf, x, y):
        self.soldats.append(inf(self, x, y))
    
    def update(self, joueur):
        pass 
    
class Soldat():
    def __init__(self, parent, x, y):
        self.parent = parent
        self.id = self.parent.parent.parent.createurId.prochainid()
        self.x = x
        self.y = y
        self.level = 1
        self.vie = 10
        self.range = 5
        self.dommage = 5
        self.idCible = None
    
    
    def attaquer(self, cible):
        """if cible.x - self.x <= 5 and cible.x - self.x >= -5 and cible.y - self.y <= 5 and cible.y - self.y >= -5:
            cible.vie = cible.vie - self.dommage
        else:   
            pass"""
        
        
      #  for (!cible.x == self.x and cible.y == self.y):
        """for (cible.x - self.x <= self.range and cible.x - self.x >= -self.range and cible.y - self.y <= self.range and cible.y - self.y >= -self.range):
            #Marcher jusqu'࡬a cible.....
            self.x = self.x-(self.x-cible.x)
            self.y = self.y-(self.y-cible.y)"""
        
        cible.vie = cible.vie - self.dommage
        
        
           # avancer()
            
        
    def avancer(self, cible):
       """ for !cible.x - self.x <= self.range and cible.x - self.x >= -self.range and cible.y - self.y <= self.range and cible.y - self.y >= -self.range:
            #Marcher jusqu'࡬a cible.....
            self.x = self.x-(self.x-cible.x)
            self.y = self.y-(self.y-cible.y)"""
    
    def update(self, joueur):
        self.level=self.level+1
        
class Char():
    def __init__(self, parent, x, y):
        self.parent = parent
        self.id = self.parent.parent.parent.createurId.prochainid()
        self.x = x
        self.y = y
        self.level = 1
        
    def Cout(self):
        pass
    def update(self, joueur):
        self.level=self.level+1
    
    def attaquer(self, cible):
        
        
        cible.vie = cible.vie - self.dommage
    
    def avancer(self, cible):
       """ for !cible.x - self.x <= self.range and cible.x - self.x >= -self.range and cible.y - self.y <= self.range and cible.y - self.y >= -self.range:
            #Marcher jusqu'࡬a cible.....
            self.x = self.x-(self.x-cible.x)
            self.y = self.y-(self.y-cible.y)"""

class Universite(Infrastructure):
    def __init__(self, parent, x, y):
        super(Universite, self).__init__(parent, x, y)
        
        self.EtudiantsMax = 2000
        self.EtudiantsMaxParlevel = 2000
        self.connaissanceAjouterParEtudiant = 100
        self.etudiants = 0
        self.etudiantsgradue = 0
        self.moyenneTempsGraduationParEtudiant = 6000  # 1 étudiant gradué toutes les 5 minutes(a voir si on change)
        self.moyenneTempsGraduationParEtudiantParLevel = 1000  # on diminue le temps qu'un etudiant est gradue
        self.compteur = 0
        self.coutRessource = {
                              'or':0,
                              'bois':0, 
                              'mineraux':0,
                              'pierre':0,
                              'petrole': 0
                                           
            }
     
    def ressourveValide(self, ressourcesJoueur):
        Valide = False
        if(ressourcesJoueur['or'] >= self.coutRessource['or'] and ressourcesJoueur['bois'] >= self.coutRessource['bois'] and ressourcesJoueur['mineraux'] >= self.coutRessource['mineraux'] and ressourcesJoueur['pierre'] >= self.coutRessource['pierre'] and ressourcesJoueur['petrole'] >= self.coutRessource['petrole'] ):
            Valide = True
        return Valide
                                   
    def upgrade(self):
        self.level += 1
        self.EtudiantsMax += self.EtudiantsMaxParlevel
        self.moyenneTempsGraduationParEtudiant -= self.moyenneTempsGraduationParEtudiantParLevel
        
    def ajouterEtudiants(self, nbEtudiant):  # 500 ou 1000 étudiants
        if(self.etudiants + nbEtudiant <= self.EtudiantsMax):
            self.etudiants += nbEtudiant
        else:
            print("ne peut plus ajouter d'etudiant")  
            

    def update(self, joueur): #graduation
        if(self.compteur == self.moyenneTempsGraduationParEtudiant and self.etudiants > 0):
            self.etudiantsgradue += 1
            self.etudiants -= 1
            joueur.ressources['connaissance'] += self.connaissanceAjouterParEtudiant * (joueur.moral/5)
            self.compteur = 0
        elif(self.etudiants == 0):
            print("il n'y a plus d'etudiant, rajouter")
        elif(self.compteur < self.moyenneTempsGraduationParEtudiant):
             self.compteur += 1   
        
class Eglise(Infrastructure):
    def __init__(self, parent, x, y):
        super(Eglise, self).__init__(parent, x, y) 
        
        self.croyants = 400
        self.croyantParlevel = 200
        self.vitesseAugmentation = 1
        self.vitesseAugmentationParLevel = 1
        self.divinite = None
        self.coutRessource = {
                              'or':300,
                              'bois':300, 
                              'mineraux':400,
                              'pierre':500
                            }
        self.moralAjouter = 1
        
    def ressourveValide(self, ressourcesJoueur):
        Valide = False
        if(ressourcesJoueur['or'] >= self.coutRessource['or'] and ressourcesJoueur['bois'] >= self.coutRessource['bois'] and ressourcesJoueur['mineraux'] >= self.coutRessource['mineraux'] and ressourcesJoueur['pierre'] >= self.coutRessource['pierre'] ):
            Valide = True
        return Valide
    
    def update(self, joueur): 
        if(joueur.moral < 100):    
            joueur.moral +=  self.moralAjouter
            
    def upgrade(self):
        
        self.croyants += self.croyantParlevel
        self.vitesseAugmentation += self.vitesseAugmentationParLevel
         
    def choisir_divinite(self, divinite):
        self.divinite = divinite
        
        
    def faire_offrande(self, nbCroyant):
        if(self.croyants - nbCroyant >= 0):
            self.croyants -= nbCroyant
            # idée, en fonction de la divinité on augmente une ressource spécifique
        else:
            print("pas assez de croyant pour faire des offrandes")
        
class BaseLancement(Infrastructure):
    def __init__(self, parent, x, y):
        super(BaseLancement, self).__init__(parent,x,y)
        self.vaisseaux = []
        self.vaisseauxMax = 40
        self.vaisseauxMaxAugmenterParLevel = 40
        self.image = "images/Buildings/tmpLaunchPad.png"
        
        self.coutRessource = {'or':0,
                              'bois':0, 
                              'mineraux':0,
                              'pierre':0
                              }

    def update(self, joueur):
        pass 
    
    def ressourveValide(self, ressourcesJoueur):
        return True
    
    def upgrade(self):
        self.level += 1
        self.vaisseauxMax += self.vaisseauxMaxAugmenterParLevel 
        
    def construire_vaisseau(self):
        self.vaisseaux += 1
        #baisser ressource joueur
        
    def lancer_vaisseau(self):
        self.vaisseaux -= 1
  
class Planete():
    def __init__(self,parent,type,dist,taille,angle):
        self.parent=parent
        self.id=self.parent.parent.createurId.prochainid()
        self.parent=parent
        self.posXatterrissage = (taille * 10 * 500) / 2
        self.posYatterrissage = (taille * 10 * 500) / 2          
        self.villes=[]
        self.proprietaire="inconnu"
        self.visiteurs={}
        self.established=[]
        self.distance=dist
        self.type=type  
        if type == "Hot":
            self.image="images/lavaplanet.png"
        elif type == "Habitable":
            self.image="images/planet.png"
        else:
             self.image="images/iceplanet.png"    
        self.imagemap = "images/map.jpg"
                    
        self.taille=taille
        self.angle=angle
        self.station = None
        #Vitesse d'orbite en fonction de la distance
        i = 0.01 - ((self.distance - self.parent.distMin)*0.0005) 

        self.vitesse = i
        self.x = 0
        self.y = 0
        self.name = "placeholder"
    
    
    
    def orbite(self):       
        if self.angle < 360:
            self.angle += self.vitesse
        else:
            self.angle = 0
        
    def creerville(self, joueurId, x=None, y=None):
        if x == None:
            x = self.posXatterrissage
            y = self.posYatterrissage
        ville = Ville(self, joueurId, x, y)
        self.villes.append(ville)
        return ville.id

class Station():
    def __init__(self,parent,proprietaire):
        self.parent = parent   
        self.proprietaire = proprietaire   
        self.x = self.parent.x
        self.y = self.parent.y
        self.couleur = "white" #A CHANGER !!!!!!
        self.range = 2 
        self.shotSPD = 10
        self.fireRate = 5
        self.shotDMG = 5 # A CHANGER !!!!
        self.maxDist = self.range * 3
        self.tirs = []
        self.angle = 0         
        
    def orbit(self):
        if self.angle >= 0 and self.angle < 360:
            self.angle += 1
        else:
            self.angle = 0
     
    def hasclearshot(self):
        if self.cible:
            quadrantStation = 0
            quadrantCible = 0
            
            if (self.x < self.parent.x) and (self.y < self.parent.y):
                quadrantStation = 1
            elif (self.x > self.parent.x) and (self.y > self.parent.y):
                quadrantStation = 3
            elif (self.x > self.parent.x) and (self.y < self.parent.y):
                quadrantStation= 2
            else:
                quadrantStation = 4
               
            if (self.cible.x < self.parent.x) and (self.cible.y < self.parent.y):
                quadrantCible = 1
            elif (self.cible.x < self.parent.x) and (self.cible.y < self.parent.y):
                quadrantCible = 3
            elif (self.cible.x < self.parent.x) and (self.cible.y < self.parent.y):
                quadrantCible= 2
            else:
                quadrantCible = 4
                
            #print("QUADRANTCIBLE: ",quadrantCible,"  QUADRANTSTATION: ",quadrantStation)
            if (quadrantCible == quadrantStation) or (quadrantCible%2 != quadrantStation%2):
                return True
            else:
                return False
        else:
            return False
           
           
           
    def findTarget(self,fire): 
        self.orbit()      
        for v in self.parent.parent.vaisseaux:
            #Seulement si vaisseau est ennemi           
            if v.proprietaire != self.proprietaire:
                dist = hlp.calcDistance(self.x, self.y, v.x, v.y)            
                #Si vaisseau V est dans la range
                if dist <= self.range:
                    if fire:
                        self.cible = v
                        if self.hasclearshot():
                            self.tirer(v)
    
    def tirer(self,cible):
        self.tirs.append(Projectile(self,cible))
       
class Projectile():
    def __init__(self,parent,cible):
        self.parent = parent
        self.x = parent.x
        self.y = parent.y
        self.vitesse = parent.shotSPD        
        self.shotDMG = parent.shotDMG
        self.cible = cible  
        self.cibleX = cible.x
        self.cibleY = cible.y  
        self.distanceTravelled = 0
        self.maxDist = parent.maxDist
        self.angletrajet=hlp.calcAngle(self.x,self.y,self.cibleX,self.cibleY)
    
    def avancer(self):
        rep = None     
        #Avancer vers la cible
        x1,y1 = (self.x,self.y)
        self.x,self.y=hlp.getAngledPoint(self.angletrajet,self.vitesse,self.x,self.y)
        self.distanceTravelled += hlp.calcDistance(x1,y1,self.x,self.y)
       
        #Si il a atteint sa cible
        if self.cible:
            if hlp.calcDistance(self.x,self.y,self.cible.x,self.cible.y) <= self.vitesse:
                rep=self.cible                
                self.cible=None
        elif self.distanceTravelled > self.maxDist:
            rep = "OUT"
        
        #Si il est sorti du cadre sans hit
        #if (self.x > self.bound or self.x < 0) or (self.y > self.bound or self.y < 0):
        #    rep = "OUT"            
            
        return rep
    
class Etoile():
    def __init__(self,parent,x,y):
        self.parent=parent
        self.id=self.parent.parent.createurId.prochainid()        
        self.taille=random.randrange(15,45)/10 #De 1.5 a 4.5
     
        #Type en fonction de la taille -------------------
        if self.taille <= 3: #De 1.5 a 3 (range de 1.5)
            self.type = "jaune"
            self.couleur="yellow"
            self.image = "images/yellowstar.png"
        elif self.taille <= 3.5: #De 3 a 3.5 (range de 0.5)
            self.type = "blanche"
            self.couleur = "mint cream"
            self.image = "images/whitestar.png"
        else:
            self.type= "bleue" #De 4 a 4.5 (range de 0.5)
            self.couleur = "cyan"
            self.image = "images/bluestar.png"
        #Goldilock zone en fonction de la taille ---------
        self.goldilockMin = (self.taille * 2) + 2  # de 5 a 10
        self.goldilockMax = (self.taille * 4) + 2  # de 8 a 18
        self.name = "placeholder"
        
class Systeme():
    def __init__(self,parent,x,y):
        self.parent=parent
        self.id=self.parent.createurId.prochainid()
        self.proprietaire="inconnu"
        self.visiteurs={}
        self.diametre=50 # UA unite astronomique = 150000000km
        self.x=x
        self.y=y
        self.etoile=Etoile(self,x,y)
        self.distMax = int(self.etoile.taille*6)+2 # DE 11 � 29 
        self.distMin = int(self.etoile.taille*1.5)+3 # DE 4 a 8 
        self.vaisseaux = []
        self.planetes=[]
        self.planetesvisites=[]
        self.furthest = 0
        self.creerplanetes()
        self.name = "placeholder"
        
    def creerplanetes(self):
        systemeplanetaire=8#random.randrange(5) # 4 chance sur 5 d'avoir des planetes
        if systemeplanetaire:
            nbplanetes = random.randrange(12) + 1
            for i in range(nbplanetes):                
                distsol = random.randrange(self.distMin, self.distMax)  # distance en unite astronomique 150000000km
                if distsol < self.etoile.goldilockMin:
                    type = "Hot"
                elif distsol > self.etoile.goldilockMax:
                    type = "Cold"
                else:
                    type = "Habitable"
                taille=random.randrange(20,50)/100 # DE 0.2 a 0.5                
                angle=random.randrange(360)
                self.planetes.append(Planete(self,type,distsol,taille,angle))
                #Trouver la planete les plus loin
                if distsol > self.furthest:
                    self.furthest = distsol
                
class Vaisseau():
    def __init__(self,parent,nom,base,vue):
        self.parent=parent
        self.id=self.parent.parent.createurId.prochainid()
        self.proprietaire=nom                
        self.base=base
        self.vue = vue
        self.angletrajet=0
        self.angleinverse=0
        self.x=self.base.x
        self.y=self.base.y        
        self.cargo=0
        self.energie=100
        self.maxenergie = 100
        self.cible=None 
        self.ratioX = 0
        self.ratioY = 0
        self.folderpath = "images/Ships/"        
        self.imageEx = None
        self.unit = 0
        self.exhaust = 0
        self.maxExhaust = 7        
        
    def avancer(self):
        rep=None
        #print("AVANCER !")
        if self.cible:
            #Refresh
            self.ciblerdestination(self.cible)
            #print("J'AI UNE CIBLE, JE SUIS A ")
            if isinstance(self.cible,tuple):                
                x,y = self.cible[0],self.cible[1]
                #print("JE VAIS DANS LE VIDE ")
            else:
                x=self.cible.x
                y=self.cible.y
                
                
            if self.vue == "G":
                vitesse = self.vitesseG
            else:
                vitesse = self.vitesseS*self.unit
            self.x,self.y=hlp.getAngledPoint(self.angletrajet,vitesse,self.x,self.y)
            if hlp.calcDistance(self.x,self.y,x,y) <=vitesse:
                rep=self.cible
                self.base=self.cible
                self.cible=None
            return rep     

           
    def ciblerdestination(self,p):
        #SI LA CIBLE EST DANS LE VIDE
        if isinstance(p,tuple):                  
            self.cible=p
            self.angletrajet=hlp.calcAngle(self.x,self.y,self.cible[0],self.cible[1])            
            self.angleinverse=math.radians(math.degrees(self.angletrajet)+180)
            dist=hlp.calcDistance(self.x,self.y,p[0],p[1])
        #SI ON CIBLE EST UN ASTRE
        else:
            self.cible=p
            self.angletrajet=hlp.calcAngle(self.x,self.y,self.cible.x,self.cible.y)
            self.angleinverse=math.radians(math.degrees(self.angletrajet)+180)
            dist=hlp.calcDistance(self.x,self.y,p.x,p.y) 
            
        #AFFICHER LA BONNE IMAGE 
        self.image = hlp.getAngledImage(self.folderpath,self.imagepath,self.angletrajet) 
      
class Sprinteur(Vaisseau):
    def __init__(self,parent,nom,systeme,vue):
        super(Sprinteur,self).__init__(parent,nom,systeme,vue)
        self.couleur = "purple"  
        self.imagepath = "Sprinter/"  
        self.LargeIcon = self.folderpath+self.imagepath+"LargeIcon.png"
        self.taille = 0.6  
        #Image par defaut, sur 0degres
        self.image = hlp.getAngledImage(self.folderpath,self.imagepath,self.angletrajet) 
        self.vitesseG=0.025        
        self.vitesseS=0.06  
        self.taille = 0.6
    
class Chasseur(Vaisseau):
    def __init__(self,parent,nom,systeme,vue):
        super(Chasseur,self).__init__(parent,nom,systeme,vue)
        self.couleur = "yellow"
        self.imagepath = "Chasseur/" 
        self.LargeIcon = self.folderpath+self.imagepath+"LargeIcon.png" 
        self.taille = 0.9  
        #Image par defaut, sur 0degres
        self.image = hlp.getAngledImage(self.folderpath,self.imagepath,self.angletrajet) 
        self.vitesseG=0.005        
        self.vitesseS=0.02    
        
class Eclaireur(Vaisseau):
    def __init__(self,parent,nom,systeme,vue):
        super(Eclaireur,self).__init__(parent,nom,systeme,vue)
        self.couleur = "green"
        self.imagepath = "Eclaireur/"  
        self.LargeIcon = self.folderpath+self.imagepath+"LargeIcon.png"
        self.taille = 0.4 
        #Image par defaut, sur 0degres
        self.image = hlp.getAngledImage(self.folderpath,self.imagepath,self.angletrajet) 
        self.vitesseG=0.004        
        self.vitesseS=0.04      
        
class Battleship(Vaisseau):
    def __init__(self,parent,nom,systeme,vue):
        super(Battleship,self).__init__(parent,nom,systeme,vue)
        self.couleur = "green"
        self.imagepath = "Battleship/"  
        self.LargeIcon = self.folderpath+self.imagepath+"LargeIcon.png"
        self.taille = 1.1  
        #Image par defaut, sur 0degres
        self.image = hlp.getAngledImage(self.folderpath,self.imagepath,self.angletrajet) 
        self.vitesseG=0.004        
        self.vitesseS=0.04    
        
class Destroyeur(Vaisseau):
    def __init__(self,parent,nom,systeme,vue):
        super(Destroyeur,self).__init__(parent,nom,systeme,vue)
        self.couleur = "green"
        self.imagepath = "Destroyeur/"
        self.LargeIcon = self.folderpath+self.imagepath+"LargeIcon.png"  
        self.taille = 1.4  
        #Image par defaut, sur 0degres
        self.image = hlp.getAngledImage(self.folderpath,self.imagepath,self.angletrajet) 
        self.vitesseG=0.004        
        self.vitesseS=0.03    

class Mothership(Vaisseau):
    def __init__(self,parent,nom,systeme,vue):
        super(Mothership,self).__init__(parent,nom,systeme,vue)
        self.couleur = "green"
        self.imagepath = "Mothership/" 
        self.LargeIcon = self.folderpath+self.imagepath+"LargeIcon.png" 
        self.taille = 1.8  
        #Image par defaut, sur 0degres
        self.image = hlp.getAngledImage(self.folderpath,self.imagepath,self.angletrajet) 
        self.vitesseG=0.004        
        self.vitesseS=0.02        
 
class Joueur():
    def __init__(self, parent, nom, origine, couleur):
        self.parent = parent
        self.id = parent.createurId.prochainid()
        self.artificiel = 0  # IA
        self.nom = nom
        self.origine = origine
        self.couleur = couleur
        self.systemesvisites = [origine[0]]
        self.vaisseauxinterstellaires = []
        self.vaisseauxinterplanetaires = []
        self.compteur = 0
        self.ressources = {'or':1000,
                        'credit':1000,
                        'bois':1000,
                        'mineraux':1000,
                        'petrole':1000,
                        'pierre':1000,
                        'nourriture':1000,
                        'energie':0,
                        'connaissance':0}
        
        self.nourritureConsommer = 0
        self.moral =  0
        
        self.actions={"creervaisseau":self.creervaisseau,
                      "creervaisseauS":self.creervaisseauS,
                      "creerstation":self.creerstation,
                      "ciblerdestination":self.ciblerdestination,
                      "atterrirplanete":self.atterrirplanete,
                      "visitersysteme":self.visitersysteme,
                      "creerville":self.creerville,
                      "creerInfra":self.creerInfra,
                      #"creerUnit":self.creerUnit,
                      "nouveauMessageChat":self.nouveauMessageChat}
    
    def creerville(self, listeparams):
        nom, systemeid, planeteid, x, y = listeparams
        #print("listeparams: " + str(listeparams) + " , joueur id:" + self.id)
        for i in self.systemesvisites:
            if i.id == systemeid:
                for j in i.planetes:
                    if j.id == planeteid:
                        j.established.append(self.nom)
                        villeid = j.creerville(self.nom, x, y)
                        self.parent.parent.afficherville(nom, systemeid, planeteid, villeid, x, y)
    
    def creerInfra(self, listeparams):
        nom, systemeid, planeteid, villeid , x, y, type_infra = listeparams
        for s in self.systemesvisites:
            if s.id == systemeid:
                for p in s.planetes:
                    if p.id == planeteid:
                        for v in p.villes:
                            if v.id==villeid:
                                print("CONSTRUIRE infra: "+type_infra)
                                id_infra = v.creerInfrastructure(self, type_infra, x, y, self.nom)
                                if(id_infra != None):
                                    self.parent.parent.afficherInfra(nom,systemeid,planeteid,x,y, type_infra, id_infra) # A CHANGER DANS AFFICHAGE STATIQUE
                       
                        
    def atterrirplanete(self, d):
        nom, systeid, planeid = d
        for i in self.systemesvisites:
            i.visiteurs[nom] = self.id
            #print("sys visite")
            #print(i)
            if i.id == systeid:
                for j in i.planetes:
                    #print(j.id + "==" + planeid + "?")
                    if j.id == planeid:
                        i.planetesvisites.append(j)
                        if nom == self.parent.parent.monnom:
                            j.visiteurs[nom] = self.id
                            self.parent.parent.voirplanete(i.id, j.id)
                            self.mode = "vueplanete"
                        return 1
        
    def visitersysteme(self, systeme_id):
        for i in self.parent.systemes:
            if i.id == systeme_id:
                if i not in self.systemesvisites:
                    self.systemesvisites.append(i)
                self.mode = ""
                
    def creervaisseau(self,listPar):
        id,type=listPar
        for i in self.systemesvisites:
            if i.id==id:
                if type == 'sprinteur':
                        v=Sprinteur(self,self.nom,i,"G")
                        self.vaisseauxinterstellaires.append(v)
                        i.vaisseaux.append(v)
                        return 1
                elif type == 'chasseur':
                        v=Chasseur(self,self.nom,i,"G")
                        self.vaisseauxinterstellaires.append(v)                       
                        i.vaisseaux.append(v)
                        return 1                    
                elif type == 'eclaireur':
                        v=Eclaireur(self,self.nom,i,"G")
                        self.vaisseauxinterstellaires.append(v)
                        i.vaisseaux.append(v)
                        return 1 
                elif type == 'battleship':
                        v=Battleship(self,self.nom,i,"G")
                        self.vaisseauxinterstellaires.append(v)                       
                        i.vaisseaux.append(v)
                        return 1
                elif type == 'destroyeur':
                        v=Destroyeur(self,self.nom,i,"G")
                        self.vaisseauxinterstellaires.append(v)                       
                        i.vaisseaux.append(v)
                        return 1
                elif type == 'mothership':
                        v=Mothership(self,self.nom,i,"G")
                        self.vaisseauxinterstellaires.append(v)                       
                        i.vaisseaux.append(v)
                        return 1
            
    def creervaisseauS(self,listpar):
        id,id_base,type = listpar
        for i in self.systemesvisites:
            for p in i.planetes:
                if p.id==id:
                    for v in p.villes:
                        for b in v.infrastructures:
                            if b.id == id_base:
                                if type == 'sprinteur':
                                    v=Sprinteur(self,self.nom,p,"S")
                                    self.vaisseauxinterplanetaires.append(v)
                                    i.vaisseaux.append(v)
                                    b.vaisseaux.append(v)
                                    return 1
                                elif type == 'chasseur':
                                    v=Chasseur(self,self.nom,p,"S")
                                    self.vaisseauxinterplanetaires.append(v)    
                                    i.vaisseaux.append(v)                   
                                    b.vaisseaux.append(v)
                                    return 1                    
                                elif type == 'eclaireur':
                                    v=Eclaireur(self,self.nom,p,"S")
                                    self.vaisseauxinterplanetaires.append(v)
                                    i.vaisseaux.append(v)
                                    b.vaisseaux.append(v)
                                    return 1 
                                elif type == 'battleship':
                                    v=Battleship(self,self.nom,p,"S")
                                    self.vaisseauxinterplanetaires.append(v)
                                    i.vaisseaux.append(v)                       
                                    b.vaisseaux.append(v)
                                    return 1
                                elif type == 'destroyeur':
                                    v=Destroyeur(self,self.nom,p,"S")
                                    self.vaisseauxinterplanetaires.append(v)  
                                    i.vaisseaux.append(v)                     
                                    b.vaisseaux.append(v)
                                    return 1
                                elif type == 'mothership':
                                    v=Mothership(self,self.nom,p,"S")
                                    self.vaisseauxinterplanetaires.append(v)    
                                    i.vaisseaux.append(v)                   
                                    b.vaisseaux.append(v)
                                    return 1
        
    def creerstation(self,id):
        for s in self.systemesvisites:
            for p in s.planetes:
                if p.id == id:
                    if p.station == None:
                        p.station = Station(p,self.nom) 
                    else:
                        print("Il y a deja une station")
                    
        
    def ciblerdestination(self,ids):
        idori,iddesti=ids    
        for i in self.vaisseauxinterstellaires:
            if i.id== idori:
                if isinstance(iddesti,tuple):
                    
                    i.ciblerdestination(iddesti)
                    return
                for j in self.parent.systemes:
                    if j.id== iddesti:
                        #i.cible=j
                        i.ciblerdestination(j)
                        return                
                    
        for i in self.vaisseauxinterplanetaires:
            if i.id== idori:
                if isinstance(iddesti,tuple):                  
                    i.ciblerdestination(iddesti)
                    return
                else:               
                    for j in self.systemesvisites:
                        for p in j.planetes:                        
                            if p.id == iddesti:                           
                                # i.cible=j
                                i.ciblerdestination(p)
                                return
    
    def augmenterRess(self):
        valeur = 0.5  # 99
        self.ressources["or"] += valeur
        print ('La quantite de l''or :', self.ressources["or"])
        
    def gererRessources(self):
        for i in self.systemesvisites:
            for j in i.planetes:
                for k in j.villes:
                    for inf in k.infrastructures:
                        inf.update(self)
                    k.update(self)
                    
	
    def retirerRessource(self, coutRessource):
        if('or' in coutRessource):
            self.ressources['or'] -= coutRessource['or']
        if('credit' in coutRessource):
            self.ressources['credit'] -= coutRessource['credit']
        if('bois' in coutRessource):
            self.ressources['bois'] -= coutRessource['bois']
        if('mineraux' in coutRessource):
            self.ressources['mineraux'] -= coutRessource['mineraux']
        if('petrole' in coutRessource):
            self.ressources['petrole'] -= coutRessource['petrole']
        if('pierre' in coutRessource):
            self.ressources['pierre'] -= coutRessource['pierre']
        if('nourriture' in coutRessource):
            self.ressources['nourriture'] -= coutRessource['nourriture']
        if('energie' in coutRessource):
            self.ressources['energie'] -= coutRessource['energie']
        if('connaissance' in coutRessource):
            self.ressources['connaissance'] -= coutRessource['connaissance']
        
        
        self.parent.changerVueRessource(self.nom)
    
    def definirNourritureConso(self, nourriture):
        self.nourritureConsommer = math.pow(nourriture, 2)
        self.moral =  nourriture
        

    def prochaineaction(self): # NOTE : cette fonction sera au coeur de votre developpement
        #FAIRE BOUGER LES VAISSEAUX SYSTEME
        for i in self.vaisseauxinterplanetaires: 
            if i.energie <=0:
                print("PLUS DE VIE")
                self.vaisseauxinterplanetaires.remove(i)
                for s in self.systemesvisites:
                    if i in s.vaisseaux:
                        s.vaisseaux.remove(i)
                          
            elif i.cible:    
                rep = i.avancer()
                if rep:
                    #TEMPORAIRE, Planete
                    if not isinstance(rep, tuple):
                        if rep.x > 100:
                            for s in self.systemesvisites:
                                for p in s.planetes:
                                    if rep.id == p.id:
                                        s.vaisseaux.remove(i)                                       
                                        p.vaisseaux.append(i)
                                        print("VAISSEAU",i.id," ATTERIR SUR PLANETE",p.id,"LISTE : ",p.vaisseaux)
                                        self.parent.parent.atterrirdestination(self.nom,s.id,p.id)
                    else:
                        if(rep[4]=="star"):                            
                            for s in self.systemesvisites:
                                if rep[5] == s.id:
                                    for v in self.vaisseauxinterplanetaires:
                                        self.vaisseauxinterplanetaires.remove(v)
                                        s.vaisseaux.remove(v)
                                        v.vue = "G"
                                        v.x = s.x 
                                        v.y = s.y
                                        v.cible = None
                                        self.vaisseauxinterstellaires.append(v)
                                        self.parent.parent.vue.voirgalaxie()
                            
            
            if self.compteur%5 == 0 and self.compteur != 0:
                if i.exhaust != i.maxExhaust:
                    i.exhaust += 1
                else:
                    i.exhaust = 0
                #OUVRIR PLANETE ETC ..
        
        #FAIRE BOUGER LES VAISSEAUX GALAXIE
        for i in self.vaisseauxinterstellaires:
            if i.cible:
                rep = i.avancer()
                if rep:
                    if rep.proprietaire == "inconnu":
                        if rep not in self.systemesvisites:
                            self.systemesvisites.append(rep)
                            #self.parent.changerproprietaire(self.nom,self.couleur,rep) ON ENLEVE TEMPORAIREMENT LES PROPRIOS
                    #ENSUITE, ON VISITE LE SYSTEME EN QUESTION ET ON CHANGE LE VAISSEAU DE VUE                    
                    self.vaisseauxinterstellaires.remove(i)
                    i.vue = "S"
                    i.x = -420
                    i.y = -420
                    self.vaisseauxinterplanetaires.append(i)
                    rep.vaisseaux.append(i)   
                    self.parent.parent.visitersysteme(self.id,rep.id)
                              
        #STATIONS
        for s in self.parent.systemes:
            for p in s.planetes:
                if p.station:
                    #Tirer selon le firerate
                    if self.compteur != 0 and self.compteur%p.station.fireRate == 0:
                        fire = True
                    else:
                        fire = False
                    #Cherche cible
                    p.station.findTarget(fire)
                    #Projectiles
                    for t in p.station.tirs:
                        rep = t.avancer()
                        #Si touche cible
                        if rep:
                            #Si touche vaisseau, baisser energie
                            if rep != "OUT":
                                rep.energie -= t.shotDMG
                            p.station.tirs.remove(t)
                    
        
        if(self.ressources['nourriture'] > 0):                                  
            if(self.compteur == 50):  
                self.compteur = 0                  
                self.gererRessources()
                if (self.ressources['nourriture'] < 0):
                    self.ressources['nourriture'] = 0
    
                if(self.parent.parent.vue.mode == "vuePla"):
                    self.parent.changerVueRessource(self.nom)
            
                    
            else:
                self.compteur += 1

        else:
            
            print("nourriture manquante")
            self.compteur = 0 

    
    def nouveauMessageChat(self,txt):
        self.parent.parent.vue.nouveauMessageChat(txt)
    
        
#  DEBUT IA
class IA(Joueur):
    def __init__(self, parent, nom, systemeorigine, couleur):
        Joueur.__init__(self, parent, nom, systemeorigine, couleur)
        self.contexte = "galaxie"
        self.delaiaction = random.randrange(5, 10) * 20  # le delai est calcule pour chaque prochaine action en seconde
        # self.derniereaction=time.time()
        
    # NOTE sur l'analyse de la situation   
    #          on utilise le temps (time.time() retourne le nombre de secondes depuis 1970) pour le delai de 'cool down'
    #          la decision dependra du contexte (modes de la vue)
    #          aussi presentement - on s'occupe uniquement d'avoir un vaisseau et de deplacer ce vaisseau vers 
    #          le systeme le plus proche non prealablement visite.
    def analysesituation(self):
        # t=time.time()
        if self.delaiaction == 0:
            if self.contexte == "galaxie":
                if len(self.vaisseauxinterstellaires) == 0:
                    c = self.parent.parent.cadre + 5
                    if c not in self.parent.actionsafaire.keys(): 
                        self.parent.actionsafaire[c]=[] 
                    self.parent.actionsafaire[c].append([self.nom,"creervaisseau",[self.origine[0].id,'a']])
                    #print("AJOUTER VAISSEAU ",self.origine[0].x,self.origine[0].y)
                else:
                    for i in self.vaisseauxinterstellaires:
                        sanscible = []
                        if i.cible == None:
                            sanscible.append(i)
                        if sanscible:
                            vi = random.choice(sanscible)
                            systtemp = None
                            systdist = 1000000000000
                            for j in self.parent.systemes:
                                d = hlp.calcDistance(vi.x, vi.y, j.x, j.y)
                                # print ("DISTANCE ",i,d)
                                if d < systdist and j not in self.systemesvisites:
                                    systdist = d
                                    systtemp = j
                            if systtemp:
                                vi.ciblerdestination(systtemp)
                                # print("CIBLER ",systtemp,systtemp.x,systtemp.y)
                            else:
                                pass
                                # print("JE NE TROUVE PLUS DE CIBLE")
                                
                self.delaiaction = random.randrange(5, 10) * 20
        else:
            self.delaiaction-=1
                #print("CIV:" ,self.nom,self.couleur, self.delaiaction)
        #print(self.moral)
# FIN IA


    
class Modele():
    def __init__(self, parent, joueurs, dd):
        self.parent = parent
        self.createurId = self.parent.createurId
        self.diametre, self.densitestellaire, qteIA = dd
        self.nbsystemes = int(self.diametre ** 2 / self.densitestellaire)
        #print(self.nbsystemes)
        self.ias = []  # IA 
        self.joueurs = {}
        #print("joueurs : ", self.joueurs.__class__)
        self.joueurscles = joueurs
        #print("joueurscle : ", self.joueurscles.__class__)
        self.actionsafaire = {}
        self.pulsars = []
        self.systemes = []
        self.terrain = []
        self.creersystemes(int(qteIA))  # nombre d'ias a ajouter
        self.marchePublique=MarchePublique()
     
    def no_overlap(self, x, y):  # Sert a verifier que l'astre qu'on essaye de placer ne sera pas placed sur un autre
                                   
        # Verifier les pulsars
        for p in self.pulsars:            
            if x > (p.x - 0.1) and x < (p.x + 0.1):  # Verifier les x              
                if y > (p.y - 0.1) and y < (p.y + 0.1):  # Verifier les y               
                    return False         
                
        # Verifier les etoiles
        for s in self.systemes:            
            if x > (s.x - 0.1) and x < (s.x + 0.1):  # Verifier les x              
                if y > (s.y - 0.1) and y < (s.y + 0.1):  # Verifier les y               
                    return False                          
                
        # Si on arrive ici, il n'y a aucun overlap        
        return True  
    
    def valid_coords(self): 
        valid = False
        while (not valid):
            x = random.randrange(self.diametre * 10) / 10        
            y = random.randrange(self.diametre * 10) / 10
            
            #EMPECHER DE PLACER UN ASTRE OUT-OF-BOUND --------------------------------
            if x < 0.1:
                x += 0.1
            elif x > (self.diametre - 0.1):
                x -= 0.1
                
            if y < 0.1:
                y += 0.1
            elif y > (self.diametre - 0.1):
                y -= 0.1
            # VERIFIER LES OVERLAPS
            if self.no_overlap(x, y):
                valid = True 
        # Si c'est valide , retourner les bonnes coords    
        return x, y
         
    def creersystemes(self, nbias):  # IA ajout du parametre du nombre d'ias a ajouter
        
        # Creation des Ã©toiles
        for i in range(self.nbsystemes):   
            posx, posy = self.valid_coords()         
            self.systemes.append(Systeme(self, posx, posy)) 
            
        # Creation des pulsars       
        for i in range(20):
            posx, posy = self.valid_coords()
            self.pulsars.append(Pulsar(self, posx, posy))   
            
        np = len(self.joueurscles) + nbias  # on ajoute le nombre d'ias
        systemeSolaire = []
        systemetemp = self.systemes[:]
        while np:
            p = random.choice(systemetemp)
            if p not in systemeSolaire and len(p.planetes) > 0:
                systemeSolaire.append(p)
                systemetemp.remove(p)
                np -= 1
        couleurs = ["blue", "goldenrod", "orangered", "greenyellow",
                  "dodgerblue", "yellow2", "maroon1", "chartreuse3",
                  "firebrick1", "MediumOrchid2", "DeepPink2", "blue"]  # IA ajout de 3 couleurs
        
        
        
        for i in self.joueurscles: 
            print("JOUEUR CLE !!!!!!!!!!!! ")          
            sys_origin = systemeSolaire.pop(0)
            print("SYSORIGIN : ",sys_origin)
            for pla in sys_origin.planetes: 
                #Donner un planete habitable
                 if pla.type == "Habitable": 
                     print("SYSPLANETE : ",pla.id,pla.type)
                     self.joueurs[i] = Joueur(self, i, [sys_origin, pla], couleurs.pop(0))
                     self.parent.creerville(i,sys_origin.id,pla.id,None,None)
                     break
                
       
            
        for i in range(nbias):  # IA
            nomia = "IA_" + str(i)
            self.joueurscles.append(nomia)
            
            sys_origin = systemeSolaire.pop(0)
            planete_origin = sys_origin.planetes.pop(0)
            planete_origin.creerville(i)
            ia=IA(self,nomia,[sys_origin,planete_origin],couleurs.pop(0))
            self.joueurs[nomia]=ia  #IA
            self.ias.append(ia)  #IA

    def creerstation(self,planete):
        self.parent.actions.append([self.parent.monnom,"creerstation",planete])
        
    def creervaisseauS(self,listpar):
        self.parent.actions.append([self.parent.monnom,"creervaisseauS",listpar])

    def prochaineaction(self,cadre):
        if cadre in self.actionsafaire:
            for i in self.actionsafaire[cadre]:
                print("actionafaire",i)
                self.joueurs[i[0]].actions[i[1]](i[2])
            del self.actionsafaire[cadre]
                
        for i in self.joueurscles:
            self.joueurs[i].prochaineaction()
            
        for i in self.ias:
            i.analysesituation()
            
        for i in self.pulsars:
            i.evoluer()
            
        for i in self.systemes:
            for p in i.planetes:
                p.orbite()
            
    def changerproprietaire(self,nom,couleur,syst):
        self.parent.changerproprietaire(nom,couleur,syst)
        
    def changerVueRessource(self, nom):
        #self.parent.vue.modecourant.setRessource(nom)
        self.parent.updateInfoJoueur()    

    def definirMoral(self, nom, moral):
        self.joueurs[nom].definirMoral(moral)

    def avoirNourritureConsomme(self, nom):
        return self.joueurs[nom].nourritureConsommer
    
    def definirNourritureConso(self, nom, nourriture):
        self.joueurs[nom].definirNourritureConso(nourriture)
        

