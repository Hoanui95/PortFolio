let nomNiveau;
let statusNiveau;
let statusid;
let delaiMin;
let delaiMax;
let j1X;
let j1Y;
let j2X;
let j2Y;
let largeur;
let hauteur;
let modifNiveau;
let debut;
let debutX = 0;
let debutY = 0;
let j1here = false;
let j2here = false;

window.onload = function () {
	drawMap();
	moveOnMap();
	$("#btnValidation").prop("disabled",true);
    document.getElementById("envoyer").onclick = function(){		
		nomNiveau = document.getElementById("titre").value;
		statusNiveau = document.getElementById("status").value;
		if(statusNiveau == "actif")
		{
			statusid = 1;
		}
		else if(statusNiveau == "test")
		{
			statusid = 2;
		}
		else if(statusNiveau == "inactif")
		{
			statusid = 3;
		}
		delaiMin = document.getElementById("delais_min").value;
        delaiMax = document.getElementById("delais_max").value;
		largeur = document.getElementById("largeur").value;
		hauteur = document.getElementById("hauteur").value;			
		modifNiveau = new Array();
		changeAttrCube();
		for (let y = 0; y < hauteur; y++) 
		{
			for (let x = 0; x < largeur; x++) 
			{
				let id = y.toString() + x.toString() ;
				let temp = "#"+ id;
				
				if($(temp).attr('class') !== "cube")
				{
					if($(temp).attr('class').includes('joueur1'))
					{
						j1X = x;
						j1Y = y;
		
					}
					else if($(temp).attr('class').includes('joueur2'))
					{
						j2X = x;
						j2Y = y;
					}

					if($(temp).attr('class') !== "cube joueur2")
					{
						if( $(temp).attr('class') !== "cube joueur1")
						{
							let arbre = 0;
							let mur = 1;
		
							if($(temp).attr('class').includes('arbre'))
							{
								arbre = 1;
							}
							
							if($(temp).attr('class').includes('murInverse'))
							{
								mur = 4;
							}
							else if($(temp).attr('class').includes('mur'))
							{
								mur = 2;
							}
							else if($(temp).attr('class').includes('murMobile'))
							{
								mur = 3;
							}		
							modifNiveau.push(new Array(x, y, arbre, mur))
						}
					}
				}
			}	
		}  
	
		if($('body').find('.joueur1').length == 0)
		{
			alert("Veuillez placer le joueur1");
		}
		else if( $('body').find('.joueur2').length == 0)
		{
			alert("Veuillez placer le joueur2");
			envoyerInfo();	
		}
		else if (nomNiveau.length == 0){
			alert("Veuillez Entrer un nom de niveau");
		}
		else
		{
			envoyerInfo();
		}
	}		
}

function changeAttrCube()
{
	let id;
	let idAfter;
	console.log("CHANGE")
	for(let i = 0 ; i < hauteur ; i++){
		for(let j = 0 ; j < largeur ; j++){	
			id = (parseInt(hauteur)-i).toString() + (j+1).toString();
			idAfter = (i).toString() + (j).toString()
			$("#"+id).attr("id", idAfter);
		}
	}
}

function envoyerInfo()
{
	
	$.ajax({
		type : "POST",
		url : "ajax.php",
		data : {
			nom : nomNiveau,
			status : statusid,
			delaimin : delaiMin,
			delaimax : delaiMax,
			largeur : largeur,
			hauteur : hauteur,
			modifications : modifNiveau,
			j1x : j1X, 
			j1y : j1Y, 
			j2x : j2X, 
			j2y : j2Y
		},
		error : function (e,x){
			console.log(e);
		}		
	})
	.done(response => {
		location.reload();
	});
	
	

}

