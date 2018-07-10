# coding: utf-8

'''
	Classe abstraite DAO qui définit les fonctions du DAO
'''

class DAO(object):
    
    def __init__(self):
        pass
    
    def updateExperience(self):
        raise NotImplementedError("Subclass must implement abstract method!")
    
    def lireJoueur(self, dto):
        raise NotImplementedError("Subclass must implement abstract method!")
    
    def ecrireStatArme(self):
        raise NotImplementedError("Subclass must implement abstract method!")
    
    def deconnection(self):
		raise NotImplementedError("Subclass must implement abstract method!")
	

