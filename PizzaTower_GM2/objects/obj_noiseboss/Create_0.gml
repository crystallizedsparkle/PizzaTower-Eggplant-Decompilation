scr_initenemy();

with (obj_player1)
{
    state = UnknownEnum.Value_191;
    brick = true;
}

elite = true;
hit = false;
elitehit = 8;
wastedhits = 0;
state = UnknownEnum.Value_134;
walkstate = UnknownEnum.Value_134;
targetspot = instance_nearest(x, y, obj_noise_pogospot);
oldtargetspot = targetspot;
movespeed = 0;
move = 0;
wallspeed = 0;
bounced = false;
afterimage_buffer = 0;
savedstate = UnknownEnum.Value_134;
substate = UnknownEnum.Value_134;
attackpool = -4;
attackbuffer = 100;
placedtraps = false;
jumpbuffer = 0;
jumpmax = 120;
grav = 0.5;
hsp = 0;
vsp = 0;
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
landspr = 997;
idlespr = 997;
fallspr = 997;
stunfallspr = 997;
walkspr = 1006;
turnspr = 997;
recoveryspr = 997;
grabbedspr = 997;
scaredspr = 997;
ragespr = 997;
hp = 1;
slapped = false;
grounded = true;
birdcreated = false;
boundbox = false;
spr_dead = 997;
important = false;
heavy = false;
depth = 0;
paletteselect = 0;
spr_palette = 151;
grabbedby = 0;
stuntouchbuffer = 0;
scaredbuffer = 0;

enum UnknownEnum
{
    Value_134 = 134,
    Value_191 = 191
}
