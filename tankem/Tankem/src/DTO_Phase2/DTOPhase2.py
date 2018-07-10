# coding: utf-8

#Importe pour faire un message box
import ctypes  

'''
	Classe DTO qui donne accès aux valeurs de la balance
'''


class DTOPhase2():
	def __init__(self):
		self.niv_name = ""

		# contient tous les infos d'un niveau
		# les donnees sont sauvegardees comme ceci ex: (niv_name, niv_date, niv_id_status ...)
		
		
		#self.niv_date = ()
		#self.niv_id_status = ()

		#INFO SUR LE NIVEAU
		self.niv_delais_min = 0
		self.niv_delais_max = 0	
		self.niv_ligne_x = 0
		self.niv_ligne_y = 0
		self.niv_joueur1_x = 0
		self.niv_joueur1_y = 0
		self.niv_joueur2_x = 0
		self.niv_joueur2_y = 0

		# LES TUPLES DE MODIFICATTIONS POUR CHAQUE X ET Y 
		self.mod_pos_x = []
		self.mod_pos_y = []
		self.mod_arbre = []
		self.mod_id_mur = []

"""
	//tableau du nom niveau
"""