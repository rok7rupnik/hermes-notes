// objekti.js
//
// Funkcije za generiranje objektov

//*************************** OBRAZCI ****************************
function Input(type, name, id)
{
	var toRet = document.createElement("input");
	toRet.setAttribute("type", type);
	toRet.setAttribute("name", name);
	toRet.setAttribute("id", id);
	
	return toRet;
}

function Element(tag, attributes, values)
{
	var toRet = document.createElement(tag);
	
	for(var i = 0; i < attributes.length; i++)
	{
		toRet.setAttribute(attributes[i], values[i]);
	}
	
	return toRet;
}