
let prg = null;
let percent = null;
let counter = 5;
let progress = 25;
let load = null;

let spriteList = [];
let ctx = null;

let veiculeIndex = 0;
let nameImages = ["armor.png", "autruche.png", "japanTank.png", "jet.png", "limace.png", "rebelBiker.png", "soucoupe.png"];
let flipImages = [false, false, true, true, true, true, false];
let scaleImages = [1.5, 1.5, 1.5, 1.3, 1, 1.7, 1.7];
let columnImages = [14, 11, 12, 7, 8, 4, 12];
let topImages = [-60, -60, -60, -40, -10, -90, -90];
let audioLoading = new Audio ("sound/loading.mp3");


window.onload = function () {


  
    let canva = document.getElementById("canvas-lobby");
    ctx = canva.getContext("2d");

    setTimeout(getUserInfo, 2000); // Appel initial (attendre 2 secondes)
    setTimeout(getList, 2000); // Appel initial (attendre 2 secondes

    prg = document.getElementById("progressCurrent");
    percent = document.getElementById("percentCount");
    counter = 5;
    progress = 25;
    audioLoading.play();
    load = setInterval(frame, 22);
    
    mainTick();
}

function mainTick()
{
    ctx.clearRect(0, 0, 1000, 800);
    
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
function frame()
{
    if(progress == 500 && counter == 100)
    {
        clearInterval(load);
        document.getElementById("lobby").style.display = "block";
        document.getElementById("deconnexion").style.display = "block";
        document.getElementById("loading").style.display = "none";
        audioLoading.pause();
        setTimeout(vehicule, 1500);
        
    }
    else
    {
        progress += 5;
        counter += 1;
        prg.style.width = progress + "px";
        percent.innerHTML = counter + "%";
    }
}

function vehicule()
{
    
    spriteList.push(new VehicleLobby(nameImages[veiculeIndex], flipImages[veiculeIndex], scaleImages[veiculeIndex], columnImages[veiculeIndex], topImages[veiculeIndex]));
    veiculeIndex += 1;
    if(veiculeIndex == 7)
    {
        veiculeIndex = 0;
    }
    setTimeout(vehicule, 1500);
}


function getUserInfo() {
    $.ajax({
        url : "ajax-user-info.php",
        type : "POST"
    })
    .done(function (msg) { 
    var reponse = JSON.parse(msg);

    document.querySelector("#name").innerHTML = "  " + reponse.username;

    document.querySelector("#hp").innerHTML = "  " + reponse.hp;

    document.querySelector("#type").innerHTML = "  " + reponse.type;
    
    document.querySelector("#mp").innerHTML = "  " + reponse.mp;

	document.querySelector("#niveau").innerHTML = "  " + reponse.level;

    setTimeout(getUserInfo, 2000);
    })
}

function getList() {
    $.ajax({
        url : "ajax-list.php",
        type : "POST"
    })
    .done(function (msg) { 
        var reponse = JSON.parse(msg);

        if (typeof reponse === "object") 
        {
    
            while (document.querySelector("#list-server").firstChild) {
                document.querySelector("#list-server").removeChild(document.querySelector("#list-server").firstChild);
            }

            for (i = 0; i < reponse.length; i++) {
                
                let parent = document.createElement("div");

                parent.className = "list";

                let pName = document.createElement("p");
                let name = document.createTextNode(reponse[i].name + "\n");
                pName.appendChild(name);

                let pLevel = document.createElement("p");
                let level = document.createTextNode(reponse[i].level + "\n");
                pLevel.appendChild(level);

                let pJoueurs = document.createElement("p");
                let nbjoueurs = document.createTextNode(reponse[i].nb + "/" + reponse[i].max_users + "\n");
                pJoueurs.appendChild(nbjoueurs);

                let pHp = document.createElement("p");
                let hp = document.createTextNode(reponse[i].hp + "HP\n" );
                pHp.appendChild(hp);

                let pType = document.createElement("p");
                let type = document.createTextNode(reponse[i].type + "\n\n\n");
                pType.appendChild(type);
                
                let id = reponse[i].id;
                parent.onclick  =  function () {
                    enterGame(id);
                }; 

                parent.appendChild(pName);
                parent.appendChild(pLevel);
                parent.appendChild(pJoueurs);
                parent.appendChild(pHp);
                parent.appendChild(pType);

                document.querySelector("#list-server").appendChild(parent);

            }

        }
        setTimeout(getList, 2000); 

    })
}

function enterGame(idGame) 
{
    $.ajax({
        url : "ajax-enter.php",
        type : "POST",
        data : {
            id : idGame
        }
    })
    .done(function (msg) { 
    var reponse = JSON.parse(msg);
    
        if(reponse === "GAME_ENTERED")
        {
            window.location.href = "game.php";
        }
    
    })
        
}


