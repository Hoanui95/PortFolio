-- ARME EFFICACE POUR UN JOUEUR (JOUEUR ID = 1) ALL PARTIES
SELECT * FROM partie 
    INNER JOIN arme 
        ON partie.PAR_ID_ARME_GAGNANT = arme.ARM_ID 
        OR partie.PAR_ID_ARME_PERDANT = arme.ARM_ID
    INNER JOIN coup_joueur 
    ON arme.ARM_ID_CANON = coup_joueur.COU_ID 
    OR arme.ARM_ID_MITRAILLETTE = coup_joueur.COU_ID
    OR arme.ARM_ID_GRENADE = coup_joueur.COU_ID
    OR arme.ARM_ID_POMPE = coup_joueur.COU_ID
    OR arme.ARM_ID_PIEGE = coup_joueur.COU_ID
    OR arme.ARM_ID_MISSILLE = coup_joueur.COU_ID
WHERE coup_joueur.COU_TOTALCOUP <> 0
AND (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1') 
OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1'))
ORDER BY (coup_joueur.COU_COUPATTEINCIBLE/coup_joueur.COU_TOTALCOUP)  DESC FETCH FIRST 1 ROWS ONLY;

-- ARME PRÉFÉRÉ POUR UN JOUEUR (JOUEUR ID = 1) ALL PARTIES
SELECT * FROM 
(SELECT COUNT(*) as CANON FROM partie 
    INNER JOIN arme 
        ON partie.PAR_ID_ARME_GAGNANT = arme.ARM_ID 
        OR partie.PAR_ID_ARME_PERDANT = arme.ARM_ID
    INNER JOIN coup_joueur 
     ON arme.ARM_ID_CANON = coup_joueur.COU_ID
WHERE coup_joueur.COU_TOTALCOUP <> 0
AND (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1') 
OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1'))
ORDER BY coup_joueur.COU_TOTALCOUP  DESC),
(SELECT COUNT(*) as MITRAILLETTE FROM partie 
    INNER JOIN arme 
        ON partie.PAR_ID_ARME_GAGNANT = arme.ARM_ID 
        OR partie.PAR_ID_ARME_PERDANT = arme.ARM_ID
    INNER JOIN coup_joueur 
     ON arme.ARM_ID_MITRAILLETTE = coup_joueur.COU_ID
WHERE coup_joueur.COU_TOTALCOUP <> 0
AND (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1') 
OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1'))
ORDER BY coup_joueur.COU_TOTALCOUP  DESC),
(SELECT COUNT(*) as GRENADE FROM partie 
    INNER JOIN arme 
        ON partie.PAR_ID_ARME_GAGNANT = arme.ARM_ID 
        OR partie.PAR_ID_ARME_PERDANT = arme.ARM_ID
    INNER JOIN coup_joueur 
     ON arme.ARM_ID_GRENADE = coup_joueur.COU_ID
WHERE coup_joueur.COU_TOTALCOUP <> 0
AND (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1') 
OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1'))
ORDER BY coup_joueur.COU_TOTALCOUP  DESC), 
(SELECT COUNT(*) as POMPE FROM partie 
    INNER JOIN arme 
        ON partie.PAR_ID_ARME_GAGNANT = arme.ARM_ID 
        OR partie.PAR_ID_ARME_PERDANT = arme.ARM_ID
    INNER JOIN coup_joueur 
     ON arme.ARM_ID_POMPE = coup_joueur.COU_ID
WHERE coup_joueur.COU_TOTALCOUP <> 0
AND (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1') 
OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1'))
ORDER BY coup_joueur.COU_TOTALCOUP  DESC), 
(SELECT COUNT(*) as PIEGE FROM partie 
    INNER JOIN arme 
        ON partie.PAR_ID_ARME_GAGNANT = arme.ARM_ID 
        OR partie.PAR_ID_ARME_PERDANT = arme.ARM_ID
    INNER JOIN coup_joueur 
     ON arme.ARM_ID_PIEGE = coup_joueur.COU_ID
WHERE coup_joueur.COU_TOTALCOUP <> 0
AND (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1') 
OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1'))
ORDER BY coup_joueur.COU_TOTALCOUP  DESC), 
(SELECT COUNT(*) as MISSILLE FROM partie 
    INNER JOIN arme 
        ON partie.PAR_ID_ARME_GAGNANT = arme.ARM_ID 
        OR partie.PAR_ID_ARME_PERDANT = arme.ARM_ID
    INNER JOIN coup_joueur 
     ON arme.ARM_ID_MISSILLE = coup_joueur.COU_ID
WHERE coup_joueur.COU_TOTALCOUP <> 0
AND (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1') 
OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1'))
ORDER BY coup_joueur.COU_TOTALCOUP  DESC)
;

--NB TOTAL DE PARTIE JOUÉ | GAGNÉ | PERDU
SELECT * FROM 
(SELECT count(*) AS JOUÉ  
    FROM partie 
WHERE (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1') 
OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1')),
(SELECT count(*) AS GAGNÉ  
    FROM partie 
WHERE partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1')),
(SELECT count(*) AS PERDU  
    FROM partie 
WHERE partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1'));

--NB DENSITÉ DE PARTIE JOUÉ (PAR JOUR)
SELECT to_char(PAR_DATE_DEBUT,'yyyy/mm/dd'), count(*) AS NB_PARTIE  FROM partie
WHERE (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1') 
OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1'))
GROUP BY to_char(PAR_DATE_DEBUT,'yyyy/mm/dd') 
ORDER BY to_char(PAR_DATE_DEBUT,'yyyy/mm/dd');

--TOP 5 ENEMIES
SELECT joueur.JOU_NOM, count(PAR_ID_JOUEUR_GAGNANT) AS KILL FROM partie 
inner join joueur
on partie.PAR_ID_JOUEUR_GAGNANT = joueur.JOU_ID
WHERE partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = 'player1')
GROUP BY PAR_ID_JOUEUR_GAGNANT, joueur.JOU_NOM
ORDER BY KILL  DESC FETCH FIRST 5 ROWS ONLY;
