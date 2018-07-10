<?php
	require_once("action/dashboardAction.php");

	$action = new DashboardAction();
	$action->execute();
?>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css">
    <link href="css/dashboard.css" rel="stylesheet">
    <link href="css/color.css" rel="stylesheet">
    <script src="javascript/dashboard.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<body>
   
    <nav class="navbar  navbar-expand-sm navbar-dark bg-dark sticky-top" >
        <a class="navbar-brand" href="#"><a class="navbar-brand" href="#" style="font-size:1rem; ">TANKEM</a></a>
        <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse">☰</button>  -->
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="navbar-nav">
                <li class="active nav-item"><a class="nav-link" href="index.php">Gestionnaire</a></li>
                <li class="nav-item"><a class="nav-link"  href="#">Editeur de niveaux</a></li>
                </ul>
                <ul class="navbar-nav ml-auto">			
            </ul>
        </div>
    </nav>
    <!-- SIDEBAR START -->
    <nav class="col-md-2 d-none d-md-block sidebar mt-5">
        <div class="sidebar-sticky">
            <ul class="nav flex-column text-center">  
                <h3>SIDEBAR</h3>
                <!-- <li class="nav-item">
                    <a class="nav-link" href="#">
                    Coolpoints
                    </a>
                </li> -->
                <div class="container">
                    <button type="button" class="btn btn-primary btn-block mt-5" id="btnCoolpoints"><i class="fas fa-dollar-sign" ></i> CoolPoints</button>
                    <button type="button" class="btn btn-success btn-block mt-3" id="btnstats"><i class="fas fa-chart-line"></i> Statistiques</button>
                    <div id="hide_stats">
                        <button type="button" class="btn btn-success btn-block mt-5" id="btnStatArmePref"><i class="fas fa-chart-line"></i> Stat - Armes Préféré</button>
                        <button type="button" class="btn btn-success btn-block" id="btnStatParties"><i class="fas fa-chart-line"></i> Stat - Parties</button>
                        <button type="button" class="btn btn-success btn-block" id="btnStatDensite"><i class="fas fa-chart-line"></i> Stat - Densité</button>
                        <button type="button" class="btn btn-success btn-block" id="btnStatEnemies"><i class="fas fa-chart-line"></i> Stat - Top Ennemis</button>
                    </div>
                    
                    <a type="button" href="?logout=true" class="btn btn-danger btn-block mt-5"><i class="fas fa-sign-out-alt"></i> Déconnexion</a>
                </div>
                
                
            </ul>		
        </div>
    </nav> 
    <!-- SIDEBAR END -->
    <div class="container-fluid ">
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="true">PROFIL</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="coolpoints-tab" data-toggle="tab" href="#tab_coolpoints" role="tab" aria-controls="coolpoints" aria-selected="false">Coolpoints</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="stats-tab" data-toggle="tab" href="#tab_stats" role="tab" aria-controls="stats" aria-selected="false">Statistiques</a>
                </li>
            </ul>
          
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <form class="" action="dashboard.php" method="post">
                         <div class="row">
                            <div class="col-md-4 mb-3">
                                <div class="jumbotron jumb">
                                    <h1 class="display-4">Expérience</h1>
                                    <span id="inputExp" class="badge badge-primary">..</span>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="jumbotron jumb">
                                    <h1 class="display-4">Niveau</h1>
                                    <span id="inputNiveau" class="badge badge-danger">..</span>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="jumbotron jumb">
                                    <h1 class="display-4">Dernière partie</h1>
                                    <span id="inputParti" class="badge badge-warning">..</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="inputNom">Nom</label>
                                <input type="text" class="form-control w-100" name="inputNom" id="inputNom" placeholder="Nom" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="inputPwd">Mot de passe</label>
                                <input type="text" class="form-control w-100" name="inputPwd" id="inputPwd" placeholder="Mpt de passe" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label for="inputPhrase">Phrase Perso.</label>
                                <input type="text" class="form-control w-100" name="inputPhrase" id="inputPhrase" placeholder="Phrase perso." required>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label for="inputColor">Couleur du Tank</label>
                                <div name="inputColor" >
                                    <div class="color_picker_dialog" draggable="false">
                                        <div class="hue_bar">
                                            <div class="hue_picker"></div>
                                        </div>
                                        <div class="sat_rect" draggable="false">
                                            <div class="white"></div>
                                            <div class="black"></div>
                                            <div class="sat_picker"></div>
                                        </div>
                                        <div class="bottom">
                                            <div class="color_preview"></div>
                                            <input type="text" id="couleurHex" onkeyup="changeHex(this.value)" value="R:255 G:0 B:0" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 mb-3">   
                                <label for="inputColor">Couleur actuel</label>                         
                                <div class="" id="colorpicked"></div> 
                            </div> 
                            
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <button type="button" onclick="profileEdit()" class="btn btn-success btn-block">Enregitrer</button>
                            </div>
                            
                        </div>                 
                    </form>
                    
                </div>
                <!-- COOLPOINTS TAB -->
                <div class="tab-pane fade" id="tab_coolpoints" role="tabpanel" aria-labelledby="coolpoints-tab">
                    <form action="dashboard.php" method="post">
                        <div class="row">
                            <div class="col-md-3 mt-4">
                                <label for="inputCoolpoints">CoolPoints</label>
                                <input type="text" class="form-control w-100" name="inputCoolpoints" id="inputCoolpoints" placeholder="" readonly >
                            </div>                        
                        </div>
                        <div class="form-group">
                            <label for="inputVie">Vie</label>
                            <div class="row">
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-warning  btn-block" id="btnVieMinus"> - </button>                            
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-success  btn-block" id="btnVie"> + </button>                        
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" type="number" name="inputVie" id="inputVie" max="25" readonly>               
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" type="text" name="inputPercentVie" id="inputPercentVie" readonly>               
                                </div>
                            </div>                        
                        </div>
                        <div class="form-group">
                            <label for="inputForce">Force</label>
                            <div class="row">
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-warning  btn-block " id="btnForceMinus"> - </button>                            
                                </div>
                                    <div class="col-md-2">
                                    <button type="button" class="btn btn-success  btn-block " id="btnForce"> + </button>                        
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" type="number" name="inputForce" id="inputForce" readonly>               
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" type="text" name="inputPercentForce" id="inputPercentForce" readonly>               
                                </div>
                            </div>                        
                        </div>
                        <div class="form-group">
                            <label for="inputAgilite">Agilité</label>
                            <div class="row">
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-warning  btn-block " id="btnAgiliteMinus"> - </button>                            
                                </div>
                                    <div class="col-md-2">
                                    <button type="button" class="btn btn-success  btn-block " id="btnAgilite"> + </button>                        
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" type="number" name="inputAgilite" id="inputAgilite" readonly>               
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" type="text" name="inputPercentAgilite" id="inputPercentAgilite" readonly>               
                                </div>
                            </div>                        
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Dextérité</label>
                            <div class="row">
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-warning  btn-block " id="btnDexMinus"> - </button>                            
                                </div>
                                    <div class="col-md-2">
                                    <button type="button" class="btn btn-success  btn-block " id="btnDex"> + </button>                        
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" type="number" name="inputDex" id="inputDex" readonly>               
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" type="text" name="inputPercentDex" id="inputPercentDex" readonly>               
                                </div>
                            </div>                        
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <button id="btnSaveCoolPoints" type="button" class="btn btn-success btn-block">Enregitrer</button>
                            </div>                        
                        </div>   
                    </form>
                </div>

                <!-- 
                • Vie : 5% plus de vie par CoolPoint 
                • Force : 5% de plus de dégât par CoolPoint 
                • Agilité : 2.5% sur la vitesse du tank par CoolPoint 
                • Dextérité : gain de 2.5% progressif sur le rechargement des armes par CoolPoint 
                --> 
            


                <!-- STATS TAB -->
                <div class="tab-pane fade" id="tab_stats" role="tabpanel" aria-labelledby="stats-tab">

                    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Global</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Parties</a>
                        </li>
                    </ul>

                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">

                            <div class="col-md-12">
                                <!-- STATS ARMES -->
                                <div id="can" class="col-md-10">
                                    <h3>Statistiques de Jeux</h3> 
                                    <h4 id="prefgun"></h4>                                   
                                </div>    
                            </div>
                            <canvas id="canvas" width="1200" height="500"></canvas>
                        
                        </div>                
                        <div class="tab-pane fade zone" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                            <div class="row">
                                <div class="col-6 partie" style="height:600px;overflow:auto;">
                                    <h1 id="messagePartie" ></h1>
                                    <div id="partiesListe" class="row">
                                               
                                    </div>
                                    <script type="x-script" id="template4">
                                           <h1 id="idPart"> Partie 1 </h1>
                                           <h4 id="j1"> Partie 1 </h4>
                                    </script>   
                                </div>
                                <div class="col-5 partie" style="height:600px;">
                                    <h1 class="joueurG"> --- </h1>
                                    <h2 class="niveauPar"> --- </h2>
                                    <h4 class="debutPar"> --- </h4>
                                    <h4 class="finPar"> --- </h4>
                                    <h4 class="distPar"> --- </h4>
                                    </br>
                                    </br>
                                    </br>
                                    <h3>VOTRE ADVERSAIRE</h3>
                                    <h4 class="joueurP"> --- </h4>
                                    <h4 class="distParAD"> --- </h4>
                                </div>
                            </div>
                        </div>
                    </div>    
            </div>
        </main>
    </div>
</body>
</html>