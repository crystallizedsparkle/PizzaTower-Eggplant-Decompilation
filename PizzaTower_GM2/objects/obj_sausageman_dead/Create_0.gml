vsp = random_range(-10, -18);
hsp = sign(x - obj_player.x) * random_range(10, 18);
grav = 0.4;
angle = 0;
randomize();
spinspeed = choose(0, 0, 0, 10, 20);
alarm[0] = 5;
cigar = false;
stomped = false;
buffer = 10;

if (x != obj_player.x)
    image_xscale = -sign(x - obj_player.x);

depth = -999;
paletteselect = 0;
spr_palette = 0;
d = 255;