function moveOnMap(){	
	document.onkeydown = function (e) {
		let temp = debut;
		let posX = parseInt(debutX);
		let posY = parseInt(debutY);
		let selector = 'div[posx="'+ posX.toString() +'"][posy="'+ posY.toString() +'"]';
		if(e.which == 68){		
			if(posX < parseInt(largeur)){
				$('div[posx="'+ posX.toString() +'"][posy="'+ posY.toString() +'"]').css("background-color", "rgb(153, 153, 102)");	
				posX = parseInt(debutX) + 1 ;			
				$('div[posx="'+ posX.toString() +'"][posy="'+ posY.toString() +'"]').css("background-color", "darkgrey");	
				debutX = posX.toString();
			}
		}
		else if(e.which == 65){
			if(posX > 1){
				$('div[posx="'+ posX.toString() +'"][posy="'+ posY.toString() +'"]').css("background-color", "rgb(153, 153, 102)");	
				posX = parseInt(debutX) - 1 ;			
				$('div[posx="'+ posX.toString() +'"][posy="'+ posY.toString() +'"]').css("background-color", "darkgrey");	
				debutX = posX.toString();
			}
		}
		else if(e.which == 87){
			if(posY > 1){
				$('div[posx="'+ posX.toString() +'"][posy="'+ posY.toString() +'"]').css("background-color", "rgb(153, 153, 102)");	
				posY = parseInt(debutY) - 1 ;			
				$('div[posx="'+ posX.toString() +'"][posy="'+ posY.toString() +'"]').css("background-color", "darkgrey");	
				debutY = posY.toString();
			}
		}
		else if(e.which == 83){
			if(posY < parseInt(hauteur)){
				$('div[posx="'+ posX.toString() +'"][posy="'+ posY.toString() +'"]').css("background-color", "rgb(153, 153, 102)");	
				posY = parseInt(debutY) + 1 ;			
				$('div[posx="'+ posX.toString() +'"][posy="'+ posY.toString() +'"]').css("background-color", "darkgrey");	
				debutY = posY.toString();
			}
		}
		else if(e.which == 103){			
			if($(selector).attr('class').includes("mur")){
				if(!$(selector).attr('class').includes("murInverse") && !$(selector).attr('class').includes("murMobile")){
					$(selector).removeClass("mur");
				}
				else{
					$(selector).removeClass("murInverse");
					$(selector).removeClass("murMobile");
					$(selector).addClass('mur');	
				}
			}
			else{
				$(selector).addClass('mur');
			}		
		}
		else if(e.which == 104){
			if(!$(selector).attr('class').includes("murInverse")){
				if(!$(selector).attr('class').includes("mur") && !$(selector).attr('class').includes("murMobile")){
					$(selector).addClass('murInverse');								
				}
				else{
					$(selector).removeClass("mur");
					$(selector).removeClass("murMobile");
					$(selector).addClass('murInverse');	
				}							
			}
			else{
				$(selector).removeClass("murInverse");
			}
		}
		else if(e.which == 105){
			if(!$(selector).attr('class').includes("murMobile")){
				if(!$(selector).attr('class').includes("mur") && !$(selector).attr('class').includes("murInverse")){
					$(selector).addClass('murMobile');							
				}
				else{
					$(selector).removeClass("mur");
					$(selector).removeClass("murInverse");
					$(selector).addClass('murMobile');	
				}							
			}
			else{
				$(selector).removeClass("murMobile");
			}
		}
		else if(e.which == 100){
			if(!$(selector).attr('class').includes("arbre")){
				$(selector).html('<img id="arbre" src="images/arbre.png" alt="" draggable="true" width="30" height="30">');
				$(selector).addClass('arbre');
				$(selector).removeClass("joueur1");
				$(selector).removeClass("joueur2");
			}
			else{
				$(selector).removeClass('arbre');
				$(selector).html("");
			}
		}
		else if(e.which == 97){			
			if(!$(selector).attr('class').includes("joueur1")){
				$("#center div").removeClass("joueur1");
				$(".joueur1").remove();
				$("#joueur1").remove();
				$(selector).removeClass("arbre");
				$(selector).removeClass("joueur2");
				$(selector).html('<img id="joueur1" src="images/tank1.png" alt="" draggable="true" width="30" height="30">');
				$(selector).addClass('joueur1');							
			}
			else{		
				$("#center div").removeClass("joueur1");
				$(".joueur1").remove();
				$("#joueur1").remove();
				$(selector).html("");
			}
		}
		else if(e.which == 98){
			if(!$(selector).attr('class').includes("joueur2")){
				$("#center div").removeClass("joueur2");
				$(".joueur2").remove();
				$("#joueur2").remove();
				$(selector).removeClass("arbre");
				$(selector).removeClass("joueur1");
				$(selector).html('<img id="joueur2" src="images/tank2.png" alt="" draggable="true" width="30" height="30">');
				$(selector).addClass('joueur2');								
			}
			else{		
				$("#center div").removeClass("joueur2");
				$(".joueur2").remove();
				$("#joueur2").remove();
				$(selector).html("");
			}
		} 
	}	
}

