# -*- coding: utf-8 -*-
from tkinter import *
from tkinter import messagebox
from tkinter import tix
import tkinter.ttk as ttk
from PIL import Image,ImageDraw, ImageTk
import os,os.path
import random
import math
from helper import Helper as hlp
from orion_empire_modele import *
from numpy import column_stack
from _overlapped import NULL
import time


class Vue():
    def __init__(self,parent,ip,nom,largeur=900,hauteur=730):
        self.root=Tk()
        self.root.title(os.path.basename(sys.argv[0]))
        self.root.protocol("WM_DELETE_WINDOW", self.fermerfenetre)
        #self.root.minsize(largeur, hauteur)
        self.parent=parent
        self.modele=None
        self.nom=None
        self.largeur=largeur
        self.hauteur=hauteur
        self.images={}
        self.modes={}
        self.modecourant=None
        self.mode = ""
        self.res_Var = {
            'bois': IntVar(value=0),
            'or':IntVar(value=0),
            'mineraux':IntVar(value=0),
            'petrole':IntVar(value=0),
            'pierre':IntVar(value=0),
            'nourriture':IntVar(value=0),
            'energie':IntVar(value=0),
            'connaissance':IntVar(value=0),
            'credit':IntVar(value=0) }
        self.cadreactif=None
        self.creercadres(ip,nom)
        self.changecadre(self.cadresplash)
        
    def changemode(self,cadre):
        if self.modecourant:
            self.modecourant.pack_forget()
        self.modecourant=cadre
        self.modecourant.pack(expand=1,fill=BOTH)            

    def changecadre(self,cadre,etend=0):
        if self.cadreactif:
            self.cadreactif.pack_forget()
        self.cadreactif=cadre
        if etend:
            self.cadreactif.pack(expand=1,fill=BOTH)
        else:
            self.cadreactif.pack()
    
    def creercadres(self,ip,nom):
        self.creercadreBas()
        self.creercadresplash(ip, nom, self.largeur, self.hauteur)
        self.creercadrelobby()
        self.cadrejeu=Frame(self.root,bg="blue")
        self.modecourant=None
        
        
    def creercadreBas(self):
        #Le gros cadre
        self.nom=self.parent.monnom

        self.cadreBas=Frame(self.root, height=100)
        self.cadreBas.pack_propagate(0)
        
        #Chat
        self.cadreChat=Frame(self.cadreBas,highlightbackground="Black", highlightcolor="Black", highlightthickness=2)
        #self.cadreChat.pack(side=LEFT, fill=Y)
        self.cadreChat.grid(row=0, column=0, sticky="nsew")
        
        Label(self.cadreChat, text="Log",bg="cyan2").pack(fill=X)
        
            #liste des destinataires
        self.comboboxListeChat=ttk.Combobox(self.cadreChat)
        self.comboboxListeChat['values'] = "Tous"
        self.comboboxListeChat.current(0)
        self.comboboxListeChat.pack(fill=X) 
        
            #tous les messages
        
        
        self.listeChat=Listbox(self.cadreChat)
        self.listeChat.pack(fill=BOTH, expand=1)
        
        #scrollbar = Scrollbar(self.listeChat)
        #scrollbar.pack(side=RIGHT, fill=Y)
        
        #self.listeChat.config(yscrollcommand=scrollbar.set)
        #scrollbar.config(command=self.listeChat.yview)
        
            #la ou on ecrit le message
        self.entryChat = Entry(self.cadreChat, width=30)
        self.entryChat.bind("<Return>", self.envoyeMessage)
        self.entryChat.pack(fill=X) 
        
        
        
        #Marche Public
            
            #init vars
        self.vTextfieldMarche = ""
        self.actionMarche = "acheter"
        self.nbsRessourceMarche = self.vTextfieldMarche
        
            #init frame
        self.cadreMarche=Frame(self.cadreBas,highlightbackground="Black", highlightcolor="Black", highlightthickness=2)
        #self.cadreMarche.pack(side=LEFT, fill=Y)
        self.cadreMarche.grid(row=0, column=1, sticky="nsew")
        
        Label(self.cadreMarche, text="Marché public",bg="cyan2").pack(fill=X)
        
            #bouton de l'action a faire
        self.cadreActions=Frame(self.cadreMarche)
        self.cadreActions.pack(fill=X)
        
        vChoixMarche = StringVar()
        self.radioAcheter = Radiobutton(self.cadreActions,indicatoron=0, text="acheter", variable=vChoixMarche, value="acheter", command=lambda t="acheter": self.choisirActionMarche(t)).grid(row=0, column=0, sticky="nsew")
        self.radioVendre = Radiobutton(self.cadreActions,indicatoron=0, text="vendre", variable=vChoixMarche, value="vendre", command=lambda t="vendre": self.choisirActionMarche(t)).grid(row=0, column=1, sticky="nsew")
        self.cadreActions.grid_columnconfigure(0, weight=1, uniform="group1")
        self.cadreActions.grid_columnconfigure(1, weight=1, uniform="group1")
        self.cadreActions.grid_rowconfigure(0, weight=1)
        #self.radioAcheter.invoke()
        
            #textfield ou on met le nombre
        self.textFieldMarche = Entry(self.cadreMarche, textvariable=self.vTextfieldMarche)
        self.textFieldMarche.insert(0, "0")
        self.textFieldMarche.bind("<KeyRelease>", self.calculerMarche)
        self.textFieldMarche.pack(fill=X)
        
            #dropdown pour chosir ressource de la transaction
        self.menuMarcheRessources=ttk.Combobox(self.cadreMarche)
        self.menuMarcheRessources['values'] = ('or','bois','mineraux','petrole','pierre','nourriture','energie')
        self.menuMarcheRessources.current(0)
        self.menuMarcheRessources.bind("<<ComboboxSelected>>", self.choisirResMarche)
        self.menuMarcheRessources.pack(fill=X)
            #set la ressource par default
        self.nomRessource = self.menuMarcheRessources.get()
        
            #label pour information sur la transaction
        self.labelInfoMarche = Label(self.cadreMarche, text="info avant d'acheter")
        self.labelInfoMarche.pack(fill=BOTH, expand=1)
        
            #confirmaer la transaction
        self.boutonAcheterMarche = Button(self.cadreMarche, text="Accepter", command=self.transactionMarche).pack(fill=X)
        
        self.creercadreRessources()
        
        #Pack tous le bas
        self.cadreBas.grid_columnconfigure(0, weight=3, uniform="groupBAS")
        self.cadreBas.grid_columnconfigure(1, weight=2, uniform="groupBAS")

        self.cadreBas.grid_columnconfigure(2, minsize=100, uniform="groupBAS")

        self.cadreBas.grid_rowconfigure(0, weight=1)
    
    def creercadreRessources(self):
        

        self.cadreressource=Frame(self.cadreBas, height=200, bg="gray20", highlightbackground="Black", highlightcolor="Black", highlightthickness=2)

        self.cadreressource.columnconfigure(0,weight=1)
        self.cadreressource.grid(row=0, column=2, sticky="nsew")
        #self.cadreressource.grid_columnconfigure(0, weight=1)
        #self.cadreressource.grid_columnconfigure(1, weight=1)
        
        Label(self.cadreressource, text="Ressources", bg="cyan2", font=("Helvetica", 13)).pack(side=TOP, fill=X)

        self.cadreRessourceInfo=Frame(self.cadreressource, height=200, bg="gray20")

        self.cadreRessourceInfo.pack(fill=BOTH)
        self.cadreRessourceInfo.grid_columnconfigure(0, weight=1)
        self.cadreRessourceInfo.grid_columnconfigure(1, weight=1)
        #RESSOURCE DISPO

        Label(self.cadreRessourceInfo, text="Bois :", bg="gray20",fg="cyan2", width=10, justify=LEFT, anchor="w").grid(column=0,row=1, sticky=W)

        self.labelBois=Label(self.cadreRessourceInfo, textvariable=self.res_Var['bois'], bg="gray20" ,fg="white", width=15, justify=LEFT, anchor="w")
        self.labelBois.grid(column=1,row=1, sticky=W)
        
        Label(self.cadreRessourceInfo, text="Or :", bg="gray11",fg="cyan2", width=10, justify=LEFT, anchor="w").grid(column=0,row=2, sticky=W)
        self.labeloR=Label(self.cadreRessourceInfo, textvariable=self.res_Var['or'], bg="gray11" ,fg="white", width=15, justify=LEFT, anchor="w")
        self.labeloR.grid(column=1,row=2, sticky=W)
        
        Label(self.cadreRessourceInfo, text="Mineraux :", bg="gray20",fg="cyan2", width=10, justify=LEFT, anchor="w").grid(column=0,row=3, sticky=W)
        self.labelMineraux=Label(self.cadreRessourceInfo, textvariable=self.res_Var['mineraux'], bg="gray20" ,fg="white", width=15, justify=LEFT, anchor="w")
        self.labelMineraux.grid(column=1,row=3, sticky=W)
        
        #Label(self.cadreRessourceInfo, text="Pierre :", bg="gray11",fg="cyan2", width=10, justify=LEFT, anchor="w").grid(column=0,row=4, sticky=W)
        #self.labelPierre=Label(self.cadreRessourceInfo, textvariable=self.res_Var['pierre'], bg="gray11" ,fg="white", width=15, justify=LEFT, anchor="w")
        #self.labelPierre.grid(column=1,row=4, sticky=W)
        
        #Label(self.cadreRessourceInfo, text="Petrole :", bg="gray20",fg="cyan2", width=10, justify=LEFT, anchor="w").grid(column=0,row=5, sticky=W)
        #self.labelPetrole=Label(self.cadreRessourceInfo, textvariable=self.res_Var['petrole'], bg="gray20" ,fg="white", width=15, justify=LEFT, anchor="w")
        #self.labelPetrole.grid(column=1,row=5, sticky=W)
        
        Label(self.cadreRessourceInfo, text="Energie :", bg="gray11",fg="cyan2", width=10, justify=LEFT, anchor="w").grid(column=0,row=6, sticky=W)
        self.labelEnergie=Label(self.cadreRessourceInfo, textvariable=self.res_Var['energie'], bg="gray11" ,fg="white", width=15, justify=LEFT, anchor="w")
        self.labelEnergie.grid(column=1,row=6, sticky=W)
        
        Label(self.cadreRessourceInfo, text="Food :", bg="gray20",fg="cyan2", width=10, justify=LEFT, anchor="w").grid(column=0,row=7, sticky=W)
        self.labelNourriture=Label(self.cadreRessourceInfo, textvariable=self.res_Var['nourriture'], bg="gray20" ,fg="white", width=15, justify=LEFT, anchor="w")
        self.labelNourriture.grid(column=1,row=7, sticky=W)
        
        Label(self.cadreRessourceInfo, text="Knowledge :", bg="gray11",fg="cyan2", width=10, justify=LEFT, anchor="w").grid(column=0,row=8, sticky=W)
        self.labelConnaissance=Label(self.cadreRessourceInfo, textvariable=self.res_Var['connaissance'], bg="gray11" ,fg="white", width=15, justify=LEFT, anchor="w")
        self.labelConnaissance.grid(column=1,row=8, sticky=W)
        
        Label(self.cadreRessourceInfo, text="Credit :", bg="gray20",fg="cyan2", width=10, justify=LEFT, anchor="w").grid(column=0,row=9, sticky=W)
        self.labelCredit=Label(self.cadreRessourceInfo, textvariable=self.res_Var['credit'], bg="gray20" ,fg="white", width=15, justify=LEFT, anchor="w")
        self.labelCredit.grid(column=1,row=9, sticky=W)
        
        Label(self.cadreRessourceInfo, text="Production:", bg="gray11",fg="cyan2", width=10, justify=LEFT, anchor="w").grid(column=0,row=10, sticky=W)

        self.sliderNourriture = Scale(self.cadreRessourceInfo, from_=0, to=100, orient=HORIZONTAL, bg="gray", cursor="trek")
        self.sliderNourriture.grid(column=1,row=10, sticky=W)
        

    def updateListJoueurs(self):
        self.comboboxListeChat['values'] = self.parent.listerjoueurs()
    
    def updateInfoJoueur(self):
        joueur = self.parent.getJoueur(self.nom)
        if joueur:
            self.res_Var['bois'].set(math.ceil(joueur.ressources['bois']))
            self.res_Var['or'].set(math.ceil(joueur.ressources['or']))
            self.res_Var['mineraux'].set(math.ceil(joueur.ressources['mineraux']))
            self.res_Var['petrole'].set(math.ceil(joueur.ressources['petrole']))
            self.res_Var['energie'].set(math.ceil(joueur.ressources['energie']))
            self.res_Var['pierre'].set(math.ceil(joueur.ressources['pierre']))
            self.res_Var['connaissance'].set(math.ceil(joueur.ressources['connaissance']))
            self.res_Var['credit'].set(math.ceil(joueur.ressources['credit']))
            self.res_Var['nourriture'].set(math.ceil(joueur.ressources['nourriture']))
               
    def nouveauMessageChat(self, txt):        
        if self.nom == txt[0]:  #si message prive a moi
            self.listeChat.insert(END, "De "+txt[1]+" : "+txt[2])
        elif txt[0] == 'Tous':  #si message envoye a tous
            if txt[1] == self.parent.monnom:
                self.listeChat.insert(END, "Moi : "+txt[2])
            else:
                self.listeChat.insert(END, txt[1]+" : "+txt[2])
        elif txt[1] == self.parent.monnom:  #si j'ai envoye le message prive
            self.listeChat.insert(END, "À "+txt[0]+" : "+txt[2])
        self.listeChat.yview(END)
        
    def envoyerAlerte(self,txt):
        #txt = [dequi , message]
        self.listeChat.insert(END, txt[0]+" : "+txt[1])
    
    def envoyeMessage(self, evt):
        txt=self.entryChat.get()
        aQui=self.comboboxListeChat.get()
        if txt:
            self.entryChat.delete(0, END)
            self.parent.nouveauMessageChat([aQui,self.parent.monnom,txt])

    def choisirActionMarche(self, StringAction):
        self.actionMarche = StringAction
        self.calculerMarche(StringAction)
    
    def choisirResMarche(self,evt):
        print("event")
        print(evt)
        self.nomRessource = self.menuMarcheRessources.get()
        self.calculerMarche(evt)

    def afficherMarche(self, prixTot):
        StringInfo = self.actionMarche + " " + self.nbsRessourceMarche + " " + self.nomRessource + " pour " + str(prixTot) + " crédits"
        self.labelInfoMarche.config(text=StringInfo)
    
    def calculerMarche(self,evt):
        self.nbsRessourceMarche = self.textFieldMarche.get()
        if self.nbsRessourceMarche == "": self.nbsRessourceMarche = "0"
        prixUnitaire = self.parent.getPrixRessources(self.nomRessource)
        self.ratio = self.parent.getRatioRessource()
        
        self.prixTotal = 0
        
        try:
            if self.actionMarche ==  "acheter":
                self.prixTotal = prixUnitaire*int(self.nbsRessourceMarche)  
            elif self.actionMarche ==  "vendre":
                self.prixTotal = prixUnitaire*int(self.nbsRessourceMarche)*self.ratio
        except ValueError:
            pass
        
        print("prix unitaire: " + str(prixUnitaire))
        print("prix total: " + str(self.prixTotal))
        print(self.ratio)
        self.afficherMarche(self.prixTotal)
    
    def transactionMarche(self):
        if self.actionMarche == "acheter":
            self.acheterMarche()
        elif self.actionMarche == "vendre":
            self.vendreMarche()
    
    def acheterMarche(self):
        #self.calculerMarche(evt)
        try:
            self.parent.acheterResources(self.nomRessource, int(self.nbsRessourceMarche), self.parent.modele.joueurs[self.parent.monnom])
            self.envoyerAlerte(["Marche","Merci de votre achat"])
        except ValueError:
            print("Action IMPOSSIBLE!")
        
    def vendreMarche(self):
        #self.calculerMarche()
        self.parent.vendreResources(self.nomRessource, int(self.nbsRessourceMarche), self.parent.modele.joueurs[self.parent.monnom])
        self.envoyerAlerte(["Marche","Merci d'avoir fait affaire avec nous"])
        
    def creercadresplash(self,ip,nom, largeur, hauteur):
        self.cadresplash=Frame(self.root)
        self.canevasplash=Canvas(self.cadresplash,width=600, height=400,bg="black")
        self.canevasplash.pack()
        self.nomsplash=Entry(font=("Helvetica", 13), justify=CENTER)
        self.nomsplash.insert(0, nom)
        self.ipsplash=Entry(font=("Helvetica", 13), justify=CENTER)
        self.ipsplash.insert(0, ip)
        labip=Label(text=ip,bg="red",borderwidth=0,relief=RIDGE)
        labadresse=Label(text="Adresse IP : ",fg="cyan2",font=("Helvetica", 13),bg="gray20",borderwidth=0,relief=RIDGE)
        labnom=Label(text="Nom : ",fg="cyan2",font=("Helvetica", 13),bg="gray20",borderwidth=0,relief=RIDGE) 
        labbg=Label(bg="gray",borderwidth=2,relief=RIDGE)       
        
        btncreerpartie=Button(text="Creer partie",fg="cyan2", cursor="trek", font=("Helvetica", 13),bg="gray20",command=self.creerpartie)
        btnconnecterpartie=Button(text="Connecter partie",fg="cyan2",cursor="trek",font=("Helvetica", 13),bg="gray20",command=self.connecterpartie)
        #Ligne Adresse IP
        self.canevasplash.create_window(100,200,window=labadresse,width=100,height=30)
        self.canevasplash.create_window(200,200,window=self.ipsplash,width=100,height=30)
        #Ligne Nom
        self.canevasplash.create_window(100,250,window=labnom,width=100,height=30)
        self.canevasplash.create_window(200,250,window=self.nomsplash,width=100,height=30)
        
        self.canevasplash.create_window(150,300,window=btncreerpartie,width=200,height=50)
        self.canevasplash.create_window(150,350,window=btnconnecterpartie,width=200,height=50)
        
        self.AnimationGif = animerGif(self, 60, 2, 0, 0, NW, 'images/background/spaceship3.gif')
        self.AnimationGif.attributeCanvas(self.canevasplash)
        self.AnimationGif.animeMoi()

    def creercadrelobby(self):
        self.cadrelobby=Frame(self.root)
        self.canevaslobby=Canvas(self.cadrelobby,width=640,height=420,bg="lightblue")
        self.canevaslobby.pack()
        
        self.listelobby=Listbox(bg="cyan2",borderwidth=0,relief=RIDGE)
        self.diametre=Entry(font=("Helvetica", 11))
        self.diametre.insert(0, 5)
        self.densitestellaire=Entry(font=("Helvetica", 11))
        self.densitestellaire.insert(0, 2)
        self.qteIA=Entry(font=("Helvetica", 11))
        self.qteIA.insert(0, 0)
        self.lblDiametre=Label(fg="cyan2",bg="gray20",text="Diametre en annee lumiere : ", font=("Helvetica", 11))
        self.lblDensite=Label(fg="cyan2",bg="gray20",text="Densité stellaire : ", font=("Helvetica", 11))
        self.lblIA=Label(fg="cyan2",bg="gray20",text="Nb d'IA : ",font=("Helvetica", 11))
        self.btnlancerpartie=Button(text="Lancer partie",fg="cyan2",cursor="trek",font=("Arial", 15),bg="gray20",command=self.lancerpartie,state=DISABLED)
        self.canevaslobby.create_window(460,240,window=self.listelobby,width=150,height=350)
        self.canevaslobby.create_window(270,200,window=self.diametre,width=100,height=30)
        self.canevaslobby.create_window(120,200,window=self.lblDiametre,width=190,height=30)
        
        self.canevaslobby.create_window(270,250,window=self.densitestellaire,width=100,height=30)
        self.canevaslobby.create_window(150,250,window=self.lblDensite,height=30)
        
        self.canevaslobby.create_window(270,300,window=self.qteIA,width=100,height=30)
        self.canevaslobby.create_window(170,300,window=self.lblIA,height=30)
        
        self.canevaslobby.create_window(220,370,window=self.btnlancerpartie,width=200,height=60)


    def voirgalaxie(self):
        # A FAIRE comme pour voirsysteme et voirplanete, tester si on a deja la vuegalaxie
        #         sinon si on la cree en centrant la vue sur le systeme d'ou on vient
        s=self.modes["galaxie"]
        self.changemode(s)
        self.mode = "vueGal" 
       
    def voirsysteme(self,systeme=None):
        if systeme:
            sid=systeme.id
            if sid in self.modes["systemes"].keys():
                s=self.modes["systemes"][sid]
            else:
                s=VueSysteme(self)
                self.modes["systemes"][sid]=s
                s.initsysteme(systeme)
            self.changemode(s)
            self.mode = "vueSys"
        
    def voirplanete(self,maselection=None):
        s=self.modes["planetes"]
        
        if maselection:
            sysid=maselection[5]
            planeid=maselection[2]
            if planeid in self.modes["planetes"].keys():
                s=self.modes["planetes"][planeid]
            else:
                s=VuePlanete(self,sysid,planeid)
                self.modes["planetes"][planeid]=s
                s.initplanete(sysid,planeid)
            self.changemode(s)
            self.mode = "vuePla"
        else:
            print("aucune planete selectionnee pour atterrissage")
        
    def creerpartie(self):
        nom=self.nomsplash.get()
        ip=self.ipsplash.get()
        if nom and ip:

            self.parent.creerpartie()
            self.btnlancerpartie.config(state=NORMAL)
            self.connecterpartie()
          
    def connecterpartie(self):
        nom=self.nomsplash.get()
        ip=self.ipsplash.get()
        
        if nom and ip:
            rep=self.parent.inscrirejoueur()
            if rep[1]=="Erreur de nom":
                messagebox.showwarning("Warning",rep[1])
            else:
                self.AnimationGif.attributeCanvas(self.canevaslobby)
                self.changecadre(self.cadrelobby)
                self.AnimationGif.animeMoi()
                self.parent.boucleattente()
            
    def lancerpartie(self):
        diametre=self.diametre.get()
        densitestellaire=self.densitestellaire.get()
        qteIA=self.qteIA.get()  # IA
        if diametre :
            diametre=float(diametre)
        else:
            diametre=None
        if densitestellaire :
            densitestellaire=float(densitestellaire)
        else:
            densitestellaire=None
        self.parent.lancerpartie(diametre,densitestellaire,qteIA)  #IA
        
    def affichelisteparticipants(self,lj):
        self.listelobby.delete(0,END)
        for i in lj:
            self.listelobby.insert(END,i)

    def afficherinitpartie(self,mod):
        self.root.minsize(self.largeur, self.hauteur)
        self.nom=self.parent.monnom
        self.modele=mod
        joueur = None
        for j in self.modele.joueurs:
            if self.modele.joueurs[j].nom == self.nom:
                joueur = self.modele.joueurs[j]
                print(joueur.id)
        
        self.modes["galaxie"]=VueGalaxie(self)
        self.modes["systemes"]={}
        self.modes["planetes"]={}
        self.modes["perspective"] = Perspective(self)
        
        g=self.modes["galaxie"]
        g.labid.config(text=self.nom)
        #g.labid.config(fg=mod.joueurs[self.nom].couleur)
        
        g.chargeimages()
        g.afficherdecor() #pourrait etre remplace par une image fait avec PIL -> moins d'objets
        self.changecadre(self.cadrejeu,1)
        self.changemode(g)

        print("INIT ORIGINE !!!!!!!! "+str(joueur)+" "+str(joueur.origine[0].id)+" "+str(joueur.origine[1].id))
        self.parent.atterrirdestination(joueur, joueur.origine[0].id, joueur.origine[1].id)
        
        self.cadreBas.pack(side=BOTTOM, fill=X)

        
 
    def reafficherModeleStatique(self,planeteid,x,y):
        for i in self.modes["planetes"].keys():
            if i == planeteid:
                self.modes["planetes"][i].refresh(x,y)
                self.modes["planetes"][i].afficherminimap()
                

    def afficherInfra(self, joueur,systemeid,planeteid,x,y, type_infra, id_infra):
        print("afficherInfra")
        for i in self.modes["planetes"].keys():
            if i == planeteid:
                im=self.modes["planetes"][i].images[type_infra]
                self.modes["planetes"][i].canevas.create_image(x,y,image=im, tags=(type_infra,id_infra, "infra", x, y))
                self.modes["planetes"][i].afficherminimap()
                
    

    def afficherville(self,joueur,systemeid,planeteid,villeid,x,y):
        print("afficherville")
        for i in self.modes["planetes"].keys():
            if i == planeteid:
                im=self.modes["planetes"][i].images["ville"]
                self.modes["planetes"][i].canevas.create_image(x,y,image=im, tags=("ville", villeid, "infra", x, y))
                self.modes["planetes"][i].afficherminimap()
        
                
                
    def fermerfenetre(self):
        # Ici, on pourrait mettre des actions a faire avant de fermer (sauvegarder, avertir etc)
        self.parent.fermefenetre()
        
