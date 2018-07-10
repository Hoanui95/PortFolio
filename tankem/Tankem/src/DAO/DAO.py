
# coding: utf-8

'''
	Classe abstraite DAO qui définit les fonctions du DAO
'''

class DAO(object):
	
	def __init__(self):
		pass
	def lire(self):
		raise NotImplementedError("Subclass must implement abstract method!")
	def ecrire(self, dto):
		raise NotImplementedError("Subclass must implement abstract method!")

