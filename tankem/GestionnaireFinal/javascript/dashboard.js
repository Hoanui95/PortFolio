let lesParties;
let lesInfo;

let statArme = [];
let statMap = [];
let statDistance = [];
let simulCoolpoints = 100;
let simulCoolpointsPercent = "45%";
let colR = 255;
let colG = 0;
let colB = 0;
LabelResult = ["A", "B", "C", "D", "E", "F", "G"];
DataResult = [1,2,3,4,5,6,7];
window.onload = () =>{
    statButtonPanel();
    colorPicker();
    //arrays2graph(LabelResult, DataResult, "test function");

    // Chercher les informations du joueur 
    chargerinfo();

    $("canvas").hide();
   


    infoCoolpoints();
    infoPercentCoolpoints();
    gestionCoolpoints();

 
    //convertToCoolpoint(550)

    $( "#btnTest" ).on( "click", function() {
		console.log("OK")
		//CoolPointEdit();
    });
      
      

    
	
}
function arrays2graph(labelArray , dataArray, statsName){
    let ctx = document.getElementById('canvas').getContext('2d');
    ctx.clearRect(0,0,1200,500);
    let chart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labelArray,
            datasets: [{
                label: statsName,
                /* backgroundColor: 'rgb(255, 99, 132)', */
                borderColor: 'rgb(255, 99, 132)',
                data: dataArray,
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });
}
function infoCoolpoints(){        
    $("#coolpoints-tab").on( "click", function() {
        getCoolPoint();
    });
    $("#btnSaveCoolPoints").on( "click", function() {
        CoolPointEdit();
    });
    
}
function infoPercentCoolpoints(vie, force, agilite, dex){
    $("#inputPercentVie").val((parseFloat(vie)*5)+"%");
    $("#inputPercentForce").val((parseFloat(force)*5)+"%");
    $("#inputPercentAgilite").val((parseFloat(agilite)*2.5)+"%");
    $("#inputPercentDex").val((parseFloat(dex)*2.5)+"%");

    $("#inputVie").val(parseFloat(vie));
    $("#inputForce").val(parseFloat(force));
    $("#inputAgilite").val(parseFloat(agilite));
    $("#inputDex").val(parseFloat(dex));
}
function gestionCoolpoints(){
    $("#btnVie").on( "click", function() {
        console.log("click")        
        if($("#inputVie").val()< 25 ){
            coolpoints2skills("vie", true);
        }  
      });
    $( "#btnVieMinus" ).on( "click", function() {
        console.log("click")
        if($("#inputVie").val()!=0 ){
            coolpoints2skills("vie", false);
        }        
    });
    $("#btnForce").on( "click", function() {
        console.log("click")        
        if($("#inputForce").val()< 25 ){
            coolpoints2skills("Force", true)
        }  
      });
    $( "#btnForceMinus" ).on( "click", function() {
        console.log("click")
        if($("#inputForce").val()!=0){
            coolpoints2skills("Force", false)
        }
    });
    $("#btnAgilite").on( "click", function() {
        console.log("click")
        if($("#inputAgilite").val()< 25){
            coolpoints2skills("Agilite", true)
        }        
      });
    $( "#btnAgiliteMinus" ).on( "click", function() {
        console.log("click")
        if($("#inputAgilite").val()!=0){
            coolpoints2skills("Agilite", false)
        }
    });
    $("#btnDex").on( "click", function() {
        console.log("click")        
        if($("#inputDex").val()< 25){
            coolpoints2skills("Dexterite", true)
        }
      });
    $( "#btnDexMinus" ).on( "click", function() {
        console.log("click")
        if($("#inputDex").val()!=0){
            coolpoints2skills("Dexterite", false)
        }
    });
}
function coolpoints2skills(skill, increment){
    if(increment){
        simulCoolpoints--;
    }
    else{
        simulCoolpoints++; 
    }
    if(skill == "vie"){
        $("#inputVie").val(operator(increment, $("#inputVie").val()));   
        $("#inputPercentVie").val(operatorPercent(increment, $("#inputPercentVie").val(), 5));       
    }
    else if(skill == "Force"){
        $("#inputForce").val(operator(increment, $("#inputForce").val()));    
        $("#inputPercentForce").val(operatorPercent(increment, $("#inputPercentForce").val(), 5));       
    }
    else if(skill == "Agilite"){
        $("#inputAgilite").val(operator(increment, $("#inputAgilite").val())); 
        let temp = $("#inputPercentAgilite").val();
        $("#inputPercentAgilite").val(operatorPercent(increment, temp, 2.5));            
    }
    else if(skill == "Dexterite"){
        $("#inputDex").val(operator(increment, $("#inputDex").val())); 
        $("#inputPercentDex").val(operatorPercent(increment, $("#inputPercentDex").val(), 2.5));
    }
    $("#inputCoolpoints").val(simulCoolpoints);
}
function operator(increment, val){
    console.log("OUI : " + val)
    if(increment){

        val++;
    }
    else{
        val--;
    }
    return val;
}
function operatorPercent(increment, val, percent){
    console.log(val)
    let str = val.slice(0, -1);
    console.log(str)
    str = parseFloat(str);
    console.log("OUI % : " + str)
    if(increment){

        str+=percent;
    }
    else{
        str-=percent;
    }
    str = str.toString();
    val = str + "%"; 
    return val;
}


