scr_initenemy();
start_xscale = image_xscale;
grav = 0.5;
hsp = 0;
vsp = 0;
hit = false;
playerid = -4;
attack_y = y;
cooldown = 0;
state = UnknownEnum.Value_126;
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
idlespr = 1098;
stunfallspr = 439;
walkspr = 1098;
stunspr = 439;
grabbedspr = 439;
scaredspr = 439;
flash = false;
slapped = false;
birdcreated = false;
boundbox = false;
spr_dead = 2468;
important = false;
heavy = true;
depth = 0;
grabbedby = 0;
paletteselect = 1;
spr_palette = 231;
stuntouchbuffer = 0;

enum UnknownEnum
{
    Value_126 = 126
}
