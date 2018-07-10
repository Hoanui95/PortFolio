<?php
  require_once("action/supprimerAction.php");

  $action = new SupprimerAction();
  $action->execute();
  
  if($action->suppetat == "supp")
  {
    echo "
        <script type=\"text/javascript\">
        alert('joueur supprimé :(');
        </script>
    ";
  }
    if($action->suppetat == "err")
    {
        echo "
            <script type=\"text/javascript\">
            alert('erreur dans la supprission  :)');
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
    <link href="css/singin.css" rel="stylesheet">
    <!-- Js local -->
    <script src="javascript/loginJS.js"></script>

    

  </head>



<link  href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<body class="main">
          <div class="login-screen"></div>
              <div class="login-center">
                  <div class="container min-height" style="margin-top: 20px;">
                    <div class="row">
                          <div class="col-xs-4 col-md-offset-8">
                              <div class="login" id="card">
                                <div class="front signin_form"> 
                                  <h2>Supprimer un joueur</h2>
								  
								 	 <form action="supprimer.php" method="POST" class="login-form">
                                      <div class="form-group">
                                          <div class="input-group">
                                              <input name="nomS" id="inputNom" class="form-control" placeholder="Nom"> 
                                              <span class="input-group-addon">
                                                  <i class="glyphicon glyphicon-user"></i>
                                              </span>
                                          </div>
                                      </div>
                                      <div class="form-group supp-btn lescenter">
                                          <input type="submit" class="btn" value="SUPPRIMER">
                                      </div>
                                  </form>
                                </div>
                            
                              </div>
                          </div>   <!--fin de row -->
                      </div>
                  </div>
              </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-Flip/1.0.18/jquery.flip.js"></script>
        
    </body>
    </form>
  </body>
</html>
