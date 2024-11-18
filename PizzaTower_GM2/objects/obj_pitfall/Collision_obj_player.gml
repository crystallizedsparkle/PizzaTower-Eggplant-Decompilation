with (other)
{
    x = other.x;
    y = other.y + (other.sprite_height - 46);
    
    if (!instance_exists(obj_fadeout))
    {
        obj_player1.targetDoor = other.targetDoor;
        obj_player1.targetRoom = other.targetRoom;
        
        if (instance_exists(obj_player2))
        {
            if (object_index == obj_player2)
            {
                obj_player1.x = obj_player2.x;
                obj_player1.y = obj_player2.y;
                obj_player1.state = UnknownEnum.Value_0;
            }
            
            if (object_index == obj_player1)
            {
                obj_player2.x = obj_player1.x;
                obj_player2.y = obj_player1.y;
                obj_player2.state = UnknownEnum.Value_0;
            }
            
            obj_player2.targetDoor = other.targetDoor;
            obj_player2.targetRoom = other.targetRoom;
        }
        
        other.visited = true;
        image_index = 0;
        
        if (state == UnknownEnum.Value_105)
            state = UnknownEnum.Value_0;
        
        instance_create(x, y, obj_fadeout);
    }
}

enum UnknownEnum
{
    Value_0,
    Value_105 = 105
}