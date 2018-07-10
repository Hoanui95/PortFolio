

from file_dialog import select_save_as_sql
import random
import math
import time

NOMBRE_PARTIES = 250
NOMBRE_JOUEUR = 3
NOMBRE_ARMRS = 6
EXP_MAX = 22100


experienceJ1 = 0
experienceJ2 = 0
experienceJ3 = 0

coolPointVie1 = 0
coolPointForce1 = 0
coolPointVie2 = 0
coolPointForce2 = 0
coolPointVie3 = 0
coolPointForce3 = 0

#Chaque fois une parties est terminee, on insere 12 fois dans la table cou_joueur
#Intervalle de 12
intervalleTable = 0 
force = random.randint(40,55)
vie = 100
#Tires total atteint sur GAGNANT par PERDANT, ces valeurs servent a trouver les experiences gagnees pour chaque joueur
tempVieGagnant = 0
tempTireTotalAtteintPerdant = 0
tempForcePerdant = 0


def creer_Fichier_SQL_Random():

		filename = select_save_as_sql()
		if filename:
			with open(filename, "wb") as file:
				creation_random_joueurs(file)
				valeur_random_table_partie(file)
				

def creation_random_joueurs(file):
	file.write("/*Creation des 3 joueurs dans la table joueur*/ \n\n")
	
	phrasePersonnelle = ["Winner Winner","Chicken Diner","Best tankem"]
	
	#Ajouter 3 joueurs dans la table joueur
	for x in range (1,NOMBRE_JOUEUR + 1):
		jou_nom = "player" + str(x)
		jou_motDePasse = jou_nom
		jou_phrasePersonnelle = phrasePersonnelle[random.randint(0,len(phrasePersonnelle)-1)]
		jou_experience = 0
		
		
		jou_coolPointVie = 0

		jou_coolPointForce = 0

		jou_coolPointAgilite = 0

		jou_coolPointDexterite = 0
		
		jou_r = random.randint(0,255)
		jou_g = random.randint(0,255)
		jou_b = random.randint(0,255)
		
	 	file.write("EXECUTE Proc_InsererJoueur("+stringInsert(jou_nom)+","+stringInsert(jou_motDePasse)+","+stringInsert(jou_phrasePersonnelle)+","+str(jou_experience)+","+str(jou_coolPointVie)+","+str(jou_coolPointForce)+","+str(jou_coolPointAgilite)+","+str(jou_coolPointDexterite)+","+str(jou_r)+","+str(jou_g)+","+str(jou_b)+");")

		file.write("\n\n")

def valeur_random_table_partie(file):
	#note: 250 parties!!!
	
	file.write("/*Creation "+str(NOMBRE_PARTIES)+" parties random dans la table partie*/ \n\n")

	dateDebut = (randomDateStart("2018/1/23 1:30:00", random.random()))

	for x in range(1,NOMBRE_PARTIES+1):

		
		file.write("\n/****************** Partie #"+str(x)+" ***********************/ \n")
		#Creation de la date et l'heure du DEBUT du jeu
		par_date_debut = (randomDateStart(dateDebut, random.random()))
		#Creation de la date et l'heure du FIN du jeu
		par_date_fin = (randomDateEnd(par_date_debut,random.random()))
		#Inserer date et l'heure de FIN avec nouveau date du DEBUT pour refaire un random
		dateDebut = par_date_fin

		#Definir le joueur GAGNANT dans les "nombreJoueurs"
		par_id_joueur_gagnant = random.randint(1,NOMBRE_JOUEUR)
		#Definir le joueur PERDANT dans les "nombreJoueurs"
		#Id PERDANT ne peut pas etre meme que le id GAGNANT
		differentId = False
		while(differentId == False):
			idPerdant = random.randint(1,NOMBRE_JOUEUR)
			if idPerdant != par_id_joueur_gagnant:
				par_id_joueur_perdant = idPerdant
				differentId = True

		#Definir dans quel map que ces deux joueurs ont joue. 3 maps par defaut
		par_id_niveau_joue = random.randint(1,3)

		#Creation des coups tires par chacun des deux joueurs
		randomCoupJoueur(file,par_id_joueur_gagnant,par_id_joueur_perdant)
		#Cretion des armes pour chaque joueur
		creationArmes(file)

		par_id_arme_j1 = x + x-1
		par_id_arme_j2 = 2*x
		par_distance_j1 = random.randint(1000,2000)
		par_distance_j2 = random.randint(1000,2000)
		file.write("/*Insertion dans la table partie*/\n")
		file.write("EXECUTE Proc_InsererPartie("+stringInsert(par_date_debut)+", "+stringInsert(par_date_fin)+", "+str(par_id_joueur_gagnant)+", "+str(par_id_joueur_perdant)+", "+str(par_id_niveau_joue)+", "+str(par_id_arme_j1)+", "+str(par_id_arme_j2)+ ", "+str(par_distance_j1)+", "+str(par_distance_j2)+");")
		
		file.write("\n\n")
		
		#Mise a jour pour les joueurs GAGNANT et joueur PERDANT
		updateFinPartie(file, par_id_joueur_gagnant, par_id_joueur_perdant)
		

