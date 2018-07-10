select * from joueur;

select * from partie;

select to_char(PAR_DATE_DEBUT,'yyyy/mm/dd hh24:mi:ss') , par_id 'perdant' from partie;

DELETE FROM JOUEUR WHERE JOU_NOM = 'davvv';


SELECT * 
FROM PARTIE 
INNER JOIN joueur ON joueur.jou_id = PARTIE.PAR_ID_JOUEUR_PERDANT
INNER JOIN joueur ON joueur.jou_id = PARTIE.PAR_ID_JOUEUR_GAGNANT
WHERE PAR_ID_JOUEUR_GAGNANT= 1 OR PAR_ID_JOUEUR_PERDANT= 1 
ORDER BY PAR_ID;


SELECT P.PAR_ID,PAR_ID_NIVEAU_JOUE,PAR_DATE_DEBUT,PAR_DATE_FIN,PAR_DISTANCE_PERDANT,PAR_DISTANCE_GAGNANT, J.jou_nom "perdant",J.jou_experience "ExpADv",G.jou_nom "gagnant"
FROM
  PARTIE P
  INNER JOIN joueur J 
ON J.jou_id = P.PAR_ID_JOUEUR_PERDANT
  INNER JOIN joueur G
ON G.jou_id = P.PAR_ID_JOUEUR_GAGNANT
  WHERE PAR_ID_JOUEUR_GAGNANT= 1 OR PAR_ID_JOUEUR_PERDANT= 1;



SELECT * FROM PARTIE WHERE PAR_ID_JOUEUR_GAGNANT= 1 OR PAR_ID_JOUEUR_PERDANT= 1 ORDER BY PAR_ID;












SELECT P.PAR_ID,PAR_ID_NIVEAU_JOUE,to_char(PAR_DATE_DEBUT,'yyyy/mm/dd hh24:mi:ss') "PAR_DATE_DEBUT" ,PAR_DATE_FIN,PAR_DISTANCE_PERDANT,PAR_DISTANCE_GAGNANT,PAR_ID_JOUEUR_GAGNANT,PAR_ID_JOUEUR_PERDANT, J.jou_nom "perdant" ,G.jou_nom "gagnant"
                                                FROM
												PARTIE P
												INNER JOIN joueur J 
												ON J.jou_id = P.PAR_ID_JOUEUR_PERDANT
												INNER JOIN joueur G
												ON G.jou_id = P.PAR_ID_JOUEUR_GAGNANT
												WHERE PAR_ID_JOUEUR_GAGNANT= 1 OR PAR_ID_JOUEUR_PERDANT= 1;
                                                
                                                
                                                
                                                
DELETE FROM JOUEUR WHERE JOU_NOM = 'player1';