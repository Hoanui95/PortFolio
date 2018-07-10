<?php
	require_once("action/CommonAction.php");
	require_once("action/DAO/UserDAO.php");


	class ajaxProfileAction extends CommonAction 
	{
		public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_PUBLIC);
		}

		
		protected function executeAction() 
		{

			if ( !ctype_space($_POST["mdp"])  and !ctype_space($_POST["phrase"])  and !ctype_space($_POST["leNom"]) ) 
			{	
			
				$coulR = $_POST["colR"];
				$coulG = $_POST["colG"];
				$coulB = $_POST["colB"];
				$mdp = $_POST["mdp"];
				$phrase = $_POST["phrase"];
				$nom = $_POST["leNom"];
				

				//UserDAO::profileEdit($coul,$mdp,$phrase,$nom,CommonAction::getUsername());
				UserDAO::profileEdit($coulR, $coulG, $coulB,$mdp,$phrase,$nom,CommonAction::getUsername());
				
				$this->result ="Done";

				$_SESSION["username"] =$nom;
			}
			else 
			{
				// echo "
				// 			<script type=\"text/javascript\">
				// 			alert('INFORMATIONS INVALIDES ! :(');
				// 			</script>
				// 		";
				$this->result ="erreur";
			}
		}
	}