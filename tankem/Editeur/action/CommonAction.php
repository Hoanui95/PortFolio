<?php
	session_start();
	require_once("action/Constants.php");

	abstract class CommonAction {
		protected static $VISIBILITY_ADMIN = 3;
		protected static $VISIBILITY_MODERATEUR = 2;
		protected static $VISIBILITY_MEMBER = 1;
		protected static $VISIBILITY_PUBLIC = 0;
		
		private $visibility = null;
	
		public function __construct($visibility) {
			$this->visibility = $visibility;
		}
		
		public function execute() {
			
			if (!empty($_GET["logout"])) {
				session_unset();
				session_destroy();
				session_start();
			}

			if (empty($_SESSION["visibility"])) {
				$_SESSION["visibility"] = CommonAction::$VISIBILITY_PUBLIC;
			}

			if ($_SESSION["visibility"] < $this->visibility) {
				header("location:index.php");
				exit;
			}

			$this->executeAction();
		}
		
		protected abstract function executeAction();
		
		public function getUsername() {
			return $_SESSION["username"];
		}
		
		public function isLoggedIn() {
			return isset($_SESSION["username"]);
		}
		
		public function getCurrentPage() {
			$pageURL = 'http://';
			if ($_SERVER["SERVER_PORT"] != "80") {
				$pageURL .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
			} else {
				$pageURL .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
			}
			return $pageURL;
		}
	}

	
	
	
	
	
	
	
	