# coding: utf-8

from DTO_Phase2 import *

import cx_Oracle
import random

class DAO_Oracle(object):
    
    def __init__(self, identifiant, password, dsn):
       self.connexion = cx_Oracle.connect(identifiant, password, dsn)
    
    def lire(self, idNiveau):
        curNiveau = self.connexion.cursor()
        curModif = self.connexion.cursor()

        dto = DTOPhase2()
        print(idNiveau)
        try:
            selectNiveau = "select * from niveau where niv_id = :1"
            curNiveau.execute(selectNiveau, {'1': idNiveau})
            query_value = curNiveau.fetchall()
            if(len(query_value) > 0):
                for row in query_value:
                   
                        
                    dto.__dict__['niv_name'] = row[1]
                    dto.__dict__['niv_delais_min'] = row[4]
                    dto.__dict__['niv_delais_max'] = row[5]
                    dto.__dict__['niv_ligne_x'] = row[6]
                    dto.__dict__['niv_ligne_y'] = row[7]
                    dto.__dict__['niv_joueur1_x'] = row[8]
                    dto.__dict__['niv_joueur1_y'] = row[9]
                    dto.__dict__['niv_joueur2_x'] = row[10]
                    dto.__dict__['niv_joueur2_y'] = row[11]

        except cx_Oracle.DatabaseError as err:
            error, = err.arg
            print("Oracle-Error-Code", error.code)
            print("Oracle-Error-Message", error.message)
            
        try:
            selectModif = "select * from modifications where mod_id_niv = :1"
            curModif.execute(selectModif, {'1': idNiveau})
            query_value = curModif.fetchall()
            if(len(query_value) > 0):
                for row in query_value:
                    dto.__dict__['mod_pos_x'].append(row[1])
                    dto.__dict__['mod_pos_y'].append(row[2])
                    dto.__dict__['mod_arbre'].append(row[3])
                    dto.__dict__['mod_id_mur'].append(row[4])

        except cx_Oracle.DatabaseError as err:
            error, = err.arg
            print("Oracle-Error-Code", error.code)
            print("Oracle-Error-Message", error.message)

        curNiveau.close()
        curModif.close()
        
        return dto
    
    def accessNomsNiveaux(self):
        curValue = self.connexion.cursor()
        noms = []
        try:
            curValue.execute("select niv_id, niv_name from niveau where niv_id_status = 1 ORDER BY niv_name")
            query_value = curValue.fetchall()

            if(len(query_value) > 0):
                for row in query_value:
                    temp = (row[1], row[0])
                    noms.append(temp)

        except cx_Oracle.DatabaseError as err:
            error, = err.arg
            print("Oracle-Error-Code", error.code)
            print("Oracle-Error-Message", error.message)

        curValue.close()
        
        return noms

    def deconnection(self):
        self.connexion.close()