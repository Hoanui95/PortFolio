
from DTO_Joueur1 import *
from DTO_Joueur2 import *
from finPartie import *
from DAO import DAO

import cx_Oracle
import random

class DAO_Joueur(DAO):
    def __init__(self, identifiant, password, dsn):
        super(DAO_Joueur, self).__init__()
        self.connexion = cx_Oracle.connect(identifiant, password, dsn)
    
    def updateExperience(self, idJoueur, nouvelleExperience):
        curExperience = self.connexion.cursor()
        
        Tuple = (nouvelleExperience, idJoueur)

        curExperience.execute("update joueur set jou_experience = :1 where jou_id = :2",Tuple)
        self.connexion.commit()
        curExperience.close()

    def lireJoueur(self, idJoueur, nom, mdp):
        if(idJoueur == 0):
            dto = DTO_Joueur1()
        else:
            dto = DTO_Joueur2()
            
        curJoueur = self.connexion.cursor()

        try:
            selectJoueur = "select * from joueur where jou_nom = :1 and jou_motDePasse = :2"
            curJoueur.execute(selectJoueur, {'1': nom, '2': mdp})
            query_joue = curJoueur.fetchall()
            if(len(query_joue) > 0):
                for row in query_joue:
                    dto.__dict__['id'] = int(row[0])
                    dto.__dict__['nom'] = str(row[1])
                    dto.__dict__['mdp'] = str(row[2])
                    dto.__dict__['phrase'] = str(row[3])
                    dto.__dict__['experience'] = int(row[4])
                    dto.__dict__['vie'] = int(row[5])
                    dto.__dict__['force'] = int(row[6])
                    dto.__dict__['agilite'] = int(row[7])
                    dto.__dict__['dexterite'] = int(row[8])
                    dto.__dict__['R'] = float(row[9])/255
                    dto.__dict__['G'] = float(row[10])/255
                    dto.__dict__['B'] = float(row[11])/255
        
        except cx_Oracle.DatabaseError as err:
            error, = err.arg
            print("Oracle-Error-Code", error.code)
            print("Oracle-Error-Message", error.message)

        curJoueur.close()
        return dto

    def ecrireStatArme(self, dtoPartie):
        curStatJGagnant = self.connexion.cursor()

		#Creation des stats armes du joueur gagnant
        listeStatArmeGagnant = []
        
        
        for i in dtoPartie.armeJ1:
            print(i.totalCoup)
            tupleTemp = (int(i.totalCoup), int(i.coupRecu), int(i.coupAtteint))
            listeStatArmeGagnant.append(tupleTemp)
        
        
        curStatJGagnant.executemany("insert into coup_joueur(cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (:1, :2, :3)",listeStatArmeGagnant)
        curStatJGagnant.close()
        print(listeStatArmeGagnant)
        
        self.connexion.commit()

        #select des id des derniere stat du joueur
        idArmeCanonGagnant = 0
        idArmeMitrailletteGagnant = 0
        idArmeGrenadeGagnant = 0
        idArmePompeGagnant = 0
        idArmePiegeGagnant = 0
        idArmeMissilleGagnant = 0  

        curIdCanon = self.connexion.cursor()
        selectIdCanon = "select MAX(cou_id) - 5 from coup_joueur"
        curIdCanon.execute(selectIdCanon, {})
        query = curIdCanon.fetchall()
        if(len(query) > 0):
            for row in query:
                 idArmeCanonGagnant = row[0]
        
        
        curIdMitraillette = self.connexion.cursor()
        selectIdMitraillette = "select MAX(cou_id) - 4 from coup_joueur"
        curIdMitraillette.execute(selectIdMitraillette, {})
        query = curIdMitraillette.fetchall()
        if(len(query) > 0):
            for row in query:
                idArmeMitrailletteGagnant = row[0]
        
        curIdGrenade = self.connexion.cursor()
        selectIdGrenade = "select MAX(cou_id) - 3 from coup_joueur"
        curIdGrenade.execute(selectIdGrenade, {})
        query = curIdGrenade.fetchall()
        if(len(query) > 0):
            for row in query:
                idArmeGrenadeGagnant = row[0]

        curIdPompe = self.connexion.cursor()
        selectIdPompe = "select MAX(cou_id) - 2 from coup_joueur"
        curIdPompe.execute(selectIdPompe, {})
        query = curIdPompe.fetchall()
        if(len(query) > 0):
            for row in query:
                idArmePompeGagnant = row[0]

        curIdPiege = self.connexion.cursor()
        selectIdPiege = "select MAX(cou_id) - 1 from coup_joueur"
        curIdPiege.execute(selectIdPiege, {})
        query = curIdPiege.fetchall()
        if(len(query) > 0):
            for row in query:
                idArmePiegeGagnant = row[0]

        curIdMissille = self.connexion.cursor()
        selectIdMissille = "select MAX(cou_id) from coup_joueur"
        curIdMissille.execute(selectIdMissille, {})
        query = curIdMissille.fetchall()
        if(len(query) > 0):
            for row in query:
                idArmeMissilleGagnant = row[0]

        curIdCanon.close()
        curIdMitraillette.close()
        curIdGrenade.close()
        curIdPompe.close()
        curIdPiege.close()
        curIdMissille.close()


        
        #insertion des stat des armes des joiueurs 
        curArmeJGagnant = self.connexion.cursor()
        
        tupleArme = (int(idArmeCanonGagnant), int(idArmeMitrailletteGagnant), int(idArmeGrenadeGagnant), int(idArmePompeGagnant), int(idArmePiegeGagnant), int(idArmeMissilleGagnant))

        curArmeJGagnant.execute("Insert into arme(arm_id_canon, arm_id_mitraillette,arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) values (:1, :2, :3, :4, :5, :6)",tupleArme)
        
        curArmeJGagnant.close()
        self.connexion.commit()


        #select de l'id de l,arme du joueur gagnant
        idArmeJGagnant = 0
        curIdArmeJGagnant = self.connexion.cursor()
        selectArmeJGagnant = "select MAX(arm_id) from arme"
        curIdArmeJGagnant.execute(selectArmeJGagnant, {})
        query = curIdArmeJGagnant.fetchall()
        if(len(query) > 0):
            for row in query:
                idArmeJGagnant = int(row[0])

        curIdArmeJGagnant.close()
        self.connexion.commit()
           
        #Creation des stats armes du joueur perdant
        curStatJPerdant = self.connexion.cursor()
        listeStatArmePerdant = []

        for i in dtoPartie.armeJ2:
			tupleTemp = ()
			tupleTemp = (int(i.totalCoup), int(i.coupRecu), int(i.coupAtteint))
			listeStatArmePerdant.append(tupleTemp)

        curStatJPerdant.executemany("insert into coup_joueur(cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (:1, :2, :3)",listeStatArmePerdant)
        curStatJPerdant.close()
        
        self.connexion.commit()

         #select des id des derniere stat du joueur
        idArmeCanonPerdant = 0
        idArmeMitraillettePerdant = 0
        idArmeGrenadePerdant = 0
        idArmePompePerdant = 0
        idArmePiegePerdant = 0
        idArmeMissillePerdant = 0  

        curIdCanon = self.connexion.cursor()
        selectIdCanon = "select MAX(cou_id) - 5 from coup_joueur"
        curIdCanon.execute(selectIdCanon, {})
        query = curIdCanon.fetchall()
        if(len(query) > 0):
            for row in query:
                idArmeCanonPerdant = row[0]

        curIdMitraillette = self.connexion.cursor()
        selectIdMitraillette = "select MAX(cou_id) - 4 from coup_joueur"
        curIdMitraillette.execute(selectIdMitraillette, {})
        query = curIdMitraillette.fetchall()
        if(len(query) > 0):
            for row in query:
                idArmeMitraillettePerdant = row[0]
        
        curIdGrenade = self.connexion.cursor()
        selectIdGrenade = "select MAX(cou_id) - 3 from coup_joueur"
        curIdGrenade.execute(selectIdGrenade, {})
        query = curIdGrenade.fetchall()
        if(len(query) > 0):
            for row in query:
                idArmeGrenadePerdant = row[0]

        curIdPompe = self.connexion.cursor()
        selectIdPompe = "select MAX(cou_id) - 2 from coup_joueur"
        curIdPompe.execute(selectIdPompe, {})
        query = curIdPompe.fetchall()
        if(len(query) > 0):
            for row in query:
                idArmePompePerdant = row[0]

        curIdPiege = self.connexion.cursor()
        selectIdPiege = "select MAX(cou_id) - 1 from coup_joueur"
        curIdPiege.execute(selectIdPiege, {})
        query = curIdPiege.fetchall()
        if(len(query) > 0):
            for row in query:
                idArmePiegePerdant = row[0]

        curIdMissille = self.connexion.cursor()
        selectIdMissille = "select MAX(cou_id) from coup_joueur"
        curIdMissille.execute(selectIdMissille, {})
        query = curIdMissille.fetchall()
        if(len(query) > 0):
            for row in query:
                idArmeMissillePerdant = row[0]

        curIdCanon.close()
        curIdMitraillette.close()
        curIdGrenade.close()
        curIdPompe.close()
        curIdPiege.close()
        curIdMissille.close()

        
        #insertion des stat des armes du joueur perdant 
        curArmeJPerdant = self.connexion.cursor()
        
        tupleArme = (int(idArmeCanonPerdant), int(idArmeMitraillettePerdant), int(idArmeGrenadePerdant), int(idArmePompePerdant), int(idArmePiegePerdant), int(idArmeMissillePerdant))

        curArmeJPerdant.execute("Insert into arme(arm_id_canon, arm_id_mitraillette,arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) values (:1, :2, :3, :4, :5, :6)",tupleArme)
        
        curArmeJPerdant.close()
        self.connexion.commit()

        #select des id des armes des deux joueurs
        idArmeJPerdant = 0
     
        curIdArmeJPerdant = self.connexion.cursor()
        selectArmeJPerdant = "select MAX(arm_id) from arme"
        curIdArmeJPerdant.execute(selectArmeJPerdant, {})
        query = curIdArmeJPerdant.fetchall()
        if(len(query) > 0):
            for row in query:
                idArmeJPerdant = int(row[0])

        curIdArmeJPerdant.close()
        self.connexion.commit()

        #insertion partie entiere
        curPartie = self.connexion.cursor()

        print(dtoPartie.distanceJ1)
        print(dtoPartie.distanceJ2)
        print(dtoPartie.niveauJoue)
        print(idArmeJGagnant)
        print(idArmeJPerdant)
        print(dtoPartie.idJoueurGagnant)
        print(dtoPartie.idJoueurPerdant)
        debut = dtoPartie.dateDebut
        fin = dtoPartie.dateFin
       

        tuplePartie = (int(dtoPartie.idJoueurGagnant), int(dtoPartie.idJoueurPerdant), int(dtoPartie.niveauJoue), idArmeJGagnant, idArmeJPerdant, int(dtoPartie.distanceJ1), int(dtoPartie.distanceJ2))

        curPartie.execute("Insert into partie(par_date_debut, par_date_fin,par_id_joueur_gagnant, par_id_joueur_perdant, par_id_niveau_joue, par_id_arme_gagnant, par_id_arme_perdant, par_distance_gagnant, par_distance_perdant) VALUES (to_date('"+debut[:10]+ " "+debut[11:19]+"', 'YYYY-MM-DD hh24:mi:ss'), to_date('"+fin[:10]+ " "+fin[11:19]+"', 'YYYY-MM-DD hh24:mi:ss'), :1, :2, :3, :4, :5, :6, :7)",tuplePartie)
        
        curPartie.close()
        self.connexion.commit()

    def deconnection(self):
		self.connexion.close()
