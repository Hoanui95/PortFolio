/*Creation des 3 joueurs dans la table joueur*/ 

INSERT INTO joueur (jou_nom, jou_motDePasse, jou_phrasePersonnelle, jou_experience,jou_coolPointVie,jou_coolPointForce,jou_coolPointAgilite,jou_coolPointDexterite,jou_r,jou_g,jou_b) VALUES ('player1' ,'player1' ,'Chicken Diner' ,0 ,0 ,0 ,0 ,0 ,53 ,135, 201);

INSERT INTO joueur (jou_nom, jou_motDePasse, jou_phrasePersonnelle, jou_experience,jou_coolPointVie,jou_coolPointForce,jou_coolPointAgilite,jou_coolPointDexterite,jou_r,jou_g,jou_b) VALUES ('player2' ,'player2' ,'Chicken Diner' ,0 ,0 ,0 ,0 ,0 ,195 ,51, 8);

INSERT INTO joueur (jou_nom, jou_motDePasse, jou_phrasePersonnelle, jou_experience,jou_coolPointVie,jou_coolPointForce,jou_coolPointAgilite,jou_coolPointDexterite,jou_r,jou_g,jou_b) VALUES ('player3' ,'player3' ,'Best tankem' ,0 ,0 ,0 ,0 ,0 ,27 ,174, 101);

/*Creation 10 parties random dans la table partie*/ 


/****************** Partie #1 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,1);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (4 ,1 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,1);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (0 ,1 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (6 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (10 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (8 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (10 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (10 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (10 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (3 ,0 ,0);

/*Insertion dans les tables armes*/
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (1, 3 ,5, 7, 9, 11);
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (2, 4 ,6, 8, 10, 12);

/*Insertion dans la table partie*/
INSERT INTO partie (par_date_debut, par_date_fin, par_id_joueur_gagnant, par_id_joueur_perdant, par_id_niveau_joue, par_id_arme_gagnant, par_id_arme_perdant, par_distance_gagnant, par_distance_perdant) VALUES (to_date('2018/01/23 05:06:28','yyyy/mm/dd hh24:mi:ss'), to_date('2018/01/23 05:07:21','yyyy/mm/dd hh24:mi:ss'), 1, 3, 3, 1, 2, 932, 821);

/*Update Joueur3*/
UPDATE joueur SET jou_experience =0, jou_coolPointVie=0, jou_coolPointForce=0, jou_coolPointAgilite=0, jou_coolPointDexterite=0 WHERE jou_id=3;
/*Update Joueur1*/
UPDATE joueur SET jou_experience =220, jou_coolPointVie=0, jou_coolPointForce=0, jou_coolPointAgilite=0, jou_coolPointDexterite=0 WHERE jou_id=1;

/****************** Partie #2 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,0 ,2);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (0 ,2 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (4 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (0 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (4 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (4 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (9 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (4 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (10 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (8 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (7 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (10 ,0 ,0);

/*Insertion dans les tables armes*/
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (13, 15 ,17, 19, 21, 23);
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (14, 16 ,18, 20, 22, 24);

/*Insertion dans la table partie*/
INSERT INTO partie (par_date_debut, par_date_fin, par_id_joueur_gagnant, par_id_joueur_perdant, par_id_niveau_joue, par_id_arme_gagnant, par_id_arme_perdant, par_distance_gagnant, par_distance_perdant) VALUES (to_date('2018/01/23 07:26:28','yyyy/mm/dd hh24:mi:ss'), to_date('2018/01/23 07:27:10','yyyy/mm/dd hh24:mi:ss'), 3, 1, 2, 3, 4, 851, 853);

/*Update Joueur1*/
UPDATE joueur SET jou_experience =220, jou_coolPointVie=0, jou_coolPointForce=0, jou_coolPointAgilite=0, jou_coolPointDexterite=0 WHERE jou_id=1;
/*Update Joueur3*/
UPDATE joueur SET jou_experience =220, jou_coolPointVie=0, jou_coolPointForce=0, jou_coolPointAgilite=0, jou_coolPointDexterite=0 WHERE jou_id=3;

/****************** Partie #3 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (0 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,1);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (4 ,1 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,1);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (7 ,1 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (9 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (10 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (8 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,0);

/*Insertion dans les tables armes*/
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (25, 27 ,29, 31, 33, 35);
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (26, 28 ,30, 32, 34, 36);

/*Insertion dans la table partie*/
INSERT INTO partie (par_date_debut, par_date_fin, par_id_joueur_gagnant, par_id_joueur_perdant, par_id_niveau_joue, par_id_arme_gagnant, par_id_arme_perdant, par_distance_gagnant, par_distance_perdant) VALUES (to_date('2018/01/23 14:35:45','yyyy/mm/dd hh24:mi:ss'), to_date('2018/01/23 14:36:44','yyyy/mm/dd hh24:mi:ss'), 3, 2, 1, 5, 6, 826, 1000);

