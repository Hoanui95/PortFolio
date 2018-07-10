## -*- coding: utf-8 -*-

from direct.showbase.ShowBase import ShowBase
from direct.gui.OnscreenText import OnscreenText 
from direct.gui.DirectGui import *
from panda3d.core import *
from direct.interval.LerpInterval import *
from direct.interval.IntervalGlobal import *
from direct.showbase.Transitions import Transitions
import sys
import time

from entity import *
from panda3d.bullet import BulletWorld
from math import pi, sin, cos, radians, degrees

from DAO_Phase2 import *
from authentification import *

class InterfaceMenuPrincipal(ShowBase):
    def __init__(self):
       
        self.arriver1 = False
        self.arriver2 = False
        self.Parallel = Parallel(name="parallel")
        
        #Image d'arrière plan
        self.background=OnscreenImage(parent=render2d, image="../asset/Menu/menuPrincipal.jpg")

        #On dit à la caméra que le dernier modèle doit s'afficher toujours en arrière
        self.baseSort = base.cam.node().getDisplayRegion(0).getSort()
        base.cam.node().getDisplayRegion(0).setSort(10)

        #Titre du jeu
        self.textTitre = OnscreenText(text = "Tankem!",
                                      pos = (0,0.6), 
                                      scale = 0.32,
                                      fg=(0.8,0.9,0.7,1),
                                      align=TextNode.ACenter)


        #-------------------->



        #--------------------<


        #Boutons
        btnScale = (0.18,0.18)
        text_scale = 0.12
        borderW = (0.04, 0.01)
        couleurBack = (0.243,0.325,0.121,1)
        separation = 0.5
        hauteur = -0.6
        self.b1 = DirectButton(text = ("Quick play", "!", "!", "disabled"),
                          text_scale=btnScale,
                          borderWidth = borderW,
                          text_bg=couleurBack,
                          frameColor=couleurBack,
                          relief=2,
                          command=self.chargeJeu,
                          pos = (-1,0,hauteur))


        self.b3 = DirectButton(text = ("Niveaux", "!", "!", "disabled"),
                          text_scale=btnScale,
                          borderWidth = borderW,
                          text_bg=couleurBack,
                          frameColor=couleurBack,
                          relief=2,
                          command=self.choisirNiveau,
                          pos = (1,0,hauteur))


        self.b2 = DirectButton(text = ("Quitter", "Bye!", ":-(", "disabled"),
                        text_scale=btnScale,
                        borderWidth = borderW,
                        text_bg=couleurBack,
                        frameColor=couleurBack,
                        relief=2,
                        command = lambda : sys.exit(),
                        pos = (0,0,hauteur))

        #Initialisation de l'effet de transition
        curtain = loader.loadTexture("../asset/Menu/loading.jpg")

        self.transition = Transitions(loader)
        self.transition.setFadeColor(0, 0, 0)
        self.transition.setFadeModel(curtain)

        self.sound = loader.loadSfx("../asset/Menu/demarrage.mp3")
        self.etat = False

        #ici pour button les interfaces
        self.verticalOffsetControlButton = 0.225
        self.verticalOffsetCenterControlButton = -0.02

    def cacher(self):
            #Est esssentiellement un code de "loading"

            #On remet la caméra comme avant
            base.cam.node().getDisplayRegion(0).setSort(self.baseSort)
            #On cache les menus
            self.background.hide()
            self.b1.hide()
            self.b2.hide()
            self.b3.hide()
            self.textTitre.hide()


    def cacherNiveau(self):
       
        #On remet la caméra comme avant
        base.cam.node().getDisplayRegion(0).setSort(self.baseSort)
       
        #On cache les menus
        self.background.hide()
        self.myScrolledListLabel.hide()

    def cacherAuthentification(self):
       
        #On remet la caméra comme avant
        base.cam.node().getDisplayRegion(0).setSort(self.baseSort)
       
        self.labelJ1.hide() 
        self.labelmdp1.hide()
        self.entryJ1.hide()
        self.entrymdp1.hide() 
        self.labelJ2.hide() 
        self.labelmdp2.hide() 
        self.entryJ2.hide() 
        self.entrymdp2.hide()
        self.connectJ1.hide()
        self.connectJ2.hide()
        self.champMessage.hide()
        self.champCalcule1.hide()
        self.champVs.hide()
        self.champCalcule2.hide()
        self.champCombattre.hide()
        self.champNomNiv.hide()
        self.champFavori.hide()
        self.boutonCombattre.hide()
        self.labelVs.hide()
        self.background.hide()



    def chargeJeu(self):
            #On démarre!
            #if self.etat==True:
            #    self.cacherNiveau()
            
            Sequence(Func(lambda : self.transition.irisOut(0.2)),
                     SoundInterval(self.sound),               
                     Func(self.cacher),
                     Func(lambda : messenger.send("DemarrerPartie", ["quick"])),
                     #Wait(0.2), #Bug étrange quand on met pas ça. L'effet de transition doit lagger
                     Func(lambda : self.transition.irisIn(0.2))
            ).start()


    def chargeJeuNiveau(self,niveau):
        self.tank1.removeNode()
        self.tank2.removeNode()
        Sequence(Func(lambda : self.transition.irisOut(0.2)),
                    SoundInterval(self.sound),               
                    Func(self.cacherAuthentification),
                    Func(lambda : messenger.send("DemarrerPartie", [niveau])),
                    #Wait(0.2), #Bug étrange quand on met pas ça. L'effet de transition doit lagger
                    Func(lambda : self.transition.irisIn(0.2))
        ).start()


    
    def choisirNiveau(self):
     
        '''
        self.textObject = OnscreenText(text = "CHOISISSEZ VOTRE CHAMP DE BATAILLLE", pos =(0,0.9),
        scale = 0.1,fg=(1,1.5,0.5,0.3),bg=(1,1,1,0.4),align=TextNode.ACenter,mayChange=1)
        '''

        self.cacher()
        self.etat=True
        self.background = OnscreenImage(parent = render2d, image="../asset/Menu/niveau.jpg")

      
        try:
            self.leDaoPhase2 = DAO_Oracle("e1529743","AAAaaa111","delta/decinfo.edu")
            self.niveaux = self.leDaoPhase2.accessNomsNiveaux()
            self.leDaoPhase2.deconnection()

            if(len(self.niveaux) > 0):
                mapsInfo = self.niveaux

                # ici pour cartes
                self.controlTextScale = 0.10
                self.controlBorderWidth = (0.005, 0.005)
                self.scrollItemButtons = self.createAllItemsNiveau(mapsInfo)

               

                self.myScrolledListLabel = DirectScrolledList(
                        decButton_pos = (0.5, 0.0,-0.625-  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton),
                        decButton_text = "Monter",
                        decButton_text_scale = 0.08,
                        decButton_borderWidth = (0.0025, 0.0025),
                        decButton_frameSize = (-0.35, 0.35, -0.0375, 0.075),
                        decButton_text_fg = (0.15, 0.15, 0.75, 1.0),

                        incButton_pos = (-0.5, 0.0, -0.625 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton),
                        incButton_text = "Descendre",
                        incButton_text_scale = 0.08,
                        incButton_borderWidth = (0.0025, 0.0025),
                        incButton_frameSize = (-0.35, 0.35, -0.0375, 0.075),
                        incButton_text_fg = (0.15, 0.15, 0.75, 1.0),



                        #position du frame x , z y
                        pos = (0.1, 0, 0.5),
                        items = self.scrollItemButtons,
                        numItemsVisible = 5,
                        forceHeight = 0.175,
                        
                        frameSize = (-1.05, 1.05, -0.95, 0.325),
                        frameColor = (0.3254,0.3254, 0.12549, 0.75),

                        # sur un item
                        itemFrame_pos = (0.0, 0.0, 0.0),
                        itemFrame_frameSize = (-1.025, 1.025, -0.775, 0.15),
                        itemFrame_frameColor = (0.1098039215686275,0.1098039215686275, 0.0431372549019608, 0.75),
                        itemFrame_relief = 1
                    )
            else:
                ctypes.windll.user32.MessageBoxA(0, "Il n'y a aucun niveau actif dans la BD, on demarre le tankem avec un niveau au hasard", "Error de connection", 0)
                self.chargeJeu()
        except:
            ctypes.windll.user32.MessageBoxA(0, "erreur connexion pour les niveaux, on demarre le tankem avec un niveau au hasard", "Error de connection", 0)
            

       

    def AuthentificationJoueur(self, mapId):
        try:
            self.dao_joueur = DAO_Joueur("e1529743","AAAaaa111","delta/decinfo.edu")
            self.cacherNiveau()
            self.background = OnscreenImage(parent = render2d, image="../asset/Menu/background.jpg")
            base.cam.node().getDisplayRegion(0).setSort(20)

            self.isConnectedJ1 = False
            self.isConnectedJ2 = False

            self.labelJ1 = DirectLabel(text = "Joueur 1", text_scale=0.06, pos=(-1.5, 0.0, 1.1 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.25, 0.25, -0.035, 0.060), color=(0,0,0,1), text_fg=(1,1,1,1))
            self.labelmdp1 = DirectLabel(text = "Mot de passe", text_scale=0.06, pos=(-1.5, 0.0, 1.0 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.25, 0.25, -0.035, 0.060), color=(0,0,0,1), text_fg=(1,1,1,1))
            self.entryJ1 = DirectEntry(text_scale=0.06, pos=(-0.9, 0.0, 1.1 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.25, 0.25, -0.035, 0.060), color=(0,0,0,1), text_fg=(1,1,1,1))
            self.entrymdp1 = DirectEntry(text_scale=0.06, pos=(-0.9, 0.0, 1.0 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.25, 0.25, -0.035, 0.060), color=(0,0,0,1), text_fg=(1,1,1,1))
            self.labelJ2 = DirectLabel(text = "Joueur 2", text_scale=0.06, pos=(0.3, 0.0, 1.1 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.25, 0.25, -0.035, 0.060), color=(0,0,0,1), text_fg=(1,1,1,1))
            self.labelmdp2 = DirectLabel(text = "Mot de passe", text_scale=0.06, pos=(0.3, 0.0, 1.0 - self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.25, 0.25, -0.035, 0.060), color=(0,0,0,1), text_fg=(1,1,1,1))
            self.entryJ2 = DirectEntry(text_scale=0.06, pos=(0.9, 0.0, 1.1 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.25, 0.25, -0.035, 0.060), color=(0,0,0,1), text_fg=(1,1,1,1))
            self.entrymdp2 = DirectEntry(text_scale=0.06, pos=(0.9, 0.0, 1.0 - self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.25, 0.25, -0.035, 0.060), color=(0,0,0,1), text_fg=(1,1,1,1))
            self.connectJ1 = DirectButton(frameColor=(1,0.5,0.5,1), relief=1, text = "Connection",text_scale=0.06, pos=(-0.3, 0.0, 1.1 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.25, 0.25, -0.035, 0.060), command = lambda: self.connect("J1", mapId))
            self.connectJ2 = DirectButton(frameColor=(1,0.5,0.5,1), relief=1, text = "Connection", text_scale=0.06, pos=(1.5, 0.0, 1.1 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.25, 0.25, -0.035, 0.060), command = lambda: self.connect("J2", mapId))
            self.champMessage = DirectLabel(text = "Veuillez vous-connectez !",text_scale=0.06, pos=(0, 0.0, 0.8 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2, -0.020, 0.065), color=(0,0,0,1),text_fg=(1,0.1,0.1,1))
        except:
            ctypes.windll.user32.MessageBoxA(0, "erreur connexion pour les login des joueurs, demmarage automatique", "Error de login", 0)
            self.cacherNiveau()
            self.chargeJeu()
            
        

    def connect(self, joueur, mapId):
        if(joueur == "J1"):
            self.dto_joueur1 = self.dao_joueur.lireJoueur(0, self.entryJ1.get(), self.entrymdp1.get())
            if(self.dto_joueur1.id == 0):
                self.champMessage.hide()
                self.champMessage =  DirectLabel(text = "Le joueur n'est pas reconnu !",  text_scale=0.06, pos=(0, 0.0, 0.8 -  self.verticalOffsetControlButton + self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2, -0.020, 0.065), text_fg=(1,0.1,0.1,1), color=(0,0,0,1))
            elif(self.isConnectedJ2):
                if(self.dto_joueur1.id == self.dto_joueur2.id):
                    self.champMessage.hide()
                    self.champMessage =  DirectLabel(text = "Le joueur est déja connecté !",  text_scale=0.06, pos=(0, 0.0, 0.8 -  self.verticalOffsetControlButton + self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2, -0.020, 0.065), text_fg=(1,0.1,0.1,1), color=(0,0,0,1))
                else:
                    self.champMessage.hide()
                    self.champMessage =  DirectLabel(text = "Joueur1 est connecté !",  text_scale=0.06, pos=(0, 0.0, 0.8 -  self.verticalOffsetControlButton + self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2, -0.020, 0.065), text_fg=(1,0.1,0.1,1), color=(0,0,0,1))
                    self.isConnectedJ1 = True
                    self.char1 = self.creerChar(6,6,0,Vec3(self.dto_joueur1.R,self.dto_joueur1.G,self.dto_joueur1.B))            
            else:
                self.champMessage.hide()
                self.champMessage =  DirectLabel(text = "Joueur1 est connecté !",  text_scale=0.06, pos=(0, 0.0, 0.8 -  self.verticalOffsetControlButton + self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2, -0.020, 0.065), text_fg=(1,0.1,0.1,1), color=(0,0,0,1))
                self.isConnectedJ1 = True
                self.char1 = self.creerChar(6,6,0,Vec3(self.dto_joueur1.R,self.dto_joueur1.G,self.dto_joueur1.B)) 
        else:
            self.dto_joueur2 = self.dao_joueur.lireJoueur(1, self.entryJ2.get(), self.entrymdp2.get())
            if(self.dto_joueur2.id == 0):
                self.champMessage.hide()
                self.champMessage =  DirectLabel(text = "Le joueur n'est pas reconnu !",  text_scale=0.06, pos=(0, 0.0, 0.8 -  self.verticalOffsetControlButton + self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2, -0.020, 0.065), text_fg=(1,0.1,0.1,1), color=(0,0,0,1))
            elif(self.isConnectedJ1):
                if(self.dto_joueur1.id == self.dto_joueur2.id):
                    self.champMessage.hide()
                    self.champMessage =  DirectLabel(text = "Le joueur est déja connecté !",  text_scale=0.06, pos=(0, 0.0, 0.8 -  self.verticalOffsetControlButton + self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2, -0.020, 0.065), text_fg=(1,0.1,0.1,1), color=(0,0,0,1))
                else:
                    self.champMessage.hide()
                    self.champMessage =  DirectLabel(text = "Joueur2 est connecté !", text_scale=0.06, pos=(0, 0.0, 0.8 -  self.verticalOffsetControlButton + self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2, -0.020, 0.065), text_fg=(1,0.1,0.1,1))
                    self.isConnectedJ2 = True
                    self.char2 = self.creerChar(3,3,1,Vec3(self.dto_joueur2.R,self.dto_joueur2.G,self.dto_joueur2.B)) #Char gris-jaune
            else:
                self.champMessage.hide()
                self.champMessage =  DirectLabel(text = "Joueur2 est connecté !", text_scale=0.06, pos=(0, 0.0, 0.8 -  self.verticalOffsetControlButton + self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2, -0.020, 0.065), text_fg=(1,0.1,0.1,1), color=(0,0,0,1))
                self.isConnectedJ2 = True
                self.char2 = self.creerChar(3,3,1,Vec3(self.dto_joueur2.R,self.dto_joueur2.G,self.dto_joueur2.B)) #Char gris-jaune
        if(self.isConnectedJ1 and self.isConnectedJ2):
            self.champMessage.hide()
            self.champMessage = DirectLabel(text = "Les deux joueurs sont connecté !",  text_scale=0.06, pos=(0, 0.0, 0.8 -  self.verticalOffsetControlButton + self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2, -0.020, 0.065), text_fg=(1,0.1,0.1,1), color=(0,0,0,1))
            self.createLastItem(mapId)

    def tournerJ1(self):
        self.arriver1 = True
        if(self.arriver2):
            self.Parallel.append(self.tankHprInterval1)
            self.Parallel.append(self.tankHprInterval2)
            self.Parallel.loop()
        else:
            self.Parallel.append(self.tankHprInterval1)
            self.Parallel.loop()

    def tournerJ2(self):
        self.arriver2 = True
        if(self.arriver1):
            self.Parallel.append(self.tankHprInterval2)
            self.Parallel.append(self.tankHprInterval1)
            self.Parallel.loop()
        else:
            self.Parallel.append(self.tankHprInterval2)
            self.Parallel.loop()
    def creerChar(self,positionX, positionY, identifiant, couleur):

        # On charge le modèles
        
     
        if(identifiant == 0):
            self.tank1 = loader.loadModel("../asset/Tank/tank")
            self.tank1.reparentTo(render)
            self.tank1.setColorScale(couleur.getX(),couleur.getY(),couleur.getZ(),1)
            self.tank1.setZ(-0.25)
            self.tank1.setHpr(-90,0,0)
            self.tankHprInterval1 = self.tank1.hprInterval(3.0,Point3(-450, 0, 0))
            tankAvancerDroite = self.tank1.posInterval(3.0,Point3(-4,15,-3),startPos=Point3(-7,15,-3))
            self.Sequence = Sequence(tankAvancerDroite, Func(self.tournerJ1))
            self.Sequence.start()

        else:
            self.tank2 = loader.loadModel("../asset/Tank/tank")
            self.tank2.reparentTo(render)
            self.tank2.setColorScale(couleur.getX(),couleur.getY(),couleur.getZ(),1)
            self.tank2.setZ(-0.25)
            self.tank2.setHpr(90,0,0)
            self.tankHprInterval2 = self.tank2.hprInterval(3.0,Point3(450, 0, 0))
            tankAvancerGauche = self.tank2.posInterval(3.0,Point3(4,15,-3),startPos=Point3(7,15,-3))
            self.Sequence = Sequence(tankAvancerGauche, Func(self.tournerJ2))
            self.Sequence.start()


    def createLastItem(self, mapId):
        #analyse pour le nom calcule 
        analyse1 = AnalyseDTOJoueur(self.dto_joueur1)
        analyse2 = AnalyseDTOJoueur(self.dto_joueur2)
        self.nomCalcule1 = analyse1.nomCalcule()
        self.nomCalcule2 = analyse2.nomCalcule()

        
        self.champCalcule1 = DirectLabel(text = self.nomCalcule1,  text_scale=0.06, pos=(0, 0.0, 0.65 -  self.verticalOffsetControlButton + self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2, -0.035, 0.065), scale=(0,0,0),text_fg=(1,0.1,0.1,1), color=(0,0,0,1))
        self.champVs = DirectLabel(text = "VS",  text_scale=0.06, pos=(0, 0.0, 0.55 -  self.verticalOffsetControlButton + self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2, -0.035, 0.065), scale=(0,0,0),text_fg=(1,0.1,0.1,1), color=(0,0,0,1))
        self.champCalcule2 = DirectLabel(text =  self.nomCalcule2 ,  text_scale=0.06, pos=(0, 0.0, 0.45 -  self.verticalOffsetControlButton + self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2, -0.020, 0.065), scale=(0,0,0),text_fg=(1,0.1,0.1,1), color=(0,0,0,1))
        self.champCombattre = DirectLabel(text = "Combattrons dans",  text_scale=0.06, pos=(0, 0.0, 0.30 -  self.verticalOffsetControlButton + self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2,-0.035, 0.065), scale=(0,0,0),text_fg=(1,0.1,0.1,1), color=(0,0,0,1))
        pos = 0
        for i in self.niveaux:
            if(i[1] == mapId):
                niveau = self.niveaux[pos][0]
            pos += 1
        self.champNomNiv = DirectLabel(text = str(niveau), text_scale=0.06, pos=(0, 0.0, 0.20 -  self.verticalOffsetControlButton + self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2, -0.020, 0.065), scale=(0,0,0),text_fg=(1,0.1,0.1,1), color=(0,0,0,1))

        #favori
        if(self.dto_joueur1.experience > self.dto_joueur2.experience):
            favori = self.nomCalcule1  + " est favori"
            self.dto_joueur1.favori = 0
        elif(self.dto_joueur1.experience < self.dto_joueur2.experience):
            favori =  self.nomCalcule2  + " est favori"
            self.dto_joueur2.favori = 0
        else:
            favori = "Aucun favori"
            self.dto_joueur1.favori = 0
            self.dto_joueur2.favori = 0

        self.champFavori = DirectLabel(text = favori,  text_scale=0.06, pos=(0, 0.0, 0.05 -  self.verticalOffsetControlButton + self.verticalOffsetCenterControlButton), frameSize = (-1.2,1.2, -0.020, 0.065), scale=(0,0,0),text_fg=(1,0.1,0.1,1), color=(0,0,0,1))
        #animation des labels
        delai = Wait(0.3)

        scale1 = self.champCalcule1.scaleInterval(0.7, Point3(1, 1, 1), blendType="easeInOut")
        scale2 = self.champVs.scaleInterval(0.7, Point3(1, 1, 1), blendType="easeInOut")
        scale3 = self.champCalcule2.scaleInterval(0.7, Point3(1, 1, 1), blendType="easeInOut")
        scale4 = self.champCombattre.scaleInterval(0.7, Point3(1, 1, 1), blendType="easeInOut")
        scale5 = self.champNomNiv.scaleInterval(0.7, Point3(1, 1, 1), blendType="easeInOut")
        scale6 = self.champFavori.scaleInterval(0.7, Point3(1, 1, 1), blendType="easeInOut")
       
        sequence = Sequence(scale1, delai, scale2, delai,scale3, delai,scale4,scale5, delai,scale6, delai)
        sequence.start()

        #animation bouton combattre
        self.boutonCombattre = DirectButton(frameColor=(1,0,0,1), relief=2, text = "Combattre", text_scale=0.07, pos=(0, 0.0, - 0.5 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.40, 0.40, -0.080, 0.060), command = lambda: self.affichageCombat(mapId))
        interval1 = self.boutonCombattre.scaleInterval(0.7, Point3(1.2, 1.2, 1.2), blendType="easeInOut")
        interval2 = self.boutonCombattre.scaleInterval(0.7, Point3(1, 1, 1), blendType="easeInOut")
        
        self.sequenceBouton = Sequence(interval1,interval2,name="sequenceBouton")
        self.sequenceBouton.loop()

    def affichageCombat(self, mapId):
        self.sequenceBouton.finish()
        self.boutonCombattre.hide()
        self.Parallel.start()
        self.labelVs = DirectLabel(text = self.nomCalcule1 + " VS " + self.nomCalcule2,frameColor=(1,0,0,1), text_scale=0.07, pos=(0, 0.0, - 0.7 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-1.0,1.0, -0.020, 0.065), scale=(6,6,6))
        rapetisseLabel =  self.labelVs.scaleInterval(1, Point3(1, 1, 1), blendType="easeInOut")
        delai = Wait(3.5)
        self.sequenceNomVS = Sequence(rapetisseLabel, delai,  Func(self.loadGame,mapId), name="sequenceNom")
        self.sequenceNomVS.start()


    def createItemButtonNiveau(self, mapName, mapId):
            return DirectButton(
                    text = mapName,
                    text_scale = self.controlTextScale, 
                    borderWidth = self.controlBorderWidth, 
                    relief = 1,
                    frameSize = (-1.0, 1.0, -0.0425, 0.085),
                    command = lambda: self.AuthentificationJoueur(mapId))

    def createAllItemsNiveau(self, mapsInfo):
        scrollItemButtons = []#self.createItemButtonNiveau(u'-> Carte aléatoire <-', None)]
        for mapInfo in mapsInfo:
            scrollItemButtons.append(self.createItemButtonNiveau(self.formatText(mapInfo[0]), mapInfo[1]))
        return scrollItemButtons

    def formatText(self, text, maxLength = 20):
        return text if len(text) <= maxLength else text[0:maxLength] + '...'

    def loadGame(self, mapId):
        # À ajuster... évidemment...
        self.dao_joueur.deconnection()
        self.chargeJeuNiveau(mapId)
    

    