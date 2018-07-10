<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/OracleDao.php");
	require_once("action/DAO/OracleDao2.php");
	
	class AjaxAction extends CommonAction {
		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC);
		}

		protected function executeAction() {
			
			$nom = $_POST["nom"];
			$status = $_POST["status"];
			$delaimin = $_POST["delaimin"];
			$delaimax = $_POST["delaimax"];
			$larguer = $_POST["largeur"]; //niv_ligne_x
			$hauteur = $_POST["hauteur"]; // niv_ligne_y
			$modification = $_POST["modifications"];
			$joueur1x = $_POST["j1x"];
			$joueur1y = $_POST["j1y"];
			$joueur2x = $_POST["j2x"];
			$joueur2y = $_POST["j2y"];

			$this->result = array($nom, $status, $delaimin, $delaimax, $larguer, $hauteur, $joueur1x ,$joueur1y,$joueur2x,$joueur2y, $modification);
			
			
			OracleDao::insertion($this->result);
			sleep(5);
			OracleDao::insertion2($this->result);
		
			}
		
	}