function statButtonPanel(){
	$( "#stats-tab" ).on( "click", function() {
        $("#hide_stats").show();
        getStats("arme_efficace");
        $("canvas").hide();
	  });
	$( "#coolpoints-tab" ).on( "click", function() {
        $("#hide_stats").hide();
        
	});
	$( "#profile-tab" ).on( "click", function() {
        $("#hide_stats").hide();
      });

      
    $( "#btnStatArmePref" ).on( "click", function() {        
        getStats("arme_prefere");  
        $("canvas").show();  
    });
    $( "#btnStatParties" ).on( "click", function() {        
        getStats("partie");    
        $("canvas").show();
    });
    $( "#btnStatDensite" ).on( "click", function() {        
        getStats("densite");  
        $("canvas").show();
    });
    $( "#btnStatEnemies" ).on( "click", function() {        
        getStats("enemies");  
        $("canvas").show();
    });
    $( "#btnCoolpoints" ).on( "click", function() {        
        $('.nav-tabs a[href="#tab_coolpoints"]').tab('show');
    });
    $( "#btnstats" ).on( "click", function() {        
        $('.nav-tabs a[href="#tab_stats"]').tab('show');
    });
}




function calculerNiveau(experience)
{
    let niveau;
    delta = 2*2 - 4 * 1 * (2 - (experience/50))
    niveau = parseInt((-2+ Math.sqrt(delta))/(2))
    if (experience <  250)
    {
        niveau = 0; 
    }
    return niveau;
}

function chargerParties(joueurID)
{
    $.ajax({
		type : "POST",
        url : "ajaxPartieLoad.php", // a creer 
        data : 
		{
			joueurID : joueurID
        }
	})
	
    .done(response => 
        {
		console.log("cherger parties");
		response = JSON.parse(response);
		//console.log("ELs parties " + response);
        lesParties = response;
        if (lesParties.length != 0 )
        {
            $("#inputParti").text(lesParties[lesParties.length-1]["PAR_DATE_DEBUT"]);
        }
       else 
       {
             $("#inputParti").text("AUCUNE");
       }
		mettreParties(response);
		
	});
}

function mettreParties(info)
{
    document.getElementById("partiesListe").innerHTML = "";
	let template = document.querySelector("#template4").innerHTML;


    if (info.length == 0 )
    {
        console.log("ici");
        $("#messagePartie").text("Aucune partie Jouée ! Allez vous amuser et revenez :)");
    }

	for (var i = 0; i < info.length; i++) 
	{
        console.log("ici");
		
        let node = document.createElement("div");

		node.setAttribute("class","col-10");
		node.setAttribute("class","unePartie");
		node.addEventListener("click", partieDetaille);
		node.setAttribute("id",i);

		node.innerHTML = template;

        node.querySelector("#idPart").innerHTML = info[i]["PAR_ID"];
        document.getElementById("partiesListe").appendChild(node);


       
        if (info[i]["PAR_ID_JOUEUR_GAGNANT"] == lesInfo[0]["JOU_ID"])
        {
            console.log("la");
            node.querySelector("#j1").innerHTML = "GAGNÉ";
            $( "#"+i).addClass( "partgagne" );
        }
        else 
        {
            console.log("OUla");
            node.querySelector("#j1").innerHTML = "PERDU";
            $( "#"+i).addClass( "partperdu" );
        }
        
        
        
        
        // Chercher toutes les parties pour les afficher 

	}
}


