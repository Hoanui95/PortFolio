/*Creation des 3 joueurs dans la table joueur*/ 

EXECUTE Proc_InsererJoueur('player1','player1','Winner Winner',0,0,0,0,0,159,110,72);

EXECUTE Proc_InsererJoueur('player2','player2','Winner Winner',0,0,0,0,0,47,63,93);

EXECUTE Proc_InsererJoueur('player3','player3','Winner Winner',0,0,0,0,0,135,192,207);

/*Creation 250 parties random dans la table partie*/ 


/****************** Partie #1 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1, 3 ,5, 7, 9, 11);
EXECUTE Proc_InsererArme(2, 4 ,6, 8, 10, 12);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/23 11:25:44', '2018/01/23 11:27:18', 3, 2, 2, 1, 2, 1024, 1970);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(0, 0, 0, 0, 0 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(300, 1, 2, 1, 1 ,3);

/****************** Partie #2 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(13, 15 ,17, 19, 21, 23);
EXECUTE Proc_InsererArme(14, 16 ,18, 20, 22, 24);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/23 11:39:21', '2018/01/23 11:39:58', 1, 2, 1, 3, 4, 1507, 1741);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(0, 0, 0, 0, 0 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(300, 1, 2, 1, 1, 1);

/****************** Partie #3 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(25, 27 ,29, 31, 33, 35);
EXECUTE Proc_InsererArme(26, 28 ,30, 32, 34, 36);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/23 13:02:54', '2018/01/23 13:03:34', 3, 2, 1, 5, 6, 1223, 1278);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(0, 0, 0, 0, 0 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(610, 3, 3, 2, 2 ,3);

/****************** Partie #4 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(37, 39 ,41, 43, 45, 47);
EXECUTE Proc_InsererArme(38, 40 ,42, 44, 46, 48);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/23 14:57:30', '2018/01/23 14:59:13', 2, 1, 3, 7, 8, 1747, 1175);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(388, 1, 2, 1, 1, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(312, 1, 2, 1, 1 ,2);

/****************** Partie #5 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(49, 51 ,53, 55, 57, 59);
EXECUTE Proc_InsererArme(50, 52 ,54, 56, 58, 60);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/23 19:34:26', '2018/01/23 19:35:38', 2, 1, 2, 9, 10, 1511, 1788);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(476, 1, 2, 1, 1, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(534, 3, 3, 2, 2 ,2);

/****************** Partie #6 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(61, 63 ,65, 67, 69, 71);
EXECUTE Proc_InsererArme(62, 64 ,66, 68, 70, 72);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/23 21:16:21', '2018/01/23 21:17:02', 2, 3, 1, 11, 12, 1537, 1921);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(702, 3, 3, 2, 2 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(770, 3, 3, 2, 2 ,2);

/****************** Partie #7 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(73, 75 ,77, 79, 81, 83);
EXECUTE Proc_InsererArme(74, 76 ,78, 80, 82, 84);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/23 23:11:41', '2018/01/23 23:12:53', 2, 3, 3, 13, 14, 1776, 1736);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(702, 3, 3, 2, 2 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(1098, 4, 4, 3, 4 ,2);

/****************** Partie #8 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(85, 87 ,89, 91, 93, 95);
EXECUTE Proc_InsererArme(86, 88 ,90, 92, 94, 96);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/24 11:05:21', '2018/01/24 11:06:55', 3, 1, 1, 15, 16, 1426, 1315);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(476, 1, 2, 1, 1, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(1030, 4, 4, 3, 4 ,3);

/****************** Partie #9 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(97, 99 ,101, 103, 105, 107);
EXECUTE Proc_InsererArme(98, 100 ,102, 104, 106, 108);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/24 21:13:14', '2018/01/24 21:14:06', 3, 2, 2, 17, 18, 1291, 1550);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(1098, 4, 4, 3, 4 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(1370, 5, 6, 4, 5 ,3);

/****************** Partie #10 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(109, 111 ,113, 115, 117, 119);
EXECUTE Proc_InsererArme(110, 112 ,114, 116, 118, 120);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/24 22:08:20', '2018/01/24 22:10:05', 3, 2, 2, 19, 20, 1541, 1179);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(1098, 4, 4, 3, 4 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(1720, 5, 6, 4, 5 ,3);

/****************** Partie #11 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(121, 123 ,125, 127, 129, 131);
EXECUTE Proc_InsererArme(122, 124 ,126, 128, 130, 132);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/25 04:37:28', '2018/01/25 04:38:14', 3, 2, 3, 21, 22, 1546, 1857);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(1098, 4, 4, 3, 4 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(2070, 6, 7, 6, 6 ,3);

/****************** Partie #12 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(133, 135 ,137, 139, 141, 143);
EXECUTE Proc_InsererArme(134, 136 ,138, 140, 142, 144);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/25 07:52:38', '2018/01/25 07:53:09', 1, 2, 1, 23, 24, 1934, 1600);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(1098, 4, 4, 3, 4 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(886, 4, 4, 3, 4, 1);

/****************** Partie #13 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(145, 147 ,149, 151, 153, 155);
EXECUTE Proc_InsererArme(146, 148 ,150, 152, 154, 156);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/25 13:29:16', '2018/01/25 13:30:32', 1, 2, 2, 25, 26, 1871, 1062);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(1194, 4, 4, 3, 4 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(1130, 4, 4, 3, 4, 1);

/****************** Partie #14 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(157, 159 ,161, 163, 165, 167);
EXECUTE Proc_InsererArme(158, 160 ,162, 164, 166, 168);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/25 14:16:59', '2018/01/25 14:18:31', 1, 2, 1, 27, 28, 1766, 1339);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(1290, 4, 4, 3, 4 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(1374, 5, 6, 4, 5, 1);

/****************** Partie #15 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(169, 171 ,173, 175, 177, 179);
EXECUTE Proc_InsererArme(170, 172 ,174, 176, 178, 180);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/25 14:54:42', '2018/01/25 14:56:28', 2, 3, 2, 29, 30, 1932, 1861);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(2178, 6, 7, 6, 6 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(1622, 5, 6, 4, 5 ,2);

/****************** Partie #16 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(181, 183 ,185, 187, 189, 191);
EXECUTE Proc_InsererArme(182, 184 ,186, 188, 190, 192);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/25 23:10:37', '2018/01/25 23:11:55', 3, 2, 1, 31, 32, 1312, 1561);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(1622, 5, 6, 4, 5 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(2538, 8, 8, 7, 7 ,3);

/****************** Partie #17 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(193, 195 ,197, 199, 201, 203);
EXECUTE Proc_InsererArme(194, 196 ,198, 200, 202, 204);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/26 00:35:50', '2018/01/26 00:36:45', 2, 3, 2, 33, 34, 1906, 1427);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(2650, 8, 8, 7, 7 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(1960, 6, 7, 6, 6 ,2);

/****************** Partie #18 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(205, 207 ,209, 211, 213, 215);
EXECUTE Proc_InsererArme(206, 208 ,210, 212, 214, 216);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/26 09:43:13', '2018/01/26 09:43:57', 2, 3, 1, 35, 36, 1557, 1591);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(2650, 8, 8, 7, 7 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(2420, 6, 7, 6, 6 ,2);

/****************** Partie #19 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(217, 219 ,221, 223, 225, 227);
EXECUTE Proc_InsererArme(218, 220 ,222, 224, 226, 228);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/26 14:21:42', '2018/01/26 14:22:27', 3, 2, 2, 37, 38, 1782, 1001);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(2420, 6, 7, 6, 6 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(3030, 8, 8, 7, 7 ,3);

/****************** Partie #20 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(229, 231 ,233, 235, 237, 239);
EXECUTE Proc_InsererArme(230, 232 ,234, 236, 238, 240);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/27 00:43:16', '2018/01/27 00:44:32', 3, 1, 3, 39, 40, 1274, 1419);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(1478, 5, 6, 4, 5, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(3306, 9, 9, 8, 9 ,3);

/****************** Partie #21 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(241, 243 ,245, 247, 249, 251);
EXECUTE Proc_InsererArme(242, 244 ,246, 248, 250, 252);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/27 01:51:20', '2018/01/27 01:52:14', 3, 1, 1, 41, 42, 1711, 1376);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(1582, 5, 6, 4, 5, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(3592, 9, 9, 8, 9 ,3);

/****************** Partie #22 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(253, 255 ,257, 259, 261, 263);
EXECUTE Proc_InsererArme(254, 256 ,258, 260, 262, 264);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/27 05:34:06', '2018/01/27 05:35:00', 3, 1, 3, 43, 44, 1878, 1399);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(1582, 5, 6, 4, 5, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(3982, 9, 9, 8, 9 ,3);

/****************** Partie #23 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(265, 267 ,269, 271, 273, 275);
EXECUTE Proc_InsererArme(266, 268 ,270, 272, 274, 276);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/27 09:13:31', '2018/01/27 09:14:55', 3, 2, 2, 45, 46, 1142, 1743);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(2420, 6, 7, 6, 6 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(4372, 10, 11, 9, 10 ,3);

/****************** Partie #24 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(277, 279 ,281, 283, 285, 287);
EXECUTE Proc_InsererArme(278, 280 ,282, 284, 286, 288);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/27 20:57:25', '2018/01/27 20:58:29', 3, 2, 3, 47, 48, 1450, 1423);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(2528, 8, 8, 7, 7 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(4664, 10, 11, 9, 10 ,3);

/****************** Partie #25 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(289, 291 ,293, 295, 297, 299);
EXECUTE Proc_InsererArme(290, 292 ,294, 296, 298, 300);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/27 23:46:11', '2018/01/27 23:47:37', 2, 1, 1, 49, 50, 1141, 1533);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(1582, 5, 6, 4, 5, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(2908, 8, 8, 7, 7 ,2);

/****************** Partie #26 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(301, 303 ,305, 307, 309, 311);
EXECUTE Proc_InsererArme(302, 304 ,306, 308, 310, 312);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/28 00:04:12', '2018/01/28 00:04:59', 3, 1, 2, 51, 52, 1187, 1448);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(1686, 5, 6, 4, 5, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(4960, 10, 11, 9, 10 ,3);

/****************** Partie #27 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(313, 315 ,317, 319, 321, 323);
EXECUTE Proc_InsererArme(314, 316 ,318, 320, 322, 324);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/28 09:26:58', '2018/01/28 09:28:05', 3, 2, 2, 53, 54, 1738, 1496);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(3020, 8, 8, 7, 7 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(5248, 11, 12, 11, 11 ,3);

/****************** Partie #28 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(325, 327 ,329, 331, 333, 335);
EXECUTE Proc_InsererArme(326, 328 ,330, 332, 334, 336);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/28 11:27:48', '2018/01/28 11:28:52', 2, 3, 3, 55, 56, 1534, 1646);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(5248, 11, 12, 11, 11 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(3500, 9, 9, 8, 9 ,2);

/****************** Partie #29 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(337, 339 ,341, 343, 345, 347);
EXECUTE Proc_InsererArme(338, 340 ,342, 344, 346, 348);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/28 13:58:25', '2018/01/28 13:59:16', 3, 1, 3, 57, 58, 1452, 1956);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(1686, 5, 6, 4, 5, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(5658, 11, 12, 11, 11 ,3);

/****************** Partie #30 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(349, 351 ,353, 355, 357, 359);
EXECUTE Proc_InsererArme(350, 352 ,354, 356, 358, 360);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/29 01:11:28', '2018/01/29 01:12:46', 1, 2, 3, 59, 60, 1172, 1726);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(3616, 9, 9, 8, 9 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(2020, 6, 7, 6, 6, 1);

/****************** Partie #31 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(361, 363 ,365, 367, 369, 371);
EXECUTE Proc_InsererArme(362, 364 ,366, 368, 370, 372);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/29 01:39:19', '2018/01/29 01:40:04', 3, 1, 2, 61, 62, 1616, 1472);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(2020, 6, 7, 6, 6, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(6068, 11, 12, 11, 11 ,3);

/****************** Partie #32 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(373, 375 ,377, 379, 381, 383);
EXECUTE Proc_InsererArme(374, 376 ,378, 380, 382, 384);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/29 03:42:32', '2018/01/29 03:44:04', 1, 3, 3, 63, 64, 1139, 1230);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(6196, 13, 13, 12, 12 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(2352, 6, 7, 6, 6, 1);

/****************** Partie #33 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(385, 387 ,389, 391, 393, 395);
EXECUTE Proc_InsererArme(386, 388 ,390, 392, 394, 396);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/29 15:23:49', '2018/01/29 15:24:42', 2, 1, 3, 65, 66, 1326, 1303);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(2352, 6, 7, 6, 6, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(4006, 9, 9, 8, 9 ,2);

/****************** Partie #34 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(397, 399 ,401, 403, 405, 407);
EXECUTE Proc_InsererArme(398, 400 ,402, 404, 406, 408);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/29 20:49:49', '2018/01/29 20:51:32', 2, 3, 1, 67, 68, 1522, 1994);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(6196, 13, 13, 12, 12 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(4496, 10, 11, 9, 10 ,2);

/****************** Partie #35 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(409, 411 ,413, 415, 417, 419);
EXECUTE Proc_InsererArme(410, 412 ,414, 416, 418, 420);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/30 04:30:01', '2018/01/30 04:31:46', 1, 3, 3, 69, 70, 1341, 1598);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(6196, 13, 13, 12, 12 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(2812, 8, 8, 7, 7, 1);

/****************** Partie #36 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(421, 423 ,425, 427, 429, 431);
EXECUTE Proc_InsererArme(422, 424 ,426, 428, 430, 432);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/30 08:35:31', '2018/01/30 08:36:33', 1, 3, 3, 71, 72, 1513, 1325);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(6196, 13, 13, 12, 12 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(3292, 9, 9, 8, 9, 1);

/****************** Partie #37 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(433, 435 ,437, 439, 441, 443);
EXECUTE Proc_InsererArme(434, 436 ,438, 440, 442, 444);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/30 10:16:15', '2018/01/30 10:17:33', 3, 2, 3, 73, 74, 1309, 1571);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(4496, 10, 11, 9, 10 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(6626, 13, 13, 12, 12 ,3);

/****************** Partie #38 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(445, 447 ,449, 451, 453, 455);
EXECUTE Proc_InsererArme(446, 448 ,450, 452, 454, 456);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/30 18:15:59', '2018/01/30 18:16:36', 2, 1, 1, 75, 76, 1850, 1426);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(3292, 9, 9, 8, 9, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(4896, 10, 11, 9, 10 ,2);

/****************** Partie #39 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(457, 459 ,461, 463, 465, 467);
EXECUTE Proc_InsererArme(458, 460 ,462, 464, 466, 468);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/30 19:07:54', '2018/01/30 19:09:05', 3, 1, 3, 77, 78, 1205, 1737);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(3408, 9, 9, 8, 9, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(6940, 13, 13, 12, 12 ,3);

/****************** Partie #40 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(469, 471 ,473, 475, 477, 479);
EXECUTE Proc_InsererArme(470, 472 ,474, 476, 478, 480);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/31 04:09:16', '2018/01/31 04:10:37', 1, 2, 1, 79, 80, 1746, 1955);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(5020, 10, 11, 9, 10 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(3774, 9, 9, 8, 9, 1);

/****************** Partie #41 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(481, 483 ,485, 487, 489, 491);
EXECUTE Proc_InsererArme(482, 484 ,486, 488, 490, 492);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/31 09:39:48', '2018/01/31 09:41:12', 3, 2, 2, 81, 82, 1703, 1622);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(5144, 11, 12, 11, 11 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(7246, 13, 13, 12, 12 ,3);

/****************** Partie #42 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(493, 495 ,497, 499, 501, 503);
EXECUTE Proc_InsererArme(494, 496 ,498, 500, 502, 504);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/01/31 15:50:29', '2018/01/31 15:52:16', 3, 2, 3, 83, 84, 1958, 1101);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(5144, 11, 12, 11, 11 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(7676, 14, 14, 13, 14 ,3);

/****************** Partie #43 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(505, 507 ,509, 511, 513, 515);
EXECUTE Proc_InsererArme(506, 508 ,510, 512, 514, 516);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/01 03:34:03', '2018/02/01 03:35:31', 1, 2, 3, 85, 86, 1546, 1220);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(5272, 11, 12, 11, 11 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(4136, 10, 11, 9, 10, 1);

/****************** Partie #44 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(517, 519 ,521, 523, 525, 527);
EXECUTE Proc_InsererArme(518, 520 ,522, 524, 526, 528);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/01 04:50:07', '2018/02/01 04:51:41', 1, 2, 1, 87, 88, 1775, 1528);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(5400, 11, 12, 11, 11 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(4508, 10, 11, 9, 10, 1);

/****************** Partie #45 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(529, 531 ,533, 535, 537, 539);
EXECUTE Proc_InsererArme(530, 532 ,534, 536, 538, 540);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/01 13:23:30', '2018/02/01 13:25:12', 3, 2, 2, 89, 90, 1389, 1625);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(5528, 11, 12, 11, 11 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(7988, 14, 14, 13, 14 ,3);

/****************** Partie #46 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(541, 543 ,545, 547, 549, 551);
EXECUTE Proc_InsererArme(542, 544 ,546, 548, 550, 552);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/01 18:54:31', '2018/02/01 18:55:58', 3, 2, 3, 91, 92, 1060, 1104);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(5528, 11, 12, 11, 11 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(8428, 14, 14, 13, 14 ,3);

/****************** Partie #47 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(553, 555 ,557, 559, 561, 563);
EXECUTE Proc_InsererArme(554, 556 ,558, 560, 562, 564);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/01 19:42:25', '2018/02/01 19:43:08', 1, 3, 3, 93, 94, 1005, 1951);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(8428, 14, 14, 13, 14 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(5008, 10, 11, 9, 10, 1);

/****************** Partie #48 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(565, 567 ,569, 571, 573, 575);
EXECUTE Proc_InsererArme(566, 568 ,570, 572, 574, 576);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/02 01:12:57', '2018/02/02 01:13:44', 3, 2, 1, 95, 96, 1291, 1563);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(5528, 11, 12, 11, 11 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(8868, 15, 16, 14, 15 ,3);

/****************** Partie #49 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(577, 579 ,581, 583, 585, 587);
EXECUTE Proc_InsererArme(578, 580 ,582, 584, 586, 588);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/02 04:53:50', '2018/02/02 04:54:34', 1, 2, 3, 97, 98, 1402, 1377);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(5656, 11, 12, 11, 11 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(5380, 11, 12, 11, 11, 1);

/****************** Partie #50 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(589, 591 ,593, 595, 597, 599);
EXECUTE Proc_InsererArme(590, 592 ,594, 596, 598, 600);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/02 10:39:09', '2018/02/02 10:39:41', 1, 2, 1, 99, 100, 1841, 1576);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(5656, 11, 12, 11, 11 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(5790, 11, 12, 11, 11, 1);

/****************** Partie #51 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(601, 603 ,605, 607, 609, 611);
EXECUTE Proc_InsererArme(602, 604 ,606, 608, 610, 612);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/02 13:07:10', '2018/02/02 13:08:06', 3, 2, 3, 101, 102, 1004, 1091);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(5656, 11, 12, 11, 11 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(9318, 15, 16, 14, 15 ,3);

/****************** Partie #52 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(613, 615 ,617, 619, 621, 623);
EXECUTE Proc_InsererArme(614, 616 ,618, 620, 622, 624);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/02 22:40:22', '2018/02/02 22:41:27', 1, 3, 3, 103, 104, 1236, 1647);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(9318, 15, 16, 14, 15 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(6300, 13, 13, 12, 12, 1);

/****************** Partie #53 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(625, 627 ,629, 631, 633, 635);
EXECUTE Proc_InsererArme(626, 628 ,630, 632, 634, 636);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/03 09:39:11', '2018/02/03 09:39:48', 2, 3, 3, 105, 106, 1414, 1208);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(9318, 15, 16, 14, 15 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(6166, 13, 13, 12, 12 ,2);

/****************** Partie #54 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(637, 639 ,641, 643, 645, 647);
EXECUTE Proc_InsererArme(638, 640 ,642, 644, 646, 648);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/03 18:42:57', '2018/02/03 18:43:35', 1, 2, 3, 107, 108, 1159, 1500);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(6298, 13, 13, 12, 12 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(6598, 13, 13, 12, 12, 1);

/****************** Partie #55 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(649, 651 ,653, 655, 657, 659);
EXECUTE Proc_InsererArme(650, 652 ,654, 656, 658, 660);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/03 21:44:21', '2018/02/03 21:46:10', 2, 1, 3, 109, 110, 1052, 1997);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(6730, 13, 13, 12, 12, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(6596, 13, 13, 12, 12 ,2);

/****************** Partie #56 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(661, 663 ,665, 667, 669, 671);
EXECUTE Proc_InsererArme(662, 664 ,666, 668, 670, 672);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/04 09:31:25', '2018/02/04 09:33:05', 2, 3, 2, 111, 112, 1937, 1609);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(9318, 15, 16, 14, 15 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(7126, 13, 13, 12, 12 ,2);

/****************** Partie #57 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(673, 675 ,677, 679, 681, 683);
EXECUTE Proc_InsererArme(674, 676 ,678, 680, 682, 684);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/04 10:47:44', '2018/02/04 10:49:08', 2, 3, 3, 113, 114, 1309, 1809);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(9318, 15, 16, 14, 15 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(7656, 14, 14, 13, 14 ,2);

/****************** Partie #58 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(685, 687 ,689, 691, 693, 695);
EXECUTE Proc_InsererArme(686, 688 ,690, 692, 694, 696);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/04 21:07:10', '2018/02/04 21:08:43', 3, 2, 1, 115, 116, 1784, 1965);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(7792, 14, 14, 13, 14 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(9632, 15, 16, 14, 15 ,3);

/****************** Partie #59 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(697, 699 ,701, 703, 705, 707);
EXECUTE Proc_InsererArme(698, 700 ,702, 704, 706, 708);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/05 08:59:40', '2018/02/05 09:00:31', 1, 2, 3, 117, 118, 1611, 1669);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(7792, 14, 14, 13, 14 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(7260, 14, 14, 13, 14, 1);

/****************** Partie #60 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(709, 711 ,713, 715, 717, 719);
EXECUTE Proc_InsererArme(710, 712 ,714, 716, 718, 720);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/05 17:33:46', '2018/02/05 17:34:37', 2, 1, 2, 119, 120, 1241, 1339);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(7396, 14, 14, 13, 14, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(8096, 14, 14, 13, 14 ,2);

/****************** Partie #61 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(721, 723 ,725, 727, 729, 731);
EXECUTE Proc_InsererArme(722, 724 ,726, 728, 730, 732);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/06 02:58:07', '2018/02/06 02:59:33', 2, 3, 2, 121, 122, 1138, 1557);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(9776, 15, 16, 14, 15 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(8492, 14, 14, 13, 14 ,2);

/****************** Partie #62 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(733, 735 ,737, 739, 741, 743);
EXECUTE Proc_InsererArme(734, 736 ,738, 740, 742, 744);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/06 11:30:27', '2018/02/06 11:31:11', 3, 2, 2, 123, 124, 1026, 1906);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(8492, 14, 14, 13, 14 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(10226, 16, 17, 16, 16 ,3);

/****************** Partie #63 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(745, 747 ,749, 751, 753, 755);
EXECUTE Proc_InsererArme(746, 748 ,750, 752, 754, 756);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/06 20:56:00', '2018/02/06 20:57:45', 3, 2, 3, 125, 126, 1080, 1390);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(8628, 15, 16, 14, 15 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(10550, 16, 17, 16, 16 ,3);

/****************** Partie #64 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(757, 759 ,761, 763, 765, 767);
EXECUTE Proc_InsererArme(758, 760 ,762, 764, 766, 768);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/07 06:01:00', '2018/02/07 06:02:42', 1, 3, 1, 127, 128, 1531, 1517);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(10550, 16, 17, 16, 16 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(7936, 14, 14, 13, 14, 1);

/****************** Partie #65 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(769, 771 ,773, 775, 777, 779);
EXECUTE Proc_InsererArme(770, 772 ,774, 776, 778, 780);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/07 10:59:18', '2018/02/07 11:00:06', 1, 3, 1, 129, 130, 1099, 1732);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(10698, 16, 17, 16, 16 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(8328, 14, 14, 13, 14, 1);

/****************** Partie #66 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(781, 783 ,785, 787, 789, 791);
EXECUTE Proc_InsererArme(782, 784 ,786, 788, 790, 792);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/07 16:46:17', '2018/02/07 16:47:49', 1, 3, 1, 131, 132, 1060, 1652);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(10698, 16, 17, 16, 16 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(8868, 15, 16, 14, 15, 1);

/****************** Partie #67 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(793, 795 ,797, 799, 801, 803);
EXECUTE Proc_InsererArme(794, 796 ,798, 800, 802, 804);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/07 17:47:48', '2018/02/07 17:49:19', 1, 3, 2, 133, 134, 1663, 1908);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(10846, 16, 17, 16, 16 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(9270, 15, 16, 14, 15, 1);

/****************** Partie #68 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(805, 807 ,809, 811, 813, 815);
EXECUTE Proc_InsererArme(806, 808 ,810, 812, 814, 816);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/08 02:23:53', '2018/02/08 02:24:28', 1, 2, 3, 135, 136, 1530, 1385);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(8772, 15, 16, 14, 15 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(9576, 15, 16, 14, 15, 1);

/****************** Partie #69 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(817, 819 ,821, 823, 825, 827);
EXECUTE Proc_InsererArme(818, 820 ,822, 824, 826, 828);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/08 05:08:59', '2018/02/08 05:10:39', 2, 3, 2, 137, 138, 1129, 1915);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(10846, 16, 17, 16, 16 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(9322, 15, 16, 14, 15 ,2);

/****************** Partie #70 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(829, 831 ,833, 835, 837, 839);
EXECUTE Proc_InsererArme(830, 832 ,834, 836, 838, 840);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/08 05:19:09', '2018/02/08 05:20:04', 1, 3, 1, 139, 140, 1220, 1192);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(10846, 16, 17, 16, 16 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(10126, 16, 17, 16, 16, 1);

/****************** Partie #71 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(841, 843 ,845, 847, 849, 851);
EXECUTE Proc_InsererArme(842, 844 ,846, 848, 850, 852);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/08 07:36:09', '2018/02/08 07:37:40', 3, 2, 3, 141, 142, 1595, 1604);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(9466, 15, 16, 14, 15 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(11162, 16, 17, 16, 16 ,3);

/****************** Partie #72 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(853, 855 ,857, 859, 861, 863);
EXECUTE Proc_InsererArme(854, 856 ,858, 860, 862, 864);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/08 15:44:05', '2018/02/08 15:45:52', 3, 1, 3, 143, 144, 1967, 1953);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(10126, 16, 17, 16, 16, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(11622, 18, 18, 17, 17 ,3);

/****************** Partie #73 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(865, 867 ,869, 871, 873, 875);
EXECUTE Proc_InsererArme(866, 868 ,870, 872, 874, 876);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/09 03:44:29', '2018/02/09 03:45:46', 1, 3, 2, 145, 146, 1750, 1275);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(11622, 18, 18, 17, 17 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(10686, 16, 17, 16, 16, 1);

/****************** Partie #74 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(877, 879 ,881, 883, 885, 887);
EXECUTE Proc_InsererArme(878, 880 ,882, 884, 886, 888);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/09 08:35:37', '2018/02/09 08:36:46', 2, 3, 3, 147, 148, 1746, 1841);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(11774, 18, 18, 17, 17 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(9864, 16, 17, 16, 16 ,2);

/****************** Partie #75 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(889, 891 ,893, 895, 897, 899);
EXECUTE Proc_InsererArme(890, 892 ,894, 896, 898, 900);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/09 18:26:00', '2018/02/09 18:27:36', 2, 1, 1, 149, 150, 1384, 1864);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(10686, 16, 17, 16, 16, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(10324, 16, 17, 16, 16 ,2);

/****************** Partie #76 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(901, 903 ,905, 907, 909, 911);
EXECUTE Proc_InsererArme(902, 904 ,906, 908, 910, 912);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/10 06:25:50', '2018/02/10 06:26:54', 2, 1, 3, 151, 152, 1298, 1143);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(10686, 16, 17, 16, 16, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(10784, 16, 17, 16, 16 ,2);

/****************** Partie #77 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(913, 915 ,917, 919, 921, 923);
EXECUTE Proc_InsererArme(914, 916 ,918, 920, 922, 924);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/10 10:03:49', '2018/02/10 10:04:38', 1, 3, 3, 153, 154, 1241, 1654);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(11774, 18, 18, 17, 17 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(11246, 16, 17, 16, 16, 1);

/****************** Partie #78 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(925, 927 ,929, 931, 933, 935);
EXECUTE Proc_InsererArme(926, 928 ,930, 932, 934, 936);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/10 15:55:55', '2018/02/10 15:57:25', 3, 1, 3, 155, 156, 1017, 1216);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(11246, 16, 17, 16, 16, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(12254, 18, 18, 17, 17 ,3);

/****************** Partie #79 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(937, 939 ,941, 943, 945, 947);
EXECUTE Proc_InsererArme(938, 940 ,942, 944, 946, 948);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/10 17:26:20', '2018/02/10 17:27:50', 2, 1, 2, 157, 158, 1660, 1972);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(11246, 16, 17, 16, 16, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(11244, 16, 17, 16, 16 ,2);

/****************** Partie #80 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(949, 951 ,953, 955, 957, 959);
EXECUTE Proc_InsererArme(950, 952 ,954, 956, 958, 960);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/10 19:45:36', '2018/02/10 19:46:14', 2, 1, 3, 159, 160, 1015, 1594);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(11394, 18, 18, 17, 17, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(11556, 18, 18, 17, 17 ,2);

/****************** Partie #81 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(961, 963 ,965, 967, 969, 971);
EXECUTE Proc_InsererArme(962, 964 ,966, 968, 970, 972);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/11 02:26:20', '2018/02/11 02:27:27', 1, 2, 1, 161, 162, 1287, 1237);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(11556, 18, 18, 17, 17 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(11874, 18, 18, 17, 17, 1);

/****************** Partie #82 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(973, 975 ,977, 979, 981, 983);
EXECUTE Proc_InsererArme(974, 976 ,978, 980, 982, 984);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/11 12:26:49', '2018/02/11 12:28:17', 1, 2, 2, 163, 164, 1822, 1669);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(11708, 18, 18, 17, 17 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(12202, 18, 18, 17, 17, 1);

/****************** Partie #83 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(985, 987 ,989, 991, 993, 995);
EXECUTE Proc_InsererArme(986, 988 ,990, 992, 994, 996);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/11 14:44:50', '2018/02/11 14:45:27', 3, 2, 1, 165, 166, 1089, 1645);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(11860, 18, 18, 17, 17 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(12582, 18, 18, 17, 17 ,3);

/****************** Partie #84 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(997, 999 ,1001, 1003, 1005, 1007);
EXECUTE Proc_InsererArme(998, 1000 ,1002, 1004, 1006, 1008);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/11 15:04:55', '2018/02/11 15:06:32', 2, 1, 1, 167, 168, 1409, 1067);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(12354, 18, 18, 17, 17, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(12188, 18, 18, 17, 17 ,2);

/****************** Partie #85 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1009, 1011 ,1013, 1015, 1017, 1019);
EXECUTE Proc_InsererArme(1010, 1012 ,1014, 1016, 1018, 1020);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/11 16:17:35', '2018/02/11 16:19:03', 1, 2, 1, 169, 170, 1905, 1368);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(12340, 18, 18, 17, 17 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(12682, 18, 18, 17, 17, 1);

/****************** Partie #86 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1021, 1023 ,1025, 1027, 1029, 1031);
EXECUTE Proc_InsererArme(1022, 1024 ,1026, 1028, 1030, 1032);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/12 04:07:06', '2018/02/12 04:08:09', 1, 3, 3, 171, 172, 1707, 1570);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(12734, 18, 18, 17, 17 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(13010, 19, 19, 18, 19, 1);

/****************** Partie #87 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1033, 1035 ,1037, 1039, 1041, 1043);
EXECUTE Proc_InsererArme(1034, 1036 ,1038, 1040, 1042, 1044);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/12 14:09:24', '2018/02/12 14:10:24', 1, 2, 2, 173, 174, 1472, 1619);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(12492, 18, 18, 17, 17 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(13348, 19, 19, 18, 19, 1);

/****************** Partie #88 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1045, 1047 ,1049, 1051, 1053, 1055);
EXECUTE Proc_InsererArme(1046, 1048 ,1050, 1052, 1054, 1056);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/12 18:05:55', '2018/02/12 18:06:44', 3, 1, 1, 175, 176, 1818, 1022);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(13504, 19, 19, 18, 19, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(13158, 19, 19, 18, 19 ,3);

/****************** Partie #89 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1057, 1059 ,1061, 1063, 1065, 1067);
EXECUTE Proc_InsererArme(1058, 1060 ,1062, 1064, 1066, 1068);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/13 00:15:42', '2018/02/13 00:16:18', 2, 3, 1, 177, 178, 1463, 1173);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(13158, 19, 19, 18, 19 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(13072, 19, 19, 18, 19 ,2);

/****************** Partie #90 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1069, 1071 ,1073, 1075, 1077, 1079);
EXECUTE Proc_InsererArme(1070, 1072 ,1074, 1076, 1078, 1080);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/13 01:25:08', '2018/02/13 01:26:37', 3, 1, 1, 179, 180, 1172, 1037);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(13504, 19, 19, 18, 19, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(13648, 19, 19, 18, 19 ,3);

/****************** Partie #91 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1081, 1083 ,1085, 1087, 1089, 1091);
EXECUTE Proc_InsererArme(1082, 1084 ,1086, 1088, 1090, 1092);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/13 02:40:42', '2018/02/13 02:42:08', 2, 3, 3, 181, 182, 1034, 1854);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(13648, 19, 19, 18, 19 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(13562, 19, 19, 18, 19 ,2);

/****************** Partie #92 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1093, 1095 ,1097, 1099, 1101, 1103);
EXECUTE Proc_InsererArme(1094, 1096 ,1098, 1100, 1102, 1104);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/13 14:18:03', '2018/02/13 14:18:50', 1, 3, 1, 183, 184, 1512, 1850);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(13648, 19, 19, 18, 19 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(13994, 19, 19, 18, 19, 1);

/****************** Partie #93 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1105, 1107 ,1109, 1111, 1113, 1115);
EXECUTE Proc_InsererArme(1106, 1108 ,1110, 1112, 1114, 1116);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/13 18:43:04', '2018/02/13 18:44:47', 3, 1, 1, 185, 186, 1477, 1344);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(13994, 19, 19, 18, 19, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(14138, 19, 19, 18, 19 ,3);

/****************** Partie #94 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1117, 1119 ,1121, 1123, 1125, 1127);
EXECUTE Proc_InsererArme(1118, 1120 ,1122, 1124, 1126, 1128);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/13 20:36:14', '2018/02/13 20:36:52', 3, 1, 3, 187, 188, 1960, 1944);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(14150, 19, 19, 18, 19, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(14472, 19, 19, 18, 19 ,3);

/****************** Partie #95 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1129, 1131 ,1133, 1135, 1137, 1139);
EXECUTE Proc_InsererArme(1130, 1132 ,1134, 1136, 1138, 1140);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/14 03:04:53', '2018/02/14 03:06:16', 2, 1, 1, 189, 190, 1762, 1327);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(14150, 19, 19, 18, 19, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(14052, 19, 19, 18, 19 ,2);

/****************** Partie #96 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1141, 1143 ,1145, 1147, 1149, 1151);
EXECUTE Proc_InsererArme(1142, 1144 ,1146, 1148, 1150, 1152);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/14 11:38:59', '2018/02/14 11:40:16', 1, 2, 1, 191, 192, 1071, 1811);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(14052, 19, 19, 18, 19 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(14640, 20, 21, 19, 20, 1);

/****************** Partie #97 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1153, 1155 ,1157, 1159, 1161, 1163);
EXECUTE Proc_InsererArme(1154, 1156 ,1158, 1160, 1162, 1164);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/14 12:58:16', '2018/02/14 12:59:31', 2, 1, 1, 193, 194, 1348, 1422);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(14804, 20, 21, 19, 20, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(14478, 19, 19, 18, 19 ,2);

/****************** Partie #98 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1165, 1167 ,1169, 1171, 1173, 1175);
EXECUTE Proc_InsererArme(1166, 1168 ,1170, 1172, 1174, 1176);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/14 17:24:35', '2018/02/14 17:25:11', 2, 3, 1, 195, 196, 1521, 1752);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(14472, 19, 19, 18, 19 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(14968, 20, 21, 19, 20 ,2);

/****************** Partie #99 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1177, 1179 ,1181, 1183, 1185, 1187);
EXECUTE Proc_InsererArme(1178, 1180 ,1182, 1184, 1186, 1188);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/15 02:01:07', '2018/02/15 02:02:03', 2, 3, 3, 197, 198, 1497, 1123);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(14472, 19, 19, 18, 19 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(15468, 20, 21, 19, 20 ,2);

/****************** Partie #100 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1189, 1191 ,1193, 1195, 1197, 1199);
EXECUTE Proc_InsererArme(1190, 1192 ,1194, 1196, 1198, 1200);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/15 10:58:01', '2018/02/15 10:59:49', 1, 3, 3, 199, 200, 1113, 1154);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(14628, 20, 21, 19, 20 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(15148, 20, 21, 19, 20, 1);

/****************** Partie #101 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1201, 1203 ,1205, 1207, 1209, 1211);
EXECUTE Proc_InsererArme(1202, 1204 ,1206, 1208, 1210, 1212);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/15 19:05:55', '2018/02/15 19:06:32', 3, 1, 3, 201, 202, 1470, 1097);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(15148, 20, 21, 19, 20, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(15128, 20, 21, 19, 20 ,3);

/****************** Partie #102 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1213, 1215 ,1217, 1219, 1221, 1223);
EXECUTE Proc_InsererArme(1214, 1216 ,1218, 1220, 1222, 1224);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/15 19:45:13', '2018/02/15 19:45:58', 3, 1, 3, 203, 204, 1447, 1239);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(15148, 20, 21, 19, 20, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(15628, 20, 21, 19, 20 ,3);

/****************** Partie #103 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1225, 1227 ,1229, 1231, 1233, 1235);
EXECUTE Proc_InsererArme(1226, 1228 ,1230, 1232, 1234, 1236);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/16 06:51:59', '2018/02/16 06:52:44', 3, 2, 1, 205, 206, 1225, 1499);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(15468, 20, 21, 19, 20 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(16128, 20, 21, 19, 20 ,3);

/****************** Partie #104 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1237, 1239 ,1241, 1243, 1245, 1247);
EXECUTE Proc_InsererArme(1238, 1240 ,1242, 1244, 1246, 1248);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/16 08:43:44', '2018/02/16 08:44:49', 2, 1, 2, 207, 208, 1534, 1055);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(15312, 20, 21, 19, 20, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(15804, 20, 21, 19, 20 ,2);

/****************** Partie #105 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1249, 1251 ,1253, 1255, 1257, 1259);
EXECUTE Proc_InsererArme(1250, 1252 ,1254, 1256, 1258, 1260);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/16 09:21:21', '2018/02/16 09:21:57', 1, 2, 3, 209, 210, 1612, 1344);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(15968, 20, 21, 19, 20 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(15648, 20, 21, 19, 20, 1);

/****************** Partie #106 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1261, 1263 ,1265, 1267, 1269, 1271);
EXECUTE Proc_InsererArme(1262, 1264 ,1266, 1268, 1270, 1272);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/16 18:06:51', '2018/02/16 18:08:31', 3, 2, 1, 211, 212, 1253, 1523);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(16132, 20, 21, 19, 20 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(16464, 21, 22, 21, 21 ,3);

/****************** Partie #107 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1273, 1275 ,1277, 1279, 1281, 1283);
EXECUTE Proc_InsererArme(1274, 1276 ,1278, 1280, 1282, 1284);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/17 00:54:49', '2018/02/17 00:56:29', 3, 2, 3, 213, 214, 1701, 1385);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(16296, 21, 22, 21, 21 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(16808, 21, 22, 21, 21 ,3);

/****************** Partie #108 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1285, 1287 ,1289, 1291, 1293, 1295);
EXECUTE Proc_InsererArme(1286, 1288 ,1290, 1292, 1294, 1296);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/17 05:21:02', '2018/02/17 05:21:40', 2, 1, 3, 215, 216, 1065, 1962);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(15648, 20, 21, 19, 20, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(16804, 21, 22, 21, 21 ,2);

/****************** Partie #109 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1297, 1299 ,1301, 1303, 1305, 1307);
EXECUTE Proc_InsererArme(1298, 1300 ,1302, 1304, 1306, 1308);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/17 11:17:57', '2018/02/17 11:19:19', 2, 3, 3, 217, 218, 1270, 1281);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(16808, 21, 22, 21, 21 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(17312, 21, 22, 21, 21 ,2);

/****************** Partie #110 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1309, 1311 ,1313, 1315, 1317, 1319);
EXECUTE Proc_InsererArme(1310, 1312 ,1314, 1316, 1318, 1320);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/17 17:04:48', '2018/02/17 17:05:28', 2, 3, 2, 219, 220, 1780, 1127);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(16976, 21, 22, 21, 21 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(17652, 21, 22, 21, 21 ,2);

/****************** Partie #111 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1321, 1323 ,1325, 1327, 1329, 1331);
EXECUTE Proc_InsererArme(1322, 1324 ,1326, 1328, 1330, 1332);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/17 23:25:40', '2018/02/17 23:27:25', 3, 1, 2, 221, 222, 1237, 1931);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(15648, 20, 21, 19, 20, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(17484, 21, 22, 21, 21 ,3);

/****************** Partie #112 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1333, 1335 ,1337, 1339, 1341, 1343);
EXECUTE Proc_InsererArme(1334, 1336 ,1338, 1340, 1342, 1344);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/18 05:10:50', '2018/02/18 05:12:32', 2, 1, 1, 223, 224, 1576, 1790);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(15812, 20, 21, 19, 20, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(17996, 21, 22, 21, 21 ,2);

/****************** Partie #113 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1345, 1347 ,1349, 1351, 1353, 1355);
EXECUTE Proc_InsererArme(1346, 1348 ,1350, 1352, 1354, 1356);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/18 14:02:13', '2018/02/18 14:03:22', 3, 1, 3, 225, 226, 1317, 1511);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(15812, 20, 21, 19, 20, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(17992, 21, 22, 21, 21 ,3);

/****************** Partie #114 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1357, 1359 ,1361, 1363, 1365, 1367);
EXECUTE Proc_InsererArme(1358, 1360 ,1362, 1364, 1366, 1368);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/18 14:47:37', '2018/02/18 14:48:34', 2, 3, 2, 227, 228, 1438, 1963);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(18160, 23, 23, 22, 22 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(18336, 23, 23, 22, 22 ,2);

/****************** Partie #115 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1369, 1371 ,1373, 1375, 1377, 1379);
EXECUTE Proc_InsererArme(1370, 1372 ,1374, 1376, 1378, 1380);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/18 22:33:50', '2018/02/18 22:35:00', 3, 2, 2, 229, 230, 1182, 1758);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(18336, 23, 23, 22, 22 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(18690, 23, 23, 22, 22 ,3);

/****************** Partie #116 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1381, 1383 ,1385, 1387, 1389, 1391);
EXECUTE Proc_InsererArme(1382, 1384 ,1386, 1388, 1390, 1392);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/19 07:39:39', '2018/02/19 07:41:25', 3, 2, 3, 231, 232, 1212, 1686);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(18336, 23, 23, 22, 22 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(19220, 23, 23, 22, 22 ,3);

/****************** Partie #117 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1393, 1395 ,1397, 1399, 1401, 1403);
EXECUTE Proc_InsererArme(1394, 1396 ,1398, 1400, 1402, 1404);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/19 14:06:07', '2018/02/19 14:07:40', 2, 3, 2, 233, 234, 1534, 1799);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(19392, 23, 23, 22, 22 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(18694, 23, 23, 22, 22 ,2);

/****************** Partie #118 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1405, 1407 ,1409, 1411, 1413, 1415);
EXECUTE Proc_InsererArme(1406, 1408 ,1410, 1412, 1414, 1416);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/19 21:37:24', '2018/02/19 21:38:16', 1, 2, 2, 235, 236, 1944, 1476);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(18866, 23, 23, 22, 22 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(16238, 20, 21, 19, 20, 1);

/****************** Partie #119 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1417, 1419 ,1421, 1423, 1425, 1427);
EXECUTE Proc_InsererArme(1418, 1420 ,1422, 1424, 1426, 1428);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/20 00:04:45', '2018/02/20 00:06:11', 2, 3, 2, 237, 238, 1053, 1321);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(19392, 23, 23, 22, 22 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(19396, 23, 23, 22, 22 ,2);

/****************** Partie #120 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1429, 1431 ,1433, 1435, 1437, 1439);
EXECUTE Proc_InsererArme(1430, 1432 ,1434, 1436, 1438, 1440);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/20 02:59:55', '2018/02/20 03:00:39', 3, 2, 2, 239, 240, 1115, 1935);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(19396, 23, 23, 22, 22 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(19922, 23, 23, 22, 22 ,3);

/****************** Partie #121 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1441, 1443 ,1445, 1447, 1449, 1451);
EXECUTE Proc_InsererArme(1442, 1444 ,1446, 1448, 1450, 1452);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/20 10:54:49', '2018/02/20 10:56:31', 3, 1, 3, 241, 242, 1358, 1852);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(16238, 20, 21, 19, 20, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(20452, 24, 24, 23, 24 ,3);

/****************** Partie #122 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1453, 1455 ,1457, 1459, 1461, 1463);
EXECUTE Proc_InsererArme(1454, 1456 ,1458, 1460, 1462, 1464);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/20 21:30:31', '2018/02/20 21:32:09', 2, 1, 3, 243, 244, 1398, 1316);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(16238, 20, 21, 19, 20, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(19926, 23, 23, 22, 22 ,2);

/****************** Partie #123 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1465, 1467 ,1469, 1471, 1473, 1475);
EXECUTE Proc_InsererArme(1466, 1468 ,1470, 1472, 1474, 1476);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/21 07:25:53', '2018/02/21 07:27:38', 1, 2, 3, 245, 246, 1243, 1696);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(20098, 24, 24, 23, 24 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(16664, 21, 22, 21, 21, 1);

/****************** Partie #124 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1477, 1479 ,1481, 1483, 1485, 1487);
EXECUTE Proc_InsererArme(1478, 1480 ,1482, 1484, 1486, 1488);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/21 11:16:41', '2018/02/21 11:17:14', 2, 3, 2, 247, 248, 1454, 1503);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(20452, 24, 24, 23, 24 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(20638, 24, 24, 23, 24 ,2);

/****************** Partie #125 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1489, 1491 ,1493, 1495, 1497, 1499);
EXECUTE Proc_InsererArme(1490, 1492 ,1494, 1496, 1498, 1500);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/21 14:36:59', '2018/02/21 14:38:24', 3, 2, 3, 249, 250, 1296, 1605);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(20814, 24, 24, 23, 24 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(20816, 24, 24, 23, 24 ,3);

/****************** Partie #126 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1501, 1503 ,1505, 1507, 1509, 1511);
EXECUTE Proc_InsererArme(1502, 1504 ,1506, 1508, 1510, 1512);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/22 02:16:00', '2018/02/22 02:17:49', 2, 1, 3, 251, 252, 1651, 1065);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(16832, 21, 22, 21, 21, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(21186, 24, 24, 23, 24 ,2);

/****************** Partie #127 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1513, 1515 ,1517, 1519, 1521, 1523);
EXECUTE Proc_InsererArme(1514, 1516 ,1518, 1520, 1522, 1524);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/22 06:54:32', '2018/02/22 06:56:02', 2, 3, 2, 253, 254, 1406, 1529);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(20816, 24, 24, 23, 24 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(21726, 24, 24, 23, 24 ,2);

/****************** Partie #128 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1525, 1527 ,1529, 1531, 1533, 1535);
EXECUTE Proc_InsererArme(1526, 1528 ,1530, 1532, 1534, 1536);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/22 17:28:50', '2018/02/22 17:30:38', 1, 2, 1, 255, 256, 1920, 1658);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(21902, 24, 24, 23, 24 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(17264, 21, 22, 21, 21, 1);

/****************** Partie #129 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1537, 1539 ,1541, 1543, 1545, 1547);
EXECUTE Proc_InsererArme(1538, 1540 ,1542, 1544, 1546, 1548);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/22 17:51:53', '2018/02/22 17:52:51', 3, 1, 1, 257, 258, 1827, 1058);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(17264, 21, 22, 21, 21, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(21356, 24, 24, 23, 24 ,3);

/****************** Partie #130 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1549, 1551 ,1553, 1555, 1557, 1559);
EXECUTE Proc_InsererArme(1550, 1552 ,1554, 1556, 1558, 1560);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/22 20:04:21', '2018/02/22 20:05:41', 1, 2, 3, 259, 260, 1980, 1573);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22078, 24, 24, 23, 24 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(17696, 21, 22, 21, 21, 1);

/****************** Partie #131 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1561, 1563 ,1565, 1567, 1569, 1571);
EXECUTE Proc_InsererArme(1562, 1564 ,1566, 1568, 1570, 1572);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/22 20:37:01', '2018/02/22 20:38:46', 1, 2, 2, 261, 262, 1140, 1979);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22078, 24, 24, 23, 24 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(18304, 23, 23, 22, 22, 1);

/****************** Partie #132 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1573, 1575 ,1577, 1579, 1581, 1583);
EXECUTE Proc_InsererArme(1574, 1576 ,1578, 1580, 1582, 1584);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/23 07:32:34', '2018/02/23 07:34:00', 2, 1, 1, 263, 264, 1253, 1985);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(18476, 23, 23, 22, 22, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #133 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1585, 1587 ,1589, 1591, 1593, 1595);
EXECUTE Proc_InsererArme(1586, 1588 ,1590, 1592, 1594, 1596);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/23 16:53:55', '2018/02/23 16:55:08', 3, 2, 3, 265, 266, 1169, 1747);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(21820, 24, 24, 23, 24 ,3);

/****************** Partie #134 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1597, 1599 ,1601, 1603, 1605, 1607);
EXECUTE Proc_InsererArme(1598, 1600 ,1602, 1604, 1606, 1608);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/23 22:41:38', '2018/02/23 22:42:51', 2, 1, 1, 267, 268, 1444, 1027);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(18648, 23, 23, 22, 22, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #135 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1609, 1611 ,1613, 1615, 1617, 1619);
EXECUTE Proc_InsererArme(1610, 1612 ,1614, 1616, 1618, 1620);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/24 07:14:53', '2018/02/24 07:16:12', 3, 2, 3, 269, 270, 1632, 1356);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #136 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1621, 1623 ,1625, 1627, 1629, 1631);
EXECUTE Proc_InsererArme(1622, 1624 ,1626, 1628, 1630, 1632);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/24 18:01:29', '2018/02/24 18:02:57', 3, 2, 3, 271, 272, 1116, 1827);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #137 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1633, 1635 ,1637, 1639, 1641, 1643);
EXECUTE Proc_InsererArme(1634, 1636 ,1638, 1640, 1642, 1644);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/24 23:03:37', '2018/02/24 23:04:24', 3, 1, 3, 273, 274, 1363, 1467);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(18820, 23, 23, 22, 22, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #138 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1645, 1647 ,1649, 1651, 1653, 1655);
EXECUTE Proc_InsererArme(1646, 1648 ,1650, 1652, 1654, 1656);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/25 01:54:31', '2018/02/25 01:55:17', 3, 2, 2, 275, 276, 1927, 1645);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #139 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1657, 1659 ,1661, 1663, 1665, 1667);
EXECUTE Proc_InsererArme(1658, 1660 ,1662, 1664, 1666, 1668);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/25 13:07:16', '2018/02/25 13:07:54', 2, 3, 2, 277, 278, 1775, 1535);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #140 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1669, 1671 ,1673, 1675, 1677, 1679);
EXECUTE Proc_InsererArme(1670, 1672 ,1674, 1676, 1678, 1680);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/25 19:20:58', '2018/02/25 19:21:43', 3, 1, 2, 279, 280, 1876, 1590);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(18820, 23, 23, 22, 22, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #141 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1681, 1683 ,1685, 1687, 1689, 1691);
EXECUTE Proc_InsererArme(1682, 1684 ,1686, 1688, 1690, 1692);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/25 22:45:51', '2018/02/25 22:46:24', 1, 3, 3, 281, 282, 1905, 1632);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(19274, 23, 23, 22, 22, 1);

/****************** Partie #142 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1693, 1695 ,1697, 1699, 1701, 1703);
EXECUTE Proc_InsererArme(1694, 1696 ,1698, 1700, 1702, 1704);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/26 04:49:43', '2018/02/26 04:50:46', 2, 3, 3, 283, 284, 1718, 1830);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #143 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1705, 1707 ,1709, 1711, 1713, 1715);
EXECUTE Proc_InsererArme(1706, 1708 ,1710, 1712, 1714, 1716);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/26 12:04:18', '2018/02/26 12:05:59', 1, 3, 3, 285, 286, 1357, 1831);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(19728, 23, 23, 22, 22, 1);

/****************** Partie #144 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1717, 1719 ,1721, 1723, 1725, 1727);
EXECUTE Proc_InsererArme(1718, 1720 ,1722, 1724, 1726, 1728);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/26 22:25:53', '2018/02/26 22:27:13', 1, 3, 2, 287, 288, 1527, 1703);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(20358, 24, 24, 23, 24, 1);

/****************** Partie #145 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1729, 1731 ,1733, 1735, 1737, 1739);
EXECUTE Proc_InsererArme(1730, 1732 ,1734, 1736, 1738, 1740);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/27 10:03:23', '2018/02/27 10:04:39', 3, 1, 2, 289, 290, 1476, 1149);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(20534, 24, 24, 23, 24, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #146 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1741, 1743 ,1745, 1747, 1749, 1751);
EXECUTE Proc_InsererArme(1742, 1744 ,1746, 1748, 1750, 1752);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/27 19:10:21', '2018/02/27 19:12:06', 3, 2, 1, 291, 292, 1453, 1708);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #147 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1753, 1755 ,1757, 1759, 1761, 1763);
EXECUTE Proc_InsererArme(1754, 1756 ,1758, 1760, 1762, 1764);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/27 21:05:58', '2018/02/27 21:07:32', 2, 3, 1, 293, 294, 1311, 1350);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #148 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1765, 1767 ,1769, 1771, 1773, 1775);
EXECUTE Proc_InsererArme(1766, 1768 ,1770, 1772, 1774, 1776);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/28 01:59:23', '2018/02/28 02:00:49', 3, 2, 2, 295, 296, 1309, 1625);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #149 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1777, 1779 ,1781, 1783, 1785, 1787);
EXECUTE Proc_InsererArme(1778, 1780 ,1782, 1784, 1786, 1788);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/28 05:46:16', '2018/02/28 05:47:53', 1, 2, 2, 297, 298, 1403, 1396);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(20998, 24, 24, 23, 24, 1);

/****************** Partie #150 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1789, 1791 ,1793, 1795, 1797, 1799);
EXECUTE Proc_InsererArme(1790, 1792 ,1794, 1796, 1798, 1800);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/28 07:42:58', '2018/02/28 07:43:56', 2, 1, 1, 299, 300, 1891, 1393);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(21174, 24, 24, 23, 24, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #151 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1801, 1803 ,1805, 1807, 1809, 1811);
EXECUTE Proc_InsererArme(1802, 1804 ,1806, 1808, 1810, 1812);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/28 14:27:29', '2018/02/28 14:28:21', 2, 1, 1, 301, 302, 1373, 1738);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(21174, 24, 24, 23, 24, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #152 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1813, 1815 ,1817, 1819, 1821, 1823);
EXECUTE Proc_InsererArme(1814, 1816 ,1818, 1820, 1822, 1824);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/28 15:45:08', '2018/02/28 15:46:51', 2, 3, 2, 303, 304, 1170, 1161);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #153 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1825, 1827 ,1829, 1831, 1833, 1835);
EXECUTE Proc_InsererArme(1826, 1828 ,1830, 1832, 1834, 1836);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/02/28 18:12:48', '2018/02/28 18:13:32', 3, 2, 3, 305, 306, 1473, 1022);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #154 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1837, 1839 ,1841, 1843, 1845, 1847);
EXECUTE Proc_InsererArme(1838, 1840 ,1842, 1844, 1846, 1848);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/01 01:54:33', '2018/03/01 01:56:20', 1, 2, 1, 307, 308, 1767, 1943);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(21814, 24, 24, 23, 24, 1);

/****************** Partie #155 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1849, 1851 ,1853, 1855, 1857, 1859);
EXECUTE Proc_InsererArme(1850, 1852 ,1854, 1856, 1858, 1860);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/01 11:21:27', '2018/03/01 11:22:53', 1, 2, 3, 309, 310, 1923, 1614);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #156 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1861, 1863 ,1865, 1867, 1869, 1871);
EXECUTE Proc_InsererArme(1862, 1864 ,1866, 1868, 1870, 1872);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/01 13:30:48', '2018/03/01 13:32:22', 1, 3, 1, 311, 312, 1620, 1241);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #157 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1873, 1875 ,1877, 1879, 1881, 1883);
EXECUTE Proc_InsererArme(1874, 1876 ,1878, 1880, 1882, 1884);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/01 19:25:10', '2018/03/01 19:26:18', 2, 3, 3, 313, 314, 1807, 1774);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #158 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1885, 1887 ,1889, 1891, 1893, 1895);
EXECUTE Proc_InsererArme(1886, 1888 ,1890, 1892, 1894, 1896);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/01 22:57:07', '2018/03/01 22:58:35', 2, 1, 3, 315, 316, 1357, 1686);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #159 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1897, 1899 ,1901, 1903, 1905, 1907);
EXECUTE Proc_InsererArme(1898, 1900 ,1902, 1904, 1906, 1908);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/02 03:53:00', '2018/03/02 03:54:08', 1, 3, 2, 317, 318, 1465, 1301);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #160 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1909, 1911 ,1913, 1915, 1917, 1919);
EXECUTE Proc_InsererArme(1910, 1912 ,1914, 1916, 1918, 1920);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/02 13:56:16', '2018/03/02 13:56:56', 1, 3, 1, 319, 320, 1742, 1384);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #161 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1921, 1923 ,1925, 1927, 1929, 1931);
EXECUTE Proc_InsererArme(1922, 1924 ,1926, 1928, 1930, 1932);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/02 21:04:30', '2018/03/02 21:05:16', 1, 3, 3, 321, 322, 1261, 1478);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #162 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1933, 1935 ,1937, 1939, 1941, 1943);
EXECUTE Proc_InsererArme(1934, 1936 ,1938, 1940, 1942, 1944);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/02 21:30:57', '2018/03/02 21:31:29', 3, 1, 2, 323, 324, 1393, 1115);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #163 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1945, 1947 ,1949, 1951, 1953, 1955);
EXECUTE Proc_InsererArme(1946, 1948 ,1950, 1952, 1954, 1956);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/02 23:07:24', '2018/03/02 23:08:53', 1, 2, 2, 325, 326, 1333, 1947);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #164 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1957, 1959 ,1961, 1963, 1965, 1967);
EXECUTE Proc_InsererArme(1958, 1960 ,1962, 1964, 1966, 1968);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/03 10:36:39', '2018/03/03 10:38:03', 3, 1, 2, 327, 328, 1310, 1193);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #165 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1969, 1971 ,1973, 1975, 1977, 1979);
EXECUTE Proc_InsererArme(1970, 1972 ,1974, 1976, 1978, 1980);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/03 10:46:54', '2018/03/03 10:47:45', 1, 3, 2, 329, 330, 1540, 1051);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #166 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1981, 1983 ,1985, 1987, 1989, 1991);
EXECUTE Proc_InsererArme(1982, 1984 ,1986, 1988, 1990, 1992);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/03 20:53:36', '2018/03/03 20:54:28', 3, 1, 3, 331, 332, 1132, 1741);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #167 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(1993, 1995 ,1997, 1999, 2001, 2003);
EXECUTE Proc_InsererArme(1994, 1996 ,1998, 2000, 2002, 2004);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/04 04:42:30', '2018/03/04 04:43:26', 1, 2, 2, 333, 334, 1092, 1780);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #168 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2005, 2007 ,2009, 2011, 2013, 2015);
EXECUTE Proc_InsererArme(2006, 2008 ,2010, 2012, 2014, 2016);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/04 08:26:17', '2018/03/04 08:26:56', 3, 2, 1, 335, 336, 1781, 1696);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #169 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2017, 2019 ,2021, 2023, 2025, 2027);
EXECUTE Proc_InsererArme(2018, 2020 ,2022, 2024, 2026, 2028);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/04 18:58:30', '2018/03/04 19:00:08', 1, 3, 3, 337, 338, 1622, 1352);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #170 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2029, 2031 ,2033, 2035, 2037, 2039);
EXECUTE Proc_InsererArme(2030, 2032 ,2034, 2036, 2038, 2040);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/05 02:51:38', '2018/03/05 02:52:23', 3, 1, 1, 339, 340, 1980, 1573);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #171 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2041, 2043 ,2045, 2047, 2049, 2051);
EXECUTE Proc_InsererArme(2042, 2044 ,2046, 2048, 2050, 2052);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/05 03:05:46', '2018/03/05 03:06:49', 2, 1, 1, 341, 342, 1286, 1548);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #172 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2053, 2055 ,2057, 2059, 2061, 2063);
EXECUTE Proc_InsererArme(2054, 2056 ,2058, 2060, 2062, 2064);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/05 09:29:05', '2018/03/05 09:30:15', 2, 3, 3, 343, 344, 1404, 1867);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #173 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2065, 2067 ,2069, 2071, 2073, 2075);
EXECUTE Proc_InsererArme(2066, 2068 ,2070, 2072, 2074, 2076);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/05 12:25:00', '2018/03/05 12:26:32', 1, 3, 1, 345, 346, 1109, 1832);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #174 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2077, 2079 ,2081, 2083, 2085, 2087);
EXECUTE Proc_InsererArme(2078, 2080 ,2082, 2084, 2086, 2088);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/05 23:29:37', '2018/03/05 23:30:13', 3, 2, 1, 347, 348, 1351, 1890);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #175 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2089, 2091 ,2093, 2095, 2097, 2099);
EXECUTE Proc_InsererArme(2090, 2092 ,2094, 2096, 2098, 2100);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/06 07:26:08', '2018/03/06 07:27:14', 2, 1, 2, 349, 350, 1061, 1672);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #176 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2101, 2103 ,2105, 2107, 2109, 2111);
EXECUTE Proc_InsererArme(2102, 2104 ,2106, 2108, 2110, 2112);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/06 14:57:53', '2018/03/06 14:59:33', 3, 1, 2, 351, 352, 1611, 1277);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #177 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2113, 2115 ,2117, 2119, 2121, 2123);
EXECUTE Proc_InsererArme(2114, 2116 ,2118, 2120, 2122, 2124);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/06 22:43:42', '2018/03/06 22:44:30', 3, 2, 3, 353, 354, 1251, 1240);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #178 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2125, 2127 ,2129, 2131, 2133, 2135);
EXECUTE Proc_InsererArme(2126, 2128 ,2130, 2132, 2134, 2136);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/07 05:13:34', '2018/03/07 05:14:42', 2, 1, 3, 355, 356, 1765, 1225);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #179 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2137, 2139 ,2141, 2143, 2145, 2147);
EXECUTE Proc_InsererArme(2138, 2140 ,2142, 2144, 2146, 2148);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/07 16:57:39', '2018/03/07 16:58:17', 3, 2, 2, 357, 358, 1383, 1723);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #180 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2149, 2151 ,2153, 2155, 2157, 2159);
EXECUTE Proc_InsererArme(2150, 2152 ,2154, 2156, 2158, 2160);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/07 20:29:53', '2018/03/07 20:31:12', 2, 3, 3, 359, 360, 1153, 1924);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #181 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2161, 2163 ,2165, 2167, 2169, 2171);
EXECUTE Proc_InsererArme(2162, 2164 ,2166, 2168, 2170, 2172);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/08 06:17:04', '2018/03/08 06:18:24', 1, 3, 2, 361, 362, 1922, 1072);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #182 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2173, 2175 ,2177, 2179, 2181, 2183);
EXECUTE Proc_InsererArme(2174, 2176 ,2178, 2180, 2182, 2184);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/08 07:04:43', '2018/03/08 07:05:50', 3, 2, 3, 363, 364, 1546, 1611);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #183 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2185, 2187 ,2189, 2191, 2193, 2195);
EXECUTE Proc_InsererArme(2186, 2188 ,2190, 2192, 2194, 2196);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/08 08:43:30', '2018/03/08 08:44:08', 3, 2, 1, 365, 366, 1460, 1341);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #184 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2197, 2199 ,2201, 2203, 2205, 2207);
EXECUTE Proc_InsererArme(2198, 2200 ,2202, 2204, 2206, 2208);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/08 13:03:19', '2018/03/08 13:04:13', 1, 2, 1, 367, 368, 1035, 1355);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #185 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2209, 2211 ,2213, 2215, 2217, 2219);
EXECUTE Proc_InsererArme(2210, 2212 ,2214, 2216, 2218, 2220);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/08 18:04:20', '2018/03/08 18:05:23', 1, 2, 3, 369, 370, 1724, 1538);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #186 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2221, 2223 ,2225, 2227, 2229, 2231);
EXECUTE Proc_InsererArme(2222, 2224 ,2226, 2228, 2230, 2232);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/09 05:10:23', '2018/03/09 05:11:50', 2, 3, 1, 371, 372, 1162, 1114);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #187 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2233, 2235 ,2237, 2239, 2241, 2243);
EXECUTE Proc_InsererArme(2234, 2236 ,2238, 2240, 2242, 2244);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/09 08:32:17', '2018/03/09 08:33:37', 2, 1, 3, 373, 374, 1387, 1333);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #188 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2245, 2247 ,2249, 2251, 2253, 2255);
EXECUTE Proc_InsererArme(2246, 2248 ,2250, 2252, 2254, 2256);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/09 11:03:53', '2018/03/09 11:04:57', 1, 2, 3, 375, 376, 1671, 1945);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #189 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2257, 2259 ,2261, 2263, 2265, 2267);
EXECUTE Proc_InsererArme(2258, 2260 ,2262, 2264, 2266, 2268);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/09 19:40:47', '2018/03/09 19:41:45', 1, 2, 1, 377, 378, 1463, 1292);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #190 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2269, 2271 ,2273, 2275, 2277, 2279);
EXECUTE Proc_InsererArme(2270, 2272 ,2274, 2276, 2278, 2280);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/10 00:55:36', '2018/03/10 00:57:07', 2, 3, 1, 379, 380, 1025, 1892);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #191 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2281, 2283 ,2285, 2287, 2289, 2291);
EXECUTE Proc_InsererArme(2282, 2284 ,2286, 2288, 2290, 2292);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/10 02:21:32', '2018/03/10 02:22:17', 1, 3, 1, 381, 382, 1179, 1452);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #192 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2293, 2295 ,2297, 2299, 2301, 2303);
EXECUTE Proc_InsererArme(2294, 2296 ,2298, 2300, 2302, 2304);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/10 03:20:55', '2018/03/10 03:22:28', 3, 2, 3, 383, 384, 1683, 1316);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #193 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2305, 2307 ,2309, 2311, 2313, 2315);
EXECUTE Proc_InsererArme(2306, 2308 ,2310, 2312, 2314, 2316);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/10 09:21:08', '2018/03/10 09:22:39', 2, 3, 1, 385, 386, 1832, 1206);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #194 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2317, 2319 ,2321, 2323, 2325, 2327);
EXECUTE Proc_InsererArme(2318, 2320 ,2322, 2324, 2326, 2328);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/10 16:39:28', '2018/03/10 16:41:16', 3, 2, 2, 387, 388, 1574, 1367);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #195 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2329, 2331 ,2333, 2335, 2337, 2339);
EXECUTE Proc_InsererArme(2330, 2332 ,2334, 2336, 2338, 2340);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/10 18:49:56', '2018/03/10 18:50:42', 3, 1, 2, 389, 390, 1782, 1519);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #196 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2341, 2343 ,2345, 2347, 2349, 2351);
EXECUTE Proc_InsererArme(2342, 2344 ,2346, 2348, 2350, 2352);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/10 21:45:25', '2018/03/10 21:46:48', 3, 1, 3, 391, 392, 1008, 1065);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #197 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2353, 2355 ,2357, 2359, 2361, 2363);
EXECUTE Proc_InsererArme(2354, 2356 ,2358, 2360, 2362, 2364);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/11 01:19:33', '2018/03/11 01:20:26', 1, 3, 1, 393, 394, 1956, 1769);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #198 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2365, 2367 ,2369, 2371, 2373, 2375);
EXECUTE Proc_InsererArme(2366, 2368 ,2370, 2372, 2374, 2376);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/11 11:59:35', '2018/03/11 12:00:11', 3, 2, 1, 395, 396, 1051, 1865);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #199 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2377, 2379 ,2381, 2383, 2385, 2387);
EXECUTE Proc_InsererArme(2378, 2380 ,2382, 2384, 2386, 2388);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/11 19:05:02', '2018/03/11 19:06:03', 3, 1, 1, 397, 398, 1271, 1713);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #200 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2389, 2391 ,2393, 2395, 2397, 2399);
EXECUTE Proc_InsererArme(2390, 2392 ,2394, 2396, 2398, 2400);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/11 19:33:59', '2018/03/11 19:34:46', 3, 2, 2, 399, 400, 1591, 1347);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #201 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2401, 2403 ,2405, 2407, 2409, 2411);
EXECUTE Proc_InsererArme(2402, 2404 ,2406, 2408, 2410, 2412);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/11 20:12:29', '2018/03/11 20:13:02', 1, 2, 1, 401, 402, 1958, 1694);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #202 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2413, 2415 ,2417, 2419, 2421, 2423);
EXECUTE Proc_InsererArme(2414, 2416 ,2418, 2420, 2422, 2424);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/12 03:48:17', '2018/03/12 03:49:32', 2, 1, 3, 403, 404, 1702, 1645);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #203 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2425, 2427 ,2429, 2431, 2433, 2435);
EXECUTE Proc_InsererArme(2426, 2428 ,2430, 2432, 2434, 2436);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/12 11:11:25', '2018/03/12 11:11:59', 2, 3, 2, 405, 406, 1768, 1267);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #204 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2437, 2439 ,2441, 2443, 2445, 2447);
EXECUTE Proc_InsererArme(2438, 2440 ,2442, 2444, 2446, 2448);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/12 20:06:04', '2018/03/12 20:07:19', 1, 3, 2, 407, 408, 1902, 1322);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #205 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2449, 2451 ,2453, 2455, 2457, 2459);
EXECUTE Proc_InsererArme(2450, 2452 ,2454, 2456, 2458, 2460);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/13 01:22:41', '2018/03/13 01:24:01', 3, 2, 2, 409, 410, 1436, 1034);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #206 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2461, 2463 ,2465, 2467, 2469, 2471);
EXECUTE Proc_InsererArme(2462, 2464 ,2466, 2468, 2470, 2472);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/13 11:13:06', '2018/03/13 11:14:02', 3, 2, 1, 411, 412, 1867, 1168);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #207 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2473, 2475 ,2477, 2479, 2481, 2483);
EXECUTE Proc_InsererArme(2474, 2476 ,2478, 2480, 2482, 2484);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/13 15:22:06', '2018/03/13 15:22:50', 2, 1, 3, 413, 414, 1810, 1002);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #208 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2485, 2487 ,2489, 2491, 2493, 2495);
EXECUTE Proc_InsererArme(2486, 2488 ,2490, 2492, 2494, 2496);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/14 00:16:11', '2018/03/14 00:17:03', 2, 1, 2, 415, 416, 1506, 1245);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #209 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2497, 2499 ,2501, 2503, 2505, 2507);
EXECUTE Proc_InsererArme(2498, 2500 ,2502, 2504, 2506, 2508);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/14 10:49:46', '2018/03/14 10:51:12', 3, 1, 1, 417, 418, 1422, 1972);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #210 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2509, 2511 ,2513, 2515, 2517, 2519);
EXECUTE Proc_InsererArme(2510, 2512 ,2514, 2516, 2518, 2520);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/14 13:49:44', '2018/03/14 13:51:07', 3, 1, 2, 419, 420, 1592, 1671);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #211 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2521, 2523 ,2525, 2527, 2529, 2531);
EXECUTE Proc_InsererArme(2522, 2524 ,2526, 2528, 2530, 2532);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/14 16:12:35', '2018/03/14 16:13:41', 3, 2, 2, 421, 422, 1304, 1702);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #212 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2533, 2535 ,2537, 2539, 2541, 2543);
EXECUTE Proc_InsererArme(2534, 2536 ,2538, 2540, 2542, 2544);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/14 17:34:04', '2018/03/14 17:35:10', 2, 1, 1, 423, 424, 1183, 1869);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #213 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2545, 2547 ,2549, 2551, 2553, 2555);
EXECUTE Proc_InsererArme(2546, 2548 ,2550, 2552, 2554, 2556);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/14 19:03:10', '2018/03/14 19:04:07', 2, 1, 2, 425, 426, 1615, 1422);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #214 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2557, 2559 ,2561, 2563, 2565, 2567);
EXECUTE Proc_InsererArme(2558, 2560 ,2562, 2564, 2566, 2568);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/15 05:08:37', '2018/03/15 05:09:56', 1, 2, 2, 427, 428, 1331, 1383);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #215 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2569, 2571 ,2573, 2575, 2577, 2579);
EXECUTE Proc_InsererArme(2570, 2572 ,2574, 2576, 2578, 2580);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/15 16:29:36', '2018/03/15 16:31:18', 3, 1, 2, 429, 430, 1129, 1110);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #216 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2581, 2583 ,2585, 2587, 2589, 2591);
EXECUTE Proc_InsererArme(2582, 2584 ,2586, 2588, 2590, 2592);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/15 21:48:33', '2018/03/15 21:49:52', 3, 2, 1, 431, 432, 1442, 1065);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #217 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2593, 2595 ,2597, 2599, 2601, 2603);
EXECUTE Proc_InsererArme(2594, 2596 ,2598, 2600, 2602, 2604);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/15 23:44:13', '2018/03/15 23:45:34', 2, 3, 1, 433, 434, 1399, 1935);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #218 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2605, 2607 ,2609, 2611, 2613, 2615);
EXECUTE Proc_InsererArme(2606, 2608 ,2610, 2612, 2614, 2616);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/16 10:00:02', '2018/03/16 10:01:45', 3, 1, 2, 435, 436, 1182, 1168);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #219 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2617, 2619 ,2621, 2623, 2625, 2627);
EXECUTE Proc_InsererArme(2618, 2620 ,2622, 2624, 2626, 2628);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/16 12:03:05', '2018/03/16 12:04:35', 1, 3, 3, 437, 438, 1135, 1969);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #220 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2629, 2631 ,2633, 2635, 2637, 2639);
EXECUTE Proc_InsererArme(2630, 2632 ,2634, 2636, 2638, 2640);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/16 15:51:11', '2018/03/16 15:52:42', 1, 3, 2, 439, 440, 1184, 1162);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #221 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2641, 2643 ,2645, 2647, 2649, 2651);
EXECUTE Proc_InsererArme(2642, 2644 ,2646, 2648, 2650, 2652);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/17 01:01:59', '2018/03/17 01:02:43', 1, 2, 1, 441, 442, 1730, 1610);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #222 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2653, 2655 ,2657, 2659, 2661, 2663);
EXECUTE Proc_InsererArme(2654, 2656 ,2658, 2660, 2662, 2664);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/17 10:09:34', '2018/03/17 10:10:55', 2, 1, 3, 443, 444, 1569, 1767);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #223 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2665, 2667 ,2669, 2671, 2673, 2675);
EXECUTE Proc_InsererArme(2666, 2668 ,2670, 2672, 2674, 2676);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/17 18:21:53', '2018/03/17 18:23:02', 1, 3, 2, 445, 446, 1152, 1643);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #224 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2677, 2679 ,2681, 2683, 2685, 2687);
EXECUTE Proc_InsererArme(2678, 2680 ,2682, 2684, 2686, 2688);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/17 23:08:06', '2018/03/17 23:08:41', 2, 3, 1, 447, 448, 1711, 1626);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #225 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2689, 2691 ,2693, 2695, 2697, 2699);
EXECUTE Proc_InsererArme(2690, 2692 ,2694, 2696, 2698, 2700);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/17 23:13:09', '2018/03/17 23:14:48', 3, 2, 1, 449, 450, 1971, 1325);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #226 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2701, 2703 ,2705, 2707, 2709, 2711);
EXECUTE Proc_InsererArme(2702, 2704 ,2706, 2708, 2710, 2712);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/18 08:29:06', '2018/03/18 08:30:51', 3, 1, 3, 451, 452, 1317, 1876);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #227 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2713, 2715 ,2717, 2719, 2721, 2723);
EXECUTE Proc_InsererArme(2714, 2716 ,2718, 2720, 2722, 2724);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/18 18:16:12', '2018/03/18 18:18:00', 2, 3, 3, 453, 454, 1619, 1828);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #228 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2725, 2727 ,2729, 2731, 2733, 2735);
EXECUTE Proc_InsererArme(2726, 2728 ,2730, 2732, 2734, 2736);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/18 19:28:31', '2018/03/18 19:29:55', 2, 1, 1, 455, 456, 1352, 1320);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #229 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2737, 2739 ,2741, 2743, 2745, 2747);
EXECUTE Proc_InsererArme(2738, 2740 ,2742, 2744, 2746, 2748);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/19 02:41:20', '2018/03/19 02:42:09', 1, 2, 3, 457, 458, 1003, 1984);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #230 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2749, 2751 ,2753, 2755, 2757, 2759);
EXECUTE Proc_InsererArme(2750, 2752 ,2754, 2756, 2758, 2760);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/19 11:42:50', '2018/03/19 11:44:10', 1, 2, 1, 459, 460, 1097, 1267);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #231 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2761, 2763 ,2765, 2767, 2769, 2771);
EXECUTE Proc_InsererArme(2762, 2764 ,2766, 2768, 2770, 2772);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/19 21:07:26', '2018/03/19 21:08:50', 2, 3, 3, 461, 462, 1847, 1461);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #232 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2773, 2775 ,2777, 2779, 2781, 2783);
EXECUTE Proc_InsererArme(2774, 2776 ,2778, 2780, 2782, 2784);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/19 23:25:49', '2018/03/19 23:26:28', 3, 2, 3, 463, 464, 1205, 1650);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #233 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2785, 2787 ,2789, 2791, 2793, 2795);
EXECUTE Proc_InsererArme(2786, 2788 ,2790, 2792, 2794, 2796);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/20 02:52:40', '2018/03/20 02:53:17', 2, 1, 3, 465, 466, 1865, 1237);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #234 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,2 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2797, 2799 ,2801, 2803, 2805, 2807);
EXECUTE Proc_InsererArme(2798, 2800 ,2802, 2804, 2806, 2808);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/20 06:01:57', '2018/03/20 06:03:02', 3, 1, 1, 467, 468, 1901, 1655);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #235 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2809, 2811 ,2813, 2815, 2817, 2819);
EXECUTE Proc_InsererArme(2810, 2812 ,2814, 2816, 2818, 2820);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/20 08:08:59', '2018/03/20 08:10:24', 1, 2, 3, 469, 470, 1643, 1566);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #236 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2821, 2823 ,2825, 2827, 2829, 2831);
EXECUTE Proc_InsererArme(2822, 2824 ,2826, 2828, 2830, 2832);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/20 10:23:46', '2018/03/20 10:24:16', 1, 2, 3, 471, 472, 1699, 1103);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #237 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2833, 2835 ,2837, 2839, 2841, 2843);
EXECUTE Proc_InsererArme(2834, 2836 ,2838, 2840, 2842, 2844);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/20 15:01:01', '2018/03/20 15:02:26', 1, 2, 2, 473, 474, 1275, 1093);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #238 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2845, 2847 ,2849, 2851, 2853, 2855);
EXECUTE Proc_InsererArme(2846, 2848 ,2850, 2852, 2854, 2856);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/20 21:05:54', '2018/03/20 21:06:42', 2, 1, 1, 475, 476, 1363, 1081);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #239 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2857, 2859 ,2861, 2863, 2865, 2867);
EXECUTE Proc_InsererArme(2858, 2860 ,2862, 2864, 2866, 2868);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/21 03:59:59', '2018/03/21 04:01:43', 2, 1, 2, 477, 478, 1877, 1978);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #240 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2869, 2871 ,2873, 2875, 2877, 2879);
EXECUTE Proc_InsererArme(2870, 2872 ,2874, 2876, 2878, 2880);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/21 08:16:06', '2018/03/21 08:17:03', 1, 3, 2, 479, 480, 1527, 1423);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #241 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2881, 2883 ,2885, 2887, 2889, 2891);
EXECUTE Proc_InsererArme(2882, 2884 ,2886, 2888, 2890, 2892);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/21 19:27:30', '2018/03/21 19:28:09', 3, 1, 2, 481, 482, 1869, 1063);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #242 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2893, 2895 ,2897, 2899, 2901, 2903);
EXECUTE Proc_InsererArme(2894, 2896 ,2898, 2900, 2902, 2904);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/22 00:02:36', '2018/03/22 00:04:08', 1, 3, 2, 483, 484, 1121, 1212);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #243 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2905, 2907 ,2909, 2911, 2913, 2915);
EXECUTE Proc_InsererArme(2906, 2908 ,2910, 2912, 2914, 2916);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/22 09:36:54', '2018/03/22 09:37:52', 2, 3, 2, 485, 486, 1980, 1116);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #244 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2917, 2919 ,2921, 2923, 2925, 2927);
EXECUTE Proc_InsererArme(2918, 2920 ,2922, 2924, 2926, 2928);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/22 12:32:44', '2018/03/22 12:33:26', 3, 2, 1, 487, 488, 1019, 1584);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #245 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(5 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2929, 2931 ,2933, 2935, 2937, 2939);
EXECUTE Proc_InsererArme(2930, 2932 ,2934, 2936, 2938, 2940);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/22 15:01:27', '2018/03/22 15:02:49', 2, 3, 3, 489, 490, 1519, 1799);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #246 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2941, 2943 ,2945, 2947, 2949, 2951);
EXECUTE Proc_InsererArme(2942, 2944 ,2946, 2948, 2950, 2952);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/22 19:24:44', '2018/03/22 19:25:25', 2, 3, 1, 491, 492, 1867, 1603);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #247 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#1*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2953, 2955 ,2957, 2959, 2961, 2963);
EXECUTE Proc_InsererArme(2954, 2956 ,2958, 2960, 2962, 2964);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/23 06:04:33', '2018/03/23 06:06:09', 3, 1, 1, 493, 494, 1848, 1802);

/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);

/****************** Partie #248 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#2 ET PERDANT#3*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,2);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,2 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(10 ,1 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(6 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2965, 2967 ,2969, 2971, 2973, 2975);
EXECUTE Proc_InsererArme(2966, 2968 ,2970, 2972, 2974, 2976);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/23 10:58:25', '2018/03/23 10:59:47', 2, 3, 2, 495, 496, 1830, 1696);

/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);

/****************** Partie #249 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#1 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,1 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(8 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2977, 2979 ,2981, 2983, 2985, 2987);
EXECUTE Proc_InsererArme(2978, 2980 ,2982, 2984, 2986, 2988);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/23 21:19:44', '2018/03/23 21:20:51', 1, 2, 3, 497, 498, 2000, 1154);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur1*/
EXECUTE Proc_UpdateJoueur(22100,25, 25, 25, 25, 1);

/****************** Partie #250 ***********************/ 
/*Creation random des tires pour les joueurs GAGNANT#3 ET PERDANT#2*/ 

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,1 ,3);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,3 ,1);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(0 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(4 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(7 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(9 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(1 ,0 ,0);

/*GAGNANT*/ 
EXECUTE Proc_InsererCoupJoueur(2 ,0 ,0);

/*PERDANT*/ 
EXECUTE Proc_InsererCoupJoueur(3 ,0 ,0);

/*Insertion dans les tables armes*/
EXECUTE Proc_InsererArme(2989, 2991 ,2993, 2995, 2997, 2999);
EXECUTE Proc_InsererArme(2990, 2992 ,2994, 2996, 2998, 3000);

/*Insertion dans la table partie*/
EXECUTE Proc_InsererPartie('2018/03/23 23:19:39', '2018/03/23 23:21:12', 3, 2, 1, 499, 500, 1097, 1019);

/*Update Joueur2*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,2);
/*Update Joueur3*/
EXECUTE Proc_UpdateJoueur(22100, 25, 25, 25, 25 ,3);
