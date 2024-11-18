switch (state)
{
    case UnknownEnum.Value_0:
        with (obj_player)
        {
            if (other.state != UnknownEnum.Value_134 && state == UnknownEnum.Value_0 && vsp > 0 && key_up && place_meeting(x, y + 1, other))
            {
                state = UnknownEnum.Value_146;
                hsp = 0;
                vsp = 0;
                sprite_index = spr_idle;
                
                with (other)
                {
                    playerid = other.id;
                    playerxoffset = other.x - x;
                    state = UnknownEnum.Value_134;
                    
                    if (place_meeting(x + (dir * 32), y, obj_solid))
                        dir *= -1;
                }
            }
        }
        
        break;
    
    case UnknownEnum.Value_134:
        x += (dir * 5);
        playerid.x = x + playerxoffset;
        playerid.hsp = 0;
        playerid.vsp = 0;
        
        if (place_meeting(x + dir, y, obj_solid))
        {
            with (playerid)
                state = UnknownEnum.Value_0;
            
            state = UnknownEnum.Value_0;
            
            with (obj_camera)
            {
                shake_mag = 5;
                shake_mag_acc = 5 / room_speed;
            }
            
            scr_soundeffect(27);
            dir *= -1;
        }
        
        break;
}

enum UnknownEnum
{
    Value_0,
    Value_134 = 134,
    Value_146 = 146
}
