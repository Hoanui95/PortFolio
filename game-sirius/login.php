<?php
	require_once("action/LoginAction.php");

    $action = new LoginAction();
    $action->execute();

    require_once("partial/header.php");
    
?>

<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/sprite/soldierAnimLeft.js"></script>
<script src="js/sprite/soldierAnimeRight.js"></script>
<script src="js/sprite/nuclearBombLogin.js"></script>
<script src="js/sprite/planeLogin.js"></script>
<script src="js/sprite/explosion.js"></script>
<script src="js/sprite/char.js"></script>
<script src="js/sprite/bulletChar.js"></script>
<script src="js/javascript-login.js"></script>

<div class="container-background">
	<div class="container-login">
        <h1>Connexion</h1> 
        <?php 
				if ($action->wrongLogin) {
					?>
					<div class="error-div"><strong>Erreur : </strong><?=$action->key?></div>
					<?php
				}
			?>
        <div class="panel-body">
            <form action="login.php" method="post" class="form-signin">
                <input class="form-control" name="username" placeholder="Nom d'usager"  type="text">
                <input class="form-control" name="password" placeholder="Mot de passe" type="password">
                <br></br>
                <input class="btn btn-lg btn-success btn-block" type="submit" value="Entrer »">  
            </form>
        </div>
    </div>
    <button id="volume" width = " 30px" height = " 30px" class="btn btn-default"></button>
	<canvas id="canvasLogin" width="1080" height="720"></canvas>
</div>
<?php
	require_once("partial/footer.php");
