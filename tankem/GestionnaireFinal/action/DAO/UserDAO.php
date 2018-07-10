<?php
	require_once("Connection.php");


	class UserDAO 
	{
		/*S'authentifier avec des informations prevenant de la base de donné */
		/*********************************************************************/

		/*MÉTHODE VU EN CALSSE AVEC LA BD ORACLE*/
		public static function authenticateOracle($username, $pwd) 
		{
			$connection = ConnectionOracle::getConnection();

			$statement = $connection->prepare("SELECT * FROM JOUEUR where JOU_NOM = ?");
			$statement->bindParam(1, $username);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$visibility = 0;

			if ($row = $statement->fetch()) {
				if ($row["JOU_MOTDEPASSE"]==$pwd) 
				{
					$visibility = 1;
				}
			}

			return $visibility;
		}



		/*SUPPRIMER USER*/
		public static function supprimerJoueur($username) 
		{
			$connection = ConnectionOracle::getConnection();

			$statement = $connection->prepare("DELETE FROM JOUEUR WHERE JOU_NOM = ?");
			$statement->bindParam(1, $username);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();
		}


		 
		/*MÉTHODE ORACLE*/
		public static function ajouterUserOracle($nom,$motdepass,$phrse) 
		{
			$connection = ConnectionOracle::getConnection();
                 
			$statement = $connection->prepare("INSERT INTO JOUEUR  (JOU_NOM, JOU_MOTDEPASSE,JOU_PHRASEPERSONNELLE) VALUES(?,?,?)");


			$statement->bindParam(1, $nom);
			$statement->bindParam(2, $motdepass);
			$statement->bindParam(3, $phrse);

			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();
		}


		public static function profileEdit($newCouleurR,$newCouleurG,$newCouleurB,$motDePass,$phrase,$Nouveaunom,$nom)
		{
			$connection = ConnectionOracle::getConnection();
			$statement = $connection->prepare("UPDATE joueur SET jou_r = ? ,jou_g = ? ,jou_b = ? , jou_motDePasse = ?, jou_phrasePersonnelle = ?, jou_nom = ? WHERE jou_nom = ?");

			
			$statement->bindParam(1, $newCouleurR);
			$statement->bindParam(2, $newCouleurG);
			$statement->bindParam(3, $newCouleurB);
			

			$statement->bindParam(4, $motDePass);
			$statement->bindParam(5, $phrase);
			$statement->bindParam(6, $Nouveaunom);
			$statement->bindParam(7, $nom);			

			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();
		}

		public static function CoolPointConvertEdit($vie,$force,$agil,$dex,$nom)
		{
			$connection = ConnectionOracle::getConnection();
			$statement = $connection->prepare("UPDATE joueur SET jou_coolPointVie = ? , jou_coolPointForce = ? ,jou_coolPointAgilite = ? ,jou_coolPointDexterite = ?  WHERE jou_nom = ?");

			$statement->bindParam(1, $vie);
			$statement->bindParam(2, $force);
			$statement->bindParam(3, $agil);
			$statement->bindParam(4, $dex);
			$statement->bindParam(5, $nom);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			
		}

		public static function getExp($nom)
		{
			$connection = ConnectionOracle::getConnection();
			$statement = $connection->prepare("SELECT * from JOUEUR WHERE JOU_NOM = ?");
			$statement->bindParam(1, $nom);
			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$result = $statement->fetchAll();			
			return $result;
		}


		public static function infoJoueur($leNom)
		{
			$connection = ConnectionOracle::getConnection();
			$statement = $connection->prepare("SELECT * FROM JOUEUR WHERE JOU_NOM = ?");

			$statement->bindParam(1, $leNom);

			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$result = $statement->fetchAll();
			
			return $result;
		}



		public static function partiesJoueur($leNom)
		{

			$alaisDate = "PAR_DATE_DEBUT";
			$date = "to_char(PAR_DATE_DEBUT,'yyyy/mm/dd hh24:mi:ss')".$alaisDate;// ;

			$connection = ConnectionOracle::getConnection();
			$statement = $connection->prepare('	SELECT P.PAR_ID,PAR_ID_NIVEAU_JOUE,'.$date.',PAR_DATE_FIN,PAR_DISTANCE_PERDANT,PAR_DISTANCE_GAGNANT,PAR_ID_JOUEUR_GAGNANT,PAR_ID_JOUEUR_PERDANT, J.jou_nom "perdant",G.jou_nom "gagnant"
												FROM
												PARTIE P
												INNER JOIN joueur J 
												ON J.jou_id = P.PAR_ID_JOUEUR_PERDANT
												INNER JOIN joueur G
												ON G.jou_id = P.PAR_ID_JOUEUR_GAGNANT
												WHERE PAR_ID_JOUEUR_GAGNANT= ? OR PAR_ID_JOUEUR_PERDANT= ?');

			$statement->bindParam(1, $leNom);
			$statement->bindParam(2, $leNom);

			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$result = $statement->fetchAll();
			
			return $result;
		}

		public static function armeEfficace($leNom)
		{
			$connection = ConnectionOracle::getConnection();
			$statement = $connection->prepare("SELECT * FROM partie 
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
		AND (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?) 
		OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?))
		ORDER BY (coup_joueur.COU_COUPATTEINCIBLE/coup_joueur.COU_TOTALCOUP)  DESC FETCH FIRST 1 ROWS ONLY");

			$statement->bindParam(1, $leNom);
			$statement->bindParam(2, $leNom);

			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$result = $statement->fetchAll();
			
			return $result;
		}

		public static function armePrefere($leNom)
		{
			$connection = ConnectionOracle::getConnection();
			$statement = $connection->prepare("SELECT * FROM 
			(SELECT COUNT(*) as CANON FROM partie 
				INNER JOIN arme 
					ON partie.PAR_ID_ARME_GAGNANT = arme.ARM_ID 
					OR partie.PAR_ID_ARME_PERDANT = arme.ARM_ID
				INNER JOIN coup_joueur 
				ON arme.ARM_ID_CANON = coup_joueur.COU_ID
			WHERE coup_joueur.COU_TOTALCOUP <> 0
			AND (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?) 
			OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?))
			ORDER BY coup_joueur.COU_TOTALCOUP  DESC),
			(SELECT COUNT(*) as MITRAILLETTE FROM partie 
				INNER JOIN arme 
					ON partie.PAR_ID_ARME_GAGNANT = arme.ARM_ID 
					OR partie.PAR_ID_ARME_PERDANT = arme.ARM_ID
				INNER JOIN coup_joueur 
				ON arme.ARM_ID_MITRAILLETTE = coup_joueur.COU_ID
			WHERE coup_joueur.COU_TOTALCOUP <> 0
			AND (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?) 
			OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?))
			ORDER BY coup_joueur.COU_TOTALCOUP  DESC),
			(SELECT COUNT(*) as GRENADE FROM partie 
				INNER JOIN arme 
					ON partie.PAR_ID_ARME_GAGNANT = arme.ARM_ID 
					OR partie.PAR_ID_ARME_PERDANT = arme.ARM_ID
				INNER JOIN coup_joueur 
				ON arme.ARM_ID_GRENADE = coup_joueur.COU_ID
			WHERE coup_joueur.COU_TOTALCOUP <> 0
			AND (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?) 
			OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?))
			ORDER BY coup_joueur.COU_TOTALCOUP  DESC), 
			(SELECT COUNT(*) as POMPE FROM partie 
				INNER JOIN arme 
					ON partie.PAR_ID_ARME_GAGNANT = arme.ARM_ID 
					OR partie.PAR_ID_ARME_PERDANT = arme.ARM_ID
				INNER JOIN coup_joueur 
				ON arme.ARM_ID_POMPE = coup_joueur.COU_ID
			WHERE coup_joueur.COU_TOTALCOUP <> 0
			AND (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?) 
			OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?))
			ORDER BY coup_joueur.COU_TOTALCOUP  DESC), 
			(SELECT COUNT(*) as PIEGE FROM partie 
				INNER JOIN arme 
					ON partie.PAR_ID_ARME_GAGNANT = arme.ARM_ID 
					OR partie.PAR_ID_ARME_PERDANT = arme.ARM_ID
				INNER JOIN coup_joueur 
				ON arme.ARM_ID_PIEGE = coup_joueur.COU_ID
			WHERE coup_joueur.COU_TOTALCOUP <> 0
			AND (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?) 
			OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?))
			ORDER BY coup_joueur.COU_TOTALCOUP  DESC), 
			(SELECT COUNT(*) as MISSILLE FROM partie 
				INNER JOIN arme 
					ON partie.PAR_ID_ARME_GAGNANT = arme.ARM_ID 
					OR partie.PAR_ID_ARME_PERDANT = arme.ARM_ID
				INNER JOIN coup_joueur 
				ON arme.ARM_ID_MISSILLE = coup_joueur.COU_ID
			WHERE coup_joueur.COU_TOTALCOUP <> 0
			AND (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?) 
			OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?))
			ORDER BY coup_joueur.COU_TOTALCOUP  DESC)");

			$statement->bindParam(1, $leNom);
			$statement->bindParam(2, $leNom);
			$statement->bindParam(3, $leNom);
			$statement->bindParam(4, $leNom);
			$statement->bindParam(5, $leNom);
			$statement->bindParam(6, $leNom);
			$statement->bindParam(7, $leNom);
			$statement->bindParam(8, $leNom);
			$statement->bindParam(9, $leNom);
			$statement->bindParam(10, $leNom);
			$statement->bindParam(11, $leNom);
			$statement->bindParam(12, $leNom);

			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$result = $statement->fetchAll();
			
			return $result;
		}

		public static function nbParties($leNom)
		{
			$connection = ConnectionOracle::getConnection();
			$statement = $connection->prepare("SELECT * FROM 
			(SELECT count(*) AS JOUE  
				FROM partie 
			WHERE (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?) 
			OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?))),
			(SELECT count(*) AS GAGNE  
				FROM partie 
			WHERE partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?)),
			(SELECT count(*) AS PERDU  
				FROM partie 
			WHERE partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?))");

			$statement->bindParam(1, $leNom);
			$statement->bindParam(2, $leNom);
			$statement->bindParam(3, $leNom);
			$statement->bindParam(4, $leNom);

			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$result = $statement->fetchAll();
			
			return $result;
		}
		public static function densite($leNom)
		{
			$connection = ConnectionOracle::getConnection();
			$statement = $connection->prepare("SELECT to_char(PAR_DATE_DEBUT,'yyyy/mm/dd') AS D, count(*) AS NB_PARTIE  FROM partie
			WHERE (partie.PAR_ID_JOUEUR_GAGNANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?) 
			OR partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?))
			GROUP BY to_char(PAR_DATE_DEBUT,'yyyy/mm/dd') 
			ORDER BY to_char(PAR_DATE_DEBUT,'yyyy/mm/dd')");

			$statement->bindParam(1, $leNom);
			$statement->bindParam(2, $leNom);

			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$result = $statement->fetchAll();
			
			return $result;
		}
		public static function topEnemies($leNom)
		{
			$connection = ConnectionOracle::getConnection();
			$statement = $connection->prepare("SELECT joueur.JOU_NOM, count(PAR_ID_JOUEUR_GAGNANT) AS KILL FROM partie 
			inner join joueur
			on partie.PAR_ID_JOUEUR_GAGNANT = joueur.JOU_ID
			WHERE partie.PAR_ID_JOUEUR_PERDANT = (SELECT JOU_id FROM joueur WHERE JOU_NOM = ?)
			GROUP BY PAR_ID_JOUEUR_GAGNANT, joueur.JOU_NOM
			ORDER BY KILL  DESC FETCH FIRST 5 ROWS ONLY");

			$statement->bindParam(1, $leNom);

			$statement->setFetchMode(PDO::FETCH_ASSOC);
			$statement->execute();

			$result = $statement->fetchAll();
			
			return $result;
		}



	}

	