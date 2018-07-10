#coding: utf-8
#1) Double-clique sur l’icône du programme/script/batch file  
#2) On tente d’accéder et transférer les données de la balance du serveur. 
#3) Un message devra s’afficher, selon le succès ou l’échec de l’opération. 
#a. Échec:  i. On indique l’erreur (ex: Connection au serveur impossible) ii. Le programme se termine
# b. Si succès: i. On demande à l’usager le nom et l’emplacement du fichier CSV dans lequel on écrira les données. 
# 	On doit proposer à l’usager le fichier BalanceTankem.csv par défaut sur le bureau de l’usager pour lui faire gagner du temps. 
#	 ii. On ouvre ensuite le fichier CSV avec Excel automatiquement avec les données importées.3 


from DAO import *
import getpass

def get_dao_oracle():
	name = raw_input("Indentifiant: ").strip()
	motDePasse = getpass.getpass('Mot de passe: ').strip()

	dao = DAO_B_Oracle(name,motDePasse,"delta/decinfo.edu")

	dto = dao.lire()
	dao.deconnection()

	return dto

def ecrire_DTO_CSV(dto):
	dao = DAO_B_CSV()
	dao.ecrire(dto)




if __name__ == "__main__":

	dto = get_dao_oracle()
	ecrire_DTO_CSV(dto)