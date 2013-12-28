// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// splosno.js
//
// Funkcionalnost, ki velja za vse strani
//
// Include-ane skripte samo prej nastejes v HTML-ju!!!



// Pri posameznih straneh lahko implementiramo tudi svoje akcije za document.ready event
function localReady(){};
function localLoad(){};

/*function start(){
 }

 window.addEventListener("load", start, true);*/

// ***************** LANGUAGE ****************************
// Vrne true, ce je this text node - atribut za filter()
function isTextNode(){
    return this.nodeType === 3 && this.nodeValue.match(/\S/);
}

function loadXMLDoc(dname)
{
    if (window.XMLHttpRequest)
    {
        xhttp=new XMLHttpRequest();
    }
    else
    {
        xhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhttp.open("GET",dname,false);
    xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    xhttp.send();
    return xhttp.responseXML;
}


// Funkcija za nalaganje besedila v znacke iz ZE PREBRANEGA XML-a
function langLoadTag(xmlDoc, tagID, lang){
    var tag = $( "#" + tagID )[0];

    var $xmlDoc = $(xmlDoc),
        $xmlTag = $xmlDoc.find('tag[id="' + tagID + '"]')[0];

    // Potrebno je preveriti, ce smo nasli znacko v xml-u
    if( (typeof $xmlTag) == "undefined"){
        console.log("Tag not found in xml\n");
        return;
    }

    var newText = $xmlTag.getElementsByTagName(lang)[0].childNodes[0].nodeValue;
    tag.innerHTML = newText;
    console.log(newText);
}

function langLoad (lang)
{
    var xmlDoc;
    // Preverimo, ce se xml uspesno nalozi
    if(!(xmlDoc = loadXMLDoc ("../resources/xml/language.xml"))){
        console.log("Error while loading language.xml\n");
        return;
    }

    // Gremo cez vse znacke, ki vsebujejo tekst in njihovim starsem spreminjamo innerHTML
    $("*").contents().filter(isTextNode).each(function(){
        var parent = $( this ).context.parentElement;
        var tagID = $( parent ).attr("id");

        langLoadTag(xmlDoc, tagID, lang);
    });
}

function readTextNodeParents(){
    // Dobimo id-je vseh znack, ki vsebujejo text
    var parents = "";

    $("*").contents().filter(isTextNode).each(function(){
        var parent = $( this ).context.parentElement;
        parents += $( parent ).attr("id");
        //parents += parent.tagName + " " + $( parent ).attr("id");
        //parents += " " + $( this ).text();
        parents += "\n";
    });
    console.log(parents);
}

// document.ready happens before window load - or does it??
$(document).ready(function(){
    // Load file specific tags
    //localLoad();
    // Load the navigation menu, header and footer
    //$("header").load("../includes/header.html");
    /*$("footer").load("../includes/footer.html", function(){

     });
     $("nav").load("../includes/nav.html", function(){
     $("#bodyDIV").slideToggle( function(){
     //readTextNodeParents();
     });
     localReady();

     });*/
    fixBanner(false);

    $("#sloBTN").click(function(){
        langLoad("sl");
    });
    $("#engBTN").click(function(){
        langLoad("en");
    });
});
