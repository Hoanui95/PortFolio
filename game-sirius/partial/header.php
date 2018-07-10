<!DOCTYPE html>
<html lang="fr">
<head>
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<title>Connexion | Sirius</title>
    <script src="js/TiledImage.js"></script>
	<script src="js/jquery.min.js"></script>
	
</head>
<body>
						<?php
							if ($action->isLoggedIn()) 
							{
								?>
								
								<a id="deconnexion" href="?logout=true">Déconnexion</a>	

								<?php
								if($action->isInGame())
								{
									?>
									
									<a href="lobby.php">Lobby</a>
	
									<?php
								}
							}
							?>
