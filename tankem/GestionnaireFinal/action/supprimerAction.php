<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/UserDAO.php");

	class SupprimerAction extends CommonAction 
	{
		public $suppetat = "";
		
		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC);
		}

		protected function executeAction() 	
		{
			if (isset($_POST["nomS"])) 
			{
				try 
				{
					UserDAO::supprimerJoueur($_POST["nomS"]);
					echo "
							<script type=\"text/javascript\">
							alert('PROBLEME DE SUPPRESSION ! :(');
							</script>
						";
					$this->suppetat ="supp";
					header("location:index.php");
				}
				catch (Exception $e) 
				{
					$this->suppetat ="err";
				}	
			}
		}
	}

	