class Perspective(Frame):
    def __init__(self,parent):
        Frame.__init__(self,parent.cadrejeu)
        self.parent=parent
        self.modele=None
        self.DistUnit=None
        self.cadreetatactif=None
        self.images={}
       
        self.cadrevue=Frame(self,width=400,height=400, bg="lightgreen")
        self.cadrevue.pack(side=LEFT,expand=1,fill=BOTH)
        
        self.cadreinfo=Frame(self,width=200,height=200,bg="darkgrey")
        self.cadreinfo.pack(side=LEFT,fill=Y)
        self.cadreinfo.pack_propagate(0)

        self.cadreetat=Frame(self.cadreinfo,bg="grey20")

        self.cadreetat.pack(fill=X)
        
        self.scrollX=Scrollbar(self.cadrevue,orient=HORIZONTAL)
        self.scrollY=Scrollbar(self.cadrevue)
        self.canevas=Canvas(self.cadrevue,width=640,height=480,bg="black",
                             xscrollcommand=self.scrollX.set,
                             yscrollcommand=self.scrollY.set)
        
       
        self.cadrevide = Frame(self.cadreinfo,width=0,height=0)
        
        self.scrollX.config(command=self.canevas.xview)
        self.scrollY.config(command=self.canevas.yview)
        self.canevas.grid(column=0,row=0,sticky=N+E+W+S)
        self.cadrevue.columnconfigure(0,weight=1)
        self.cadrevue.rowconfigure(0,weight=1)
        self.scrollX.grid(column=0,row=1,sticky=E+W)
        self.scrollY.grid(column=1,row=0,sticky=N+S)
        
        self.labid=Label(self.cadreetat,text=self.parent.nom,height=2, bg = self.parent.parent.modele.joueurs[self.parent.nom].couleur
                         ,fg = "white")
        self.labid.pack(fill=X)

        
        self.cadreetataction=Frame(self.cadreetat,bg="grey20") #TOSHA
        self.cadreetatmsg=Frame(self.cadreetat,width=200,height=200,bg="grey20")
        
      
        
        self.cadreminimap=Frame(self.cadreinfo,width=200,height=200,bg="grey20")
        self.cadreminimap.pack(side=BOTTOM)
        self.minimap=Canvas(self.cadreminimap,width=200,height=200,bg="grey11")
        self.minimap.bind("<Button>",self.cliquerminimap)
        self.minimap.pack()
        
        self.canevas.bind("<ButtonPress-1>",self.cliquervue)
        #drag dans le canevas        
        #self.canevas.bind("<Control-ButtonPress-1 >", self.scrollStart)
        #self.canevas.bind("<Control-B1-Motion>", self.scrollMove)
        self.canevas.bind("<ButtonPress-3>", self.scrollStart)
        self.canevas.bind("<B3-Motion>", self.scrollMove)
        self.canevas.bind("<ButtonPress-2>", self.destinationV)
        
        #windows scroll
        self.canevas.bind("<MouseWheel>",self.zoom)

        #windows zoom
        self.zooming = 0
        self.minzoom = -100
        self.maxzoom = 100

    def refreshPerspective(self):
        #print("hohoho")
        self.parent.root.update()

    def zoom(self,event):        
        zoomsteps=10
        if self.parent.mode == "vuePla": return        
        if (event.delta+zoomsteps > 0):            
            if(self.zooming < self.maxzoom):                
                self.DistUnit+=zoomsteps
                self.zooming += zoomsteps
                self.canevas.delete("all")
                
                self.refresh(event.x,event.y)
        elif (event.delta < 0):
            if(self.zooming-zoomsteps > self.minzoom):
                self.DistUnit-=zoomsteps
                self.zooming -= zoomsteps
                self.canevas.delete("all")
                
                self.refresh(event.x,event.y) 
    

    def refresh(self,x,y):
        pass
        
    def scrollStart(self, event):
        self.canevas.scan_mark(event.x, event.y)
        
    def scrollMove(self,event):
        self.canevas.scan_dragto(event.x, event.y, gain=1)
        
    def destinationV(self,event):
        pass
        
    def cliquervue(self,evt):
        pass
    
    def cliquerminimap(self,evt):
        pass
    
    def changecadreetat(self,cadre):
        if self.cadreetatactif:
            self.cadreetatactif.config(height=0)
            self.cadreetatactif.forget()
            self.cadreetatactif=self.cadrevide
            self.cadreetatactif.pack(fill=X)
        if cadre != None:           
            self.cadreetatactif=cadre
            self.cadreetatactif.pack(fill=X)
        
