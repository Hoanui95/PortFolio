<?php

	session_start();
	
	abstract class CommonAction {
		public static $VISIBILITY_PUBLIC = 0;
		public static $VISIBILITY_MEMBER = 1;
		public static $VISIBILITY_MODERATOR = 2;
		public static $VISIBILITY_ADMINISTRATOR = 3;


		private $pageVisibility;


		public function __construct($pageVisibility) 
		{
			$this->pageVisibility = $pageVisibility;
		
		}


		public function execute() 
		{
			if (!empty($_GET["logout"])) {
				session_unset();
				session_destroy();
				session_start();
			}

			if (empty($_SESSION["visibility"])) {
				$_SESSION["visibility"] = CommonAction::$VISIBILITY_PUBLIC;
			}

			if ($_SESSION["visibility"] < $this->pageVisibility) {
				header("location:index.php");
				exit;
			}

			$this->executeAction();
		}


		public function isLoggedIn() 
		{
			return $_SESSION["visibility"] > CommonAction::$VISIBILITY_PUBLIC;
		}


		public function getUsername() 
		{
			return empty($_SESSION["username"]) ? "Invité" : $_SESSION["username"];
		}


		protected abstract function executeAction();
	}