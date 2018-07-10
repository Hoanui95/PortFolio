<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/UserDAO.php");

	class SinginAction extends CommonAction 
	{
	
		public $missInfo = false;
		public $falsePass = false;
		
		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC);
		}


		protected function executeAction() 	
		{
			if ( !empty($_POST["nom"]) and  !empty($_POST["pwd"]) and (! ctype_space($_POST["nom"])) and (! ctype_space($_POST["pwd"])) ) 
			{	
				
				if ($_POST["pwd"] === $_POST["pwd2"])
				{
					try 
					{
						UserDAO::ajouterUserOracle($_POST["nom"],$_POST["pwd"],$_POST["phrase"]);
						$_SESSION["username"] = $_POST["nom"];
						$_SESSION["visibility"] = CommonAction::$VISIBILITY_MEMBER;
						echo "
								<script type=\"text/javascript\">
								alert('inscrit ! :(');
								</script>
							";
						header("location:dashboard.php");
						exit;
					} 
					catch (Exception $e) 
					{
						echo "
								<script type=\"text/javascript\">
								alert('CE JOUEUR EXISTE DEJA ! :(');
								</script>
							";
					}
				}
				else 
				{
					$this->falsePass = true;
					
				}
			}
			else 
			{
				if (isset($_POST['sub'])) 
				{
					$this->missInfo = true;
				}
			}

			
		}
	}
