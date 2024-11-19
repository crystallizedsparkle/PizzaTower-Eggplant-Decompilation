image_speed = 0;
image_blend = choose(global.afterimage_color1, global.afterimage_color2);
alarm[1] = 3;
alarm[0] = 15;

enum afterimages
{
	default_afterimage = 0,
	mach3effect = 1,
	heatattack = 2,
	firemouth = 3,
	blue = 4,
	blur = 5,
	
	last = 6
}