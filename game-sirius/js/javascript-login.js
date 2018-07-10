let spriteList = [];
let ctx = null;

let planeAttack = undefined;
let attackFinish = undefined;
let moquer = undefined;
let id = undefined;

let audioPlane = new Audio("sound/plane.mp3");
let audioLogin = new Audio("sound/Fallen Army.mp3");



window.onload = function () {

	let canva = document.getElementById("canvasLogin");
	ctx = canva.getContext("2d");

	audioLogin.volume = 0.5;
	audioLogin.play();
	document.getElementById("volume").onclick = OnorOffVolume;

	ToggleLogin();
	animationLogin();
	
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
	id = window.requestAnimationFrame(mainTick);
}

function stopTick()
{
	window.cancelAnimationFrame(id);
}

function animationLogin()
{
	stopTick();

	spriteList = [];

	moquer = false;
	attackFinish = false;
	planeAttack = false;
	id = undefined;


	spriteList.push(new SoldierLeft());
	spriteList.push(new SoldierRight());
	spriteList.push(new Char());

	mainTick();
	setTimeout(animationLogin, 12000);
}

function OnorOffVolume()
{
	if (audioLogin.duration > 0 && !audioLogin.paused) {

		audioLogin.pause();
		/*document.getElementById("volume").style.backgroundImage =  "url('../images/volumeOff.png')";
		document.getElementById("volume").style.backgroundRepeat = "no-repeat";
		document.getElementById("volume").style.backgroundSize = "100% 100%";*/
	
	} else {
		audioLogin.play();
		/*document.getElementById("volume").style.backgroundImage =  "url('../images/volumeOn.png')";
		document.getElementById("volume").style.backgroundRepeat = "no-repeat";
		document.getElementById("volume").style.backgroundSize = "100% 100%";*/
	}
	
}
function ToggleLogin()
{
	$(".container-login").toggle("scale", 500)
}

function beginAttack()
{
	audioPlane.play();
    spriteList.push(new PlaneLogin());
	planeAttack = true;
}

function Moquer()
{
	moquer = true;
	attackFinish = false;
}