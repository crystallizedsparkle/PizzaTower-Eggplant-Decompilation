hsp = 0;
vsp = 1;
grav = 0.5;
grounded = false;
movespeed = 8;
state = states.normal;
image_speed = 0.35;
depth = -1;
appeartimer = 200;
start_x = 0;
start_y = 0;
platformid = -4;
hsp_carry = 0;
vsp_carry = 0;
followqueue = ds_queue_create();
LAG_STEPS = 50;
touched = false;
targetRoom = room;
targetDoor = obj_player1.targetDoor;
steppy = false;

enum UnknownEnum
{
    Value_0
}
