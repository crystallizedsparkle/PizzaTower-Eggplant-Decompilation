var num, i, _player;

if (playerid != -4)
{
    with (playerid)
    {
        hsp = 0;
        vsp = 0;
    }
    
    x = playerid.x;
    y = playerid.y - 35;
    
    if (playerid.state != UnknownEnum.Value_46)
        instance_destroy();
}

if (!got)
{
    num = instance_place_list(x, y, 322, global.instancelist, false);
    
    for (i = 0; i < num; i++)
    {
        _player = ds_list_find_value(global.instancelist, i);
        
        with (_player)
        {
            if (state != UnknownEnum.Value_186)
            {
                if (grounded)
                {
                    hsp = 0;
                    vsp = 0;
                    state = UnknownEnum.Value_46;
                    scr_soundeffect(21);
                    
                    with (other)
                    {
                        got = true;
                        
                        if (got_func != -4)
                            got_func();
                        
                        alarm[0] = 150;
                        sprite_index = spr_got;
                        playerid = other.id;
                    }
                }
                
                ds_list_clear(global.instancelist);
                break;
            }
        }
    }
    
    ds_list_clear(global.instancelist);
}

enum UnknownEnum
{
    Value_46 = 46,
    Value_186 = 186
}