function partieDetaille()
{
    let leid = $( this ).attr( "id" );
    let jou_gagant;
    let dist;
    let distAD;
    let adversaire;

    // TEST


    console.log("le id du div :" + leid);
    console.log(lesParties);   

    console.log("lesInfo[0] :" + lesInfo[0]);



    if (lesParties[leid]["PAR_ID_JOUEUR_GAGNANT"] == lesInfo[0]["JOU_ID"])
    {
        a_gagne = true;
        adversaire = lesParties[leid]["perdant"];
         
        $( ".joueurG" ).html( "vous avez GAGNÉ cette partie");

        dist =  lesParties[leid]["PAR_DISTANCE_GAGNANT"];
        distAD =  lesParties[leid]["PAR_DISTANCE_PERDANT"];
    }
    else 
    {
        a_gagne = false;
        adversaire = lesParties[leid]["gagnant"]; 
        $( ".joueurG" ).text("vous avez PERDU cette partie");

        dist =  lesParties[leid]["PAR_DISTANCE_PERDANT"];
        distAD =  lesParties[leid]["PAR_DISTANCE_GAGNANT"];
    }

    $( ".niveauPar" ).text("Niveau : " + lesParties[leid]["PAR_ID_NIVEAU_JOUE"]);
    $( ".joueurP" ).text("Son nom : " + adversaire);
    $( ".debutPar" ).text("Début de la partie : " + lesParties[leid]["PAR_DATE_DEBUT"]);
    $( ".finPar" ).text("Fin de la partie : " + lesParties[leid]["PAR_DATE_FIN"]);
    $( ".distPar" ).text("Votre distance parcouru : " + dist);
    $( ".distParAD" ).text("Sa distance parcouru : " + distAD);

    
    
    console.log(lesParties[leid]);

    
}

// FONCTION POUR CHERCHER les informations d'un joueur 
function chargerinfo()
{
    $.ajax({
		type : "POST",
        url : "ajaxInfoLoad.php",
        error : function (e,x)
        {
            console.log(e);
            console.log(x);
        }

        
	})
	
    .done(response => 
        {
		console.log("chargé Info");
		response = JSON.parse(response);
        console.log(response);
        lesInfo = response;

        
        //$('#inputNom').html()

        //$("#inputNom").value = "My value";
        document.getElementById("inputNom").value = response[0]["JOU_NOM"];
        document.getElementById("inputPwd").value = response[0]["JOU_MOTDEPASSE"];
        document.getElementById("inputPhrase").value = response[0]["JOU_PHRASEPERSONNELLE"];
        document.getElementById("couleurHex").value = "R:"+response[0]["JOU_R"]+" G:"+response[0]["JOU_G"]+" B:"+response[0]["JOU_B"];        
        document.getElementById("inputExp").value = response[0]["JOU_EXPERIENCE"];

        $('#colorpicked').css('background-color', 'rgb('+response[0]["JOU_R"]+','+response[0]["JOU_G"]+','+response[0]["JOU_B"]+')');


        $("#inputNiveau").text(calculerNiveau(response[0]["JOU_EXPERIENCE"]));
        $("#inputExp").text(response[0]["JOU_EXPERIENCE"]);
        

        
        chargerParties(response[0]["JOU_ID"]);
        

    });    
}

