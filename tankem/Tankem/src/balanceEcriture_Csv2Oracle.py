#coding:utf-8

from DAO import *
import getpass


def get_dao_csv():

	dao = DAO_B_CSV()
	dto = dao.lire()

	return dto


def ecrire_DTO_ORACLE(dto):

	name = raw_input("Indentifiant: ").strip()
	motDePasse = getpass.getpass('Mot de passe: ').strip()

	dao = DAO_B_Oracle(name,motDePasse,"delta/decinfo.edu")

	#Verifier les entrées avant d'insérer dans la base de donnée
	dto.verifier()
	dao.ecrire(dto)
	dao.deconnection()

if __name__ == "__main__":
	dto = get_dao_csv()
	ecrire_DTO_ORACLE(dto)