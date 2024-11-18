var _actor, str;

_actor = false;

with (obj_player)
{
    if (state == UnknownEnum.Value_146)
        _actor = true;
}

if (_actor)
    exit;

with (other)
{
    if (key_up && grounded && ((character != "M" && y == (other.y + 50)) || (character == "M" && y == (other.y + 55))) && !instance_exists(obj_fadeout) && state != UnknownEnum.Value_112 && state != UnknownEnum.Value_95 && ((obj_player1.spotlight == true && object_index == obj_player1) || (obj_player1.spotlight == false && object_index == obj_player2)))
    {
        if (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_58 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_99)
        {
            global.currentsavefile = other.file;
            obj_player1.lastroom = room;
            obj_player2.lastroom = room;
            scr_soundeffect(76);
            obj_camera.chargecamera = 0;
            ds_list_add(global.saveroom, id);
            
            if (object_index == obj_player1)
                obj_player1.sprite_index = obj_player1.spr_lookdoor;
            
            if (object_index == obj_player2)
                obj_player2.sprite_index = obj_player2.spr_lookdoor;
            
            obj_player1.targetDoor = other.targetDoor;
            obj_player1.targetRoom = other.targetRoom;
            obj_player2.targetDoor = other.targetDoor;
            obj_player2.targetRoom = other.targetRoom;
            obj_player.image_index = 0;
            obj_player.state = UnknownEnum.Value_112;
            obj_player.mach2 = 0;
            
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
            
            other.visited = true;
            instance_create(x, y, obj_fadeout);
        }
        else if (state == UnknownEnum.Value_183)
        {
            instance_create(x, y, obj_bombexplosion);
            str = concat("saveData", other.file, ".ini");
            
            if (file_exists(str))
                file_delete(str);
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
    Value_183 = 183
}
