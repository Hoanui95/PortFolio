<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/UserDAO.php");


	class AjaxCoolPointsAction extends CommonAction 
	{
		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC);
		}
		
		protected function executeAction() 
		{
			//echo  ($_POST["couleur"] );
			//UserDAO::CoolPointConvertEdit($_POST["vie"],$_POST["force"],$_POST["agile"],$_POST["dex"],CommonAction::getUsername());
			UserDAO::CoolPointConvertEdit($_POST["vie"],$_POST["force"],$_POST["agilite"],$_POST["dex"],CommonAction::getUsername());
			$this->result = "done";
		}
	}