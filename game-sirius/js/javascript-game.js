
let canAttack = true;
let spriteList = [];
let ctx = null;
let normal = false; 
let special1 = false;
let special2 = false;
let pourcentageLifePlayer = 0;
let pourcentageLifeEnnemy = 0;
let pourcentageStamina = 0;
let pourcentageMp = 0;
let pourcentageLifeAlly = [0, 0, 0];
let allyCount = 0;
let allyAttack = [false, false, false];
let ennemyAttack = false;
let ennemyIsAttack = false;
let playerIsAttack = false;
let youWin = false;
let youLose = false;

let audioWin = new Audio("sound/win.mp3");
let audioLose = new Audio("sound/lose.mp3");

window.onload = function () {

    document.getElementById("deconnexion").style.display = "block";

    let canva = document.getElementById("canvas");
    ctx = canva.getContext("2d");
    
    document.getElementById("Attack-1").onclick =  function () {
        getAction("Normal");
    };
    document.getElementById("Attack-2").onclick =  function () {
        getAction("Special1");
    };
    document.getElementById("Attack-3").onclick =  function () {
        getAction("Special2");
    };

    spriteList.push(new Parachute());
    spriteList.push(new Soldier());
    spriteList.push(new Ennemy())
    spriteList.push(new LifePlayer());
    spriteList.push(new Stamina());
    spriteList.push(new MpPlayer());
    spriteList.push(new LifeEnnemy());

    setTimeout(getState, 2000);
    setTimeout(enableButtons, 2000); 
    mainTick();
}

function mainTick()
{
    ctx.clearRect(0, 0, screen.width, screen.height);
    
	for (let index = 0; index < spriteList.length; index++) {
		const element = spriteList[index];
		const alive = element.tick();
		
		if(!alive){
			spriteList.splice(index, 1);
			index--;
		}
	}

	window.requestAnimationFrame(mainTick);
}

function enableButtons()
{
    document.getElementById("Attack-1").disabled = false;
    document.getElementById("Attack-2").disabled = false;
    document.getElementById("Attack-3").disabled = false;
}
function getState() {
    $.ajax({
        url : "ajax-state.php",
        type : "POST"
    })
    .done(function (msg) { 
    var reponse = JSON.parse(msg);

  
    
    if (typeof reponse !== "object") {
        if(reponse == "GAME_NOT_FOUND_WIN")
        {
            audioWin.play();
            youWin = true;
            pourcentageLifeEnnemy = 0;
            setTimeout(screenWin, 4000);
            document.getElementById("win").style.animation = "fadein 4s ease";
            document.onclick = redirectionLobby;
            
            
        }
        else if(reponse == "GAME_NOT_FOUND_LOST") 
        {
            audioLose.play();   
            youLose = true;
            pourcentageLifePlayer = 0;
            setTimeout(screenGameOver, 4000);
            document.getElementById("gameover").style.animation = "fadein 4s ease";
            document.onclick = redirectionLobby;
        }
        else if(reponse == "GAME_NOT_FOUND_NONE") 
        {

            setTimeout(redirectionLobby, 10);
        }
    }
    else 
    {
        pourcentageLifePlayer = (reponse.player.hp / reponse.player.max_hp) * 100;
        pourcentageLifeEnnemy = (reponse.game.hp / reponse.game.max_hp) * 100;
        pourcentageMp = (reponse.player.mp / reponse.player.max_mp) * 100;

        if(reponse.game.attacked == true)
        {
            ennemyAttack = true;
        }
        
        for (let i = 1; i < reponse.player.skills.length; i++) {
            if(reponse.player.mp < reponse.player.skills[i].cost)
            {
                document.getElementById("Attack-" + (i+1).toString()).disabled = true;
                document.getElementById("Attack-" + (i+1).toString()).style.opacity = "0.5";
            } 
            else{
                document.getElementById("Attack-" + (i+1).toString()).disabled = false;
                document.getElementById("Attack-" + (i+1).toString()).style.opacity = "1";
            }    
        }
        if(reponse.other_players.length == 0 || reponse.other_players.length < allyCount)
        {
            allyCount = 0;
            for (let i = 0; i < spriteList.length; i++) {
                if(spriteList[i].hasOwnProperty('name'))
                {
                    spriteList.splice(i, 1);
                    i--;
                }
                else if(spriteList[i].hasOwnProperty('idLife'))
                {
                    spriteList.splice(i, 1);
                    i--;
                }
            }

           
        }
     

        for (i = 0; i < reponse.other_players.length; i++) {
            if(allyCount < reponse.other_players.length)
            {
                spriteList.push(new Ally(allyCount, reponse.other_players[allyCount].name));
                allyCount += 1;
            }

            if(reponse.other_players[i].attacked != "--")
            {
                allyAttack[i] = true;
            }

            pourcentageLifeAlly[i] = (reponse.other_players[i].hp / reponse.other_players[i].max_hp) * 100;
        } 
        setTimeout(getState, 2000); // Attendre 2 secondes avant de relancer l’appel
    }
    
    })
}

function getAction(attack) {
   if(canAttack)
   {
        canAttack = false;

        $.ajax({
            url : "ajax-action.php",
            type : "POST",
            data : {
                attack : attack
            }
        })
        .done(function (msg) { 
        var reponse = JSON.parse(msg);
        if(reponse === "OK")
        {
            reload();
            if(attack == "Normal")
            {
                normal = true;
            }
            else if(attack == "Special1")
            {
                special1 = true;
            }
            else if(attack == "Special2")
            {
                special2 = true;
            }
        }
        setTimeout(changeStateAttack, 2000);
    })
   }
    
}

function reload()
{
    pourcentageStamina = 0;
}

function changeStateAttack()
{
    canAttack = true;
}

function redirectionLobby()
{
    window.location.href = "lobby.php";
}

function screenGameOver()
{
    document.getElementById("gameover").style.opacity = "0.9";
}


function screenWin()
{
    document.getElementById("win").style.opacity = "0.9";
}