def updateFinPartie(file, idG, idP):
		global experienceJ1
		global experienceJ2
		global experienceJ3

		niveauJ1 = 0
		niveauJ2 = 0
		niveauJ3 = 0
		
		#Trouver le niveau de chaque joueur selon les valeurs globales experienceJ"x"
		niveauJ1 = getNiveauExperience(experienceJ1)
		niveauJ2 = getNiveauExperience(experienceJ2)
		niveauJ3 = getNiveauExperience(experienceJ3)

		#Trouver quel joueur est favorise et quel est defavorise ou egale
		nivGangnant = 0
		nivPerdant = 0
		if idG == 1:
			nivGangnant = niveauJ1
			if idP == 2:
				nivPerdant = niveauJ2
				experienceJ2 += updateExpGlobal(nivGangnant,nivPerdant)[1]
				if experienceJ2 > EXP_MAX:
					experienceJ2 = EXP_MAX
				updateTableJoueur(file,idP,experienceJ2)
			elif idP == 3:
				nivPerdant = niveauJ3
				experienceJ3 += updateExpGlobal(nivGangnant,nivPerdant)[1]
				if experienceJ3 > EXP_MAX:
					experienceJ3 = EXP_MAX
				updateTableJoueur(file,idP,experienceJ3)
			experienceJ1 += updateExpGlobal(nivGangnant,nivPerdant)[0]
			if experienceJ1 > EXP_MAX:
				experienceJ1 = EXP_MAX
			updateTableJoueur(file,idG,experienceJ1)
		elif idG == 2:
			nivGangnant = niveauJ2
			if idP == 1:
				nivPerdant = niveauJ1
				experienceJ1 += updateExpGlobal(nivGangnant,nivPerdant)[1]
				if experienceJ1 > EXP_MAX:
					experienceJ1 = EXP_MAX
				updateTableJoueur(file,idP,experienceJ1)
			elif idP == 3:
				nivPerdant = niveauJ3
				experienceJ3 += updateExpGlobal(nivGangnant,nivPerdant)[1]
				if experienceJ3 > EXP_MAX:
					experienceJ3 = EXP_MAX
				updateTableJoueur(file,idP,experienceJ3)
			experienceJ2 += updateExpGlobal(nivGangnant,nivPerdant)[0]
			if experienceJ2 > EXP_MAX:
				experienceJ2 = EXP_MAX
			updateTableJoueur(file,idG,experienceJ2)
		elif idG == 3:
			nivGangnant = niveauJ3
			if idP == 1:
				nivPerdant = niveauJ1
				experienceJ1 += updateExpGlobal(nivGangnant,nivPerdant)[1]
				if experienceJ1 > EXP_MAX:
					experienceJ1 = EXP_MAX
				updateTableJoueur(file,idP,experienceJ1)
			elif idP == 2:
				nivPerdant = niveauJ2
				experienceJ2 += updateExpGlobal(nivGangnant,nivPerdant)[1]
				if experienceJ2 > EXP_MAX:
					experienceJ2 = EXP_MAX
				updateTableJoueur(file,idP,experienceJ2)
			experienceJ3 += updateExpGlobal(nivGangnant,nivPerdant)[0]
			if experienceJ3 > EXP_MAX:
				experienceJ3 = EXP_MAX
			updateTableJoueur(file,idG,experienceJ3)