/*Update Joueur2*/
UPDATE joueur SET jou_experience =0, jou_coolPointVie=0, jou_coolPointForce=0, jou_coolPointAgilite=0, jou_coolPointDexterite=0 WHERE jou_id=2;
/*Update Joueur3*/
UPDATE joueur SET jou_experience =440, jou_coolPointVie=1, jou_coolPointForce=2, jou_coolPointAgilite=1, jou_coolPointDexterite=1 WHERE jou_id=3;

/****************** Partie #4 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,1);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (3 ,1 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (3 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (0 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (7 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (5 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,1);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (10 ,1 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (9 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (10 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (8 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (4 ,0 ,0);

/*Insertion dans les tables armes*/
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (37, 39 ,41, 43, 45, 47);
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (38, 40 ,42, 44, 46, 48);

/*Insertion dans la table partie*/
INSERT INTO partie (par_date_debut, par_date_fin, par_id_joueur_gagnant, par_id_joueur_perdant, par_id_niveau_joue, par_id_arme_gagnant, par_id_arme_perdant, par_distance_gagnant, par_distance_perdant) VALUES (to_date('2018/01/23 21:16:06','yyyy/mm/dd hh24:mi:ss'), to_date('2018/01/23 21:16:45','yyyy/mm/dd hh24:mi:ss'), 2, 3, 1, 7, 8, 957, 918);

/*Update Joueur3*/
UPDATE joueur SET jou_experience =440, jou_coolPointVie=1, jou_coolPointForce=2, jou_coolPointAgilite=1, jou_coolPointDexterite=1 WHERE jou_id=3;
/*Update Joueur2*/
UPDATE joueur SET jou_experience =320, jou_coolPointVie=1, jou_coolPointForce=2, jou_coolPointAgilite=1, jou_coolPointDexterite=1 WHERE jou_id=2;

/****************** Partie #5 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,1);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (9 ,1 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,1);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,1 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (3 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (4 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (9 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (0 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (6 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (6 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (4 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (8 ,0 ,0);

/*Insertion dans les tables armes*/
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (49, 51 ,53, 55, 57, 59);
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (50, 52 ,54, 56, 58, 60);

/*Insertion dans la table partie*/
INSERT INTO partie (par_date_debut, par_date_fin, par_id_joueur_gagnant, par_id_joueur_perdant, par_id_niveau_joue, par_id_arme_gagnant, par_id_arme_perdant, par_distance_gagnant, par_distance_perdant) VALUES (to_date('2018/01/24 06:13:05','yyyy/mm/dd hh24:mi:ss'), to_date('2018/01/24 06:14:09','yyyy/mm/dd hh24:mi:ss'), 3, 2, 2, 9, 10, 850, 860);

/*Update Joueur2*/
UPDATE joueur SET jou_experience =320, jou_coolPointVie=1, jou_coolPointForce=2, jou_coolPointAgilite=1, jou_coolPointDexterite=1 WHERE jou_id=2;
/*Update Joueur3*/
UPDATE joueur SET jou_experience =666, jou_coolPointVie=3, jou_coolPointForce=3, jou_coolPointAgilite=2, jou_coolPointDexterite=2 WHERE jou_id=3;

/****************** Partie #6 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (8 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,1);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (0 ,1 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (6 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (3 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,1);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (9 ,1 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (6 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (4 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (5 ,0 ,0);

/*Insertion dans les tables armes*/
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (61, 63 ,65, 67, 69, 71);
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (62, 64 ,66, 68, 70, 72);

/*Insertion dans la table partie*/
INSERT INTO partie (par_date_debut, par_date_fin, par_id_joueur_gagnant, par_id_joueur_perdant, par_id_niveau_joue, par_id_arme_gagnant, par_id_arme_perdant, par_distance_gagnant, par_distance_perdant) VALUES (to_date('2018/01/24 09:51:38','yyyy/mm/dd hh24:mi:ss'), to_date('2018/01/24 09:52:25','yyyy/mm/dd hh24:mi:ss'), 3, 1, 2, 11, 12, 975, 864);

/*Update Joueur1*/
UPDATE joueur SET jou_experience =220, jou_coolPointVie=0, jou_coolPointForce=0, jou_coolPointAgilite=0, jou_coolPointDexterite=0 WHERE jou_id=1;
/*Update Joueur3*/
UPDATE joueur SET jou_experience =904, jou_coolPointVie=4, jou_coolPointForce=4, jou_coolPointAgilite=3, jou_coolPointDexterite=4 WHERE jou_id=3;

/****************** Partie #7 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,0 ,2);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (8 ,2 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (8 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (0 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (4 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (6 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (10 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (9 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (9 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (9 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (10 ,0 ,0);

/*Insertion dans les tables armes*/
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (73, 75 ,77, 79, 81, 83);
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (74, 76 ,78, 80, 82, 84);

/*Insertion dans la table partie*/
INSERT INTO partie (par_date_debut, par_date_fin, par_id_joueur_gagnant, par_id_joueur_perdant, par_id_niveau_joue, par_id_arme_gagnant, par_id_arme_perdant, par_distance_gagnant, par_distance_perdant) VALUES (to_date('2018/01/24 11:41:15','yyyy/mm/dd hh24:mi:ss'), to_date('2018/01/24 11:42:19','yyyy/mm/dd hh24:mi:ss'), 3, 2, 2, 13, 14, 889, 899);

