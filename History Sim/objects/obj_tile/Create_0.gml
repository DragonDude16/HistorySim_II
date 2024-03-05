camera_speed = -7;
selecter = 0;
population = 0;
town_name = "Brunswick";

randomize();

population = 1
fertility = floor(random_range(1, 6)) + 0.5;
forestDensity = random_range(.1, 1.5);
food = 0;
wood = 0;
stone = 0;
foodNextPop = 500;

agricultureMult = 1;
woodMult = 0.1;
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
}

function growPop(){
	if(food < population){
		population -= 1;
		food = 0;
		foodNextPop = floor(foodNextPop / 1.1);
	}
	
	if(food >= foodNextPop){
		food -= foodNextPop;
		population += 1;
		foodNextPop = floor(foodNextPop * 1.1);
	}
	
}

function gainResources(){
	food += fertility * agricultureMult * population * (1 + 0.5 * irrigation);
	food -= power(population, 1.3);
	wood += forestDensity * woodMult * population;
	stone += stoneMult * population;
}

function build(){
	if(wood >= irrigationCost){
		wood -= irrigationCost;
		irrigation += 1;
		irrigationCost *= 3;
	}
}