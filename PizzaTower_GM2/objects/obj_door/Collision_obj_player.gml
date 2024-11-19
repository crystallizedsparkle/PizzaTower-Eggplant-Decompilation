var _actor;

if (locked)
    exit;

_actor = false;

with (obj_player)
{
    if (state == states.actor)
        _actor = true;
}

if (_actor)
    exit;

if (global.horse)
    exit;

if (john && global.panic)
    exit;

if (!place_meeting(x, y, obj_doorblocked))
{
    with (other)
    {
        if (key_up && !instance_exists(obj_jumpscare) && grounded && ((state == states.ratmount && brick) || state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep) && y == (other.y + 50) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
        {
            obj_player1.lastroom = room;
            obj_player2.lastroom = room;
            scr_soundeffect(76);
            obj_camera.chargecamera = 0;
            ds_list_add(global.saveroom, id);
            
            if (object_index == obj_player1)
            {
                if (obj_player1.isgustavo)
                    obj_player1.sprite_index = spr_ratmount_enterdoor;
                else
                    obj_player1.sprite_index = obj_player1.spr_lookdoor;
            }
            
            if (object_index == obj_player2)
                obj_player2.sprite_index = obj_player2.spr_lookdoor;
            
            obj_player1.targetDoor = other.targetDoor;
            obj_player1.targetRoom = other.targetRoom;
            obj_player2.targetDoor = other.targetDoor;
            obj_player2.targetRoom = other.targetRoom;
            
            with (obj_player)
            {
                image_index = 0;
                
                if (state != states.gotoplayer)
                    state = states.door;
                
                mach2 = 0;
            }
            
            if (instance_exists(obj_player2) && global.coop == true)
            {
                if (object_index == obj_player2)
                {
                    obj_player1.x = obj_player2.x;
                    obj_player1.y = obj_player2.y;
                }
                
                if (object_index == obj_player1)
                {
                    obj_player2.x = obj_player1.x;
                    obj_player2.y = obj_player1.y;
                }
            }
            
            with (obj_player2)
            {
                if (instance_exists(obj_coopplayerfollow))
                    state = states.gotoplayer;
            }
            
            other.visited = true;
            instance_create(x, y, obj_fadeout);
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_58 = 58,
    Value_95 = 95,
    Value_99 = 99,
    Value_103 = 103,
    Value_104,
    Value_112 = 112,
    Value_121 = 121,
    Value_146 = 146,
    Value_186 = 186,
    Value_191 = 191
}