/*Update Joueur2*/
UPDATE joueur SET jou_experience =320, jou_coolPointVie=1, jou_coolPointForce=2, jou_coolPointAgilite=1, jou_coolPointDexterite=1 WHERE jou_id=2;
/*Update Joueur3*/
UPDATE joueur SET jou_experience =1148, jou_coolPointVie=4, jou_coolPointForce=4, jou_coolPointAgilite=3, jou_coolPointDexterite=4 WHERE jou_id=3;

/****************** Partie #8 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (5 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,0 ,2);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,2 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (0 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (9 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (7 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (6 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (10 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,0 ,0);

/*Insertion dans les tables armes*/
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (85, 87 ,89, 91, 93, 95);
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (86, 88 ,90, 92, 94, 96);

/*Insertion dans la table partie*/
INSERT INTO partie (par_date_debut, par_date_fin, par_id_joueur_gagnant, par_id_joueur_perdant, par_id_niveau_joue, par_id_arme_gagnant, par_id_arme_perdant, par_distance_gagnant, par_distance_perdant) VALUES (to_date('2018/01/24 15:09:28','yyyy/mm/dd hh24:mi:ss'), to_date('2018/01/24 15:10:20','yyyy/mm/dd hh24:mi:ss'), 1, 2, 3, 15, 16, 958, 955);

/*Update Joueur2*/
UPDATE joueur SET jou_experience =320, jou_coolPointVie=1, jou_coolPointForce=2, jou_coolPointAgilite=1, jou_coolPointDexterite=1 WHERE jou_id=2;
/*Update Joueur1*/
UPDATE joueur SET jou_experience =540, jou_coolPointVie=3, jou_coolPointForce=3, jou_coolPointAgilite=2, jou_coolPointDexterite=2 WHERE jou_id=1;

/****************** Partie #9 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (4 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (5 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,0 ,2);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (5 ,2 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (0 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (5 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (3 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (3 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (9 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (4 ,0 ,0);

/*Insertion dans les tables armes*/
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (97, 99 ,101, 103, 105, 107);
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (98, 100 ,102, 104, 106, 108);

/*Insertion dans la table partie*/
INSERT INTO partie (par_date_debut, par_date_fin, par_id_joueur_gagnant, par_id_joueur_perdant, par_id_niveau_joue, par_id_arme_gagnant, par_id_arme_perdant, par_distance_gagnant, par_distance_perdant) VALUES (to_date('2018/01/24 20:24:20','yyyy/mm/dd hh24:mi:ss'), to_date('2018/01/24 20:25:13','yyyy/mm/dd hh24:mi:ss'), 2, 1, 1, 17, 18, 964, 951);

/*Update Joueur1*/
UPDATE joueur SET jou_experience =540, jou_coolPointVie=3, jou_coolPointForce=3, jou_coolPointAgilite=2, jou_coolPointDexterite=2 WHERE jou_id=1;
/*Update Joueur2*/
UPDATE joueur SET jou_experience =646, jou_coolPointVie=3, jou_coolPointForce=3, jou_coolPointAgilite=2, jou_coolPointDexterite=2 WHERE jou_id=2;

/****************** Partie #10 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (10 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,1);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,1 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (2 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (7 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (1 ,0 ,1);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (10 ,1 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (5 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (5 ,0 ,0);

/*GAGNANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (9 ,0 ,0);

/*PERDANT*/ 
INSERT INTO coup_joueur (cou_totalCoup, cou_coupRecu, cou_coupAtteinCible) VALUES (10 ,0 ,0);

/*Insertion dans les tables armes*/
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (109, 111 ,113, 115, 117, 119);
INSERT INTO arme(arm_id_canon, arm_id_mitraillette, arm_id_grenade, arm_id_pompe, arm_id_piege, arm_id_missille) VALUES (110, 112 ,114, 116, 118, 120);

/*Insertion dans la table partie*/
INSERT INTO partie (par_date_debut, par_date_fin, par_id_joueur_gagnant, par_id_joueur_perdant, par_id_niveau_joue, par_id_arme_gagnant, par_id_arme_perdant, par_distance_gagnant, par_distance_perdant) VALUES (to_date('2018/01/25 08:01:29','yyyy/mm/dd hh24:mi:ss'), to_date('2018/01/25 08:02:11','yyyy/mm/dd hh24:mi:ss'), 3, 2, 2, 19, 20, 810, 852);

/*Update Joueur2*/
UPDATE joueur SET jou_experience =646, jou_coolPointVie=3, jou_coolPointForce=3, jou_coolPointAgilite=2, jou_coolPointDexterite=2 WHERE jou_id=2;
/*Update Joueur3*/
UPDATE joueur SET jou_experience =1392, jou_coolPointVie=5, jou_coolPointForce=6, jou_coolPointAgilite=4, jou_coolPointDexterite=5 WHERE jou_id=3;
