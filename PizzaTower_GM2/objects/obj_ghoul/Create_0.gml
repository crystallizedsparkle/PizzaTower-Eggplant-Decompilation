scr_initenemy();
start_xscale = image_xscale;
grav = 0.5;
hsp = 0;
vsp = 0;
hit = false;
playerid = noone;
attack_y = y;
cooldown = 0;
state = states.idle;
stunned = 0;
alarm[0] = 150;
roaming = true;
collectdrop = 5;
flying = false;
straightthrow = false;
cigar = false;
cigarcreate = false;
stomped = false;
shot = false;
reset = false;
bombreset = 0;
hp = 2;
grounded = true;
idlespr = spr_ghoul_idle;
stunfallspr = spr_ghoul_stun;
walkspr = spr_ghoul_idle;
stunspr = spr_ghoul_stun;
grabbedspr = spr_ghoul_stun;
scaredspr = spr_ghoul_stun;
flash = false;
slapped = false;
birdcreated = false;
boundbox = false;
spr_dead = spr_ghoul_gibs;
important = false;
heavy = true;
depth = 0;
grabbedby = 0;
paletteselect = 1;
spr_palette = palette_pepgoblin;
stuntouchbuffer = 0;