def updateExpGlobal(nivGagnant, nivPerdant):
	expGagnant = 0
	expPerdant = 0
	#position [0] est l'experience GAGNANT et [1] est l'experience PERDANT
	expJoueurs = []

	#Trouver vieRestantGagnant
	vieRestantGagnant = tempVieGagnant - (tempTireTotalAtteintPerdant * tempForcePerdant)
	#Trouver viePerduGagnant
	viePerduGagnant = tempVieGagnant - vieRestantGagnant

	#le joueur defavorise gagne la partie, le joueur gagne plus de points
	if nivGagnant < nivPerdant:
		expGagnant = 100 + 100 + 2 * math.floor(vieRestantGagnant)
	else:
		expGagnant = 100 +2 * math.floor(vieRestantGagnant)

	expPerdant  = 2 * math.floor(viePerduGagnant)

	
	expJoueurs.append(expGagnant)
	expJoueurs.append(expPerdant)

	return expJoueurs

def updateTableJoueur(file,id,experience):
	#declarer global
	global coolPointForce1
	global coolPointVie1
	global coolPointForce2
	global coolPointVie2
	global coolPointForce3
	global coolPointVie3

	niveau = getNiveauExperience(experience)
	coolPoint = niveau * 5
	tempCoolPointAgilite = 0
	tempCoolPointDexterite = 0
	if id == 1:
		file.write("/*Update Joueur"+str(id)+"*/\n")
		# Si coolpoint est a 100,niveau 20, distibule sur les 4 abilites 25 chaque
		print(niveau)
		if coolPoint >= 100:
			file.write("EXECUTE Proc_UpdateJoueur("+str(int(experience))+","+str(25)+", "+str(25)+", "+str(25)+", "+str(25)+", "+str(id)+");\n")
	
		elif coolPoint > 0:
			coolPointForce1 = math.floor(coolPoint*0.25+1)#random.randint(0,coolPoint)
			coolPoint -= coolPointForce1
			coolPointVie1 = math.floor(coolPoint*0.33+1)#random.randint(0,coolPoint)
			coolPoint -= coolPointVie1
			tempCoolPointAgilite =math.floor(coolPoint*0.5)# random.randint(0,coolPoint)
			coolPoint -= tempCoolPointAgilite
			tempCoolPointDexterite = coolPoint
			file.write("EXECUTE Proc_UpdateJoueur("+str(int(experience))+", "+str(int(coolPointVie1))+", "+str(int(coolPointForce1))+", "+str(int(tempCoolPointAgilite))+", "+str(int(tempCoolPointDexterite))+", "+str(id)+");\n")
		else:
			file.write("EXECUTE Proc_UpdateJoueur("+str(int(experience))+", "+str(int(coolPointVie1))+", "+str(int(coolPointForce1))+", "+str(int(tempCoolPointAgilite))+", "+str(int(tempCoolPointDexterite))+" ,"+str(id)+");\n")
	elif id == 2:
		file.write("/*Update Joueur"+str(id)+"*/\n")
		if coolPoint >= 100:
			file.write("EXECUTE Proc_UpdateJoueur("+str(int(experience))+", "+str(25)+", "+str(25)+", "+str(25)+", "+str(25)+" ,"+str(id)+");\n")
		elif coolPoint > 0:
			coolPointForce2 = math.floor(coolPoint*0.25+1)#random.randint(0,coolPoint)
			coolPoint -= coolPointForce2
			coolPointVie2 = math.floor(coolPoint*0.33+1)#random.randint(0,coolPoint)
			coolPoint -= coolPointVie2
			tempCoolPointAgilite =math.floor(coolPoint*0.5)# random.randint(0,coolPoint)
			coolPoint -= tempCoolPointAgilite
			tempCoolPointDexterite = coolPoint
			file.write("EXECUTE Proc_UpdateJoueur("+str(int(experience))+", "+str(int(coolPointVie2))+", "+str(int(coolPointForce2))+", "+str(int(tempCoolPointAgilite))+", "+str(int(tempCoolPointDexterite))+" ,"+str(id)+");\n")	
		else:
			file.write("EXECUTE Proc_UpdateJoueur("+str(int(experience))+", "+str(int(coolPointVie2))+", "+str(int(coolPointForce2))+", "+str(int(tempCoolPointAgilite))+", "+str(int(tempCoolPointDexterite))+" ,"+str(id)+");\n")
	elif id == 3:
		file.write("/*Update Joueur"+str(id)+"*/\n")
		if coolPoint >= 100:
			file.write("EXECUTE Proc_UpdateJoueur("+str(int(experience))+", "+str(25)+", "+str(25)+", "+str(25)+", "+str(25)+" ,"+str(id)+");\n")
		elif coolPoint > 0:
			coolPointForce3 = math.floor(coolPoint*0.25+1)#random.randint(0,coolPoint)
			coolPoint -= coolPointForce3
			coolPointVie3 = math.floor(coolPoint*0.33+1)#random.randint(0,coolPoint)
			coolPoint -= coolPointVie3
			tempCoolPointAgilite =math.floor(coolPoint*0.5)# random.randint(0,coolPoint)
			coolPoint -= tempCoolPointAgilite
			tempCoolPointDexterite = coolPoint
			file.write("EXECUTE Proc_UpdateJoueur("+str(int(experience))+", "+str(int(coolPointVie3))+", "+str(int(coolPointForce3))+", "+str(int(tempCoolPointAgilite))+", "+str(int(tempCoolPointDexterite))+" ,"+str(id)+");\n")
		else:
			file.write("EXECUTE Proc_UpdateJoueur("+str(int(experience))+", "+str(int(coolPointVie3))+", "+str(int(coolPointForce3))+", "+str(int(tempCoolPointAgilite))+", "+str(int(tempCoolPointDexterite))+" ,"+str(id)+");\n")
	
	coolPoint = 0

