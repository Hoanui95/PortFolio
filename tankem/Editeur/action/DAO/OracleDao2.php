<?php
	require_once("action/DAO/Connection.php");

	class OracleDao2 {
		public static function insertion() {
			
			$connection = Connection::getConnection();
			try{
				
				
				//$_SESSION["test"] = "connection";
				$stmt = $connection->preprare("INSERT INTO tank(chiffre) VALUES(?)");
				$_SESSION["test"] = "connection2";
				$stmt->bindParam(1, "bbb");
				$stmt->execute();
				$connection->commit();
				
			}
			catch(PDOException $e)
			{
				$_SESSION["test"] = $e->getMessage();
			}
	}
	
	public static function insertion2($result){
		$_SESSION["test"] = "V1";
		$connection2 = Connection::getConnection();
		$_SESSION["x"] = $result[0];
		$_SESSION["y"] = $result[1];
		$_SESSION["arbre"] = $result[2];
		$_SESSION["mur"] = $result[3];
		$_SESSION["test"] = "V3";
		try
		{
			$_SESSION["test"] = "V4";			
			$stmt = $connection2->preprare("INSERT INTO tank('chiffre') VALUES('bbb')");
			if (!$stmt) {
				$_SESSION["test"] = $connection2->errorInfo();
				echo "\nPDO::errorInfo():\n";
				print_r($connection2->errorInfo());
			 }
			//$_SESSION["test"] = "V00";
			//$statement2->bindParam(1, intval($result[0]));
			//$statement2->bindParam(1, "bbb");
					/* $statement2->bindParam(2, intval($tab[1]));
					$statement2->bindParam(3, intval($tab[2]));
					$statement2->bindParam(4, intval($tab[3]));
					$statement2->bindParam(5, $result[0]); */
			$stmt->setFetchMode(PDO::FETCH_ASSOC);	
			$stmt->execute();
			$connection2->commit();
		}	
		catch(PDOException $e){
			$_SESSION["test"] = $e->getMessage();
		}
				
		
		
	} 
}

	