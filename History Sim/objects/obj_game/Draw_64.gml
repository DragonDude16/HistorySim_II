draw_set_color(c_white);

draw_text(1500, 50, "Year: " + string(year));

draw_text(1500, 100, "Name: " + string(selected_tile.town_name));
draw_text(1500, 125, "Population: " + string(selected_tile.population));

draw_text(1500, 150, "Food: " + string(selected_tile.food) + " / " + string(selected_tile.foodNextPop));
draw_text(1500, 175, "Wood: " + string(selected_tile.wood));
draw_text(1500, 200, "Stone: " + string(selected_tile.stone));

draw_text(1500, 500, "Fertility: " + string(selected_tile.fertility));
draw_text(1500, 525, "Forest Density: " + string(selected_tile.forestDensity));

draw_text(1500, 700, "Irrigation: " + string(selected_tile.irrigation));
draw_text(1500, 725, "Sawmills: " + string(selected_tile.sawmills));
