<?php
  require_once("action/LoginAction.php");

  $action = new LoginAction();
  $action->execute();


  if($action->wrongLogin)
  {
    echo "
        <script type=\"text/javascript\">
        alert('IDENTIFIANT INVALIDE :(');
        </script>
    ";
 }
  
?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="images/favicon.ico">
    <title>Tankem</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--  styles    -->
    <link href="css/login.css" rel="stylesheet">
     <!-- Js local -->
     <script src="javascript/loginJS.js"></script>
  </head>



<link  href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<body class="main">
          <div class="login-screen"></div>
              <div class="login-center">
                  <div class="container min-height" style="margin-top: 20px;">
                    <div class="row">
                          <div class="col-xs-4 col-md-offset-8">
                              <div class="login" id="card">
                                <div class="front signin_form"> 
                                  <h2>Se connecter</h2>
                                  
                                  
                                  <form action="index.php" method="POST" class="login-form">
                                      <div class="form-group">
                                          <div class="input-group">
                                              <input name="username" id="inputEmail" class="form-control" placeholder="Email"> 
                                              <span class="input-group-addon">
                                                  <i class="glyphicon glyphicon-user"></i>
                                              </span>
                                          </div>
                                      </div>
                                      <div class="form-group">
                                          <div class="input-group">
                                              <input name="pwd"  id="inputPassword" type="password" class="form-control" placeholder="Mot de passe">
                                              <span class="input-group-addon">
                                                  <i class="glyphicon glyphicon-lock"></i>
                                              </span>
                                          </div>
                                      </div>
                                     
                                      
                                      <div class="form-group log-btn lescenter">
                                          <input type="submit" class="btn" value="Se connecter">
                                      </div>
                                      <div class="form-group sign-btn lescenter">
                                         <button class="btn" onclick="sinscrire()" type="button">Inscrire un joueur</button>
                                      </div>
                                      <div class="form-group supp-btn lescenter">
                                         <button class="btn" onclick="supp()" type="button">Supprimer un joueur</button>
                                      </div>
                                  </form>
                                </div>
                            
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-Flip/1.0.18/jquery.flip.js"></script>
    </body>

    </form>
  </body>
</html>