class VueGalaxie(Perspective):
    def __init__(self,parent):       
        Perspective.__init__(self,parent)
        self.modele=self.parent.modele
        self.maselection=None
        self.DistUnit=200       #grandeur de la carte de jeu de la galaxie
        self.MM = False          
        

        self.labid.bind("<Button>",self.identifierplanetemere)
        self.menuVaisseau = Menubutton(self.cadreetataction, text="Choisir un vaisseau" , width=18, bg="gray40")
        self.menuVaisseau.menu=Menu(self.menuVaisseau ,tearoff = 0)
        self.menuVaisseau["menu"] = self.menuVaisseau.menu
        self.menuVaisseau.menu.add_command(label='Sprinteur', command=lambda t="sprinteur": self.creervaisseau(t))
        self.menuVaisseau.menu.add_command(label='Chasseur', command=lambda t="chasseur": self.creervaisseau(t))  
        self.menuVaisseau.menu.add_command(label='Éclaireur', command=lambda t="eclaireur": self.creervaisseau(t))          
        self.menuVaisseau.pack()
        ######### MODIFICATION FIN
        
    def refresh(self,x,y):
        self.afficherdecor()  
        
    def destinationV(self,event):
        self.changecadreetat(None)
        t=self.canevas.gettags("current")
        if t and t[0]!="current":
            if self.maselection and self.maselection[1]=="vaisseauinterstellaire":
                print("bouge!")
                self.parent.parent.ciblerdestination(self.maselection[2],t[2])
        else:
            print("Region inconnue")
            self.maselection=None
    
    def cliquervue(self,evt):
        self.changecadreetat(None)
        t=self.canevas.gettags("current")
        if t and t[0]!="current":
            #CLIQUER SUR UN VAISSEAU ###########################################
            if "vaisseauinterstellaire" in t:
                print("IN VAISSEAUINTERSTELLAIRE",t)
                self.maselection=[t[0],t[1],t[2]]
                self.montrevaisseauxselection(t[2])
                
                #self.montrevaisseauxselection()
            #CLIQUER SUR UNE ETOILE #############################################
            elif "systeme" in t:
                print("IN SYSTEME",t)
                if self.parent.nom in t: 
                    print("MINE")           
                    #Changer Selection        
                    self.maselection=[self.parent.nom,t[1],t[2]]
                    
                elif len(t) == 7:    
                    print("NOT MINE",t)
                    self.maselection=[t[5],t[1],t[2]]
                else:
                    print("NOBODY'S")
                    self.maselection=[t[0],t[1],t[2]]
                    
                #Afficher info planete
                self.montresystemeselection(t[2])
                   
            #CLIQUER SUR UN PULSAR #############################################
            elif "pulsar" in t:
                print("IN PULSAR",t)
                self.maselection=[t[0],t[1],t[2]]
                
                
            
            else:
                print("Objet inconnu",t)
        else:
            print("Region inconnue")
            self.maselection=None         
        
    def voirsysteme(self,systeme=None):
        if systeme==None:
            if self.maselection and self.maselection[0]==self.parent.nom and self.maselection[1]=="systeme":
                sid=self.maselection[2]
                for i in self.modele.joueurs[self.parent.nom].systemesvisites:
                    if i.id==sid:
                        s=i
                        break
                
                self.parent.parent.visitersysteme(self.maselection[2],sid)
                self.parent.voirsysteme(s) #normalement devrait pas planter
        else:                
            sid=systeme.id
            for i in self.modele.joueurs[self.parent.nom].systemesvisites:
                if i.id==sid:
                    s=i
                    break
            # NOTE passer par le serveur est-il requis ????????????
            self.parent.parent.visitersysteme(sid)
            self.parent.voirsysteme(s) #normalement devrait pas planter
            
    def chargeimages(self):
        im = Image.open("./images/chasseur.png")
        self.images["chasseur"] = ImageTk.PhotoImage(im)
        
    def afficherdecor(self):        
        self.largeur=int(self.DistUnit*self.modele.diametre)        
        self.hauteur=self.largeur        
        self.canevas.config(scrollregion=(0,0,self.largeur,self.hauteur))
        self.creerimagefond()
        self.affichermodelestatique()
        if self.MM == False:
            self.afficherminimap()
            self.MM = True

    def creerimagefond(self): #NOTE - au lieu de la creer a chaque fois on aurait pu utiliser une meme image de fond cree avec PIL
        #Si il n'y a pas d'image, generer
        if("fond0" not in self.images):
            print("PAS DE FOND, GENERER FOND")
            #Verifier si il y deja une image, l'effacer
            imgfondpil = Image.new("RGBA", (self.largeur,self.hauteur),"black")
            draw = ImageDraw.Draw(imgfondpil) 
            for i in range(self.largeur*2):
                x=random.randrange(self.largeur)
                y=random.randrange(self.hauteur)
                #draw.ellipse((x,y,x+1,y+1), fill="white")
                draw.ellipse((x,y,x+0.1,y+0.11), fill="white")
            self.images["fond0"] = ImageTk.PhotoImage(imgfondpil)  
            self.canevas.create_image(self.largeur/2,self.hauteur/2,image=self.images["fond0"])    
                             
            #Generer les differentes etapes de zoom   
            i = 10
            while i <= self.maxzoom:                
                tmpsize = int((self.DistUnit+i)*self.modele.diametre)
                retmp = imgfondpil.resize((tmpsize,tmpsize))
                self.images["fond"+str(i)] = ImageTk.PhotoImage(retmp)
                i+=10
            
            i = -10
            while i >= self.minzoom:                
                tmpsize = int((self.DistUnit+i)*self.modele.diametre)
                retmp = imgfondpil.resize((tmpsize,tmpsize))
                self.images["fond"+str(i)] = ImageTk.PhotoImage(retmp) 
                i-=10    
        
        #Si il y a deja une image, loader et afficher
        else:       
            #image selon zooming             
            self.canevas.create_image( (self.largeur/2)  , (self.hauteur/2)  ,image=self.images["fond"+str(self.zooming)],anchor=CENTER )
    
    def afficherminimap(self):
        me=200/self.modele.diametre   
        for i in self.modele.joueurscles:            
            couleur=self.modele.joueurs[i].couleur
            m=2
            for j in self.modele.joueurs[i].systemesvisites:                
                #self.canevas.itemconfig(s,fill=couleur)                
                self.minimap.create_oval((j.x*me)-m,(j.y*me)-m,(j.x*me)+m,(j.y*me)+m,fill=couleur,tags=("MiniEtoile"))
            
    def affichermodelestatique(self): 
        mini=self.largeur/200
        e=self.DistUnit
             
        #self.minimap.delete("MiniEtoile") 
        for i in self.modele.systemes:
            #Taille
            t=i.etoile.taille*(self.DistUnit/40)
            if t<3:
                t=3
                
            strTmp = "actual_"+str(i.id)+"_"
            #Si images pas generees, generer -----------------------------
            if (strTmp+"0") not in self.images:
                im=Image.open(i.etoile.image)
                re = im.resize((int(t*2),int(t*2)))                 
                self.images[strTmp+"0"]= ImageTk.PhotoImage(re)
                
                #Creer les differents zooms
                z = 10
                while z <= self.maxzoom:                
                    tmpsize = int( i.etoile.taille*((self.DistUnit+z)/40)    )*2
                    retmp = im.resize((tmpsize,tmpsize))
                    self.images[strTmp+str(z)] = ImageTk.PhotoImage(retmp)
                   
                    z+=10                
                z = -10
                while z >= self.minzoom:                
                    tmpsize = int( i.etoile.taille*((self.DistUnit+z)/40)   )*2
                    retmp = im.resize((tmpsize,tmpsize))
                    self.images[strTmp+str(z)] = ImageTk.PhotoImage(retmp)  
                                    
                    z-=10   
            
             
            self.canevas.create_image( (i.x*e)  , (i.y*e)  ,image=self.images[strTmp+str(self.zooming)],anchor=CENTER,tags=("inconnu","systeme",i.id,str(i.x),str(i.y)) )
            
            for i in self.modele.joueurscles:  
                for j in self.modele.joueurs[i].systemesvisites:
                    s=self.canevas.find_withtag(j.id)
                    self.canevas.addtag_withtag(i, s)                   
            # NOTE pour voir les id des objets systeme, decommentez la ligne suivantes
            #self.canevas.create_text((i.x*e)-t,(i.y*e)-(t*2),text=str(i.id),fill="white")
     
                
    # ************************ FIN DE LA SECTION D'AMORCE DE LA PARTIE
                
    def identifierplanetemere(self,evt): 
        j=self.modele.joueurs[self.parent.nom]
        couleur=j.couleur
        x=j.origine[0].x*self.DistUnit
        y=j.origine[0].y*self.DistUnit
        id=j.origine[0].id
        t=self.DistUnit/10
        self.maselection=[self.parent.nom,"systeme",id]
        self.montresystemeselection(id)
        xx=x/self.largeur
        yy=y/self.hauteur
        ee=self.canevas.winfo_width()
        ii=self.canevas.winfo_height()
        eex=int(ee)/self.largeur/2
        self.canevas.xview(MOVETO, xx-eex)
        eey=int(ii)/self.hauteur/2
        self.canevas.yview(MOVETO, yy-eey)
        
    def creervaisseau(self,type): 
        if self.maselection:
            self.parent.parent.creervaisseau(self.maselection[2],type)
            self.maselection=None
            self.canevas.delete("selecteur")
    
    def creerstation(self):
        print("Creer station EN CONSTRUCTION")
        
    def afficherpartie(self,mod):
        self.canevas.delete("artefact")
        self.canevas.delete("pulsar")
        self.afficherselection()
        
        e=self.DistUnit
        for i in mod.joueurscles:  
            i = mod.joueurs[i]          
            for j in i.vaisseauxinterstellaires:                
                    j.unit = self.DistUnit
                    jx=j.x*e
                    jy=j.y*e                     
                    tailleCercle = j.taille/30 * self.DistUnit
                    #print("COORDS : ",jx,jy,"RATIOS : ", j.ratioX,j.ratioY)                    
                    if j.image:
                        imageActuelle = j.id+"_"+j.image+"_"+str(self.zooming)
                        if imageActuelle not in self.images:
                            print("Nouvelle Image !")
                            im = Image.open(j.image)
                            taille = int(self.DistUnit*j.taille/3)                        
                            im = im.resize( (taille,taille) )
                            #ex = Image.open(j.imageEx+"00"+str(j.exhaust)+".png")
                            self.images[imageActuelle]=ImageTk.PhotoImage(im)
                            #.images[j.id+"Exhaust"]=ImageTk.PhotoImage(ex)
                        self.canevas.create_image( jx, jy , image=self.images[imageActuelle], tags=(j.proprietaire,"vaisseauinterstellaire",j.id,"artefact",int(jx),int(jy)))
                        self.canevas.create_oval(jx-tailleCercle,jy-tailleCercle,jx + tailleCercle ,jy + tailleCercle,fill=i.couleur,width=2,tags=(j.proprietaire,"vaisseauinterstellaire",j.id,"artefact",int(jx),int(jy)))
                                
        for i in mod.pulsars:
            t=i.taille*(self.DistUnit/150)
            self.canevas.create_oval((i.x*e)-t,(i.y*e)-t,(i.x*e)+t,(i.y*e)+t,fill="orchid3",dash=(1,1),
                                                 outline="maroon1",width=2,
                                     tags=("inconnu","pulsar",i.id))
                
    def changerproprietaire(self,prop,couleur,systeme):
        #lp=self.canevas.find_withtag(systeme.id) 
        self.canevas.addtag_withtag(prop,systeme.id)
        
    def changerproprietaire1(self,prop,couleur,systeme): 
        id=str(systeme.id)
        lp=self.canevas.find_withtag(id)
        self.canevas.itemconfig(lp[0],fill=couleur)
        t=(prop,"systeme",id,"systemevisite",str(len(systeme.planetes)),systeme.etoile.type)
        self.canevas.itemconfig(lp[0],tags=t)
               
    def afficherselection(self):
        #Effacer Selecteur
        self.canevas.delete("selecteur")
        if self.maselection!=None and self.maselection[0]!="current":           
            if self.maselection[0] == "inconnu":
                couleur = "green"
            else :
                joueur=self.modele.joueurs[self.maselection[0]]
                couleur = joueur.couleur
            
            e=self.DistUnit
            #CLIQUER SUR UNE ETOILE/SYSTEME ########################################################
            if self.maselection[1]=="systeme":               
                for i in self.modele.systemes:
                    #TROUVER LE SYSTEME CLIQUE
                    if i.id == self.maselection[2]:
                        
                        x=i.x
                        y=i.y
                        t=(int( i.etoile.taille*((self.DistUnit)/40))*1.5)
                        self.canevas.create_oval((x*e)-t,(y*e)-t,(x*e)+t,(y*e)+t,dash=(2,2),
                                                 width=2,
                                                 outline=couleur,
                                                 tags=("select","selecteur"))
            #CLIQUER SUR UN VAISSEAU ###############################################################
            elif self.maselection[1]=="vaisseauinterstellaire":
                for i in joueur.vaisseauxinterstellaires:
                    if i.id == self.maselection[2]:                        
                        x=i.x
                        y=i.y
                        t=int(self.DistUnit*i.taille/2) 
                        self.canevas.create_rectangle((x*e)-t,(y*e)-t,(x*e)+t,(y*e)+t,dash=(2,2),
                                                      outline=couleur,
                                                      width=2,
                                                      tags=("select","selecteur"))
            #CLIQUER SUR PULSAR ####################################################################
            elif self.maselection[1]=="pulsar":               
                for p in self.modele.pulsars:
                    if p.id == self.maselection[2]:                        
                        x = p.x
                        y = p.y
                        t = int(self.DistUnit*p.taille/75)
                        self.canevas.create_oval((x*e)-t,(y*e)-t,(x*e)+t,(y*e)+t,dash=(2,2),
                                                 width=2,
                                                 outline=couleur,
                                                 tags=("select","selecteur"))

    def afficherInfoSysteme(self,systeme):            
        self.cadreetatsysteme = Frame(self.cadreetat,bg="grey20")  
        joueur = self.modele.joueurs[self.parent.nom]  
        for s in self.modele.systemes:
            if systeme == s.id: 
                im = Image.open(s.etoile.image)
                self.PlaImg = ImageTk.PhotoImage(im.resize((180,180)))                
                Label(self.cadreetatsysteme,padx = 10,pady = 20,height=180,width=180,image=self.PlaImg,bg="grey20").pack()
                Label(self.cadreetatsysteme,text="Systeme    :    "+s.id,padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                #Si systeme, deja visite afficher boutton visiter                
                if s in joueur.systemesvisites:
                    Label(self.cadreetatsysteme,text="Planetes    :    "+str(len(s.planetes)),padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                    if s.id == joueur.origine[0].id:                      
                        Label(self.cadreetatsysteme,text="Status       :   Systeme d'origine ",padx = 10,bg="grey20",fg=joueur.couleur,justify=LEFT,anchor=W).pack(fill=X)
                    else:   
                        Label(self.cadreetatsysteme,text="Status       :   Visited " ,padx= 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                    self.btnvuesysteme=Button(self.cadreetatsysteme,text="Voir Systeme",command=self.voirsysteme)
                    self.btnvuesysteme.pack(fill=X)
                else:
                    Label(self.cadreetatsysteme,text="Status       :   Inexplored",padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
        
    def montresystemeselection(self,systeme):
        self.afficherInfoSysteme(systeme)
        self.changecadreetat(self.cadreetatsysteme)
        
    def afficherInfoVaisseau(self,vaisseau):
        self.cadreetatvaisseau = Frame(self.cadreetat,bg="grey20")  
        joueur = self.modele.joueurs[self.parent.nom]  
        for j in self.modele.joueurscles:
            j=self.modele.joueurs[j]
            for v in j.vaisseauxinterstellaires:            
                if vaisseau == v.id: 
                    im = Image.open(v.LargeIcon)
                    self.PlaVai = ImageTk.PhotoImage(im.resize((180,180)))                
                    Label(self.cadreetatvaisseau,padx = 10,pady = 20,height=180,width=180,image=self.PlaVai,bg="grey20").pack()
                    Label(self.cadreetatvaisseau,text="Prorietaire :    "+v.proprietaire, padx = 10,bg="grey20",fg=j.couleur,justify=LEFT,anchor=W).pack(fill=X)
                    Label(self.cadreetatvaisseau,text="Type    :    "+v.__class__.__name__,padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                    #i il nous appartient             
                    if j.nom == joueur.nom:
                        Label(self.cadreetatvaisseau,text="Energie   :    "+str(v.energie)+"/"+str(v.maxenergie),padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                        #CODER RESTE
    def montrevaisseauxselection(self,vaisseau):
        self.afficherInfoVaisseau(vaisseau)
        self.changecadreetat(self.cadreetatvaisseau)
    
    def afficherartefacts(self,joueurs):
        print("ARTEFACTS de ",self.nom)
    
    def cliquerminimap(self,evt):
        x=evt.x
        y=evt.y
        xn=self.largeur/int(self.minimap.winfo_width())
        yn=self.hauteur/int(self.minimap.winfo_height())
        
        ee=self.canevas.winfo_width()
        ii=self.canevas.winfo_height()
        eex=int(ee)/self.largeur/2
        eey=int(ii)/self.hauteur/2
        
        self.canevas.xview(MOVETO, (x*xn/self.largeur)-eex)
        self.canevas.yview(MOVETO, (y*yn/self.hauteur)-eey)
                
class VueSysteme(Perspective):
    def __init__(self,parent):
        Perspective.__init__(self,parent)
        self.modele=self.parent.modele
        
        self.planetes={}
        self.systeme=None
        
        self.maselection=None
        self.generated = False
        self.justrefreshed = False
        
        self.DistUnit=100 # ainsi la terre serait a 100 pixels du soleil et Uranus a 19 Unites Astronomiques       #grandeur systeme
        self.minzoom = -80
        self.maxzoom = 100
        self.ratio = 0
        
        self.lbselectecible=Label(self.cadreetatmsg,text="Choisir cible",bg="darkgrey")
        self.lbselectecible.pack()
        self.changecadreetat(self.cadreetataction)
    
    def refresh(self,x,y):        
        self.initsysteme(self.systeme)
        self.affichermodelestatique(self.systeme,x,y)
        print("LARGEUR: ",self.largeur)        
       
    def voirplanete(self):
        print("SELECTION VOIR PLANETE",self.maselection)
        self.parent.parent.atterrirdestination(self.maselection[0],self.maselection[3],self.maselection[2])

    def voirgalaxie(self):
        self.parent.voirgalaxie()
            
    def initsysteme(self,i):
        self.systeme=i
        
        self.largeur=int(self.DistUnit*(self.systeme.furthest*2))+150 #Trouve la planete la plus Ã©loignÃ©e et change la taille du canvas en fonction + marge 
        self.prop = self.largeur/self.DistUnit        
        self.hauteur=self.largeur        
        self.canevas.config(scrollregion=(0,0,self.largeur,self.hauteur))
        
        self.affichermodelestatique(i)
    
    def affichermodelestatique(self,i,x=None,y=None):
        xl=self.largeur/2
        yl=self.hauteur/2             
        UAmini=200/(self.systeme.furthest*2)-1
        mini=i.etoile.taille*UAmini/2 #Entre 3 et 8
        cEt = i.etoile.couleur        
        
        #Si images pas generees, generer -----------------------------
        filename = "actual_"+str(i.id)+"_VueSystemStar_"        
        if self.generated == False:                       
            self.creerimagefond(filename)
            pass         
        if self.generated == False:           
            self.chargerEtoile(i.etoile,filename)
            self.generated = True
                           
        #Afficher background           
        self.canevas.create_image( xl  , yl  ,image=self.images["fond"],anchor=CENTER,tags=("back") )   
        #AFFICHER ETOILE SUR CANVAS    
        self.canevas.create_image( xl  , yl  ,image=self.images["star_"+str(self.zooming)],anchor=CENTER,tags=("systeme",i.id,"etoile") )
        #AFFICHER ETOILE SUR MINIMAP    
        self.minimap.create_oval(100-mini,100-mini,100+mini,100+mini,dash=(1,2),fill=cEt)
        #AFFICHER ORBITES PLANETES
        for p in i.planetes:        
            xx,yy = hlp.getAngledPoint(math.radians(0), p.distance*self.DistUnit, xl, yl) #ORBITE
            xo = hlp.calcDistance(xl, yl, xx, yy)            #ORBITE
            self.canevas.create_oval( (xl-xo) , (yl-xo) ,( xl+xo) ,(yl+xo) ,dash=(3,5),outline="white") #ORBITE
            #AFFICHER ORBITES SUR MINIMAP      
            xx,yy = hlp.getAngledPoint(math.radians(0), p.distance*UAmini, 100, 100) #ORBITE
            xo = hlp.calcDistance(100, 100, xx, yy)             
            self.minimap.create_oval( (100-xo) , (100-xo) ,( 100+xo) ,(100+xo) ,dash=(1,20),outline="white") #ORBITE
            
        
        # NOTE Il y a un probleme ici je ne parviens pas a centrer l'objet convenablement comme dans la fonction 'identifierplanetemere'
        #if x == None or y == None:
        canl=int(self.canevas.cget("width"))/2
        canh=int(self.canevas.cget("height"))/2
        #else:
        #    canl=x
        #    canh=y
        self.canevas.xview(MOVETO, ((self.largeur/2)-canl)/self.largeur)
        self.canevas.yview(MOVETO, ((self.hauteur/2)-canh)/self.hauteur)
    
    def chargerEtoile(self,s,file):          
        #Charger etoile
        im = Image.open(s.image)          
        
        #Generer les differentes etapes de zoom   
        i = 0
        while i <= self.maxzoom:                
            tmpsize = int(s.taille*int((self.DistUnit+i)/2))*3
            retmp = im.resize((tmpsize,tmpsize))
            self.images["star_"+str(i)] = ImageTk.PhotoImage(retmp)
           
            i+=10
            
        i = -10
        while i > self.minzoom:                
            tmpsize = int(s.taille*int((self.DistUnit+i)/2))*3            
            retmp = im.resize((tmpsize,tmpsize))
            self.images["star_"+str(i)] = ImageTk.PhotoImage(retmp) 
           
            i-=10     
            
    def chargerPlanetes(self,p,nom):
        
        #Ouvrir image
        im = Image.open(p.image)        
                
        #Creer les differents zooms
        z = 0
        while z <= self.maxzoom:                
            tmpsize = int((p.taille*(self.DistUnit+z)*2) *2)
            retmp = im.resize((tmpsize,tmpsize))
            self.images[nom+str(z)] = ImageTk.PhotoImage(retmp)
                   
            z+=10                
        z = -10
        while z > self.minzoom:                
            tmpsize = int((p.taille*(self.DistUnit+z)*2) *2)
            retmp = im.resize((tmpsize,tmpsize))
            self.images[nom+str(z)] = ImageTk.PhotoImage(retmp)  
                                    
            z-=10   
                 
    def creerimagefond(self,filename): 
        #imgbg = Image.open("./images/VueSysteme.gif")  
        debutGen = time.time()  
        maxPossibleZoom = int((self.DistUnit+self.maxzoom)*(self.systeme.furthest*2))+150   
        imgfondpil = Image.new("RGBA", (maxPossibleZoom,maxPossibleZoom),"black")
        draw = ImageDraw.Draw(imgfondpil) 
        for i in range(maxPossibleZoom*2):
            x=random.randrange(maxPossibleZoom)
            y=random.randrange(maxPossibleZoom)            
            draw.ellipse((x,y,x+0.1,y+0.11), fill="yellow") 
        imgfondpil.save("images/cache/"+filename+".png")
        self.images["fond"] = ImageTk.PhotoImage(Image.open("images/cache/"+filename+".png"))
        imgfondpil=None
        
        print("Generer l'image de fond a pris : ",time.time()-debutGen)        
    
    def afficherdecor(self):
        pass
     
    def creervaisseau(self,type): 
       if self.maselection:
        self.parent.parent.creervaisseauS((self.maselection[2],type))
        self.maselection=None
        self.canevas.delete("selecteur")
    
    def destinationV(self,event):
        self.changecadreetat(None)
        self.canevas.delete("select")
        t=self.canevas.gettags("current")
        print("CURRENT DESTINATION : ",t)
        if t and t[0]!="current" and "back" not in t:
            print("DESTINATIONV SUR OBJET")
            if self.maselection and self.maselection[1]=="vaisseauinterplanetaire":                
                if "systeme" in t:
                    self.parent.parent.ciblerdestination(self.maselection[2],(self.largeur/2,self.largeur/2,self.largeur/2,self.largeur/2,"star",t[1]))    
                else:
                    self.parent.parent.ciblerdestination(self.maselection[2],t[2])            
        else:
            if self.maselection and self.maselection[1]=="vaisseauinterplanetaire":
                print("DESTINATIONV SUR VIDE")
                x = self.canevas.canvasx(event.x)
                y = self.canevas.canvasy(event.y)
                #self.canevas.create_oval(x -10,y -10,x +10,y +10,fill="purple")
                self.parent.parent.ciblerdestination(self.maselection[2],(x,y,self.largeur/x,self.largeur/y,"vide"))     
            self.maselection=None
    
    def creerstation(self):
        if self.maselection:
            self.parent.parent.creerstation(self.maselection[2])
            self.maselection=None
            self.canevas.delete("selecteur")
         
    def afficherpartie(self,mod):
        self.canevas.delete("planete")
        self.canevas.delete("artefact")
        self.minimap.delete("miniplane")
        self.afficherselection()
        xl=self.largeur/2
        yl=self.hauteur/2         
        UAmini=200/(self.systeme.furthest*2)-1   
        #AFFICHER LES PLANETES SUR LE CANEVAS         
        for p in self.systeme.planetes:  
            #AFFICHAGE PLANETES ###############################################################            
            strTmp = "actual_"+str(p.id)+"_"
            #Si images pas generees, generer -----------------------------
            if (strTmp+"0") not in self.images:            
                self.chargerPlanetes(p,strTmp)            
           
            if self.parent.nom in p.established:
                bordure = "yellow"
            elif self.parent.nom in p.visiteurs:                
                bordure = "cyan"
            
            else:
                bordure = "red" 
                
            n=int(p.taille*self.DistUnit*2) # Taille de la planete sur le canvas
            x,y=hlp.getAngledPoint(math.radians(p.angle),p.distance*self.DistUnit,xl,yl)  
            p.x,p.y=x,y 
                               
            #Afficher Bordure
            self.canevas.create_oval(x-n,y-n,x+n,y+n,outline=bordure,width=3,tags=(self.systeme.proprietaire,"planete",p.id,"inconnu",self.systeme.id,int(x),int(y)))
            self.canevas.create_image( x  , y  ,image=self.images[strTmp+str(self.zooming)],tags=(self.systeme.proprietaire,"planete",p.id,"inconnu",self.systeme.id,int(x),int(y)))   
            #AFFICHER LES PLANETES SUR LA MINIMAP
            mini=p.taille*3*UAmini # Taille de la planete sur la minimap
            
            if p.type == "Hot":
                couleur = "red"
            elif p.type == "Habitable":
                couleur = "green"
            else:
                couleur = "blue"
            
            x,y=hlp.getAngledPoint(math.radians(p.angle),p.distance*UAmini,100,100)
            self.minimap.create_oval(x-mini,y-mini,x+mini,y+mini,fill=couleur,outline=bordure,tags=("miniplane"))
            
            #AFFICHAGE STATION/PROJECTILES
            if p.station:
                p.station.rangePx = p.station.range * self.DistUnit  
                p.station.x,p.station.y = hlp.getAngledPoint(math.radians(p.station.angle), (p.taille*3.5)*self.DistUnit, p.x, p.y) #ORBITE
                coordP = (p.station.x,p.station.y)                
                #self.canevas.create_rectangle(0,0,coordP[0],coordP[1],outline="yellow",width=2,tags=("artefact"))
                self.canevas.create_oval(p.station.x-(0.1*self.DistUnit),p.station.y-(0.1*self.DistUnit),p.station.x+(0.1*self.DistUnit),p.station.y+(0.1*self.DistUnit),fill=p.station.couleur,tags=("artefact"))
                for t in p.station.tirs:
                    xFin,yFin=hlp.getAngledPoint(math.radians(t.angletrajet),6,t.x,t.y) 
                    self.canevas.create_line(xFin,yFin,t.x,t.y,fill="red",width=3,tags=("projectile","artefact")) 
       
        #AFFICHAGE VAISSEAU ############################################
        e=self.DistUnit
        
        for i in mod.joueurscles:
            i=mod.joueurs[i]
            for j in i.vaisseauxinterplanetaires:
                if j in self.systeme.vaisseaux:
                    j.unit = self.DistUnit
                    jx=j.x
                    jy=j.y 
                    if jx == 0:
                        j.x= j.base.x
                        j.y= j.base.y
                        jx=j.x
                        jy=j.y 
                    #Temporaire
                    if jx == -420:
                        j.x,j.y =(xl+(self.systeme.etoile.taille*self.DistUnit),yl)      
                        jx = j.x
                        jy = j.y         
                    
                    if j.ratioX == 0 :
                        j.ratioX = self.largeur/jx
                        j.ratioY = self.largeur/jy
                    #Si on vient de refresh, update position vaisseau et cible
                    if not self.justrefreshed:
                        j.ratioX = self.largeur/jx
                        j.ratioY = self.largeur/jy
                        
                    else:
                        self.justrefreshed = False
                        if j.cible:
                            if isinstance(j.cible,tuple):
                                print("CIBLE: ", j.cible)
                                newCible=(self.canevas.canvasx(self.largeur/j.cible[2]), self.canevas.canvasy(self.largeur/j.cible[2]),j.cible[2],j.cible[3])
                                j.cible = newCible
                                print("NEW CIBLE : ",newCible)
                    if j.cible:
                        if isinstance(j.cible,tuple):
                            jx = j.x = self.largeur/j.ratioX  
                            jy = j.y = self.largeur/j.ratioY 
                        else:
                            pass
                    
                            
                        
                    
                    #self.canevas.create_rectangle(0,0,jx,jy,outline="purple",width=3)
                    tailleCercle = j.taille/20 * self.DistUnit
                    #print("COORDS : ",jx,jy,"RATIOS : ", j.ratioX,j.ratioY)                    
                    if j.image:
                        imageActuelle = j.id+"_"+j.image+"_"+str(self.zooming)
                        if imageActuelle not in self.images:
                            print("Nouvelle Image !")
                            im = Image.open(j.image)
                            taille = int(self.DistUnit*j.taille)                        
                            im = im.resize( (taille,taille) )
                            #ex = Image.open(j.imageEx+"00"+str(j.exhaust)+".png")
                            self.images[imageActuelle]=ImageTk.PhotoImage(im)
                            #.images[j.id+"Exhaust"]=ImageTk.PhotoImage(ex)
                        self.canevas.create_image( jx, jy , image=self.images[imageActuelle], tags=(j.proprietaire,"vaisseauinterplanetaire",j.id,"artefact",int(jx),int(jy)))
                        self.canevas.create_oval(jx-tailleCercle,jy-tailleCercle,jx + tailleCercle ,jy + tailleCercle,fill=i.couleur,width=2,tags=("artefact","vaisseauinterplanetaire"))
                        #dex,dey = hlp.getAngledPoint(math.degrees(j.angleinverse),taille/2,kx,jy)
                        #self.canevas.create_image()
                    """x2,y2=hlp.getAngledPoint(j.angletrajet,16,jx,jy)
                    x1,y1=hlp.getAngledPoint(j.angletrajet,8,jx,jy)
                    x0,y0=hlp.getAngledPoint(j.angleinverse,8,jx,jy)
                    x,y=hlp.getAngledPoint(j.angleinverse,14,jx,jy)
                    self.canevas.create_line(x,y,x0,y0,fill="yellow",width=4,
                                                 tags=(j.proprietaire,"vaisseauinterplanetaire",j.id,"artefact",int(x),int(y)))
                    self.canevas.create_line(x0,y0,x1,y1,fill=i.couleur,width=6,
                                                 tags=(j.proprietaire,"vaisseauinterplanetaire",j.id,"artefact",int(x),int(y)))
                    self.canevas.create_line(x1,y1,x2,y2,fill=j.couleur,width=5,
                                                 tags=(j.proprietaire,"vaisseauinterplanetaire",j.id,"artefact",int(x),int(y)))"""    
    
    def changerproprietaire(self):
        pass
               
    def afficherselection(self):
        #Effacer Selecteur
        self.canevas.delete("selecteur")
        joueur=self.modele.joueurs[self.parent.nom]
        if self.maselection!=None and self.maselection[0]!="current":           
            couleur = "green"
            
            e=self.DistUnit       
            
            #CLIQUER SUR UN VAISSEAU ###############################################################
            if self.maselection[1]=="vaisseauinterplanetaire":
                for i in joueur.vaisseauxinterplanetaires:
                    if i.id == self.maselection[2]:                        
                        x=i.x
                        y=i.y
                        t=int(self.DistUnit*i.taille/6) 
                        self.canevas.create_rectangle((x*e)-t,(y*e)-t,(x*e)+t,(y*e)+t,dash=(2,2),
                                                      outline=couleur,
                                                      width=2,
                                                      tags=("select","selecteur"))
            #CLIQUER SUR PLANETE ####################################################################
            elif self.maselection[1]=="planete":                           
                for p in self.modele.systemes:
                    for pla in p.planetes:
                        if pla.id == self.maselection[2]:                        
                            x = pla.x
                            y = pla.y
                            t = int(self.DistUnit*pla.taille)*3
                            self.canevas.create_oval(x-t,y-t,(x)+t,(y)+t,dash=(2,2),
                                                     width=2,
                                                     outline=couleur,
                                                     tags=("select","selecteur"))

    def cliquervue(self,evt):
        self.changecadreetat(None)
        t=self.canevas.gettags("current")
        if t and t[0]!="current":
            #CLIQUER SUR UN VAISSEAU ###########################################
            if "vaisseauinterplanetaire" in t:
                print("IN VAISSEAUINTERSPLANETAIRE",t)
                self.maselection=[t[0],t[1],t[2]]
                self.montrevaisseauxselection(t[2])
                
                #self.montrevaisseauxselection()
            #CLIQUER SUR UNE PLANETE #############################################
            elif "planete" in t:
                print("IN PLANETE",t)                  
                self.maselection=[self.parent.nom,t[1],t[2],t[4]]
                self.montreplaneteselection(t[2])
                
            #CLIQUER SUR UN PULSAR #############################################
            elif "etoile" in t or "systeme" in t:
                print("IN ETOILE",t)
                self.maselection=[t[0],t[1],t[2]]
                self.montresystemeselection(t[1])
            else:
                print("Objet inconnu",t)
        else:
            print("Region inconnue")
            self.maselection=None   
        print("MA SELECTION :",self.maselection)
          
    def afficherInfoSysteme(self,systeme):            
        self.cadreetatsysteme = Frame(self.cadreetat,bg="grey20")  
        joueur = self.modele.joueurs[self.parent.nom]  
        for s in self.modele.systemes:
            if systeme == s.id: 
                im = Image.open(s.etoile.image)
                self.PlaImg = ImageTk.PhotoImage(im.resize((180,180)))                
                Label(self.cadreetatsysteme,padx = 10,pady = 20,height=180,width=180,image=self.PlaImg,bg="grey20").pack()
                Label(self.cadreetatsysteme,text="Etoile    :    "+s.etoile.name,padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                #Si systeme, deja visite afficher boutton visiter                
                if s in joueur.systemesvisites:
                    Label(self.cadreetatsysteme,text="Planetes    :    "+str(len(s.planetes)),padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                    if s.id == joueur.origine[0].id:                      
                        Label(self.cadreetatsysteme,text="Status       :   Systeme d'origine ",padx = 10,bg="grey20",fg=joueur.couleur,justify=LEFT,anchor=W).pack(fill=X)
                    else:   
                        Label(self.cadreetatsysteme,text="Status       :   Visited " ,padx= 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                    self.btnvuesysteme=Button(self.cadreetatsysteme,text="Voir Systeme",command=lambda:self.voirgalaxie())
                    self.btnvuesysteme.pack(fill=X)
                else:
                    Label(self.cadreetatsysteme,text="Status       :   Inexplored",padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
        
    def montresystemeselection(self,systeme):
        self.afficherInfoSysteme(systeme)
        self.changecadreetat(self.cadreetatsysteme)
        
    def afficherInfoVaisseau(self,vaisseau):
        self.cadreetatvaisseau = Frame(self.cadreetat,bg="grey20")  
        joueur = self.modele.joueurs[self.parent.nom]  
        for j in self.modele.joueurscles:
            j=self.modele.joueurs[j]
            for v in j.vaisseauxinterplanetaires:            
                if vaisseau == v.id: 
                    im = Image.open(v.LargeIcon)
                    self.PlaVai = ImageTk.PhotoImage(im.resize((180,180)))                
                    Label(self.cadreetatvaisseau,padx = 10,pady = 20,height=180,width=180,image=self.PlaVai,bg="grey20").pack()
                    Label(self.cadreetatvaisseau,text="Prorietaire :    "+v.proprietaire, padx = 10,bg="grey20",fg=j.couleur,justify=LEFT,anchor=W).pack(fill=X)
                    Label(self.cadreetatvaisseau,text="Type    :    "+v.__class__.__name__,padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                    #i il nous appartient             
                    if j.nom == joueur.nom:
                        Label(self.cadreetatvaisseau,text="Energie   :    "+str(v.energie)+"/"+str(v.maxenergie),padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                        #CODER RESTE
    def montrevaisseauxselection(self,vaisseau):
        self.afficherInfoVaisseau(vaisseau)
        self.changecadreetat(self.cadreetatvaisseau)  
    
    def afficherInfoPlanete(self,planete):
        self.cadreetatplanete = Frame(self.cadreetat,bg="grey20")  
        joueur = self.modele.joueurs[self.parent.nom]  
        for s in self.modele.systemes:
            for p in s.planetes:
                if planete == p.id: 
                    im = Image.open(p.image)
                    self.PlaImg = ImageTk.PhotoImage(im.resize((180,180)))                
                    Label(self.cadreetatplanete,padx = 10,pady = 20,height=180,width=180,image=self.PlaImg,bg="grey20").pack()
                    Label(self.cadreetatplanete,text="Planete    :    "+p.name,padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                    #Si etablie sur planete, afficher boutton               
                    if joueur.nom in p.established:   
                            Label(self.cadreetatplanete,text="Status       :   Established " ,padx= 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                            self.btnvueplanete=Button(self.cadreetatplanete,text="Voir Planete",command=lambda : self.voirplanete())
                            self.btnvueplanete.pack(fill=X)
                    elif joueur.nom in p.visiteurs:
                        Label(self.cadreetatplanete,text="Status       :   Visited " ,padx= 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                
                    else:
                        Label(self.cadreetatplanete,text="Status       :   Inexplored",padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)

    def montreplaneteselection(self,planete):
        self.afficherInfoPlanete(planete)
        self.changecadreetat(self.cadreetatplanete)
    
    def afficherartefacts(self,joueurs):
        pass #print("ARTEFACTS de ",self.nom)
    
    def cliquerminimap(self,evt):
        x=evt.x
        y=evt.y
        xn=self.largeur/int(self.minimap.winfo_width())
        yn=self.hauteur/int(self.minimap.winfo_height())
        
        ee=self.canevas.winfo_width()
        ii=self.canevas.winfo_height()
        eex=int(ee)/self.largeur/2
        eey=int(ii)/self.hauteur/2
        
        self.canevas.xview(MOVETO, (x*xn/self.largeur)-eex)
        self.canevas.yview(MOVETO, (y*yn/self.hauteur)-eey)
      
class VuePlanete(Perspective):
    def __init__(self,parent,syste,plane):
        Perspective.__init__(self,parent)
        self.modele=self.parent.modele
        self.planete=plane
        self.systeme=syste
        self.infrastructures={}
        self.maselection=None
        self.macommande=None
        self.sliderMoral = None
        self.villeSelectionnee=None
        self.infrastructureSelectionnee=None
        self.zooming = 0        
        self.DistUnit=500
        self.moralTemp = 0
        self.spaceUnlocked = False
        
        self.parent.root.bind("<Escape>", self.videSelection)
        self.canevas.tag_bind('infra', '<Enter>', self.showMessage)
        self.canevas.tag_bind('infra', '<Leave>', self.hideMessage)
        

        #Boutton creer ville
        im = Image.open("images/img_orion/ville_1.png")       
        self.iconBtnVille = ImageTk.PhotoImage(im.resize((40,40))) 
        self.btncreerville=Button(self.cadreetataction,text="          Creer ville                    ",image=self.iconBtnVille,compound=LEFT,command=self.creerville)
        self.btncreerville.pack(fill=X)
        
        self.parent.sliderNourriture.bind('<ButtonRelease-1>', self.changeMoral)
        
        self.parent.sliderNourriture.set(self.modele.avoirNourritureConsomme(self.parent.parent.monnom))
        
        self.changecadreetat(self.cadreetataction)
   
    def changeMoral(self, event):
        
        self.modele.definirNourritureConso(self.parent.parent.monnom, self.parent.sliderNourriture.get())
        
        
    def videSelection(self, e):
        if self.macommande:
            self.macommande = None
        if self.maselection:
            self.maselection = None
        self.changeCursor(False, "")
        self.canevas.delete("selecteur")

        self.changecadreetat(self.cadreetataction)

        
    def setRessource(self, nom):
        if(self.parent.nom == nom):
            self.parent.labeloR.configure(text="or : " + str(self.modele.joueurs[self.parent.parent.monnom].ressources["or"]))
            self.parent.labelCredit.configure(text="credit : " + str(self.modele.joueurs[self.parent.parent.monnom].ressources["credit"]))
            self.parent.labelBois.configure(text="bois : " + str(self.modele.joueurs[self.parent.parent.monnom].ressources["bois"]))
            self.parent.labelMineraux.configure(text="mineraux : " + str(self.modele.joueurs[self.parent.parent.monnom].ressources["mineraux"]))
            #self.parent.labelPetrole.configure(text="petrole : " + str(self.modele.joueurs[self.parent.parent.monnom].ressources["petrole"]))
            #self.parent.labelPierre.configure(text="pierre : " + str(self.modele.joueurs[self.parent.parent.monnom].ressources["pierre"]))
            #self.parent.labelNourriture.configure(text="nourriture : " + str(self.modele.joueurs[self.parent.parent.monnom].ressources["nourriture"]))
            #self.parent.labelEnergie.configure(text="energie : " + str(self.modele.joueurs[self.parent.parent.monnom].ressources["energie"]))
            #self.parent.configure(text="connaissance : " + str(self.modele.joueurs[self.parent.parent.monnom].ressources["connaissance"]))

            
    def refresh(self,x,y):
        s=None
        p=None      
        for systeme in self.modele.systemes:
            if systeme.id == self.systemeid:
                s=systeme
                for pla in systeme.planetes:
                    if pla.id == self.planeteid:
                        p=pla
                        taille = pla.taille                        
        
        self.largeur=int((taille*20)*self.DistUnit)
        #print("largeur:",self.largeur)
        self.hauteur=self.largeur        
        self.canevas.config(scrollregion=(0,0,self.largeur,self.hauteur))
        #self.canevas.config(bg="black")  
        #self.canevas.create_rectangle(0,0,self.largeur,self.hauteur, fill="sandy brown")  
        self.affichermodelestatique(s,p,x,y)
        
    def creerville(self):
        self.macommande="ville"
        self.changeCursor(True, "ville")
           
    def creerInfra(self, type):
        self.macommande = type
        self.changeCursor(True, type)
    
    # CRÉER UNE UNITÉ, COMME UNE INFRASTRUCTURE --- ALEXIS    
    
    def creerUnit(self, type):
        self.macommande = type
        self.changeCursor(True, type)
    
    def changeCursor(self, bool, type):
        if bool == True:
            self.parent.root.config(cursor='trek')
        else:
            self.parent.root.config(cursor="")
        self.parent.root.update()
        
    def voirsysteme(self):
        for i in self.modele.joueurs[self.parent.nom].systemesvisites:
            if i.id==self.systeme:
                self.parent.voirsysteme(i)
            
    def initplanete(self,sys,plane):
        s=None
        p=None
        for i in self.modele.joueurs[self.parent.nom].systemesvisites:
            if i.id==sys:
                s=i
                for j in i.planetes:
                    if j.id==plane:
                        p=j
                        taille = j.taille
                        break
                    
        self.systemeid=sys
        self.planeteid=plane        
        #TEMPORAIRE !!!!!!!!!!!!!!            
        self.largeur=int((taille * 20)*self.DistUnit)
        self.defSize = self.largeur        
        self.hauteur=self.largeur
        
        self.canevas.config(scrollregion=(0,0,self.largeur,self.hauteur))
         
        for k in self.modele.systemes:
            if(k.id == self.systeme):
                for i in k.planetes:
                    if(i.id == self.planete):
                        self.im = Image.open(i.imagemap)
        self.im = self.im.resize((self.largeur,self.hauteur))
        self.images["bg"] = ImageTk.PhotoImage(self.im)
        self.canevas.create_image(0,0,image=self.images["bg"], anchor=NW)    
        
        self.affichermodelestatique(s,p)
        self.afficherminimap()
    
    def affichermodelestatique(self,s,p,x=None,y=None):
        self.chargeimages()
        xl=self.largeur/2
        yl=self.hauteur/2
        #print("xl:",xl,",yl:",yl)
        if self.villeSelectionnee:
            print(self.villeSelectionnee)
            v = self.trouverVille(self.villeSelectionnee)
            self.afficherselection("ville", v)
        if x == None or y == None:
            canl=int(p.posXatterrissage-200)/self.largeur
            canh=int(p.posYatterrissage-200)/self.hauteur
            self.canevas.xview(MOVETO,canl)
            self.canevas.yview(MOVETO, canh) 
        else:
            canl=self.canevas.canvasx(x)
            canh=self.canevas.canvasy(y)
        #print("canl:",canl,",canh:",canh)
        for i in p.villes:
            xV = (i.x/self.defSize)*self.hauteur
            yV = (i.y/self.defSize)*self.hauteur
            if isinstance(i,Ville):                     
                img = self.canevas.create_image(xV,yV,image=self.images["ville"], tags=("ville", i.id, "infra", xV, yV))
                for inf in i.infrastructures:
                    type_infra = str(type(inf).__name__).lower()
                    xV = (inf.x/self.defSize)*self.hauteur
                    yV = (inf.y/self.defSize)*self.hauteur
                    img = self.canevas.create_image(xV,yV,image=self.images[type_infra], tags=(type_infra,inf.id, "infra", xV, yV))                         
       
        #for c in self.parent.modele.joueurscles:
         #       for i in self.parent.modele.joueurs[c].unitesterrestres:
        #            print("j'ai des unités")
         #           img = self.canevas.create_image(xV,yV,image=self.images["soldat"], tags=("soldat", i.id, "unite", xV, yV))

        #self.canevas.xview(MOVETO,canl)
        #self.canevas.yview(MOVETO, canh)  
    
    def showMessage(self, e):
        t=self.canevas.gettags("current")
        x = self.canevas.canvasx(e.x)
        y = self.canevas.canvasy(e.y)
        texte=t[0] + " " + t[1]
        i = self.canevas.create_text(x + 15, y + 15, text=texte, fill="white",font=("Helvetica", 14), tags=("message",))
        r = self.canevas.create_rectangle(self.canevas.bbox(i), fill="grey", tags=("message",))
        self.canevas.tag_lower(r,i)
        if t[3] and t[4]:
            posX = int(float(t[3]))
            posY = int(float(t[4]))
            #print(pos)
            #self.canevas.create_rectangle(posX,posY,posX+150,posY+150, outline="blue", tags=("message", ))
        
    def hideMessage(self, e):
        self.canevas.delete("message")
         
            
    def chargeimages(self):
        print(self.zooming)
        im = Image.open("./images/img_orion/ville_1.png")
        re = im.resize((150+self.zooming, 150+self.zooming))
        self.images["ville"] = ImageTk.PhotoImage(re)
        
        im = Image.open("./images/img_orion/mine_1.png")
        re = im.resize((100+self.zooming, 100+self.zooming))
        self.images["mine"] = ImageTk.PhotoImage(re)
        
        im = Image.open("./images/img_orion/ferme_1.png")
        re = im.resize((100+self.zooming, 100+self.zooming))
        self.images["ferme"] = ImageTk.PhotoImage(re)
        
        im = Image.open("./images/img_orion/scierie_1.png")
        re = im.resize((100+self.zooming, 100+self.zooming))
        self.images["scierie"] = ImageTk.PhotoImage(re)
        
        im = Image.open("./images/img_orion/habitation_1.png")
        re = im.resize((100+self.zooming, 100+self.zooming))
        self.images["habitation"] = ImageTk.PhotoImage(re)
        
        im = Image.open("./images/img_orion/theatre_1.png")
        re = im.resize((100+self.zooming, 100+self.zooming))
        self.images["theatre"] = ImageTk.PhotoImage(re)
        
        im = Image.open("./images/img_orion/universite_1.png")
        re = im.resize((100+self.zooming, 100+self.zooming))
        self.images["universite"] = ImageTk.PhotoImage(re)
        
        im = Image.open("./images/Buildings/tmpLaunchPad.png")#TOSHA
        re = im.resize((200,200))
        self.images["baselancement"] = ImageTk.PhotoImage(re)
        
        im = Image.open("./images/img_orion/base_mil_1.png")
        re = im.resize((100+self.zooming, 100+self.zooming))
        self.images["basemilitaire"] = ImageTk.PhotoImage(re)
        

        #im = Image.open("./images/img_orion/soldat_1.png")
        #   re = im.resize((100+self.zooming, 100+self.zooming))
        #   self.images["soldat"] = ImageTk.PhotoImage(re)
        
        im = Image.open("./images/img_orion/eglise_1.png")
        re = im.resize((100+self.zooming, 100+self.zooming))
        self.images["eglise"] = ImageTk.PhotoImage(re)
        
        im = Image.open("./images/img_orion/centrale_1.png")
        re = im.resize((100+self.zooming, 100+self.zooming))
        self.images["centralenucleaire"] = ImageTk.PhotoImage(re)
       
    def afficherdecor(self):
        pass
                
    def creervaisseau(self,type):
        print("CREER VAISSEAUX !!!!!!!! ",self.planeteid,self.maselection,type)
        self.parent.parent.creervaisseauS((self.planeteid,self.maselection,type))
        self.changecadreetat(self.cadreetataction)
        
        pass
        #v=Sprinteur(self.parent.parent.modele.joueurs[self.parent.parent.parent.nom],self.parent.parent.parent.nom,p,"S")
        #self.parent.parent.parent.creervaisseauS(self.syste,"sprinteur")
    
    def creerstation(self):
        print("Creer station EN CONSTRUCTION")
         
    def afficherpartie(self,mod):
        pass
            
    def changerproprietaire(self,prop,couleur,systeme): 
        pass
    
    def updateMoral(self, event):
        
        if(self.sliderMoral != None):

            
            self.modele.definirMoral(self.parent.parent.monnom, self.sliderMoral.get())
        
        
    def afficherselection(self, typeInfra, infra):
        print(typeInfra)
        xV = (infra.x/self.defSize)*self.hauteur
        yV = (infra.y/self.defSize)*self.hauteur
        toX = ((infra.taille/1.2)/self.defSize)*self.hauteur
        toY = ((infra.taille/1.2)/self.defSize)*self.hauteur
        if typeInfra == "ville" :
            self.canevas.create_oval(xV - toX-(0.90*self.zooming), yV- toY-(0.90*self.zooming), xV + toX+(0.90*self.zooming), yV+ toY+(0.90*self.zooming), outline="blue", dash=(5,), width=3 ,tags=("select","selecteur","range"))
        elif typeInfra == "base-militaire" :
            self.canevas.create_oval(xV - toX-(0.90*self.zooming), yV- toY-(0.90*self.zooming), xV + toX+(0.90*self.zooming), yV+ toY+(0.90*self.zooming), outline="green", dash=(5,), width=3 ,tags=("select","selecteur","range"))
            #self.canevas.create_oval(infra.x - infra.taille/2, infra.y- infra.taille/2, infra.x + infra.taille/2, infra.y+ infra.taille/2, outline="green",width=3 ,tags=("select","selecteur","range"))
        elif typeInfra == "unite-militaire" :
            self.canevas.create_oval(infra.x - infra.taille/2, infra.y- infra.taille/2, infra.x + infra.taille/2, infra.y+ infra.taille/2, outline="green",width=3 ,tags=("select","selecteur","range"))
           
    
    def afficherminimap(self):
        for s in self.modele.joueurs[self.parent.nom].systemesvisites:
            if s.id == self.systemeid:
                for p in s.planetes:
                    if p.id == self.planeteid:
                        for v in p.villes:
                            mx = (v.x/self.largeur)*200
                            my = (v.y/self.hauteur)*200    
                            self.minimap.create_oval(mx-2,my-2,mx+2,my+2,fill="red")
                            for i in v.infrastructures:
                                #TEMPORAIRE
                                mx = (i.x/self.largeur)*200
                                my = (i.y/self.hauteur)*200    
                                self.minimap.create_oval(mx-2,my-2,mx+2,my+2,fill="cyan")
            
    def cliquervue(self,evt):
        self.changecadreetat(None)
        self.canevas.delete("selecteur")
        t=self.canevas.gettags("current")
        x=self.canevas.canvasx(evt.x)
        y=self.canevas.canvasy(evt.y)
        print("Current ",t)
        if t and t[0] =="current":  
            self.changecadreetat(self.cadreetataction)                  
            if self.macommande:                
                if self.macommande == "ville":
                    self.parent.parent.creerville(self.parent.nom,self.systemeid,self.planeteid, x,y)
                elif self.macommande == "char" or self.macommande == "soldat":
                    v =self.trouverInfrastructure(self.infrastructureSelectionnee)
                    if self.inRange(v, x, y):
                        self.parent.parent.creerUnit(self.parent.nom, self.systemeid, self.planeteid, self.trouverInfrastructure(self.infrastructureSelectionnee).parent.id, self.infrastructureSelectionnee, x, y, self.macommande)       
                else:
                    #SINON, CREER L'INFRA
                    v =self.trouverVille(self.villeSelectionnee)
                    if self.inRange(v, x, y):
                        self.parent.parent.creerInfra(self.parent.nom,self.systemeid,self.planeteid, self.villeSelectionnee, x,y, self.macommande)  
                        self.villeSelectionnee = None
                        if self.macommande == "base-lancement" and not self.spaceUnlocked:
                            
                            print("UNLOCK SPACE",t)
                            self.btnvuesysteme=Button(self.cadreetataction,text="Voir Systeme",command=self.voirsysteme,height=3)
                            self.btnvuesysteme.pack(fill=X)
                            self.changecadreetat(self.cadreetataction)
                         
                         
                self.macommande=None
                self.changeCursor(False, type)
                #self.afficherminimap()
            else:
                self.villeSelectionnee = None
                print(self.villeSelectionnee)
        else:
            print(t)
            if "ville" in t:
                self.montreinfoselection(t[1])
                
                self.villeSelectionnee = t[1]
                v = self.trouverVille(self.villeSelectionnee)
                self.afficherselection("ville", v)
            elif "baselancement" in t:
                self.maselection = t[1]
                self.montreinfoselection(t[1])
                
            elif "basemilitaire" in t:     #SELECTION D'UNE BASE MILITAIRE ----ALEXIS----
                #self.changecadreetat(self.cadreBoutonBaseMil)
                self.infrastructureSelectionnee = t[1]
                self.montreinfoselection(t[1])
                i = self.trouverInfrastructure(self.infrastructureSelectionnee)
                self.afficherselection("base-militaire", i)
                #self.cadreButton.pack_forget()
            elif "char" in t or "soldat" in t:
                self.changecadreetat(self.cadreButton)
                self.uniteSelectionnee = t[1]
                i = self.trouverUnite(self.uniteSelectionnee)
                self.afficherselection("unite-militaire", i)
                print("choisi soldat ou char")
            else:
                self.montreinfoselection(t[1])
                
    
    def trouverVille(self, idVille):
        for s in self.modele.joueurs[self.parent.nom].systemesvisites:
            if s.id == self.systemeid:
                for p in s.planetes:
                    if p.id == self.planeteid:
                        for v in p.villes:
                            if idVille == v.id:
                                return v
                            
    #TROUVER UNE INFRASTRUCTURE DANS UNE VILLE POUR LA SÉLECTION     ----ALEXIS----                       
    def trouverInfrastructure(self, idInfrastructure):
        for s in self.modele.joueurs[self.parent.nom].systemesvisites:
            if s.id == self.systemeid:
                for p in s.planetes:
                    if p.id == self.planeteid:
                        for v in p.villes:
                            for i in v.infrastructures:
                                if idInfrastructure == i.id:
                                    return i      
                                
    #TROUVER UNE UNITÉ DANS UNE VILLE POUR LA SÉLECTION     ----ALEXIS----                       
    def trouverUnite(self, idUnite):
        for s in self.modele.joueurs[self.parent.nom].unitesterrestres:
            if idUnite == s.id:
                return s                         
  
    def inRange(self, ville, x, y):
        distance = math.sqrt((x-ville.x)**2 + (y-ville.y)**2)
        if distance > ville.taille/1.2:
            return False
        return True
                                    
    def afficherInfoInfra(self,infra):            
        self.cadreetatinfra = Frame(self.cadreetat,bg="grey20")  
        joueur = self.modele.joueurs[self.parent.nom]  
        for s in self.modele.systemes:
            for p in s.planetes:
                for v in p.villes:
                    #SI C'EST UNE VILLE ######################################################################
                    if v.id == infra:
                        im = Image.open("images/img_orion/ville_1.png")
                        self.PlaImg = ImageTk.PhotoImage(im.resize((180,180)))
                        Label(self.cadreetatinfra,padx = 10,pady = 20,height=180,width=180,image=self.PlaImg,bg="grey20").pack()
                        Label(self.cadreetatinfra,text="Nom      :    "+str(v.name),padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                        Label(self.cadreetatinfra,text="Niveau    :    "+str(v.level),padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                        Label(self.cadreetatinfra,text="Infrastructures :    "+str(len(v.infrastructures)),padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                        
                        #Boutton levelup
                        im = Image.open("images/Icones/levelup.png")       
                        self.iconBtnlevelup = ImageTk.PhotoImage(im.resize((35,35))) 
                        self.btnlevelup=Button(self.cadreetatinfra,text="   Monter de niveau ",image=self.iconBtnlevelup,compound=LEFT,command=lambda:self.creervaisseau())
                        self.btnlevelup.pack(fill=X)
                        
                        #Boutton creer mine
                        im = Image.open("images/img_orion/mine_1.png")       
                        self.iconBtnMine = ImageTk.PhotoImage(im.resize((35,35))) 
                        self.btncreermine=Button(self.cadreetatinfra,text="          Creer Mine                    ",image=self.iconBtnMine,compound=LEFT,command=lambda:self.creerInfra("mine"))
                        self.btncreermine.pack(fill=X)
                        
                        #Boutton creer mine
                        im = Image.open("images/img_orion/scierie_1.png")       
                        self.iconBtnScierie = ImageTk.PhotoImage(im.resize((35,35))) 
                        self.btncreerscierie=Button(self.cadreetatinfra,text="          Creer Scierie                    ",image=self.iconBtnScierie,compound=LEFT,command=lambda:self.creerInfra("scierie"))
                        self.btncreerscierie.pack(fill=X)
                        
                        #Boutton creer ferme
                        im = Image.open("images/img_orion/ferme_1.png")       
                        self.iconBtnFerme = ImageTk.PhotoImage(im.resize((35,35))) 
                        self.btncreerferme=Button(self.cadreetatinfra,text="          Creer Ferme                    ",image=self.iconBtnFerme,compound=LEFT,command=lambda:self.creerInfra("ferme"))
                        self.btncreerferme.pack(fill=X)   
                        
                        #Boutton creer centrale
                        im = Image.open("images/img_orion/centrale_1.png")       
                        self.iconBtnCentrale = ImageTk.PhotoImage(im.resize((35,35))) 
                        self.btncreercentrale=Button(self.cadreetatinfra,text="Creer Centrale Nucleaire    ",image=self.iconBtnCentrale,compound=LEFT,command=lambda:self.creerInfra("centrale"))
                        self.btncreercentrale.pack(fill=X)                        
                        
                        #Boutton launchpadtmp
                        im = Image.open("images/Buildings/tmpLaunchPad.png")       
                        self.iconBtnLaunch = ImageTk.PhotoImage(im.resize((35,35))) 
                        self.btncreerlaunch=Button(self.cadreetatinfra,text=" Creer Base de lancement ",image=self.iconBtnLaunch,compound=LEFT,command=lambda:self.creerInfra("base-lancement"))
                        self.btncreerlaunch.pack(fill=X)
                        
                        #Boutton creer base militaire
                        im = Image.open("images/img_orion/base_mil_1.png")       
                        self.iconBtnbasemil = ImageTk.PhotoImage(im.resize((35,35))) 
                        self.btncreerbasemil=Button(self.cadreetatinfra,text="    Creer Base militaire        ",image=self.iconBtnbasemil,compound=LEFT,command=lambda:self.creerInfra("base-militaire"))
                        self.btncreerbasemil.pack(fill=X)                  
                    else:
                        for i in v.infrastructures:
                            if infra == i.id: 
                                #INFRA GENERALE ###########################################################################################
                                im = Image.open(i.image)
                                self.PlaImg = ImageTk.PhotoImage(im.resize((180,180)))
                                Label(self.cadreetatinfra,padx = 10,pady = 20,height=180,width=180,image=self.PlaImg,bg="grey20").pack()
                                Label(self.cadreetatinfra,text=str(i.__class__.__name__),padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                                Label(self.cadreetatinfra,text="Niveau    :    "+str(i.level),padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                               
                                #Boutton levelup
                                im = Image.open("images/Icones/levelup.png")       
                                self.iconBtnlevelup = ImageTk.PhotoImage(im.resize((35,35))) 
                                self.btnlevelup=Button(self.cadreetatinfra,text="   Monter de niveau ",image=self.iconBtnlevelup,compound=LEFT)
                                self.btnlevelup.pack(fill=X)
                               
                                #BASE LANCEMENT ############################################################################################
                                if str(i.__class__.__name__) == "BaseLancement":
                                    Label(self.cadreetatinfra,text="Nb vaisseaux   :    "+str(len(i.vaisseaux)),padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                                    #Boutton sprinteur
                                    im = Image.open("images/Ships/Sprinter/359.png")       
                                    self.iconBtnSprinteur = ImageTk.PhotoImage(im.resize((35,35))) 
                                    self.btncreersprinter=Button(self.cadreetatinfra,text="   Creer Sprinter ",image=self.iconBtnSprinteur,compound=LEFT,command=lambda:self.creervaisseau("sprinteur"))
                                    self.btncreersprinter.pack(fill=X)
                                
                                #Boutton eclaireur
                                    im = Image.open("images/Ships/Eclaireur/359.png")       
                                    self.iconBtneclaireur = ImageTk.PhotoImage(im.resize((35,35))) 
                                    self.btncreereclaireur=Button(self.cadreetatinfra,text="   Creer Eclaireur ",image=self.iconBtneclaireur,compound=LEFT,command=lambda:self.creervaisseau("eclaireur"))
                                    self.btncreereclaireur.pack(fill=X)
                                    
                                #Boutton chasseur
                                    im = Image.open("images/Ships/Chasseur/359.png")       
                                    self.iconBtnchasseur = ImageTk.PhotoImage(im.resize((35,35))) 
                                    self.btncreerchasseur=Button(self.cadreetatinfra,text="   Creer Chasseur ",image=self.iconBtnchasseur,compound=LEFT,command=lambda:self.creervaisseau("chasseur"))
                                    self.btncreerchasseur.pack(fill=X)
                                    
                                #Boutton destroyeur
                                    im = Image.open("images/Ships/Destroyeur/359.png")       
                                    self.iconBtndestroyeur = ImageTk.PhotoImage(im.resize((35,35))) 
                                    self.btncreerdestroyeur=Button(self.cadreetatinfra,text="   Creer Destroyeur ",image=self.iconBtndestroyeur,compound=LEFT,command=lambda:self.creervaisseau("destroyeur"))
                                    self.btncreerdestroyeur.pack(fill=X)
                                
                                #Boutton battleship
                                    im = Image.open("images/Ships/Battleship/359.png")       
                                    self.iconBtnbattleship = ImageTk.PhotoImage(im.resize((35,35))) 
                                    self.btncreerbattleship=Button(self.cadreetatinfra,text="   Creer Battleship ",image=self.iconBtnbattleship,compound=LEFT,command=lambda:self.creervaisseau("battleship"))
                                    self.btncreerbattleship.pack(fill=X)
                                    
                                #Boutton mothership
                                    im = Image.open("images/Ships/Mothership/359.png")       
                                    self.iconBtnmothership = ImageTk.PhotoImage(im.resize((35,35))) 
                                    self.btncreermothership=Button(self.cadreetatinfra,text="   Creer Mothership ",image=self.iconBtnmothership,compound=LEFT,command=lambda:self.creervaisseau("mothership"))
                                    self.btncreermothership.pack(fill=X)
                                
                                #BASE MILITAIRE ############################################################################################
                                elif str(i.__class__.__name__) == "BaseMilitaire":
                                    #Boutton soldat
                                    im = Image.open("images/Ships/Sprinter/359.png")       
                                    self.iconBtnSoldat = ImageTk.PhotoImage(im.resize((35,35))) 
                                    self.btncreersoldat=Button(self.cadreetatinfra,text="   Creer Soldat ",image=self.iconBtnSoldat,compound=LEFT,command=lambda:self.creerUnit("soldat"))
                                    self.btncreersoldat.pack(fill=X)
                                
                                #Boutton char
                                    im = Image.open("images/Ships/Sprinter/359.png")       
                                    self.iconBtnchar = ImageTk.PhotoImage(im.resize((35,35))) 
                                    self.btncreerchar=Button(self.cadreetatinfra,text="   Creer Char ",image=self.iconBtnchar,compound=LEFT,command=lambda:self.creerUnit("char"))
                                    self.btncreerchar.pack(fill=X)
                                #TYPE D'INFRAS #############################################################
                                """
                                im = Image.open(s.etoile.image)
                                self.PlaImg = ImageTk.PhotoImage(im.resize((180,180)))                
                                Label(self.cadreetatsysteme,padx = 10,pady = 20,height=180,width=180,image=self.PlaImg,bg="grey20").pack()
                                Label(self.cadreetatsysteme,text="Etoile    :    "+s.etoile.name,padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                                #Si systeme, deja visite afficher boutton visiter                
                                if s in joueur.systemesvisites:
                                    Label(self.cadreetatsysteme,text="Planetes    :    "+str(len(s.planetes)),padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                                    if s.id == joueur.origine[0].id:                      
                                        Label(self.cadreetatsysteme,text="Status       :   Systeme d'origine ",padx = 10,bg="grey20",fg=joueur.couleur,justify=LEFT,anchor=W).pack(fill=X)
                                    else:   
                                        Label(self.cadreetatsysteme,text="Status       :   Visited " ,padx= 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                                    self.btnvuesysteme=Button(self.cadreetatsysteme,text="Voir Systeme",command=lambda:self.voirgalaxie())
                                    self.btnvuesysteme.pack(fill=X)
                                else:
                                    Label(self.cadreetatsysteme,text="Status       :   Inexplored",padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                    """
    def montreinfoselection(self,infra):
        self.afficherInfoInfra(infra)
        self.changecadreetat(self.cadreetatinfra)
        
    def afficherInfoVaisseau(self,vaisseau):
        self.cadreetatvaisseau = Frame(self.cadreetat,bg="grey20")  
        joueur = self.modele.joueurs[self.parent.nom]  
        for j in self.modele.joueurscles:
            j=self.modele.joueurs[j]
            for v in j.vaisseauxinterplanetaire:            
                if vaisseau == v.id: 
                    im = Image.open(v.LargeIcon)
                    self.PlaVai = ImageTk.PhotoImage(im.resize((180,180)))                
                    Label(self.cadreetatvaisseau,padx = 10,pady = 20,height=180,width=180,image=self.PlaVai,bg="grey20").pack()
                    Label(self.cadreetatvaisseau,text="Prorietaire :    "+v.proprietaire, padx = 10,bg="grey20",fg=j.couleur,justify=LEFT,anchor=W).pack(fill=X)
                    Label(self.cadreetatvaisseau,text="Type    :    "+v.__class__.__name__,padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                    #i il nous appartient             
                    if j.nom == joueur.nom:
                        Label(self.cadreetatvaisseau,text="Energie   :    "+str(v.energie)+"/"+str(v.maxenergie),padx = 10,bg="grey20",fg="white",justify=LEFT,anchor=W).pack(fill=X)
                        #CODER RESTE
    def montrevaisseauxselection(self,vaisseau):
        self.afficherInfoVaisseau(vaisseau)
        self.changecadreetat(self.cadreetatvaisseau)  
    
    def afficherartefacts(self,joueurs):
        pass #print("ARTEFACTS de ",self.nom)
    
    def cliquerminimap(self,evt):
        x=evt.x
        y=evt.y
        xn=self.largeur/int(self.minimap.winfo_width())
        yn=self.hauteur/int(self.minimap.winfo_height())
        
        ee=self.canevas.winfo_width()
        ii=self.canevas.winfo_height()
        eex=int(ee)/self.largeur/2
        eey=int(ii)/self.hauteur/2
        
        self.canevas.xview(MOVETO, (x*xn/self.largeur)-eex)
        self.canevas.yview(MOVETO, (y*yn/self.hauteur)-eey)
    
#inconsistant, certains GIF sont très lon à load, certains ne load qu'une seule image, d'autres ne laod rien et ?boucle? infini
class animerGif():
    def __init__(self, parent, vitesse, zoom, posX, posY, anchor, imgPath):
        self.parent = parent
        self.vitesse = vitesse
        self.canvas = None
        self.zoom = zoom
        self.posX = posX
        self.posY = posY
        self.anchor = anchor
        self.images = []
        self.nombreImages = 0
        
        print("IMAGES LOADING ...")
        while True:
            try:
                image = PhotoImage(file= imgPath, format="gif - {}".format(self.nombreImages))
                #print(self.nombreImages)
            except:
                #print("brisé")
                break
            if zoom != None:  
                m = image.zoom(self.zoom)
            else:
                m = image
            self.images.append(m)
            self.nombreImages+=1
        print("IMAGES LOADED")
        self.idxImage = 0
        #self.animeMoi()
    
    def attributeCanvas(self, canvas):
        self.canvas = canvas
        
    def animeMoi(self):
        
        gif= self.images[self.idxImage]
        self.idxImage+=1
        self.canvas.create_image(self.posX, self.posY, image = gif, anchor = self.anchor)
        
        if self.idxImage >= self.nombreImages:
            self.idxImage = 0
       
        self.parent.root.after(self.vitesse, self.animeMoi)
            
        
if __name__ == '__main__':
    m=Vue(0,"jmd","127.0.0.1")
    m.root.mainloop()
    