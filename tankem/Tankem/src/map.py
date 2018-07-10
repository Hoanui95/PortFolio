## -*- coding: utf-8 -*-
from util import *
from entity import *

from direct.showbase import DirectObject
from direct.gui.OnscreenText import OnscreenText 
from direct.gui.DirectGui import *
from panda3d.core import *
from panda3d.bullet import BulletPlaneShape
from panda3d.bullet import BulletRigidBodyNode
from panda3d.bullet import BulletBoxShape
from panda3d.bullet import YUp
from direct.interval.IntervalGlobal import *
import random

from DAO_Phase2 import *
from finPartie import *
from authentification import *

import datetime
import sys

'''
    . Plancher (avec ou sans arbre) 
    • Mur fixe (avec ou sans arbre) 
    • Mur animé verticalement (avec ou sans arbre) 
    • Mur animé verticalement inversé (avec ou sans arbre) 

'''


#Module qui sert à la création des maps
class Map(DirectObject.DirectObject):
    def __init__(self, mondePhysique, dto, niveau):
        #On garde le monde physique en référence
        self.mondePhysique = mondePhysique             
        self.leDto = dto
        self.niveau = niveau

        #phase 3 du projet
        self.dto_joueur1 = DTO_Joueur1()
        self.dto_joueur2 = DTO_Joueur2()
        self.toucher = False
        self.dateDebut = str(datetime.datetime.now())


        if (niveau !="quick"):
            try:
                self.leDaoPhase2 = DAO_Oracle("e1529743","AAAaaa111","delta/decinfo.edu")
                self.dtoPhase2 = self.leDaoPhase2.lire(niveau)
                self.leDaoPhase2.deconnection()
            except:
                ctypes.windll.user32.MessageBoxA(0, "erreur connexion pour les niveaux dto", "Error de connection", 0)
        
        #self.leDto2 = dto2

        #initialisation des constantes utiles
        #VARIABLE
        if (niveau !="quick"):
            
            self.map_nb_tuile_x = self.dtoPhase2.niv_ligne_x #dto2.niv_ligne_x[2]#10
            self.map_nb_tuile_y = self.dtoPhase2.niv_ligne_y
        else:
            self.map_nb_tuile_x = 10
            self.map_nb_tuile_y = 10


        self.map_grosseur_carre = 2.0 #dimension d'un carré
        self.map_petite_valeur_carre = 0.05 #Afin de contourner des problèmes d'affichage, on va parfois décaler les carrés/animations d'une petite valeur. Par exmeple, on ne veut pas que les cubes animés passent dans le plancher.

        #On veut que le monde soit centré. On calcul donc le décalage nécessaire des tuiles
        self.position_depart_x = - self.map_grosseur_carre * self.map_nb_tuile_x / 2.0
        self.position_depart_y = - self.map_grosseur_carre * self.map_nb_tuile_y / 2.0

        #On déclare des listes pour les tanks, les items et les balles
        self.listTank = []
        self.listeItem = []
        self.listeBalle = []

        #Dictionnaire qui contient des noeuds animés.
        #On pourra attacher les objets de notre choix à animer
        self.dictNoeudAnimation = {}
        self.creerNoeudAnimationImmobile() #Pour être consistant, on créé une animation... qui ne bouge pas
        self.creerNoeudAnimationVerticale() #Animation des blocs qui bougent verticalement
        self.creerNoeudAnimationVerticaleInverse() #Idem, mais décalé

        #Création de l'objet qui génèrera des arbres pour nous
        self.treeOMatic  = treeMaker.TreeOMatic()

        #Initialise le contenu vide la carte
        #On y mettra les id selon ce qu'on met
        self.endroitDisponible = [[True for x in range(self.map_nb_tuile_y)] for x in range(self.map_nb_tuile_x)]

        #Message qui permettent la création d'objets pendant la partie
        self.accept("tirerCanon",self.tirerCanon)
        self.accept("tirerMitraillette",self.tirerMitraillette)
        self.accept("lancerGrenade",self.lancerGrenade)
        self.accept("lancerGuide",self.lancerGuide)
        self.accept("deposerPiege",self.deposerPiege)
        self.accept("tirerShotgun",self.tirerShotgun)
        self.accept("tankElimine", self.gameOver)

    
    def gameOver(self, idPerdant):
        dateFin = str(datetime.datetime.now())

        listeArmeJ1 = []
        listeArmeJ1.append(self.listTank[0].armeCanon)
        listeArmeJ1.append(self.listTank[0].armeMitraillette) 
        listeArmeJ1.append(self.listTank[0].armeGrenade)
        listeArmeJ1.append(self.listTank[0].armePompe) 
        listeArmeJ1.append(self.listTank[0].armePiege) 
        listeArmeJ1.append(self.listTank[0].armeGuide)

        listeArmeJ2 = []
        listeArmeJ2.append(self.listTank[1].armeCanon)
        listeArmeJ2.append(self.listTank[1].armeMitraillette) 
        listeArmeJ2.append(self.listTank[1].armeGrenade)
        listeArmeJ2.append(self.listTank[1].armePompe) 
        listeArmeJ2.append(self.listTank[1].armePiege) 
        listeArmeJ2.append(self.listTank[1].armeGuide)

        if(idPerdant == 0):
            self.finPartie1 = AnalyseFinPartieJoueur(self.dto_joueur1.experience,self.dto_joueur1.favori,self.listTank[1].pointDeVie,self.listTank[1].pointDeVieMax - self.listTank[1].pointDeVie, False)     
            self.finPartie2 = AnalyseFinPartieJoueur(self.dto_joueur2.experience,self.dto_joueur2.favori,self.listTank[1].pointDeVie, self.listTank[1].pointDeVieMax - self.listTank[1].pointDeVie, True)
            self.dtoPartie = DTO_Partie(self.dateDebut, dateFin, self.dto_joueur2.id, self.dto_joueur1.id,self.niveau,self.dto_joueur2.distance, self.dto_joueur1.distance,listeArmeJ2, listeArmeJ1)
        else:
            self.finPartie1 = AnalyseFinPartieJoueur(self.dto_joueur1.experience,self.dto_joueur1.favori,self.listTank[0].pointDeVie, self.listTank[0].pointDeVieMax - self.listTank[0].pointDeVie, True)     
            self.finPartie2 = AnalyseFinPartieJoueur(self.dto_joueur2.experience,self.dto_joueur2.favori,self.listTank[0].pointDeVie, self.listTank[0].pointDeVieMax - self.listTank[0].pointDeVie, False)
            self.dtoPartie = DTO_Partie(self.dateDebut, dateFin, self.dto_joueur1.id, self.dto_joueur2.id,self.niveau, self.dto_joueur1.distance, self.dto_joueur2.distance, listeArmeJ1,listeArmeJ2)
        self.finPartie1.calculNouvelleExperience()
        self.finPartie2.calculNouvelleExperience()

        

        #Envoie les infos de la partie à la Base de donnée
        try:
            self.dao_joueur = DAO_Joueur("e1529743","AAAaaa111","delta/decinfo.edu")
            self.dao_joueur.updateExperience(self.dto_joueur1.id, int( self.finPartie1.nouvelleExperience))
            self.dao_joueur.updateExperience(self.dto_joueur2.id, int( self.finPartie2.nouvelleExperience))
            self.dao_joueur.ecrireStatArme(self.dtoPartie)
            self.dao_joueur.deconnection()
            #Rapport a l'écran
            self.bouttonRapport = DirectButton(frameColor=(0.3254,0.3254, 0.12549, 0.75), relief=2, text = "Rapport", text_scale=0.07, pos=(1, 0.0, -0.745), frameSize = (-0.35, 0.35, -0.080, 0.060), command = lambda: self.afficherRapport())
        except:
            ctypes.windll.user32.MessageBoxA(0, "erreur connexion pour enregistrer la partie", "Error enregistrement partie", 0)

        
        
       
    def afficherRapport(self):
        print("rapport")
        self.bouttonRapport.hide()
        messenger.send("rapport", [self.finPartie1,  self.finPartie2])



    def libererEndroitGrille(self,i,j,doitBloquer):
        #print "bloque " + str(i) + " " + str(j)
        #print (self.endroitDisponible)
        self.endroitDisponible[i][j] = doitBloquer

    def figeObjetImmobile(self):
        self.noeudOptimisation.flattenStrong()

    def construireMapHasard(self):
        #Utilisation du module de création au hasard
        #Le module a un x et y inversé!
        
        #VARIABLE
        maze = mazeUtil.MazeBuilder(self.map_nb_tuile_y, self.map_nb_tuile_x)
        maze.build()
        mazeArray = maze.refine(.6)

        #Interprétation du résultat de l'algo
        #VARIABLE
        
        for row in mazeArray:
            for cell in row:
                if(cell.type == 1):
                    typeMur = random.randint(0, 100)
                    #On créé des éléments!
                    #40% du temps un mur immobile (5% de chance d'avoir un arbre)
                    #5% du temps un arbre seul
                    #18% du temps un mur mobile (5% de chance d'avoir un arbre)
                    #17% du temps un mur mobile inverse (5% de chance d'avoir un arbre)
                    if(typeMur <= 40):
                        noeudAnimationDuMur = "AnimationMurVerticale" if typeMur <= 20 else "AnimationMurVerticaleInverse"
                        noeudAAttacher = None if random.randint(0, 20) != 0 else Arbre(self.mondePhysique,self.treeOMatic)
                        self.creerMur(cell.row, cell.col, noeudAnimationDuMur, noeudAAttacher)
                    elif(typeMur <= 45):
                        self.creerArbre(cell.row, cell.col)

                    else:
                        noeudAAttacher = None if random.randint(0, 20) != 0 else Arbre(self.mondePhysique,self.treeOMatic)
                        self.creerMur(cell.row, cell.col,"AnimationMurImmobile",noeudAAttacher)

        self.creerChar(6,6,0,Vec3(self.dto_joueur1.R,self.dto_joueur1.G,self.dto_joueur1.B))  #Char noir
        self.creerChar(3,3,1,Vec3(self.dto_joueur2.R,self.dto_joueur2.G,self.dto_joueur2.B)) #Char gris-jaune

        #Dans la carte par défaut, des items vont appraître constamment entre 10 et 20 secondes d'interval
        self.genererItemParInterval(3,8)


    # Map Par dto
    def construireMapDto(self):

        maze = mazeUtil.MazeBuilder(self.map_nb_tuile_y, self.map_nb_tuile_x)
        maze.build()
        mazeArray = maze.refine(.6)

        x= 0
        for row in self.dtoPhase2.mod_pos_x:
            
            # si il y a pas de mur
            if (self.dtoPhase2.mod_id_mur[x] == 1):
                if (self.dtoPhase2.mod_arbre[x] == 1):                  
                    self.creerArbre(row,self.dtoPhase2.mod_pos_y[x])#row,mod_pos_y[x])
            # si le mure est immobile 
            elif(self.dtoPhase2.mod_id_mur[x] == 2):
                # si il contient un arbre
                if (self.dtoPhase2.mod_arbre[x] == 1):
                    noeudAAttacher = Arbre(self.mondePhysique,self.treeOMatic)
                else:
                    noeudAAttacher = None
                self.creerMur(row,self.dtoPhase2.mod_pos_y[x],"AnimationMurImmobile",noeudAAttacher)
            # si le mure est mobile 
            elif(self.dtoPhase2.mod_id_mur[x] == 3):
                # si il contient un arbre
                if (self.dtoPhase2.mod_arbre[x] == 1):
                    noeudAAttacher = Arbre(self.mondePhysique,self.treeOMatic)
                else:
                    noeudAAttacher = None
                self.creerMur(row,self.dtoPhase2.mod_pos_y[x],"AnimationMurVerticale",noeudAAttacher)
            # si le mure est mobile INVERSÉ
            else:
                # si il contient un arbre
                if (self.dtoPhase2.mod_arbre[x] == 1):
                    noeudAAttacher = Arbre(self.mondePhysique,self.treeOMatic)
                else:
                    noeudAAttacher = None
                self.creerMur(row,self.dtoPhase2.mod_pos_y[x],"AnimationMurVerticaleInverse",noeudAAttacher)
            
            x=x+1
    
        self.creerChar(self.dtoPhase2.niv_joueur1_x,self.dtoPhase2.niv_joueur1_y,0,Vec3(self.dto_joueur1.R,self.dto_joueur1.G,self.dto_joueur1.B))  #Char noir
        self.creerChar(self.dtoPhase2.niv_joueur2_x,self.dtoPhase2.niv_joueur2_y,1,Vec3(self.dto_joueur2.R,self.dto_joueur2.G,self.dto_joueur2.B))
        #VARIABLE
        self.genererItemParInterval(self.dtoPhase2.niv_delais_min / 1000,self.dtoPhase2.niv_delais_max / 1000)

    def construireDecor(self, camera):
        modele = loader.loadModel("../asset/Skybox/skybox")
        modele.set_bin("background", 0)
        modele.set_two_sided(True)
        modele.set_depth_write(False)
        modele.set_compass()
        verticalRandomAngle = random.randint(0,45)
        modele.setHpr(0,verticalRandomAngle,-90)
        randomGrayScale = random.uniform(0.6,1.2)
        semiRandomColor = Vec4(randomGrayScale,randomGrayScale,randomGrayScale,1)
        modele.setColorScale(semiRandomColor)
        modele.setPos(0,0,0.5)
        #Et oui! Le ciel est parenté à la caméra!
        modele.reparentTo(camera)

    def construirePlancher(self):
        #Optimisation... on attache les objets statiques au même noeud et on utiliser
        #la méthode flattenStrong() pour améliorer les performances.
        self.noeudOptimisation = NodePath('NoeudOptimisation')
        self.noeudOptimisation.reparentTo(render)

        #Construction du plancher
        # On charge les tuiles qui vont former le plancher
        #VARIABLE
        for i in range(0,self.map_nb_tuile_x):
            for j in range(0,self.map_nb_tuile_y):
                modele = loader.loadModel("../asset/Floor/Floor")
                # Reparentage du modèle à la racine de la scène
                modele.reparentTo(self.noeudOptimisation)
                self.placerSurGrille(modele,i, j)

        #Construction du plancher si on tombe
        #Un plan devrait marche mais j'ai un bug de collision en continu...
        shape = BulletBoxShape(Vec3(50,50,5))
        node = BulletRigidBodyNode('Frontfiere sol')
        node.addShape(shape)
        np = render.attachNewNode(node)
        np.setTag("EntiteTankem","LimiteJeu")
        np.setPos(Vec3(0,0,-9.0))
        self.mondePhysique.attachRigidBody(node)

        #Construction de l'aire de jeu sur laquelle on joue
        shape = BulletBoxShape(Vec3(-self.position_depart_x, -self.position_depart_y, 2))
        node = BulletRigidBodyNode('Plancher')
        node.addShape(shape)
        np = render.attachNewNode(node)
        np.setTag("EntiteTankem","Plancher")
        HACK_VALUE = 0.02 #Optimisation de collision, les masques ne marchent pas
        np.setZ(-2.00 - HACK_VALUE)
        self.mondePhysique.attachRigidBody(node)

    def placerSurGrille(self,noeud,positionX, positionY):
        # On place l'objet en calculant sa position sur la grille
        noeud.setX(self.position_depart_x + (positionX+0.5) * self.map_grosseur_carre)
        noeud.setY(self.position_depart_y + (positionY+0.5) * self.map_grosseur_carre)

    def tirerCanon(self, identifiantLanceur, position, direction):
        #Création d'une balle de physique
        self.toucher = False
        someBalle = balle.Balle(identifiantLanceur,self.mondePhysique,"canon", self.leDto)
        self.listeBalle.append(someBalle)
        someBalle.projetter(position,direction)

    def tirerMitraillette(self, identifiantLanceur, position, direction):
        #Création d'une balle de physique
        self.toucher = False
        someBalle = balle.Balle(identifiantLanceur,self.mondePhysique, "mitraillette",self.leDto)
        self.listeBalle.append(someBalle)
        someBalle.projetterRapide(position,direction)

    def lancerGrenade(self, identifiantLanceur, position, direction):
        #Création d'une balle de physique
        self.toucher = False
        someBalle = balle.Balle(identifiantLanceur, self.mondePhysique, "grenade",self.leDto)
        self.listeBalle.append(someBalle)
        someBalle.lancer(position,direction)

    def lancerGuide(self, identifiantLanceur, position, direction):
        #Création d'une balle de physique
        self.toucher = False
        someBalle = balle.Balle(identifiantLanceur, self.mondePhysique, "guide", self.leDto)
        self.listeBalle.append(someBalle)

        #On définit la position d'arrivé de missile guidé
        noeudDestination = self.listTank[0].noeudPhysique
        if(identifiantLanceur == 0):
            noeudDestination = self.listTank[1].noeudPhysique

        someBalle.lancerGuide(position,noeudDestination)

    def deposerPiege(self, identifiantLanceur, position, direction):
        #Création d'une balle de physique
        self.toucher = False
        someBalle = balle.Balle(identifiantLanceur, self.mondePhysique, "piege", self.leDto)
        self.listeBalle.append(someBalle)
        someBalle.deposer(position,direction)

    def tirerShotgun(self, identifiantLanceur, position, direction):
        #Création d'une balle de physique
        self.toucher = False
        someBalle = balle.Balle(identifiantLanceur,self.mondePhysique, "pompe", self.leDto)
        self.listeBalle.append(someBalle)
        someBalle.projetterVariable(position,direction)

    #####################################################
    #Création des différentes entités sur la carte
    #####################################################

    def creerItem(self, positionX, positionY, armeId):
        #L'index dans le tableau d'item coincide avec son
        #itemId. Ça va éviter une recherche inutile pendant l'éxécution
        itemCourrant = item.Item()
        self.listeItem.append(itemCourrant)
        #On place le tank sur la grille
        self.placerSurGrille(itemCourrant.noeudPhysique,positionX,positionY)
        self.libererEndroitGrille(positionX, positionY,False)
        itemCourrant.initialisationComplete(armeId,self.mondePhysique , lambda : self.libererEndroitGrille(positionX, positionY,True))

    def creerItemHasard(self, positionX, positionY):
        listeItem = ["Mitraillette", "Shotgun", "Piege", "Grenade", "Guide","Spring"]
        itemHasard = random.choice(listeItem)
        self.creerItem(positionX, positionY,itemHasard)

    def creerItemPositionHasard(self):
        #Pas de do while en Python! Beurk...
        randomX = random.randrange(0,self.map_nb_tuile_x)
        randomY = random.randrange(0,self.map_nb_tuile_y)

        #Tant qu'on trouve pas d'endroit disponibles...
        while(not self.endroitDisponible[randomX][randomY]):
            randomX = random.randrange(0,self.map_nb_tuile_x)
            randomY = random.randrange(0,self.map_nb_tuile_y)

        #Quand c'est fait on met un item au hasard
        self.creerItemHasard(randomX,randomY)

    def genererItemParInterval(self, delaiMinimum, delaiMaximum):
        #Délai au hasard entre les bornes
        delai = random.uniform(delaiMinimum, delaiMaximum)
        intervalDelai = Wait(delai)
        intervalCreerItem = Func(self.creerItemPositionHasard)
        intervalRecommence = Func(self.genererItemParInterval,delaiMinimum,delaiMaximum)

        sequenceCreation = Sequence(intervalDelai,
                                    intervalCreerItem,
                                    intervalRecommence,
                                    name="Creation item automatique")
        #On le joue une fois et il se rappelera lui-même :-)
        sequenceCreation.start()

    def creerMur(self,positionX, positionY, strAnimation = None, appendObject = None):
        mur = Wall(self.mondePhysique)
        #On place le bloc sur la grille
        if(appendObject != None):
            #Décale l'objet de 1 unité pour être SUR le mur et non dedans
            appendObject.noeudPhysique.setZ(appendObject.noeudPhysique.getZ() + 1.0)
            appendObject.noeudPhysique.reparentTo(mur.noeudPhysique)
        self.placerSurGrille(mur.noeudPhysique,positionX,positionY)
        self.libererEndroitGrille(positionX,positionY,False)

        if(strAnimation):
            mur.animate(self.dictNoeudAnimation[strAnimation])

    def creerArbre(self,positionX, positionY):
        arbre = Arbre(self.mondePhysique,self.treeOMatic)
        #On place le bloc sur la grille
        self.placerSurGrille(arbre.noeudPhysique,positionX,positionY)
        self.libererEndroitGrille(positionX,positionY,False)

    def creerNoeudAnimationImmobile(self):
        noeudAnimationCourrant = NodePath("AnimationMurImmobile")
        self.dictNoeudAnimation["AnimationMurImmobile"] = noeudAnimationCourrant
        noeudAnimationCourrant.reparentTo(render)

    def creerNoeudAnimationVerticale(self):
        #Création d'un noeud vide
        noeudAnimationCourrant = NodePath("AnimationMurVerticale")
        tempsMouvement = 0.8
        blocPosInterval1 = LerpPosInterval( noeudAnimationCourrant,
                                            tempsMouvement,
                                            Vec3(0,0,-self.map_grosseur_carre + self.map_petite_valeur_carre),
                                            startPos=Vec3(0,0,0))
        blocPosInterval2 = LerpPosInterval( noeudAnimationCourrant,
                                            tempsMouvement,
                                            Vec3(0,0,0),
                                            startPos=Vec3(0,0,-self.map_grosseur_carre + self.map_petite_valeur_carre))
        delai = Wait(1.2)
        # On créé une séquence pour bouger le bloc
        mouvementBloc = Sequence()
        mouvementBloc = Sequence(   blocPosInterval1,
                                    delai,
                                    blocPosInterval2,
                                    delai,
                                    name="mouvement-bloc")

        mouvementBloc.loop()

        noeudAnimationCourrant.reparentTo(render)
        #Ajout dans le dicitonnaire de l'animation
        self.dictNoeudAnimation["AnimationMurVerticale"] = noeudAnimationCourrant

    def creerNoeudAnimationVerticaleInverse(self):
        #Création d'un noeud vide
        noeudAnimationCourrant = NodePath("AnimationMurVerticaleInverse")
        #VARIABLE
        tempsMouvement = self.leDto.time_move_blocs[2]
        blocPosInterval1 = LerpPosInterval( noeudAnimationCourrant,
                                            tempsMouvement,
                                            Vec3(0,0,-self.map_grosseur_carre + self.map_petite_valeur_carre),
                                            startPos=Vec3(0,0,0))
        blocPosInterval2 = LerpPosInterval(noeudAnimationCourrant,
                                            tempsMouvement,
                                            Vec3(0,0,0),
                                            startPos=Vec3(0,0,-self.map_grosseur_carre + self.map_petite_valeur_carre))
        delai = Wait(1.2)
        # On créé une séquence pour bouger le bloc
        mouvementBloc = Sequence()
        mouvementBloc = Sequence(   blocPosInterval2,
                                    delai,
                                    blocPosInterval1,
                                    delai,
                                    name="mouvement-bloc-inverse")
        mouvementBloc.loop()

        noeudAnimationCourrant.reparentTo(render)
        #Ajout dans le dicitonnaire de l'animation
        self.dictNoeudAnimation["AnimationMurVerticaleInverse"] = noeudAnimationCourrant


    def creerChar(self,positionX, positionY, identifiant, couleur):
        someTank = tank.Tank(identifiant,couleur,self.mondePhysique,self.leDto)#, dtoJoueur)
        #On place le tank sur la grille
        self.placerSurGrille(someTank.noeudPhysique,positionX,positionY)

        #Ajouter le char dans la liste
        self.listTank.append(someTank)

    def traiterCollision(self,node0, node1):
        #Pas très propre mais enfin...
        indiceTank = int(self.traiterCollisionTankAvecObjet(node0, node1,"Balle"))
        if(indiceTank != -1):
            print("indiceTank: "+str(indiceTank))
            tireurBalleId = int(self.trouverTag(node0, node1, "lanceurId"))
            balleId = int(self.trouverTag(node0, node1, "balleId"))
            #Prend 1 de dommage par défaut si la balle n'a pas été tirée par le tank
            self.listeBalle[balleId].exploser()
            if(tireurBalleId != indiceTank):
                if(indiceTank == 0):
                    if(self.toucher == False):
                        self.toucher = True
                        self.calculStatArme(self.listeBalle[balleId].nom, self.listTank[0], self.listTank[1])
                        
                    self.listTank[indiceTank].prendDommage(1,self.mondePhysique, self.listTank[1])
                else:
                    if(self.toucher == False):
                        self.toucher = True
                        self.calculStatArme(self.listeBalle[balleId].nom,self.listTank[1], self.listTank[0])
                        
                    self.listTank[indiceTank].prendDommage(1,self.mondePhysique, self.listTank[0])
            return
        
        indiceTank = int(self.traiterCollisionTankAvecObjet(node0, node1,"Item"))
        if(indiceTank != -1):
            itemID = int(self.trouverTag(node0, node1, "itemId"))
            if(itemID != -1):
                #Avertit l'item et le tank de la récupération
                itemCourrant = self.listeItem[itemID]
                #print "détecte item touché!!!!"
                itemCourrant.recupere()
                self.listTank[indiceTank].recupereItem(itemCourrant.armeId)
                return

        indiceTank = int(self.traiterCollisionTankAvecObjet(node0, node1,"LimiteJeu"))
        if(indiceTank != -1):
            #Un tank est tombé. mouhahahadddddddddd
            self.listTank[indiceTank].tombe(self.mondePhysique)
            return

    def calculStatArme(self, arme, tank, tankAdverse):
        if(arme == "canon"):
            tank.armeCanon.incrementeCoupRecu()
            tankAdverse.armeCanon.incrementeCoupAtteint()
        elif(arme == "mitraillette"):
            tank.armeMitraillette.incrementeCoupRecu()
            tankAdverse.armeMitraillette.incrementeCoupAtteint()
        elif(arme == "grenade"):
            tank.armeGrenade.incrementeCoupRecu()
            tankAdverse.armeGrenade.incrementeCoupAtteint()
        elif(arme == "pompe"):
            tank.armePompe.incrementeCoupRecu()
            tankAdverse.armePompe.incrementeCoupAtteint()
        elif(arme == "piege"):
            tank.armePiege.incrementeCoupRecu()
            tankAdverse.armePiege.incrementeCoupAtteint()
        elif(arme == "guide"):
            tank.armeGuide.incrementeCoupRecu()
            tankAdverse.armeGuide.incrementeCoupAtteint()
    #Méthode qui va retourner -1 si aucune collision avec un tank
    #Ou encore l'index du tank touché si applicable
    def traiterCollisionTankAvecObjet(self,node0,node1,testEntite):
        tag0 = node0.getTag("EntiteTankem")
        tag1 = node1.getTag("EntiteTankem")
        retour = -1
        if(tag0 == "Tank" and tag1 == testEntite):
            #print node1
            retour = node0.getTag("IdTank")

        if(tag0 == testEntite and tag1 == "Tank"):
            retour = node1.getTag("IdTank")
        return retour

    #Trouve si un des 2 noeuds a le tag indiqué
    def trouverTag(self,node0, node1, tag):
        retour = ""
        #On trouve l'ID de l'item qui a collisionné
        if(node0.getTag(tag) != ""):
            retour = node0.getTag(tag)

        if(node1.getTag(tag) != ""):
            retour = node1.getTag(tag)

        return retour

    #On met à jour ce qui est nécessaire de mettre à jour
    def update(self,tempsTot):
        for tank in self.listTank:
            tank.traiteMouvement(tempsTot)