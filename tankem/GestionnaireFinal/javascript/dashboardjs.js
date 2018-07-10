window.onload = function () 
{
	$( "#btnTest" ).on( "click", function() {
		console.log("OJK")
		getCoolPoint();
	  });

}


function couleurEdit()
{
	let txtCouleur = document.querySelector("#couleurHex");
	let txtNom = document.querySelector("#inputNom");
	let txtMotDePasse = document.querySelector("#inputPwd");
	let txtPhrase = document.querySelector("#inputPhrase");
	console.log(txtCouleur.value);
	$.ajax({
		type : "POST",
		url : "ajaxCouleur.php",
		data : 
		{
			couleur : txtCouleur.value,
			mdp : txtMotDePasse.value,
			phrase : txtPhrase.value,
			leNom : txtNom.value
        }
	})	
	.done(response => {
		console.log("Refreshed");
		response = JSON.parse(response);
		console.log(response);
	});
}
function getCoolPoint(){
	$.ajax({
		type : "POST",
		url : "ajaxExp.php",
		data : {}
	})	
	.done(response => {
		console.log("Refreshed");
		response = JSON.parse(response);
		//response = convertToCoolpoint(response);
		console.log(response);
		/* $("#inputCoolpoints").val(response);
		$("#inputVie").val(response);
		$("#inputForce").val(response);
		$("#inputAgilite").val(response);
		$("#inputDex").val(response); */
	});
}
function CoolPointEdit()
{
	let cpVie = document.querySelector("#inputVie");
	let cpForce = document.querySelector("#inputForce");
	let cpAgilite = document.querySelector("#inputAgilite");
	let cpDex = document.querySelector("#inputDex");
	$.ajax({
		type : "POST",
		url : "ajaxCoolPoints.php",
		data : 
		{
			vie : cpVie.value,
			force : cpForce.value,
			agilite : cpAgilite.value,
			dex : cpDex.value			
        }
	})	
	.done(response => {
		console.log("Refreshed");
		response = JSON.parse(response);
		console.log(response);
		if (response == "Done")
		{
			alert ("Bravo, Vos informations ont été mis à jour ! ");
		}
	
		
	});
}

function convertToCoolpoint(experience){
	let delta = 2*2 - 4 * 1 * (2 - (experience/50));
	let niveau = ((-2+math.sqrt(delta))/(2)); 
	let cp = niveau * 5
	return cp;
}