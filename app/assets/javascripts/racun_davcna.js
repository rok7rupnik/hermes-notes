// racun_na_davcno.js
// 
// Funkcionalnost za vnos racuna z vsemi podatki podjetja
//
// Include-ane skripte samo prej nastejes v HTML-ju!!!

//********************************* VARIABLES *************************************
// V stareStranke napolni meni na roke
//var stareStranke = <?php include '../baza/stranke_select.php'; ?>;

// Nova stranka
var novaStrankaCHKBX;
var datumCHKBX;
var dodajStoritevBTN;

// Integers
var fadeTime = 600;
      
function checkDatum()
{
	if(datumCHKBX.checked)
	{
		// Labeli racun prilepimo datumLBL
		pokazi("#datumLBL");
	}
	else
	{
		skrij("#datumLBL");
	}
}      

function checkNovaStranka()
{
	
	if(novaStrankaCHKBX.checked)
	{		
		skrij("#stareStrankeSLCT");
		setTimeout(function(){
			pokazi("#novaStrankaSPN");
			pokazi("#podjetjeTBL");
			pokazi("#podjetjeKontaktTBL");
			pokazi("#kontaktH2");
		}, fadeTime);
	}
	else
	{
		novaStrankaCHKBX.checked = true; // The check box still appears checked
		if(confirm("Res zelite preklicati vnos nove stranke?"))
		{
			novaStrankaCHKBX.checked = false;
			skrij("#novaStrankaSPN");
			skrij("#podjetjeTBL");
			skrij("#podjetjeKontaktTBL");
			skrij("#kontaktH2");
			setTimeout(function(){pokazi("#stareStrankeSLCT")}, fadeTime);
;		}
	}
}

// Stevilo vseh storitev - obvezno globalna spremenljivka
var steviloStoritev = 1;
function dodajStoritev()
{
	steviloStoritev++;

	var novaStoritev = Element("tr", ["id", "class"], ["storitev" + steviloStoritev, "storitev"]);
	novaStoritev.innerHTML = "" +
		"<td><input type='text' name='Izdelki[]'/>" +
		"<td><input type='number' onfocus='this.select()' value='1' name='Kosov[]'/> </td>" +
		"<td><input type='text' name='Cene[]'/></td>" +
		"<td><button type='button' class='odstraniStoritevBTN' name='storitev" + steviloStoritev + "'>-</button></td>";
	
	prilepi(novaStoritev, document.getElementById("storitve"));
}

function odstraniStoritev(id)
{
	if($("tr.storitev").length > 1)
	{
		odlepi(document.getElementById(id));
	}
}

/*function initLocal()
{
}
window.addEventListener("load", initLocal, false);*/

$(document).ready(function(){
	// Define global elements
	novaStrankaCHKBX = $("#novaStrankaCHKBX")[0];
	datumCHKBX = $("#datumCHKBX")[0];

	// Assign click functions
	$(document).delegate("button.odstraniStoritevBTN", "click", function(){
		//$("button.odstraniStoritevBTN").click(function(event){
			odstraniStoritev(this.name);
	});
	$(document).delegate("#novaStrankaCHKBX", "click", function(){
		checkNovaStranka();
	});
	$(document).delegate("#datumCHKBX", "click", function(){
		checkDatum();
	});
	$(document).delegate("#dodajStoritevBTN", "click", function(){
		dodajStoritev();
	});
});