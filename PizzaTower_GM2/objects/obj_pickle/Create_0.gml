scr_initenemy();
fadeout_time = 0.05;
fadein_time = 0.05;
threshold_x = 200;
threshold_y = 20;
targetplayer = -4;
walked = false;
accel = 0.1;
deccel = 0.1;
deccel_threshold = 0.2;
movespeed = 2.5;
pos = 0;
attack_offset = 16;
ground_check = 128;
attacking = false;
cloneid = -4;
grav = 0.5;
hsp = 0;
vsp = 0;
state = UnknownEnum.Value_134;
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
hp = 3;
grounded = true;
idlespr = 384;
stunfallspr = 385;
walkspr = 384;
stunspr = 385;
grabbedspr = 385;
scaredspr = 390;
image_xscale = -1;
flash = false;
slapped = false;
birdcreated = false;
boundbox = false;
spr_dead = 393;
important = false;
heavy = true;
depth = 0;
grabbedby = 0;
paletteselect = 1;
spr_palette = 329;
stuntouchbuffer = 0;
fade = false;

enum UnknownEnum
{
    Value_134 = 134
}