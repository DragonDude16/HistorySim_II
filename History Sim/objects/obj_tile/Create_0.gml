camera_speed = -7;
selecter = 0;
population = 0;
town_name = "Brunswick";

randomize();

population = 1

globalProdMult = 1;

knowledge = 0;
techsResearched= [];
techsPossible = refreshTechsPossible([]);

food = 0;
fertility = floor(random_range(2.5, 6)); //natural food productivity
foodNextPop = 500;

wood = 0;
forestDensity = random_range(.5, 1.5); //natural abundance of wood
woodConsumption = 0.1; //how much wood each pop needs / year 
woodBonusConsumption = 0;  //extra wood consumed if there is a surplus
woodQoL = 0;

stone = 0;



stoneMult = 0.01;

irrigation = 0;
irrigationCost = 50;
sawmills = 0;

if(fertility > 2)
{
	sprite_index = spr_grass;
	image_index = 0;
}

else
{
	sprite_index = spr_desert;
	image_index = 0;
}

function runYear(){
	gainResources();
	growPop();
	//build();
	learnTechs();
}

function growPop(){
	if(food < population){ //starve if not enough food
		population -= 1;
		food = 0;
		foodNextPop = floor(foodNextPop / 3);
	}
	
	if(food >= foodNextPop){ //grow if enough food
		food -= foodNextPop;
		population += 1;
		foodNextPop = floor(foodNextPop * 3);
	}
	
}

function gainResources(){
	food += population * fertility * scr_qol(getQoL()) * globalProdMult;
	food -= population;
	food = minZero(food);
	
	//knowledge
	knowledgeGain = population * 0.01 * globalProdMult;
	num = random(1000);
	if(num < 20){ 
		knowledgeGain *= 10;	
	}
	if(num < 2){
		knowledgeGain *= random_range(50, 150);
	}
	knowledge += knowledgeGain;
	
	// wood
	woodGain = population * forestDensity * scr_qol(getQoL()) * globalProdMult;
	woodLoss = population * (woodConsumption+woodBonusConsumption);
	wood += woodGain;
	wood -= woodLoss;
	wood = minZero(wood);
	if(woodLoss+0.1*population < woodGain){
		woodBonusConsumption += 0.1;
		woodQoL += 1;
	}
	
	//stone += stoneMult * population;
}

function learnTechs(){
	if(array_length(techsPossible) == 0){
		return;	
	}
	
	techSelected = techsPossible[round(irandom(array_length(techsPossible)-1))];
	show_debug_message(string(techsPossible));
	
	techCost = getTechCost(techSelected);
	
	if(knowledge >= techCost){
		knowledge -= techCost;
		array_push(techsResearched, techSelected);
		array_delete(techsPossible, array_get_index(techsPossible, techSelected), 1);
	
		techsPossible = refreshTechsPossible(techsResearched);
		
		activateTech(techSelected);
	}
}

function activateTech(tech){
	switch(tech){
		case "Organization I":
			globalProdMult *= 2;
		break;
		
		case "Organization II":
			globalProdMult *= 1.5;
		break;
	}
}

function build(){
	if(wood >= irrigationCost){
		wood -= irrigationCost;
		irrigation += 1;
		irrigationCost *= 3;
	}
}

function getQoL(){
	return woodQoL;	
}