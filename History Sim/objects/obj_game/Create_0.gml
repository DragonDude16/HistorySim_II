current_selected = "info";

year = 0;

mapx = 3;
mapy = 3;

map = [mapx][mapy];

for (var xx = 0; xx < mapx; xx += 1)
{
    for (var yy = 0; yy < mapy; yy += 1)
	{
			map[xx][yy] = instance_create_layer(xx*66, yy*66, "Instances", obj_tile);
			map[xx][yy].x_coord = xx;
			map[xx][yy].y_coord = yy;
	}
}

selected_tile = map[0][0].id;

function runYear(){
	year += 1;
	
	for (var xi = 0; xi < mapx; xi += 1)
	{
		for (yi = 0; yi < mapy; yi += 1)
		{
			map[xi][yi].runYear();
		}
	}
}