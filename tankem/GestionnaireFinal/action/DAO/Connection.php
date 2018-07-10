<?php

	/*LES MÉTHODE DE CONNECTION AUX BASES DE DONNÉS*/

	/*ORACLE , A L'ÉCOLE  ------ > VU AVEC FRED  ----------------------------------------------------------------------*/
	class ConnectionOracle 
	{
		private static $connection;

		public static function getConnection() 
		{

			if (empty(ConnectionOracle::$connection)) 
			{
				ConnectionOracle::$connection = new PDO("oci:dbname=" ."decinfo","e1529743","AAAaaa111");
				ConnectionOracle::$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				ConnectionOracle::$connection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
			}

			return ConnectionOracle::$connection;
		}
	}