hsp = 0;
vsp = 0;
movespeed = 7;
grav = 0.5;
platformid = -4;
hsp_carry = 0;
vsp_carry = 0;
depth = -8;
grounded = false;
jumpspeed = 11;
state = states.chase;
rubberband = false;
rubberband_dir = 1;
targetplayer = 324;
targetRoom = room;
targetDoor = "A";
image_speed = 0.35;
LAG_STEPS = 45;
followqueue = ds_queue_create();
startx = obj_player1.x;
starty = obj_player1.y;

enum UnknownEnum
{
    Value_141 = 141
}
