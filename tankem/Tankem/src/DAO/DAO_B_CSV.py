# coding: utf-8

from DAO import DAO 
from DTO import *

import csv

#from file_dialog import select_save_as_csv
from file_dialog import select_open_csv
from file_dialog import select_save_as_csv
from DTO import *

'''
	Sous classe de la classe DAO qui gère la lecture et l'écriture du fichier CSV
'''
class DAO_B_CSV(DAO):
	def __init__(self):
		super(DAO_B_CSV, self).__init__()

	def lire(self):
		
		dto = DTO()

		
		filename = select_open_csv()
		if filename:
			with open(filename, "rb") as file:
				reader = csv.reader(file, dialect = "excel")

				for row in reader:
					if(row[0] in dto.__dict__.keys()):
						if(row[0] == 'mess_accueil_content' or row[0] == 'mess_startGame_content' or row[0] == 'mess_endGame_content'):
							try:							
								valeurs = (int(row[1]), row[2])
							except ValueError: 
								valeurs = (None, None)
							
						else:
							try:							
								valeurs = (float(row[1]), float(row[2]), float(row[3]))
							except ValueError:
								valeurs = (None, None, None)

						dto.__dict__[row[0]] =  valeurs
						

		return dto
	
	def ecrire(self, dto):

		filename = select_save_as_csv()
		if filename:
			with open(filename, "wb") as file:
				writer = csv.writer(file, "excel")
				for key, value in dto.__dict__.items():
					if(key == 'mess_accueil_content' or key == 'mess_startGame_content' or key == 'mess_endGame_content'):
						writer.writerow([key, value[0], value[1]])
					else:
						writer.writerow([key, value[0], value[1], value[2]])
	
	

