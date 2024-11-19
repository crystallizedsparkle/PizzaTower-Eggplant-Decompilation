scr_initenemy();
destroyable = false;
stunstate = 0;
stuntimer = 0;
stunmax = 100;
hitboxID = -4;
killbyenemy = false;
grav = 0.5;
hsp = 0;
vsp = 0;
state = states.walk;
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
flash = false;
landspr = 87;
idlespr = 99;
fallspr = 92;
stunfallspr = 68;
walkspr = 96;
turnspr = 94;
recoveryspr = 64;
grabbedspr = 61;
scaredspr = 85;
image_xscale = -1;
hp = 1;
slapped = false;
grounded = true;
birdcreated = false;
boundbox = false;
spr_dead = 85;
important = false;
heavy = false;
depth = 0;
paletteselect = 0;
spr_palette = 151;
sprite_index = walkspr;
grabbedby = 0;
stuntouchbuffer = 0;
scaredbuffer = 0;

enum UnknownEnum
{
    Value_134 = 134
}
