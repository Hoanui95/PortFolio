Projet Tankem 
Phase 3
Equipe : - VINH Vincent 
		 - ZHANG Xi Duo
		 - FERRAHI Lyes 
		 - SARTORE-DEVASSE Hoanui

Base de données

	- Le fichier creationTableStatistique.sql est responsable de la creation des tables des coups tirés par chaque joueur, des armes de chaque
	joueur et des parties jouées.
	Le fichier creationTableUtilisateur.sql est responsable de la creation des joueurs.
	- joueur et des parties jouées.
	- Le fichier creationTableUtilisateur.sql est responsable de la creation des joueurs.
	- Le ficheir populerStatistiques.py est reponsable de populer 250 parties dans BD
		Lors de la création des 250 parties, les coolpoints sont distribués de façon égale sur les 4 états.
		Après chaque partie, s'il y a une augmentation de niveau, les coolpoints surplus sont distribués pour les 4 états et ils sont sauvegardés dans des valeurs globales
		pour augmenter ses performances pour la prochaine partie.
		la vie est initialisé à 100
		la force est entre (40-55). choisir aléatoirement.
	
Modifications dans Tankem 
	- Losque l'on choisit un niveau, la fenêtre d'authentification s'ouvre ;
	- Entrer les informations de connexion des deux joueurs ;
	- Appuyer le bouton combattre pour commencer la partie ;
	- Joueur la partie ;
	- En fin de partie, Cliquer sur le bouton rapport pour voir l'état des joueurs .
		
	
Logiciels de gestion des joueurs 
	- Enregistrer un joueur
		- Entrer son nom d'usagé
		- Entrer sa phrase punch
		- Saisissez son mot de passe
	- Supprimer un joueur
		- Saisir son nom puis valider
	- Edition du joueur
		- Saisir le changement voulu dans le champ adéquat puis valider
	- Editer les coolpoints
		- Dans l'onglet "CoolPoints" 
		- Répartir les coolpoints gagné selon les critères souhaité (Max. 25/critère)	
		- Sauvegarder
	-Analyse des statistiques
		- Allez sur l'onglet des statistiques 
		- Appuyer sur le bouton correspondant à la statistique voulu
		