def creationArmes(file):
	global intervalleTable
	file.write("/*Insertion dans les tables armes*/\n")
	#Insertion dans table armes pour joueur GAGNANT (id: impair)
	file.write("EXECUTE Proc_InsererArme("+str(1+intervalleTable)+", "+str(3+intervalleTable)+" ,"+str(5+intervalleTable)+", "+str(7+intervalleTable)+", "+str(9+intervalleTable)+", "+str(11+intervalleTable)+");\n")

	#Insertion dans table armes pour joueur PERDANT (id:pair)
	file.write("EXECUTE Proc_InsererArme("+str(2+intervalleTable)+", "+str(4+intervalleTable)+" ,"+str(6+intervalleTable)+", "+str(8+intervalleTable)+", "+str(10+intervalleTable)+", "+str(12+intervalleTable)+");\n\n")

	intervalleTable += 12

def randomCoupJoueur(file,idGagnant,idPerdant):
	global tempVieGagnant
	global tempTireTotalAtteintPerdant 
	global tempForcePerdant
	#Le tire total depent la vie du perdant et la force du gagnant
	tempTireTotalAtteint = 0
	#tempTireTotalAtteintPerdant = 0
	startIdGagnant = 0
	if idGagnant == 1 :
		startIdGagnant = 1
		tempVieGagnant = (vie * (1+0.05*coolPointVie1))
		tempForceGagnant = (force * (1+0.05*coolPointForce1))
		if idPerdant == 2:
			tempViePerdant = (vie * (1+0.05*coolPointVie2))
			tempForcePerdant = (force * (1+0.05*coolPointForce2))
			tempTireTotalAtteint = getTiresTotalGagnant(tempViePerdant, tempForceGagnant)
			tempTireTotalAtteintPerdant = getTiresTotalPerdant(tempVieGagnant, tempForcePerdant)
		elif idPerdant == 3:
			tempViePerdant = (vie * (1+0.05*coolPointVie3))
			tempForcePerdant = (force * (1+0.05*coolPointForce3))
			tempTireTotalAtteint = getTiresTotalGagnant(tempViePerdant, tempForceGagnant)
			tempTireTotalAtteintPerdant = getTiresTotalPerdant(tempVieGagnant, tempForcePerdant)
			
	elif idGagnant == 2 :
		startIdGagnant = 7
		tempVieGagnant = (vie * (1+0.05*coolPointVie2))
		tempForceGagnant = (force * (1+0.05*coolPointForce2))
		if idPerdant == 1:
			tempViePerdant =(vie * (1+0.05*coolPointVie1))
			tempForcePerdant = (force * (1+0.05*coolPointForce1))
			tempTireTotalAtteint = getTiresTotalGagnant(tempViePerdant, tempForceGagnant)
			tempTireTotalAtteintPerdant = getTiresTotalPerdant(tempVieGagnant, tempForcePerdant)
		elif idPerdant == 3:
			tempViePerdant = (vie * (1+0.05*coolPointVie3))
			tempForcePerdant = (force * (1+0.05*coolPointForce3))
			tempTireTotalAtteint = getTiresTotalGagnant(tempViePerdant, tempForceGagnant)
			tempTireTotalAtteintPerdant = getTiresTotalPerdant(tempVieGagnant, tempForcePerdant)
	elif idGagnant == 3 :
		startIdGagnant = 13
		tempVieGagnant = (vie * (1+0.05*coolPointVie3))
		tempForceGagnant = (force * (1+0.05*coolPointForce3))
		if idPerdant == 2:
			tempViePerdant = (vie * (1+0.05*coolPointVie2))
			tempForcePerdant = (force * (1+0.05*coolPointForce2))
			tempTireTotalAtteint = getTiresTotalGagnant(tempViePerdant, tempForceGagnant)
			tempTireTotalAtteintPerdant = getTiresTotalPerdant(tempVieGagnant, tempForcePerdant)
		elif idPerdant == 1:
			tempViePerdant = (vie * (1+0.05*coolPointVie1))
			tempForcePerdant = (force * (1+0.05*coolPointForce1))
			tempTireTotalAtteint = getTiresTotalGagnant(tempViePerdant, tempForceGagnant)
			tempTireTotalAtteintPerdant = getTiresTotalPerdant(tempVieGagnant, tempForcePerdant)
	

	file.write("/*Creation random des tires pour les joueurs GAGNANT#"+str(idGagnant)+" ET PERDANT#"+str(idPerdant)+"*/ \n\n")
	#Chaque joueur a distribue leurs cool points de facon differente
	tiresAtteintRestant = tempTireTotalAtteint
	tiresRecuRestant = tempTireTotalAtteintPerdant
	cou_totalCoupGagnant = 0
	#On initialise le id gagnant, dans ce cas, on sait quel intervalle des arms apartient a quel joueur
	#Par exemple, joueur1 les id de ses armes sont de 1 a 6 et joueur3 sont de 13 a 18
	startIdPerdant = 0
	differenceId = idGagnant - idPerdant
	startIdPerdant = startIdGagnant-(differenceId * NOMBRE_ARMRS)

	for i in range(0,NOMBRE_ARMRS):
		for x in range(startIdGagnant,startIdGagnant+1):
			file.write("/*GAGNANT*/ \n")
			#random entre 0 et tires recus totale
			cou_coupRecu = random.randint(0,tiresRecuRestant)
			tiresRecuRestant -= cou_coupRecu
			#Diviser les tires atteint sur les differentes armes
			cou_coupAtteinCible = random.randint(0,tiresAtteintRestant)
			tiresAtteintRestant -=  cou_coupAtteinCible
			if cou_coupAtteinCible == 0:
				cou_totalCoup = random.randint(0,10)
			else:
				cou_totalCoup = math.floor(cou_coupAtteinCible * random.uniform(1,1.3))
			file.write("EXECUTE Proc_InsererCoupJoueur("+str(int(cou_totalCoup))+" ,"+str(cou_coupRecu)+" ,"+str(cou_coupAtteinCible)+");")
			startIdGagnant += 1
			file.write("\n\n")

		for y in range(startIdPerdant, startIdPerdant+1):
			file.write("/*PERDANT*/ \n")
			#Coups recus du joueur perdant sont les coups atteints par le joueur gagnant
			cou_coupRecu2 = cou_coupAtteinCible
			#Coups recus du joueur gagnant sont les coups atteint du joueur perdant
			cou_coupAtteinCible2 = cou_coupRecu
			if cou_coupAtteinCible2 == 0:
				cou_totalCoup2 = random.randint(0,10)
			else:
				cou_totalCoup2 = math.floor(cou_coupAtteinCible2 * random.uniform(1,1.3))
			file.write("EXECUTE Proc_InsererCoupJoueur("+str(int(cou_totalCoup2))+" ,"+str(cou_coupRecu2)+" ,"+str(cou_coupAtteinCible2)+");")
			
			startIdPerdant += 1
			file.write("\n\n")