function profileEdit()
{
	let txtCouleur = document.querySelector("#couleurHex");
	let txtNom = document.querySelector("#inputNom");
	let txtMotDePasse = document.querySelector("#inputPwd");
	let txtPhrase = document.querySelector("#inputPhrase");
    console.log(txtNom.value);
    console.log(txtMotDePasse.value);
    console.log(txtPhrase.value);
	$.ajax({
		type : "POST",
		url : "ajaxProfile.php",
		data : 
		{
            leNom : txtNom.value,
            colR : colR,
            colG : colG,
            colB : colB,
			mdp : txtMotDePasse.value,
			phrase : txtPhrase.value
        },
        error : function (e,x)
        {
            console.log(e);
            console.log(x);
        }
	})	
	.done(response => {
        response = JSON.parse(response);
        if(response != "erreur"){
            console.log("Refreshed");
            alert("Votre profil a été mis à jour!");
        }
        else{
            alert("Bien esseyé !");
        }
        
	});
}
function getCoolPoint(){
	$.ajax({
		type : "POST",
		url : "ajaxExp.php",
		data : {
        },
        error : function (e,x)
        {
            console.log(e);
            console.log(x);
        }
    })	    
	.done(response => {
        console.log("Refreshed");
        console.log(response);
		response = JSON.parse(response);
        console.log(response[0].JOU_EXPERIENCE);
        
        infoPercentCoolpoints(response[0].JOU_COOLPOINTVIE, response[0].JOU_COOLPOINTFORCE, response[0].JOU_COOLPOINTAGILITE, response[0].JOU_COOLPOINTDEXTERITE);
        simulCoolpoints = convertToCoolpoint(response[0].JOU_EXPERIENCE);
        $("#inputCoolpoints").val(simulCoolpoints);
    });
}
function CoolPointEdit()
{
	let cpVie = $("#inputVie").val();
	let cpForce = $("#inputForce").val();
	let cpAgilite = $("#inputAgilite").val();
    let cpDex = $("#inputDex").val();
    //let cpExp = $("#inputCoolpoints").val();
    console.log(cpVie)
    console.log(cpForce)
    console.log(cpAgilite)
    console.log(cpDex)    
   
	$.ajax({
		type : "POST",
		url : "ajaxCoolPoints.php",
		data : 
		{
			vie : cpVie,
			force : cpForce,
			agilite : cpAgilite,
            dex : cpDex,
            //exp : cpExp	
        }
	})	
	.done(response =>{
        console.log("Refreshed");
        alert("Vos coolpoints ont été mis à jour!")		
	});
}

function getStats(type)
{
	$.ajax({
		type : "POST",
		url : "ajaxStats.php",
		data : 
		{
			query : type
        }
	})	
	.done(response =>{
        console.log(response)
        console.log("Refreshed");	
        response = JSON.parse(response);
        console.log(response)
        if(type == "arme_efficace"){
            armeEfficace(response[0])
        }
        else if(type == "arme_prefere"){            
            arrays2graph(Object.keys(response[0]), Object.values(response[0]), "Stats Armes préférés");
        }
        else if(type == "partie"){     
            arrays2graph(Object.keys(response[0]), Object.values(response[0]), "Stats Parties");       
        }
        else if(type == "enemies"){     
            let labelTemp = [];
            let valueTemp = [];
            for(ennemies in response){
                //console.log(response[date])
                labelTemp.push(response[ennemies].JOU_NOM)
                valueTemp.push(response[ennemies].KILL)
            }   
            arrays2graph(labelTemp, valueTemp, "Stats TOP 5 Ennemies");         
        }
        else if(type == "densite"){ 
            let labelTemp = [];
            let valueTemp = [];
            for(date in response){
                //console.log(response[date])
                labelTemp.push(response[date].D)
                valueTemp.push(response[date].NB_PARTIE)
            }   
            arrays2graph(labelTemp, valueTemp, "Stats Densité");       
        }
        
	});
}
function armeEfficace(array){
    console.log(array)
    if(array.COU_ID == array.ARM_ID_CANON){
        console.log("L'ARME LA PLUS EFFICACE EST : CANON");
        document.getElementById("prefgun").innerHTML = "L'ARME LA PLUS EFFICACE EST : CANON";
        
    }
    else if(array.COU_ID == array.ARM_ID_GRENADE){
        console.log("L'ARME LA PLUS EFFICACE EST : GRENADE");
        document.getElementById("prefgun").innerHTML = "L'ARME LA PLUS EFFICACE EST : GRENADE";
    }
    else if(array.COU_ID == array.ARM_ID_MISSILLE){
        console.log("L'ARME LA PLUS EFFICACE EST : MISSILLE");
        document.getElementById("prefgun").innerHTML  = "L'ARME LA PLUS EFFICACE EST : MISSILLE";
    }
    else if(array.COU_ID == array.ARM_ID_MITRAILLETTE){
        console.log("L'ARME LA PLUS EFFICACE EST : MITRAILLETTE");
        document.getElementById("prefgun").innerHTML="L'ARME LA PLUS EFFICACE EST : MITRAILLETTE";
    }
    else if(array.COU_ID == array.ARM_ID_PIEGE){
        console.log("L'ARME LA PLUS EFFICACE EST : PIEGE");
        document.getElementById("prefgun").innerHTML="L'ARME LA PLUS EFFICACE EST : PIEGE";
    }
    else if(array.COU_ID == array.ARM_ID_POMPE){
        console.log("L'ARME LA PLUS EFFICACE EST : POMPE");
        document.getElementById("prefgun").innerHTML ="L'ARME LA PLUS EFFICACE EST : POMPE";
    }

}
function convertToCoolpoint(experience){
	let delta = 2*2 - 4 * 1 * (2 - (experience/50));
	let niveau = ((-2+Math.sqrt(delta))/(2)); 
    let cp = parseInt(niveau) * 5;
    console.log(cp);
    cp = cp - parseInt($("#inputVie").val());
    cp = cp - parseInt($("#inputForce").val());
    cp = cp - parseInt($("#inputAgilite").val());
    cp = cp - parseInt($("#inputDex").val());
    console.log(cp);
	return cp;
}

