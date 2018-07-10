## -*- coding: utf-8 -*-
from util import *

from direct.showbase.ShowBase import ShowBase
from direct.gui.OnscreenText import OnscreenText 
from direct.gui.DirectGui import *
from panda3d.core import *
from direct.interval.LerpInterval import *
from direct.interval.IntervalGlobal import *

from authentification import *

 
class InterfaceMessage(ShowBase):
    def __init__(self,dto):
        self.accept("tankElimine",self.displayGameOver)
        self.callBackFunction = None

        self.accept("showHelp",self.displayHelp)

        self.createHelpText()
        self.displayHelp(False)

        self.leDto=dto

        self.accept("rapport",self.hideTextJoueurGagnant)
        self.verticalOffsetControlButton = 0.225
        self.verticalOffsetCenterControlButton = -0.02

    def effectCountDownStart(self,nombre,callbackFunction):
        self.callBackFunction = callbackFunction
        self.displayCountDown(nombre)
        
    def displayCountDown(self, nombre):
        message = str(nombre)
        startScale = 0.4

        text = TextNode('Compte à rebour')
        text.setText(message)
        textNodePath = aspect2d.attachNewNode(text)
        textNodePath.setScale(startScale)
        text.setShadow(0.05, 0.05)
        text.setShadowColor(0, 0, 0, 1)
        text.setTextColor(0.5, 0.5, 1, 1)
        text.setAlign(TextNode.ACenter)

        effetScale = LerpScaleInterval(textNodePath, 1.0, 0.05, startScale)
        effetFadeOut = LerpColorScaleInterval(textNodePath, 1.0, LVecBase4(1,1,1,0), LVecBase4(1,1,1,1))
        effetFadeOut.start()

        recursion = Func(self.displayCountDown,nombre-1)

        #Le prochain tour, on affiche la message de début de partie
        if(nombre == 1):
            recursion = Func(self.displayStartGame)
        sequence = Sequence(effetScale,recursion)
        sequence.start()

    def displayStartGame(self):
        #message = "Tankem!"
        message = self.leDto.mess_startGame_content[1]
        startScale = 0.4

        text = TextNode('Début de la partie')
        text.setText(message)
        textNodePath = aspect2d.attachNewNode(text)
        textNodePath.setScale(startScale)
        text.setShadow(0.05, 0.05)
        text.setShadowColor(0, 0, 0, 1)
        text.setTextColor(0.5, 0.5, 1, 1)
        text.setAlign(TextNode.ACenter)

        delai = Wait(0.3)
        effetFadeOut = LerpColorScaleInterval(textNodePath, 0.15, LVecBase4(1,1,1,0), LVecBase4(1,1,1,1), blendType = 'easeIn')

        sequence = Sequence(delai,effetFadeOut,Func(self.callBackFunction))
        sequence.start()

    def displayGameOver(self, idPerdant):
        joueurGagnant = 1 if idPerdant == 1 else 2

        #FINPARTIE
        #VARIABLE  
        self.dto_joueur1 = DTO_Joueur1()
        self.dto_joueur2 = DTO_Joueur2()

        if(idPerdant == 0):
            self.messageGagnant = self.dto_joueur2.nom +" "+ self.leDto.mess_endGame_content[1]
            phrase = self.dto_joueur2.phrase
            r = self.dto_joueur2.R
            g = self.dto_joueur2.G
            b = self.dto_joueur2.B
        else:
            self.messageGagnant = self.dto_joueur1.nom +" "+ self.leDto.mess_endGame_content[1]
            phrase = self.dto_joueur1.phrase
            r = self.dto_joueur1.R
            g = self.dto_joueur1.G
            b = self.dto_joueur1.B
        startScale = 0.2

        self.text = TextNode('Annonce game over')
        self.text.setText(self.messageGagnant)
        textNodePathOver = aspect2d.attachNewNode(self.text)
        textNodePathOver.setScale(startScale)
        textNodePathOver.setColorScale(LVecBase4(1,1,1,0))
        self.text.setShadow(0.05, 0.05)
        self.text.setShadowColor(0, 0, 0, 1)
        self.text.setTextColor(r,g,b, 1)
        self.text.setAlign(TextNode.ACenter)

        #delai = Wait(0.5)
        effetFadeIn = LerpColorScaleInterval(textNodePathOver, 1, LVecBase4(1,1,1,1), LVecBase4(1,1,1,0), blendType = 'easeIn')

        sequence = Sequence(effetFadeIn)
        sequence.start()

        self.phrasePerso = DirectLabel(frameColor=(r, g, b, 1), text = phrase, text_scale=0.07, pos=(0, 0.0, - 0.2 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.60, 0.60, -0.09, 0.09))
        interval1 = self.phrasePerso.scaleInterval(0.7, Point3(1.2, 1.2, 1.2), blendType="easeInOut")
        interval2 = self.phrasePerso.scaleInterval(0.7, Point3(1, 1, 1), blendType="easeInOut")
        
        self.sequencePhrase = Sequence(interval1,interval2,name="sequencePhrase")
        self.sequencePhrase.loop()

    def hideTextJoueurGagnant(self, finPartie1, finPartie2):
        self.text.setText("")
        self.phrasePerso.hide()
     
        self.titre = DirectLabel(text = "RAPPORT FIN PARTIE", text_scale=0.065, pos=(0, 0.0, -0.2
         -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-2, 2, -2, 0.060), color=LVecBase4(0.3254,0.3254, 0.12549, 0.75))

        self.gagnant = DirectLabel(text = self.messageGagnant , text_scale=0.075, pos=(0, 0.0, -0.4
         -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.50, 0.50, -0.035, 0.060), color=LVecBase4(0.3254,0.3254, 0.12549, 0.75))

        self.labelNom1 = DirectLabel(text = "Joueur 1 : " + self.dto_joueur1.nom, text_scale=0.05, pos=(-1.2, 0.0, -0.3 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.40, 0.40, -0.035, 0.060), color=LVecBase4(0.25,0.63, 0.10, 0.75),scale=(0,0,0))
    
        self.labelExperienceGagne = DirectLabel(text = "A gagné : " + str(finPartie1.experienceGagne), text_scale=0.05, pos=(-1.2, 0.0, -0.4 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.40, 0.40, -0.035, 0.060), color=LVecBase4(0.25,0.63, 0.10, 0.75),scale=(0,0,0))

        self.labeNouvelleExperience = DirectLabel(text = "Nouvelle expérience : " + str(finPartie1.nouvelleExperience), text_scale=0.05, pos=(-1.2, 0.0, -0.5 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.40, 0.40, -0.035, 0.060), color=LVecBase4(0.25,0.63, 0.10, 0.75),scale=(0,0,0))
        
        finPartie1.calculAncienNiveau()
    
        self.labelNiveauAugmente = DirectLabel(text = "Augmente Niveau : " + str(finPartie1.niveauAugmente()), text_scale=0.05, pos=(-1.2, 0.0, -0.6 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.40, 0.40, -0.035, 0.060), color=LVecBase4(0.25,0.63, 0.10, 0.75),scale=(0,0,0))

        self.labelNiveau1 = DirectLabel(text = "Niveau : " + str(finPartie1.niveau), text_scale=0.05, pos=(-1.2, 0.0, -0.7 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.40, 0.40, -0.035, 0.060), color=LVecBase4(0.25,0.63, 0.10, 0.75),scale=(0,0,0))

        #Joueur 2

        self.labelNom2 = DirectLabel(text = "Joueur 2 : " + self.dto_joueur2.nom, text_scale=0.05, pos=(1.2, 0.0, -0.3 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.40, 0.40, -0.035, 0.060), color=LVecBase4(0.25,0.63, 0.10, 0.75),scale=(0,0,0))
    
        self.labelExperienceGagne2 = DirectLabel(text = "A gagné : " + str(finPartie2.experienceGagne), text_scale=0.05, pos=(1.2, 0.0, -0.4 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.40, 0.40, -0.035, 0.060), color=LVecBase4(0.25,0.63, 0.10, 0.75),scale=(0,0,0))

        self.labeNouvelleExperience2 = DirectLabel(text = "Nouvelle expérience : " + str(finPartie2.nouvelleExperience), text_scale=0.05, pos=(1.2, 0.0, -0.5 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.40, 0.40, -0.035, 0.060), color=LVecBase4(0.25,0.63, 0.10, 0.75),scale=(0,0,0))
        
        finPartie2.calculAncienNiveau()
    
        self.labelNiveauAugmente2 = DirectLabel(text = "Augmente Niveau : " + str(finPartie2.niveauAugmente()), text_scale=0.05, pos=(1.2, 0.0, -0.6 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.40, 0.40, -0.035, 0.060), color=LVecBase4(0.25,0.63, 0.10, 0.75),scale=(0,0,0))

        self.labelNiveau2 = DirectLabel(text = "Niveau : " + str(finPartie2.niveau), text_scale=0.05, pos=(1.2, 0.0, -0.7 -  self.verticalOffsetControlButton +  self.verticalOffsetCenterControlButton), frameSize = (-0.40, 0.40, -0.035, 0.060), color=LVecBase4(0.25,0.63, 0.10, 0.75),scale=(0,0,0))

        rapportNom1 = self.labelNom1.scaleInterval(0.6, Point3(1, 1, 1), blendType="easeInOut")
        rapportNom2 = self.labelNom2.scaleInterval(0.6, Point3(1, 1, 1), blendType="easeInOut")
        rapportExp1 = self.labelExperienceGagne.scaleInterval(0.6, Point3(1, 1, 1), blendType="easeInOut")
        rapportExp2 = self.labelExperienceGagne2.scaleInterval(0.6, Point3(1, 1, 1), blendType="easeInOut")
        rapportNExp1 = self.labeNouvelleExperience.scaleInterval(0.6, Point3(1, 1, 1), blendType="easeInOut")
        rapportNExp2 = self.labeNouvelleExperience2.scaleInterval(0.6, Point3(1, 1, 1), blendType="easeInOut")
        rapportNiveauA1 = self.labelNiveauAugmente.scaleInterval(0.6, Point3(1, 1, 1), blendType="easeInOut")
        rapportNiveauA2 = self.labelNiveauAugmente2.scaleInterval(0.6, Point3(1, 1, 1), blendType="easeInOut")
        rapportNiveau1 = self.labelNiveau1.scaleInterval(0.6, Point3(1, 1, 1), blendType="easeInOut")
        rapportNiveau2 = self.labelNiveau2.scaleInterval(0.6, Point3(1, 1, 1), blendType="easeInOut")
        

        sequence1 = Sequence(rapportNom1,rapportExp1,rapportNExp1,rapportNiveauA1, rapportNiveau1)
        sequence2 = Sequence(rapportNom2,rapportExp2,rapportNExp2,rapportNiveauA2, rapportNiveau2)
        sequence1.start()
        sequence2.start()
        
    def effectMessageGeneral(self, message, duration):
        text = TextNode('Message general')

        startScale = 0.12
        text.setText(message)
        textNodePath = aspect2d.attachNewNode(text)
        textNodePath.setScale(startScale)
        textNodePath.setColorScale(LVecBase4(1,1,1,0))
        text.setShadow(0.05, 0.05)
        text.setShadowColor(0, 0, 0, 1)
        text.setTextColor(0.01, 0.2, 0.7, 1)
        text.setAlign(TextNode.ACenter)
        textNodePath.setPos(Vec3(0,0,0.65))

        delai = Wait(duration)
        effetFadeIn = LerpColorScaleInterval(textNodePath, 0.3, LVecBase4(1,1,1,1), LVecBase4(1,1,1,0), blendType = 'easeIn')
        effetFadeOut = LerpColorScaleInterval(textNodePath, 0.3, LVecBase4(1,1,1,0), LVecBase4(1,1,1,1), blendType = 'easeIn')

        sequence = Sequence(effetFadeIn,delai,effetFadeOut)
        sequence.start()

    def displayHelp(self,mustShow):
        self.textNodePath.show() if mustShow else self.textNodePath.hide()

    def createHelpText(self):
        #TODO: touches sont dupliquées dans le inputManager et ici. On doit centraliser
        message = """Contrôle\n
        Contrôle avec la souris: F2\n
        ----Joueur 1----\n
        Bouger: wasd\n
        Tirer arme principale: v\n
        Tirer arme secondaire: b\n
        Détonation des balles: b\n
        \n
        ----Joueur 2----\n
        Bouger: flèches\n
        Tirer arme principale: NumPad-1\n
        Tirer arme secondaire: NumPad-2\n
        Détonation des balles: NumPad-3\n\n
        """

        text = TextNode('Aide')
        text.setText(message)
        self.textNodePath = aspect2d.attachNewNode(text)
        self.textNodePath.setScale(0.055)
        self.textNodePath.setColorScale(LVecBase4(1,1,1,1))
        text.setShadow(0.05, 0.05)
        text.setShadowColor(0, 0, 0, 1)
        text.setTextColor(0.01, 0.2, 0.1, 1)
        text.setAlign(TextNode.ALeft)
        self.textNodePath.setPos(Vec3(-1.65,0,0.65))