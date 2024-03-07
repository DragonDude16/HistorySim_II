// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function refreshTechsPossible(techsResearched){
	newTechList = [];
	newTechPossibilities = [];
	
	if(array_length(techsResearched) == 0){
		return ["Organization I"];	
	}
	
	for(var i = 0; i < array_length(techsResearched); i++){
		switch (techsResearched[i]){
			case "Organization I":
				array_push(newTechPossibilities, "Granary");
				array_push(newTechPossibilities, "Lumber Camp");
				array_push(newTechPossibilities, "Arms");
				array_push(newTechPossibilities, "Organization II");
		}
	}
	
	for(var j = 0; j < array_length(newTechPossibilities); j++){
		if(!array_contains(techsResearched, newTechPossibilities[j])){
			array_push(newTechList, newTechPossibilities[j]);	
		}
	}
	
	return newTechList;
}

function getTechCost(tech){
	switch(tech){
		case "Organization I":
			return 50;
		break;
		
		case "Granary":
		case "Lumber Camp":
		case "Arms":
		case "Organization II":
			return 1000;
		break;
	}
}