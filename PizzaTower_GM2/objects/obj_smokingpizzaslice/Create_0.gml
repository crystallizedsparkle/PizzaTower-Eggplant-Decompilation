scr_initenemy();
substate = UnknownEnum.Value_134;
substate_max = 3 * room_speed;
substate_buffer = substate_max;
hitboxcreate = false;
shot = false;
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
flash = false;
landspr = 876;
idlespr = 1181;
fallspr = 876;
stunfallspr = 521;
walkspr = 876;
turnspr = 386;
recoveryspr = 521;
grabbedspr = 521;
scaredspr = 1465;
image_xscale = -1;
hp = 1;
slapped = false;
grounded = true;
birdcreated = false;
boundbox = false;
spr_dead = 244;
important = false;
heavy = false;
depth = 0;
paletteselect = 1;
spr_palette = 151;
grabbedby = 0;
stuntouchbuffer = 0;
scaredbuffer = 0;

enum UnknownEnum
{
    Value_134 = 134
}
