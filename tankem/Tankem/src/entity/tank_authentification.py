# -*- coding: utf-8 -*-
from util import *

import sys
from panda3d.bullet import *
from panda3d.core import *
from direct.interval.IntervalGlobal import *
from direct.particles.ParticleEffect import ParticleEffect
import math

#Modules de notre jeu

#from DAO.DAO import DAO

#from DAO.DAO_B_Oracle import DAO_B_Oracle

'''
"""
import sys
#sys.path.append("DAO/DAO_B_CSV.py")
sys.path.append("../DAO")
"""
#from DAO_B_Oracle import *

#from DAO_B_Oracle import DAO_B_Oracle 
'''

#On doit faire que les particles sont dans les chemins... because reasons. Sinon elles ne marchent vraiment pas.


class Tank_authentification():
    def __init__(self, identifiant,couleur):
        

        #Défini les variables pour avancer et tourner
        self.speed = Vec3(0,0,0)
        self.omega = 0.0
        #VARIABLE

        self.etat = "inactif"
        self.hackRecuperation = False
        self.couleur = couleur
        self.identifiant = identifiant

        # On charge le modèles
        self.modele = loader.loadModel("../asset/Tank/tank")
        #On ajoute une boite
        shape = BulletBoxShape(Vec3(0.6, 0.75, 0.3))
        #shape = BulletCapsuleShape(0.3, 0.75, ZUp)

        #On ajoute un contrôlleur de personnage
        self.playerNode = BulletCharacterControllerNode(shape, 0.4, 'ControlleurTank_' + str(self.identifiant))
        self.noeudPhysique = render.attachNewNode(self.playerNode)

        
        self.modele.reparentTo(self.noeudPhysique)
        #On réduit sa taille un peu...
        self.modele.setScale(0.75,0.75,0.75)
        #On multiple la couleur de la texture du tank par ce facteur. Ça permet de modifier la couleur de la texture du tank
        self.modele.setColorScale(couleur.getX(),couleur.getY(),couleur.getZ(),1)
        self.modele.setPos(0,20,0)
       
        print("tank")
        #Pour ne pas que le char soit entré dans le sol lors de son apparition, on le soulève un peu
        #self.noeudPhysique.setZ(1.0)
       
        #On reparente le modele au noeud physique afin qu'il le suive
        #self.modele.reparentTo(self.noeudPhysique)

        #Ajustement de la hauteur du modèle pour que la physique soit vis-à-vis le modèle
        #self.modele.setZ(-0.25)

        #self.noeudPhysique.setTag("EntiteTankem","Tank")
        #self.noeudPhysique.setTag("IdTank",str( self.identifiant))

        #UGLY HACK - Panda3D particle editor wants particle image to be in same file as python file
        #NOT ON MY WATCH. I hacked the .ptf files with (example):
        # p0.renderer.setTexture(loader.loadTexture('smoke.png'))
        # to
        # p0.renderer.setTexture(loader.loadTexture('../asset/Particle/smoke.png'))
        #self.ptfDustTrail = ParticleEffect()
        #self.ptfDustTrail.loadConfig("../asset/Particle/tankemDust.ptf")
        #self.ptfDustTrail.start(parent = self.noeudPhysique, renderParent = render)
        #self.ptfDustTrail.softStop()
        #self.tracePoussiereActive = False

    def traiterCommande(self,message):
        directionHaut = Vec3(0,1,0)
        directionBas = Vec3(0,-1,0)
        directionGauche = Vec3(-1,0,0)
        directionDroite = Vec3(1,0,0)

        #Devrait être plus simple, mais un il y a un bug si je laisse une touche enfoncée au départ
        #On contounr le problème

        if(message == "avance"):
            self.speed += directionHaut
        elif(message == "avance-stop"):
            self.speed -= directionHaut
        elif(message == "recule"):
            self.speed += directionBas
        elif(message == "recule-stop"):
            self.speed -= directionBas
        elif(message == "tourne-gauche"):
            self.speed += directionGauche
        elif(message == "tourne-gauche-stop"):
            self.speed -= directionGauche
        elif(message == "tourne-droit"):
            self.speed += directionDroite
        elif(message == "tourne-droit-stop"):
            self.speed -= directionDroite
        #Le mouvement doit être directement bloqué à partir de la fonction
        #traiteMouvement sous peine d'avoir un bug en commencant le jeu
        if(self.etat != "actif"): 
            return

    


    def jump(self):
        self.playerNode.setMaxJumpHeight(1.1)
        self.playerNode.setJumpSpeed(0)
        self.playerNode.setGravity(40)
        self.playerNode.doJump()
        #print "Jumping and stuff"



    def traiteMouvement(self,tempsTot):
        
        if (self.playerNode != None):

            #Si on a un petit mouvement, on ne bouge pas le tank
            #OU que le tank n'est pas actif
            if(self.speed.lengthSquared() < 0.2 or self.etat != "actif"):
                self.playerNode.setLinearMovement(0.0, False)
                self.playerNode.setAngularMovement(0.0)

                if(self.tracePoussiereActive):
                    self.ptfDustTrail.softStop()
                    self.tracePoussiereActive = False
            else:
                speedCopy = Vec3(self.speed)
                speedCopy.normalize()

                #VARIABLE
                vitesseAvancer = 0
                #VARIABLE
                vitesseMaxTourner = 0

                #On bouge le joueur dans la bonne direction
                #Renormalize le vecteur pour ne pas avoir un bug comme le Quake 3
                #qui nous permettrait de bouger en diagonal rapidement
                self.playerNode.setLinearMovement(speedCopy * vitesseAvancer, False)

                #Cacul un vectoriel pour tourner le tank quand on bouge
                #C'est plutôt complexe. On se base sur la théorie du pilotage
                # ("steering behavior"). Vous trouverez plein d'articles sur le sujet
                directionQuePointeLeTank = render.getRelativeVector(self.noeudPhysique, Vec3.forward())
                signeAngle = 0
                produitVectoriel = directionQuePointeLeTank.cross(speedCopy)
                angleDegre = directionQuePointeLeTank.angleDeg(speedCopy)

                #Décide de la direction de rotation
                if(produitVectoriel.getZ() > 0.01):
                    signeAngle = 1.0

                if(produitVectoriel.getZ() < -0.01):
                    signeAngle = -1.0

                #Réduire progressivement la rotation selon l'angle
                #avec une courbe en racine carrée
                angleMax = 180
                facteur = angleDegre / angleMax
                
                vitesseTourner = vitesseMaxTourner * math.sqrt(facteur)

                angleCritiqueIntermediaire = 5.0
                if(angleDegre < angleCritiqueIntermediaire):
                    vitesseIntermediaireTourner = vitesseMaxTourner * 0.5
                    vitesseTourner = vitesseIntermediaireTourner * facteur

                #Arrêter la rotation selon l'angle
                angleCritiqueDegre = 1.0
                if(angleDegre < angleCritiqueDegre):
                    vitesseTourner = 0.0
                    signeAngle = 0.0
                self.playerNode.setAngularMovement(signeAngle * vitesseTourner)

                if(not self.tracePoussiereActive):
                    #Le système de particle est attaché au modèle MAIS les particules sont attachées au mondev
                    self.ptfDustTrail.softStart()
                    self.tracePoussiereActive = True