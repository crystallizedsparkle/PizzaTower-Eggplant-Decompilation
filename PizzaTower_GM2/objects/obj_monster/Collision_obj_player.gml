if (state != UnknownEnum.Value_217 && other.state != UnknownEnum.Value_146 && !other.cutscene && other.state != UnknownEnum.Value_112)
{
    if (!global.panic && !instance_exists(obj_jumpscare))
    {
        with (obj_player)
        {
            state = UnknownEnum.Value_146;
            hsp = 0;
            vsp = 0;
            targetRoom = other.targetRoom;
            
            if (targetRoom != room && targetRoom != lastroom)
                targetDoor = other.targetDoor;
            
            lastroom = room;
            hallway = savedhallway;
            
            if (hallway)
                hallwaydirection = -savedhallwaydirection;
            
            verticalhallway = savedverticalhallway;
            
            if (verticalhallway)
                vhallwaydirection = -savedvhallwaydirection;
        }
        
        if (!oktoberfest && ds_list_find_index(global.saveroom, room_get_name(room)) == -1)
            ds_list_add(global.saveroom, room_get_name(room));
        
        with (instance_create(x, y, obj_jumpscare))
        {
            switch (other.object_index)
            {
                case obj_robotmonster:
                    monsterid = 0;
                    break;
                
                case obj_blobmonster:
                    monsterid = 1;
                    break;
                
                case obj_puppetmonster:
                    monsterid = 2;
                    break;
                
                case obj_hillbillymonster:
                    monsterid = 3;
                    break;
            }
            
            if (other.oktoberfest && random(100) <= 10)
                oktoberfest = true;
        }
    }
    else if (global.panic && !instance_exists(obj_jumpscare))
    {
        with (obj_monster)
        {
            state = UnknownEnum.Value_217;
            x = xstart;
            y = ystart;
        }
        
        with (instance_create(x, y, obj_jumpscare))
            monsterid = 4;
    }
}

enum UnknownEnum
{
    Value_112 = 112,
    Value_146 = 146,
    Value_217 = 217
}
