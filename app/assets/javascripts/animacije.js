// animacije.js
//
// Funkcije za animacije

// Integers
var fadeTime = 600;

function prilepi(child, parent){
	parent.appendChild(child);
	fixBanner(true);
	$(child).hide();
	$(child).fadeIn(fadeTime, function(){
		fixBanner(true);
	});
	
}

function odlepi(child){
	$(child).fadeOut(fadeTime, function() {
		child.parentNode.removeChild(child);
		fixBanner(true);
	});
	
}

function pokazi(selector){
	$(selector).fadeIn(fadeTime, function(){
		//fixBanner(true);
	});
	fixBanner(true);	
}

function skrij(selector){
	$(selector).fadeOut(fadeTime, function() {
		fixBanner(true);
	});
	
}

function vAlign(childSelector, parentSelector, animate){
	var childH = $(childSelector).height();
	var parentH = $(parentSelector)[0].offsetHeight;
	var topMargin = ((parentH - childH) / 2) + "px";

	// Preverimo, ce je ze poravnano
	if($(childSelector).css("margin-top") == topMargin)
		return;

	// Ce je zahtevano, premik animiramo
	if(animate)
		$(childSelector).animate({"margin-top": "+=" + topMargin});
	else
		$(childSelector).css("margin-top", topMargin);
}

function fixBanner(animate){
	// .height() ne vrne vedno prave velikosti - uporabi [0].offsetHeight
	var mainH = ($("#main")[0].offsetHeight - 15) + "px";
	$("#banner").css("height", mainH);
	vAlign("#banner", "#main", animate);
}