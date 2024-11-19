scr_initenemy();
attack_max = 180;
attack_random = 30;
attack_buffer = attack_max;
movespeed = 0;
dir = image_xscale;
inv_timer = 0;
shot = false;
grav = 0.5;
hsp = 0;
vsp = 0;
movespeed = 4;
state = states.idle;
stunned = 0;
alarm[0] = 150;
roaming = false;
collectdrop = 5;
flying = false;
straightthrow = false;
cigar = false;
cigarcreate = false;
stomped = false;
shot = false;
reset = false;
hp = 2;
hitboxcreate = false;
grounded = true;
chargereset = 0;
idlespr = 1964;
stunfallspr = 2852;
walkspr = 1964;
grabbedspr = 2852;
scaredspr = 2852;
image_xscale = -1;
flash = false;
slapped = false;
birdcreated = false;
boundbox = false;
attack = false;
sprite_index = spr_pizzaboy;
important = false;
spr_dead = 2535;
heavy = false;
depth = 0;
paletteselect = random_range(0, 4);
spr_palette = 2539;

enum UnknownEnum
{
    Value_126 = 126
}
