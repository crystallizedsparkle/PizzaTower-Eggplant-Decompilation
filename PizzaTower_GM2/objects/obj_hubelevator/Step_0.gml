switch (state)
{
    case UnknownEnum.Value_18:
        if (!instance_exists(obj_fadeout))
        {
            if (playerid.key_up2)
                selected++;
            
            if (playerid.key_down2)
                selected--;
            
            selected = clamp(selected, 0, array_length(hub_array) - 1);
            
            if (playerid.key_jump2)
            {
                if (hub_array[selected][0] != room)
                {
                    with (obj_player)
                    {
                        targetRoom = other.hub_array[other.selected][0];
                        targetDoor = "A";
                        
                        if (targetRoom == 274)
                            targetDoor = "F";
                        
                        if (check_player_coop())
                        {
                            state = UnknownEnum.Value_0;
                            
                            if (other.isgustavo)
                                state = UnknownEnum.Value_191;
                            
                            movespeed = 0;
                        }
                    }
                    
                    instance_create(x, y, obj_fadeout);
                }
                else
                {
                    state = UnknownEnum.Value_0;
                    
                    with (obj_player)
                        state = UnknownEnum.Value_0;
                }
            }
        }
        
        break;
}

enum UnknownEnum
{
    Value_0,
    Value_18 = 18,
    Value_191 = 191
}
