<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/UserDAO.php");

	class LoginAction extends CommonAction {
		public $wrongLogin = false;
		
		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC);
		}

		protected function executeAction() {
			
			if (isset($_POST["username"])) {
				$visibility = UserDAO::authenticateOracle($_POST["username"], $_POST["pwd"]);

				if ($visibility > CommonAction::$VISIBILITY_PUBLIC) 
				{
					
					$_SESSION["username"] = $_POST["username"];
					$_SESSION["visibility"] = CommonAction::$VISIBILITY_MEMBER;

					header("location:dashboard.php");
					exit;
				}
				else {
					$this->wrongLogin = true;
				}
			}
		}
	}

	
