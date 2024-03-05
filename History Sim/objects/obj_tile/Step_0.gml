if (keyboard_check(ord("A")))
{
	x += -camera_speed;
}
if (keyboard_check(ord("D")))
{
	x += camera_speed;
}
if (keyboard_check(ord("W")))
{
	y += -camera_speed;
}
if (keyboard_check(ord("S")))
{
	y += camera_speed;
}