def getTiresTotalGagnant(ViePerdant, forceGagnant):
	tempTire = ViePerdant / forceGagnant
	if (tempTire).is_integer():
		tireTotalAtteint = tempTire
	else:
		tireTotalAtteint = (tempTire) + 1
	return math.floor(tireTotalAtteint)

def getTiresTotalPerdant(vieGagnant,forcePerdant):
	tempTire = math.floor((vieGagnant / forcePerdant) - 1)
	
	return random.randint(0,tempTire)

def getNiveauExperience(experience):
	if experience >= 250:
		#Les experiences sont toujours un chiffre pair
		delta = 2*2 - 4 * 1 * (2 - (experience/50))
		niveau = ((-2+math.sqrt(delta))/(2))
		return math.floor(niveau)
	else:
		return 0

def strTimeProp(start, format, prop):
	# 12h = 43200 sec
	# Intervalle de temps demi journee
    stime = time.mktime(time.strptime(start, format))
    etime = stime + 43200

    ptime = stime + prop * (etime - stime)

    return time.strftime(format, time.localtime(ptime))

def endTimeProp(start, format, prop):
	stime = time.mktime(time.strptime(start, format))
	#le jeu dure minimum 30 secondes
	stime += 30
	#le jeu dure maximum 1m30sec
	etime = stime + 80
	ptime = stime + prop * (etime - stime)
	return time.strftime(format, time.localtime(ptime))

def randomDateStart(start, prop):
    return strTimeProp(start, '%Y/%m/%d %H:%M:%S', prop)

def randomDateEnd(start, prop):
    return endTimeProp(start,'%Y/%m/%d %H:%M:%S', prop)

def stringInsert(value):

	return "'"+value+"'"

def dateInsert(value):

	return "to_date('"+value+"','yyyy/mm/dd hh24:mi:ss')"

if __name__ == "__main__":
	creer_Fichier_SQL_Random()