draw_set_color(c_white);

if(current_selected == "info"){
	draw_text(1500, 100, "Year: " + string(year));

	draw_text(1500, 125, "Tile Coordinate: " + string(selected_tile.x_coord) + ", " + string(selected_tile.y_coord));
	draw_text(1500, 150, "Name: " + string(selected_tile.town_name));
	draw_text(1500, 175, "Population: " + string(selected_tile.population));
	draw_text(1500, 225, "Quality of Life: " + string(scr_qol(selected_tile.getQoL())*100) + " %");
	
	draw_text(1500, 300, "Food: " + string(selected_tile.food) + " / " + string(selected_tile.foodNextPop));
	draw_text(1500, 325, "Wood: " + string(selected_tile.wood));
	draw_text(1500, 350, "Stone: " + string(selected_tile.stone));

	draw_text(1500, 500, "Fertility: " + string(selected_tile.fertility));
	draw_text(1500, 525, "Forest Density: " + string(selected_tile.forestDensity));

	draw_text(1500, 700, "Irrigation: " + string(selected_tile.irrigation));
	draw_text(1500, 725, "Sawmills: " + string(selected_tile.sawmills));
}

if(current_selected = "ideas"){
	draw_text(1500, 125, "ideas go here ");
}

if(current_selected = "tech"){
	draw_text(1500, 100, "Knowledge: " + string(selected_tile.knowledge));
	
	for(var i = 0; i < array_length(selected_tile.techsResearched); i++){
		draw_text(1500, 150+i*25, string(selected_tile.techsResearched[i]));
	}
	
	if(array_length(selected_tile.techsResearched) == 0){
		draw_text(1500, 150, "No technologies researched yet");
	}
}
