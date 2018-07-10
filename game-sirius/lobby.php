<?php
	require_once("action/LobbyAction.php");


    $action = new LobbyAction();
    $action->execute();

    require_once("partial/header.php"); 
?>

<script src="js/sprite/vehicleLobby.js"></script>
<script src="js/javascript-lobby.js"></script>

<div id="loading"> 
    <div id="percentCount" class="percent-count">100% test</div>
    <div class="progressBar">
        <div class="progressCurrent" id="progressCurrent"></div>
    </div>
</div>

<div id = "lobby">
    <div id="container-info">
        <h1>Sirius</h1>
        <div class="info">
            <p>Nom : </p> 
            <p id="name"></p>
        </div>
        <div class="info">
            <p>HP : </p>
            <p id="hp"></p>
        </div>
        <div class="info">
            <p>MP : </p>
            <p id="mp"></p>
        </div>
        <div class="info">
            <p>Type : </p>
            <p id="type"></p>
        </div>
        <div class="info">
            <p>Niveau : </p>
            <p id="niveau"></p>
        </div>
    </div>

     <div id="container-list">
        <h1>Liste des Serveurs</h1>
        <div class="title">
            <p>Nom</p>
            <p>Level</p>
            <p>nbJoueurs</p>
            <p>HP</p>
            <p>Type</p>
        </div>
        <div class="style-16" id="list-server">
    
        </div>
    </div>
</div>
<canvas id="canvas-lobby" width="1000" height="800"></canvas>


<?php
	require_once("partial/footer.php");


