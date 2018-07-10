<?php
	require_once("action/GameAction.php");


    $action = new GameAction();
    $action->execute();
    
    require_once("partial/header.php"); 
?>

<script src="js/sprite/parachute.js"></script>
<script src="js/sprite/soldier.js"></script>
<script src="js/sprite/ennemy.js"></script>
<script src="js/sprite/bullet.js"></script>
<script src="js/sprite/ally.js"></script>
<script src="js/sprite/lifeAlly.js"></script>
<script src="js/sprite/bulletAlly.js"></script>
<script src="js/sprite/bulletEnnemy.js"></script>
<script src="js/sprite/explosion.js"></script>
<script src="js/sprite/nuclearBomb.js"></script>
<script src="js/sprite/plane.js"></script>
<script src="js/sprite/bomb.js"></script>
<script src="js/sprite/LifePlayer.js"></script>
<script src="js/sprite/stamina.js"></script>
<script src="js/sprite/mpPlayer.js"></script>
<script src="js/sprite/LifeEnnemy.js"></script>
<script src="js/sprite/soldierWin.js"></script>
<script src="js/javascript-game.js"></script>

<canvas id="canvas" width="1000" height="800"></canvas>

<div id="container-button">
    <button id="Attack-1" disabled><img src="images/normal.jpg" width="60px" height="30px"></button>
    <button id="Attack-2" disabled><img src="images/special1.png" width="60px" height="30px"></button>
    <button id="Attack-3" disabled><img src="images/special2.png" width="60px" height="30px"></button>
</div>

<div id="gameover"></div>
<div id="win"></div>

<?php
	require_once("partial/footer.php");


