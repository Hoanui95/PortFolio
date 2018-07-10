<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/UserDAO.php");


	class ajaxStatsAction extends CommonAction 
	{
		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC);
		}

		
		protected function executeAction() 
		{
			$query = $_POST["query"];
			

			if($query == "arme_efficace"){
                $this->result = UserDAO::armeEfficace(CommonAction::getUsername());
            }
            else if($query == "arme_prefere"){
                $this->result = UserDAO::armePrefere(CommonAction::getUsername());
            }
            else if($query == "partie"){
                $this->result = UserDAO::nbParties(CommonAction::getUsername());
            }
            else if($query == "densite"){
                $this->result = UserDAO::densite(CommonAction::getUsername());
			}
			else if($query == "enemies"){
                $this->result = UserDAO::topEnemies(CommonAction::getUsername());
            }
		}
	}