function drawMap(){
	$("#largeur , #hauteur").on("change", function(){
		$("#btnValidation").prop("disabled",false);
		largeur = document.getElementById("largeur").value;
		hauteur = document.getElementById("hauteur").value;
		if($("#largeur").val() == 0){
			$("#largeur").val("6");
			largeur = 6;
		}
		else if($("#hauteur").val() == 0){
			$("#hauteur").val("6");
			hauteur = 6;
		}
		let x = $("#hauteur").val();
		let y = $("#largeur").val();
		let i;
		let j;
		document.getElementById("center").innerHTML = "";
		for(i = 0 ; i < x ; i++){	
			if(i != 0){		
				let parent = document.getElementById("center");
				let node = document.createElement("div");
				node.setAttribute("class","");			
				parent.appendChild(node);
			}	
			for(j = 0 ; j < y ; j++){
				id = (i+1).toString() + (j+1).toString();
				parent = document.getElementById("center");
				node = document.createElement("div");
				node.setAttribute("class","cube");
				node.setAttribute("style","float:left");		
				node.setAttribute("id", id);	
				node.setAttribute("posX", (j+1).toString());
				node.setAttribute("posY", (i+1).toString());							
				parent.appendChild(node);	
				node.onclick = function(){					
					$("#"+debut).css("background-color", "rgb(153, 153, 102)");
					$('div[posx="'+ debutX.toString() +'"][posy="'+ debutY.toString() +'"]').css("background-color", "rgb(153, 153, 102)");	
					debut = $(this).attr('id');
					debutX = $(this).attr('posx');
					debutY = $(this).attr('posY');
					$("#"+debut).css("background-color", "darkgrey");					
					if($("#item").val() == "arbre"){
						if(!$(this).attr('class').includes("arbre")){
							$(this).html('<img id="arbre" src="images/arbre.png" alt="" draggable="true" width="30" height="30">');
							$(this).addClass('arbre');
						}
						else{
							$(this).removeClass('arbre');
							$(this).html("");
						}
					}
					else if($("#item").val() == "mur"){
						if($(this).attr('class').includes("mur")){
							if(!$(this).attr('class').includes("murInverse") && !$(this).attr('class').includes("murMobile")){
								$(this).removeClass("mur");
							}
							else{
								$(this).removeClass("murInverse");
								$(this).removeClass("murMobile");
								$(this).addClass('mur');	
							}
						}
						else{
							$(this).addClass('mur');
						}						
					}
					else if($("#item").val() == "murInverse"){
						if(!$(this).attr('class').includes("murInverse")){
							if(!$(this).attr('class').includes("mur") && !$(this).attr('class').includes("murMobile")){
								$(this).addClass('murInverse');								
							}
							else{
								$(this).removeClass("mur");
								$(this).removeClass("murMobile");
								$(this).addClass('murInverse');	
							}							
						}
						else{
							$(this).removeClass("murInverse");
						}
					}	
					else if($("#item").val() == "murMobile"){
						if(!$(this).attr('class').includes("murMobile")){
							if(!$(this).attr('class').includes("mur") && !$(this).attr('class').includes("murInverse")){
								$(this).addClass('murMobile');							
							}
							else{
								$(this).removeClass("mur");
								$(this).removeClass("murInverse");
								$(this).addClass('murMobile');	
							}							
						}
						else{
							$(this).removeClass("murMobile");
						}
					}
					else if($("#item").val() == "joueur1"){
						if(!$(this).attr('class').includes("joueur1")){
							$("#center div").removeClass("joueur1");
							$(".joueur1").remove();
							$("#joueur1").remove();
							$(this).removeClass("arbre");
							$(this).removeClass("joueur2");
							$(this).html('<img id="joueur1" src="images/tank1.png" alt="" draggable="true" width="30" height="30">');
							$(this).addClass('joueur1');								
						}
						else{		
							$("#center div").removeClass("joueur1");
							$(".joueur1").remove();
							$("#joueur1").remove();
							$(this).html("");
						}
					}
					else if($("#item").val() == "joueur2"){
						if(!$(this).attr('class').includes("joueur2")){
							$("#center div").removeClass("joueur2");
							$(".joueur2").remove();
							$("#joueur2").remove();
							$(this).removeClass("arbre");
							$(this).removeClass("joueur1");
							$(this).html('<img id="joueur2" src="images/tank2.png" alt="" draggable="true" width="30" height="30">');
							$(this).addClass('joueur2');								
						}
						else{		
							$("#center div").removeClass("joueur2");
							$(".joueur2").remove();
							$("#joueur2").remove();
							$(this).html("");
						}
					}				
				}
			}
		}		
	}); 
}
function verification(){
	
}