function colorPicker(){
    function rgbToHsv(r, g, b) {
        if (arguments.length === 1) {
            g = r.g, b = r.b, r = r.r;
        }
        let max = Math.max(r, g, b), min = Math.min(r, g, b),
            d = max - min,
            h,
            s = (max === 0 ? 0 : d / max),
            v = max / 255;
    
        switch (max) {
            case min: h = 0; break;
            case r: h = (g - b) + d * (g < b ? 6: 0); h /= 6 * d; break;
            case g: h = (b - r) + d * 2; h /= 6 * d; break;
            case b: h = (r - g) + d * 4; h /= 6 * d; break;
        }
    
        return [
            h,
            s,
            v
        ];
    }
    
    function hexToRgb(hex) {
        let result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
        return result ? {
            r: parseInt(result[1], 16),
            g: parseInt(result[2], 16),
            b: parseInt(result[3], 16)
        } : null;
    }
    
    function rgbToHsl(rgbArr){
        let r1 = rgbArr[0] / 255;
        let g1 = rgbArr[1] / 255;
        let b1 = rgbArr[2] / 255;
     
        let maxColor = Math.max(r1,g1,b1);
        let minColor = Math.min(r1,g1,b1);
        //Calculate L:
        let L = (maxColor + minColor) / 2 ;
        let S = 0;
        let H = 0;
        if(maxColor != minColor){
            //Calculate S:
            if(L < 0.5){
                S = (maxColor - minColor) / (maxColor + minColor);
            }else{
                S = (maxColor - minColor) / (2.0 - maxColor - minColor);
            }
            //Calculate H:
            if(r1 == maxColor){
                H = (g1-b1) / (maxColor - minColor);
            }else if(g1 == maxColor){
                H = 2.0 + (b1 - r1) / (maxColor - minColor);
            }else{
                H = 4.0 + (r1 - g1) / (maxColor - minColor);
            }
        }
     
        L = L * 100;
        S = S * 100;
        H = H * 60;
        if(H<0){
            H += 360;
        }
        let result = [H, S, L];
        return result;
    }
    
    function rgbToHex(red, green, blue) {
      let rgb = blue | (green << 8) | (red << 16);
      return '#' + (0x1000000 + rgb).toString(16).slice(1);
    }
    
    
    
    function isPercentage(n) {
        return typeof n === "string" && n.indexOf('%') != -1;
    }
    
    function isOnePointZero(n) {
        return typeof n == "string" && n.indexOf('.') != -1 && parseFloat(n) === 1;
    }
    
    function bound01(n, max) {
        if (isOnePointZero(n)) { n = "100%"; }
    
        let processPercent = isPercentage(n);
        n = Math.min(max, Math.max(0, parseFloat(n)));
    
        // Automatically convert percentage into number
        if (processPercent) {
            n = parseInt(n * max, 10) / 100;
        }
    
        // Handle floating point rounding errors
        if ((Math.abs(n - max) < 0.000001)) {
            return 1;
        }
    
        // Convert into [0, 1] range if it isn't already
        return (n % max) / parseFloat(max);
    }
    
    function hslToRgb(h, s, l) {
        let r, g, b;
    
        h = bound01(h, 360);
        s = bound01(s, 100);
        l = bound01(l, 100);
    
        function hue2rgb(p, q, t) {
            if(t < 0) t += 1;
            if(t > 1) t -= 1;
            if(t < 1/6) return p + (q - p) * 6 * t;
            if(t < 1/2) return q;
            if(t < 2/3) return p + (q - p) * (2/3 - t) * 6;
            return p;
        }
    
        if(s === 0) {
            r = g = b = l; // achromatic
        }
        else {
            let q = l < 0.5 ? l * (1 + s) : l + s - l * s;
            let p = 2 * l - q;
            r = hue2rgb(p, q, h + 1/3);
            g = hue2rgb(p, q, h);
            b = hue2rgb(p, q, h - 1/3);
        }
    
        return [r * 255, g * 255, b * 255];
    }
    
    function rgbToHsl(rgbArr) {
        let r1 = rgbArr[0] / 255;
        let g1 = rgbArr[1] / 255;
        let b1 = rgbArr[2] / 255;
     
        let maxColor = Math.max(r1,g1,b1);
        let minColor = Math.min(r1,g1,b1);
        //Calculate L:
        let L = (maxColor + minColor) / 2 ;
        let S = 0;
        let H = 0;
        if (maxColor != minColor) {
            //Calculate S:
            if (L < 0.5) {
                S = (maxColor - minColor) / (maxColor + minColor);
            } else {
                S = (maxColor - minColor) / (2.0 - maxColor - minColor);
            }
            //Calculate H:
            if(r1 == maxColor) {
                H = (g1-b1) / (maxColor - minColor);
            } else if (g1 == maxColor) {
                H = 2.0 + (b1 - r1) / (maxColor - minColor);
            } else {
                H = 4.0 + (r1 - g1) / (maxColor - minColor);
            }
        }
     
        L = L * 100;
        S = S * 100;
        H = H * 60;
        if(H<0){
            H += 360;
        }
        let result = [H, S, L];
        return result;
    }
    
    function isWindow(obj) {
        return obj !== null && obj === obj.window;
    }
    
    function getWindow(elem) {
        return isWindow(elem) ? elem : elem.nodeType === 9 && elem.defaultView;
    }
    
    function offset(elem) {
    
        let docElem, win,
            box = {
                top: 0,
                left: 0
            },
            doc = elem && elem.ownerDocument;
    
        docElem = doc.documentElement;
    
        if (typeof elem.getBoundingClientRect !== typeof undefined) {
            box = elem.getBoundingClientRect();
        }
        win = getWindow(doc);
        return {
            top: box.top + win.pageYOffset - docElem.clientTop,
            left: box.left + win.pageXOffset - docElem.clientLeft
        };
    }
    
    function segmentNumber(number, min, max) {
        return Math.max(min, Math.min(number, max));
    }
    
    
    // COLOR PICKER //---------------//
    
    
    let color = [0, 100, 50];
    
    let elements = {
        hue_bar: document.querySelector(".hue_bar"),
        sat_rect: document.querySelector(".sat_rect"),
        color_preview: document.querySelector(".color_preview"),
    
        sat_picker: document.querySelector(".sat_picker"),
        hue_picker: document.querySelector(".hue_picker")
    };
    
    let sat_width = elements.sat_rect.offsetWidth,
        sat_height = elements.sat_rect.offsetHeight;
    
    let hue_height = elements.hue_bar.offsetHeight;
    
    function returnPickedColor() {
    
      elements.hue_picker.style.background = "hsl( " + color[0] + ",100%, 50% )";
      //document.getElementById("colorpicked").style.background = "hsl( " + color[0] + "," + color[1] + "%," + color[2] + "% )";
      elements.sat_picker.style.background = "hsl( " + color[0] + "," + color[1] + "%," + color[2] + "% )";
      elements.color_preview.style.background = "hsl( " + color[0] + "," + color[1] + "%," + color[2] + "% )";
      
      let rgb_color = hslToRgb(color[0], color[1], color[2]),
          hex_color = rgbToHex(rgb_color[0], rgb_color[1], rgb_color[2]);
    
      
      //console.log(hex_color);
      //console.log(hexToRgb(hex_color).r)
      colR = hexToRgb(hex_color).r;
      colG = hexToRgb(hex_color).g;
      colB = hexToRgb(hex_color).b;
      console.log(colR + " | " + colG + " | " + colB)

      //document.querySelector(".bottom input").value = hex_color.toUpperCase();
      document.querySelector(".bottom input").value = "R:"+hexToRgb(hex_color).r+ " G:" + hexToRgb(hex_color).g + " B:" + hexToRgb(hex_color).b;
      
    }
    
    function setHuePickerValue(e) {
    
        let hue_bar_position = {
            top: offset(elements.sat_rect).top
        };
    
        color[0] = segmentNumber(Math.floor((((e.pageY - hue_bar_position.top) / hue_height) * 360)), 0, 360);
    
        elements.hue_picker.style.top = segmentNumber(((e.pageY - hue_bar_position.top) / hue_height) * 100, 0, hue_height / 2) + "%";
    
        elements.sat_rect.style.background = "hsl(" + color[0] + ", 100%, 50%)";
    
        returnPickedColor();
    }
    
    let hue_drag_started = false,
        sat_drag_started = false;
    
    //LINE DRAG START
    elements.hue_bar.addEventListener('mousedown', function(e) {
        hue_drag_started = true;
        elements.hue_picker.classList.add("active");
    
        setHuePickerValue(e);
    });
    
    //---------------------------------//
    
    function setSatPickerValue(e) {
    
        let rect_position = {
            left: offset(elements.sat_rect).left,
            top: offset(elements.sat_rect).top
        };
    
        let position = [
            segmentNumber(e.pageX - rect_position.left, 0, sat_width),
            segmentNumber(e.pageY - rect_position.top, 0, sat_height)
        ];
    
        elements.sat_picker.style.left = position[0] + "px";
        elements.sat_picker.style.top = position[1] + "px";
    
        color[1] = Math.floor(((position[0] / sat_width) * 100));
    
        let x = e.pageX - offset(elements.sat_rect).left;
        let y = e.pageY - offset(elements.sat_rect).top;
        //constrain x max
        if (x > sat_width) {
            x = sat_width;
        }
        if (x < 0) {
            x = 0;
        }
        if (y > sat_height) {
            y = sat_height;
        }
        if (y < 0) {
            y = 0;
        }
    
        //convert between hsv and hsl
        let xRatio = x / sat_width * 100,
            yRatio = y / sat_height * 100,
            hsvValue = 1 - (yRatio / 100),
            hsvSaturation = xRatio / 100,
              lightness = (hsvValue / 2) * (2 - hsvSaturation);
    
        color[2] = Math.floor(lightness * 100);
    
        returnPickedColor();
    }
    
    //COLOR DRAG START
    elements.sat_rect.addEventListener('mousedown', function(e) {
        sat_drag_started = true;
    
        elements.sat_picker.classList.add("active");
        setSatPickerValue(e);
    });
    
    document.addEventListener('mousemove', function(e) {
        //COLOR DRAG MOVE
        if (sat_drag_started) {
            setSatPickerValue(e);
        }
    
        //LINE DRAG MOVE
        if (hue_drag_started) {
            setHuePickerValue(e);
        }
    });
    
    //MOUSE UP
    document.addEventListener('mouseup', function() {
        if (sat_drag_started) {
            elements.sat_picker.classList.remove("active");
            sat_drag_started = false;
        }
    
        if (hue_drag_started) {
            elements.hue_picker.classList.remove("active");
            hue_drag_started = false;
        }
    });
    
    function changeHex(hex_val) {
      
      let rgb_val = hexToRgb(hex_val);
      console.log(rgb_val)
      
      if (rgb_val !== null) {
        
          let hsl_val = rgbToHsl([rgb_val.r,rgb_val.g,rgb_val.b]),
          hsv_val = rgbToHsv(rgb_val.r,rgb_val.g,rgb_val.b);
      
      color[0] = hsl_val[0];
      
      elements.sat_rect.style.background = "hsl(" + color[0] + ", 100%, 50%)";
      
      elements.hue_picker.style.top = hsl_val[0] / 360 * 100 + "%";
      elements.hue_picker.style.background = "hsl("+hsl_val[0]+", 100%, 50%)";
      elements.sat_picker.style.background = hex_val;
      document.querySelector(".color_preview").style.background = hex_val;
      
      elements.sat_picker.style.left = hsl_val[1] + "%";
      elements.sat_picker.style.top = 100 - ( hsv_val[2] * 100 ) + "%";    
        
      }
    }
}