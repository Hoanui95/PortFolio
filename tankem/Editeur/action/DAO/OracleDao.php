<?php
	require_once("action/DAO/Connection.php");

	class OracleDao {
		public static function insertion($result) {
			
			$connection = Connection::getConnection();
		
			
			try{

				

				$connection->exec("INSERT INTO niveau(niv_name, niv_id_status,niv_delais_min, niv_delais_max,niv_ligne_x,niv_ligne_y,niv_joueur1_x,niv_joueur1_y,niv_joueur2_x,niv_joueur2_y) VALUES ( '".$result[0]."', ".intval($result[1]).", ".intval($result[2]).", ".intval($result[3]).", ".intval($result[4]).", ".intval($result[5]).", ".intval($result[6]).", ".intval($result[7]).", ".intval($result[8]).", ".intval($result[9]).")");
				

				
				
	
				
			}
			catch(PDOException $e)
			{
				$_SESSION["test"] = $e->getMessage();
			}
			
	}

	public static function insertion2($result){
		$connection = Connection::getConnection();
		try{
			if(sizeof($result[10]) > 0){
				foreach($result[10] as $tab){	
					$connection->exec("INSERT INTO modifications(mod_pos_x, mod_pos_y, mod_arbre, mod_id_mur, mod_id_niv) VALUES (".intval($tab[0]).",".intval($tab[1]).",".intval($tab[2]).",".intval($tab[3]).", (Select niv_id FROM niveau where niv_name = '".$result[0]."'))");			
					
				}
			}
		}
		catch(PDOException $e)
		{
			$_SESSION["test"] = $e->getMessage();
		}
				
		
		
	} 
}

	