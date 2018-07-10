<?php 
	require_once("action/IndexAction.php");

	$action = new IndexAction();
	$action->execute();	
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>TANKEM EDITOR</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" media="screen" href="css/index.css" />	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.10/js/all.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/javascript-editor.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 text-center font-weight-bold" id="project_title">
				<h2 class="font-weight-bold">TANKEM EDITOR</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-9" id="map_view">
				<div id="center">
				</div>
			</div>
			<div class="col-md-3" id="sidebar">
				<form id="formId" action="index.php" method="post">
					<input type="text" class="form-control text-center" name="date" id="date" disabled>
					<input type="text" class="form-control text-center"  name="titre" id="titre" placeholder="Titre du niveau" required>					
					<label for="status">Status du niveau</label>
					<select name="status" class="form-control" id="status">
						<option value="actif" selected>Actif</option>
						<option value="test">Test</option>
						<option value="inactif">Inactif</option>
					</select>
					<label for="delais_min">Délais minimum (msec.)</label>
					<input type="number" class="form-control" name="delais_min" id="delais_min" min="1000" value="1000" step="100" >
					<label for="delais_max">Délais maximum (msec.)</label>
					<input type="number" class="form-control" name="delais_max" id="delais_max" min="1000" value="1000" step="100" >
					<div class="row">
						<div class="col-md-6">
							<label for="delais_max">Largeur</label>
							<input type="number" class="form-control text-center" name="largeur" id="largeur" min="6" max="12" value="0">
						</div>
						<div class="col-md-6">
								<label for="delais_max">Hauteur</label>
								<input type="number" class="form-control  text-center" name="hauteur" id="hauteur" min="6"  max="12" value="0">
						</div>
					</div>
					<label for="item">Items</label>
					<select class="form-control" name="item" id="item">
						<option value="empty"></option>
						<option value="arbre">Arbre</option>
						<option value="mur">Mur</option>
						<option value="murInverse">Mur inversé</option>	
						<option value="murMobile">Mur mobile</option>					
						<option value="joueur1">Position Joueur1</option>				
						<option value="joueur2">Position Joueur2</option>							
					</select>					
					<input id="envoyer" class="btn btn-success btn-block my-2" id="btnValidation" value="Valider">
				</form>				
				<div>
					<h5 class="text-center">Contrôle</h5>
					<div class="row px-4">
						<div class="d-flex text-center m-auto">
							<span><i class="fas fa-arrow-left"></i> A</span>
							<span class="ml-3"><i class="fas fa-arrow-right"></i> D</span>
							<span class="ml-3"><i class="fas fa-arrow-up"></i> W</span>
							<span class="ml-3"><i class="fas fa-arrow-down"></i> S</span>
						</div>			
					</div>
					<div class="row px-4">
						<div class="d-flex col-md-5">
							<div class="mr-3"  style="background-color:red;width:20px ;height:20px; "></div>
							<p><strong>7</strong> - Mur</p>
						</div>
						<div class="d-flex col-md-7">
							<div class="mr-3"  style="background-color:green;width:20px ;height:20px; "></div>
							<p><strong>8</strong> - Mur inverse</p>
						</div>						
					</div>
					<div class="row px-4">
						<div class="d-flex col-md-5">
							<div class="mr-3" > <img  src="images/arbre.png" alt="" draggable="true" width="30" height="30"></div>
							<p><strong>4</strong> - Arbre</p>
						</div>
						<div class="d-flex col-md-7">
							<div class="mr-3"  style="background-color:blue;width:20px ;height:20px; "></div>
							<p><strong>9</strong> - Mur mobile</p>
						</div>						
					</div>	
					<div class="row px-4">
						<div class="d-flex col-md-6">
							<div class="mr-3" > <img  src="images/tank1.png" alt="" draggable="true" width="30" height="30"></div>
							<p><strong>1</strong> - Joueur 1</p>
						</div>	
						<div class="d-flex col-md-6">
							<div class="mr-3" > <img  src="images/tank2.png" alt="" draggable="true" width="30" height="30"></div>
							<p><strong>2</strong> - Joueur 2</p>
						</div>					
					</div>	
								
				</div>
				<script>
					let today = new Date();
					let dd = today.getDate();
					let mm = today.getMonth()+1; //January is 0
					let yyyy = today.getFullYear();
					if(dd<10) {
						dd = '0'+dd
					} 
					if(mm<10) {
						mm = '0'+mm
					} 
					today = dd + '-' + mm + '-' + yyyy;
					$('#date').val(today)
				</script>
			</div>
		</div>
	</div>
</body>
</html>