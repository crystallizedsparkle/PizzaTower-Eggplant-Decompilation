scr_initenemy();

with (obj_player1)
{
    state = states.ratmount;
    brick = true;
}

elite = true;
hit = false;
elitehit = 8;
wastedhits = 0;
state = states.walk;
walkstate = states.walk;
targetspot = instance_nearest(x, y, obj_noise_pogospot);
oldtargetspot = targetspot;
movespeed = 0;
move = 0;
wallspeed = 0;
bounced = false;
afterimage_buffer = 0;
savedstate = states.walk;
substate = states.walk;
attackpool = noone;
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
landspr = spr_playerN_hurt;
idlespr = spr_playerN_hurt;
fallspr = spr_playerN_hurt;
stunfallspr = spr_playerN_hurt;
walkspr = spr_playerN_idle;
turnspr = spr_playerN_hurt;
recoveryspr = spr_playerN_hurt;
grabbedspr = spr_playerN_hurt;
scaredspr = spr_playerN_hurt;
ragespr = spr_playerN_hurt;
hp = 1;
slapped = false;
grounded = true;
birdcreated = false;
boundbox = false;
spr_dead = spr_playerN_hurt;
important = false;
heavy = false;
depth = 0;
paletteselect = 0;
spr_palette = palette_cheeseslime;
grabbedby = 0;
stuntouchbuffer = 0;
scaredbuffer = 0;

