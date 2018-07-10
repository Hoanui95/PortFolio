<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/UserDAO.php");


	class AjaxExpAction extends CommonAction 
	{
		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC);
		}
		
		protected function executeAction() 
		{			
			//$this->result = UserDAO::getExp(CommonAction::getUsername());
			$this->result = UserDAO::getExp(CommonAction::getUsername());
		}
	}