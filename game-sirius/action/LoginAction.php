<?php
	require_once("action/CommonAction.php");
	

	class LoginAction extends CommonAction {
		public $wrongLogin = false;
		public $key = null;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC);
		}

		protected function executeAction() {

			if (isset($_POST["username"])) {

				$data = [];
				$data["username"] = $_POST["username"];
				$data["pwd"] = $_POST["password"];

				$this->key = CommonAction::callAPI("signin", $data);

				
				if($this->key == "EMPTY_USERNAME" || $this->key == "USER_NOT_FOUND" || $this->key == "INVALID_USERNAME_PASSWORD" || $this->key == "CHARACTER_NOT_CREATED" || $this->key == "USER_IS_BANNED" || $this->key == "TOO_MANY_CONNECTIONS_BAN")
				{
					$visibility = CommonAction::$VISIBILITY_PUBLIC;
				}
				else
				{
					$visibility = CommonAction::$VISIBILITY_MEMBER;
				}

				if ($visibility > CommonAction::$VISIBILITY_PUBLIC) {
					
					$_SESSION["username"] = $_POST["username"];
					$_SESSION["visibility"] = CommonAction::$VISIBILITY_MEMBER;
					$_SESSION["key"] = $this->key;

					header("location:lobby.php");
					 
					exit;
				}
				else {
						$this->wrongLogin = true;
				}

			}
		}
	}
