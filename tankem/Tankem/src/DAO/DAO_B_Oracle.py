# coding: utf-8

from DAO import DAO
from DTO import * 

import cx_Oracle
import random




class DAO_B_Oracle(DAO):

	def __init__(self, identifiant, password, dsn):
		super(DAO_B_Oracle, self).__init__()
		self.connexion = cx_Oracle.connect(identifiant, password, dsn) 
	

	def lire(self):
		curValue = self.connexion.cursor()
		curMess = self.connexion.cursor()

		# faire un try CAtch
		try:
			curValue.execute("select * from balance_setting")
			curMess.execute("Select * from balance_message_setting")

			dto = DTO()

			query_value = curValue.fetchall()
			query_mess = curMess.fetchall()

			for row in query_value:
				if(row[1] in  dto.__dict__.keys()):
					values = (row[2], row[3], row[4])
					
					#dto.__dict__[key] =  values
					dto.__dict__[row[1]] = values

			for row in query_mess:
				if(row[1] in  dto.__dict__.keys()):
					values = (row[2], row[3])
					dto.__dict__[row[1]] =  values
					
		except cx_Oracle.DatabaseError as err:
			error, = err.arg
			print("Oracle-Error-Code", error.code)
			print("Oracle-Error-Message", error.message)

		
		
		
		curValue.close()
		curMess.close()
		return dto

	def ecrire(self, dto):
		curValue = self.connexion.cursor()
		curMess = self.connexion.cursor()

		listeValue = []
		listeMess = [] 

		for key, value in dto.__dict__.items():
		
			if(key == 'mess_accueil_content' or key == 'mess_startGame_content' or key == 'mess_endGame_content'):
					tupleAdd = (value[0], value[1], key)
					listeMess.append(tupleAdd)
			else:
					tupleAdd = (value[0], value[1], value[2] , key)
					listeValue.append(tupleAdd)
		
		curValue.executemany("update balance_setting set bal_min = :1,  bal_max = :2 , bal_current = :3  where bal_name = :4 ",listeValue)
		curMess.executemany("update balance_message_setting set msg_max = :1,  msg_current = :2 where msg_name = :3 ",listeMess)
		self.connexion.commit()

		curValue.close()
		curMess.close()

	def deconnection(self):
		self.connexion.close()