with (other)
{
    if (key_up && (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_99) && y == (other.y + 50) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != UnknownEnum.Value_112 && state != UnknownEnum.Value_95)
    {
        lastroom_x = other.x;
        lastroom_y = other.y;
        lastroom = room;
        obj_camera.chargecamera = 0;
        ds_list_add(global.saveroom, id);
        obj_player1.sprite_index = obj_player1.spr_lookdoor;
        obj_player1.targetDoor = other.targetDoor;
        obj_player1.targetRoom = other.targetRoom;
        obj_player1.image_index = 0;
        obj_player1.state = UnknownEnum.Value_112;
        obj_player1.mach2 = 0;
        
        if (instance_exists(obj_player2))
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
            
            obj_player2.sprite_index = obj_player2.spr_lookdoor;
            obj_player2.targetDoor = other.targetDoor;
            obj_player2.targetRoom = other.targetRoom;
            obj_player2.image_index = 0;
            obj_player2.state = UnknownEnum.Value_112;
            obj_player2.mach2 = 0;
        }
        
        other.visited = true;
        instance_create(x, y, obj_fadeout);
    }
}

enum UnknownEnum
{
    Value_0,
    Value_95 = 95,
    Value_99 = 99,
    Value_103 = 103,
    Value_104,
    Value_112 = 112,
    Value_121 = 121
}
