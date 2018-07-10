# coding: utf-8

'''
	Classe DTO qui donne accès aux valeurs de la balance par défaut
'''

class DTOdefault():
	def __init__(self):
		self.speed_chars = (4.0,12.0,10.0)
		self.speed_rotation_chars = (1000.0,2000.0,1700.0)
		self.points_vie_chars = (100.0,2000.0,200.0)
		self.time_move_blocs = (0.2,2.0,0.8)
		self.canon_speed_ball = (4.0,30.0,14.0)
		self.canon_load_time = (0.2,10.0,1.2)
		self.mitrail_speed_ball = (4.0,30.0,18.0)
		self.mitrail_load_time = (0.2,10.0,0.4)
		self.grenade_speed_init_ball = (10.0,25.0,16.0)
		self.grenade_load_time = (0.2,10.0,0.8)
		self.shotgun_speed_ball = (4.0,30.0,13.0)
		self.shotgun_load_time = (0.2,10.0,1.8)
		self.shotgun_ouverture_fusil = (0.1,1.5,0.4)
		self.piege_speed_ball = (0.2,4.0,1.0)
		self.piege_load_time = (0.2,10.0,0.8)
		self.missile_speed_ball = (20.0,40.0,30.0)
		self.missile_load_time = (0.2,10.0,3.0)
		self.spring_speed_init_jump = (6.0,20.0,10.0)
		self.spring_load_time = (0.2,10.0,0.5)
		self.size_explode_ball = (1.0,30.0,8.0)
		self.mess_accueil_content = (60,"Appuyer sur F1 pour l'aide")
		self.mess_accueil_time = (1.0,10.0,3.0)
		self.mess_countdown_time = (0.0,10.0,3.0)
		self.mess_startGame_content = (50,"Tankem!")
		self.mess_endGame_content = (70," a gagne!")	
