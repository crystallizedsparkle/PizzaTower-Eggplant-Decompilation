var num, i, b;

switch (state)
{
    case UnknownEnum.Value_0:
        if (place_meeting(x, y, obj_player))
        {
            num = instance_place_list(x, y, 322, global.instancelist, false);
            
            for (i = 0; i < num; i++)
            {
                b = ds_list_find_value(global.instancelist, i);
                
                if (b.state == UnknownEnum.Value_121)
                {
                    player_inst = b;
                    hsp = sign(player_inst.hsp);
                    
                    if (hsp == 0)
                        hsp = player_inst.xscale;
                    
                    instance_destroy(inst);
                    scr_soundeffect(26);
                    
                    with (b)
                    {
                        hitX = x;
                        hitY = y;
                        hitLag = 10;
                        tauntstoredmovespeed = movespeed;
                        tauntstoredsprite = sprite_index;
                        tauntstoredstate = state;
                        tauntstoredvsp = vsp;
                        state = UnknownEnum.Value_61;
                    }
                    
                    state = UnknownEnum.Value_137;
                    hitX = x;
                    hitY = y;
                    hitLag = 10;
                    
                    with (obj_camera)
                    {
                        shake_mag = 10;
                        shake_mag_acc = 10 / room_speed;
                    }
                }
            }
        }
        
        break;
    
    case UnknownEnum.Value_137:
        x = hitX + irandom_range(-1, 1);
        y = hitY + irandom_range(-1, 1);
        
        if (hitLag > 0)
        {
            hitLag--;
        }
        else
        {
            x = hitX;
            y = hitY;
            instance_destroy();
        }
        
        break;
}

enum UnknownEnum
{
    Value_0,
    Value_61 = 61,
    Value_121 = 121,
    Value_137 = 137
}
