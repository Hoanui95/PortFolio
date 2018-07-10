# coding: utf-8
from DTOdefault import *

#Importe pour faire un message box
import ctypes  

'''
	Classe DTO qui donne accès aux valeurs de la balance
	
'''


class DTO():
	def __init__(self):
		self.speed_chars = ()
		self.speed_rotation_chars = ()
		self.points_vie_chars = ()
		self.time_move_blocs = ()
		self.canon_speed_ball = ()
		self.canon_load_time = ()
		self.mitrail_speed_ball = ()
		self.mitrail_load_time = ()
		self.grenade_speed_init_ball = ()
		self.grenade_load_time = ()
		self.shotgun_speed_ball = ()
		self.shotgun_load_time = ()
		self.shotgun_ouverture_fusil = ()
		self.piege_speed_ball = ()
		self.piege_load_time = ()
		self.missile_speed_ball = ()
		self.missile_load_time = ()
		self.spring_speed_init_jump = ()
		self.spring_load_time = ()
		self.size_explode_ball = ()
		self.mess_accueil_content = ()
		self.mess_accueil_time = ()
		self.mess_countdown_time = ()
		self.mess_startGame_content = ()
		self.mess_endGame_content = ()

	def verifier(self):

		DTOdef = DTOdefault()

		for key, value in self.__dict__.items():
			if(key == 'mess_accueil_content' or key == 'mess_startGame_content' or key == 'mess_endGame_content'):
				if(value[0] is None or value[1] is None):
					self.__dict__[key] = DTOdef.__dict__[key]
					ctypes.windll.user32.MessageBoxA(0, "Le message ne respect pas les criteres ! Il prend les valeurs par défaut", "Valeur incorrecte !", 0)
			else:
				if(value[0] is None and value[1] is None and value[2] is None):
					self.__dict__[key] = DTOdef.__dict__[key]
					ctypes.windll.user32.MessageBoxA(0, "Le message ne respect pas les criteres ! Il prend les valeurs par défaut", "Valeur incorrecte !", 0)
				if(value[2] < value[0] ):
					self.__dict__[key] = (value[0], value[1], value[0])
					ctypes.windll.user32.MessageBoxA(0, "La valeur est plus petit que le minimum !", "Valeur incorrecte !", 0)					
				if(value[2] > value[1]):
					self.__dict__[key] = (value[0], value[1], value[1])
					ctypes.windll.user32.MessageBoxA(0, "La valeur est plus grand que le maximum  !", "Valeur incorrecte !", 0)			
				if (value[0] > value[1]):
					valueMin = value[0]
					value[0] = value[1]
					value[1] = valueMin
					ctypes.windll.user32.MessageBoxA(0, "Le minimum est plus grand que le maximum !", "Valeur incorrecte !", 0)
