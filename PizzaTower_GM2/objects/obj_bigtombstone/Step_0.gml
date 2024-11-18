mask_index = spr_player_mask;

switch (state)
{
    case UnknownEnum.Value_0:
        if (grounded)
            hsp = 0;
        
        substate = UnknownEnum.Value_0;
        break;
    
    case UnknownEnum.Value_17:
        key_left = playerid.key_left;
        key_right = playerid.key_right;
        key_jump = playerid.key_jump;
        move = key_left + key_right;
        playerid.x = x;
        playerid.y = y;
        playerid.xscale = xscale;
        
        switch (substate)
        {
            case UnknownEnum.Value_0:
                hsp = 0;
                
                if (key_jump)
                    playerid.input_buffer_jump = 0;
                
                if (playerid.input_buffer_jump < 8)
                {
                    playerid.input_buffer_jump = 8;
                    vsp = -14;
                    
                    if (move != 0)
                        xscale = sign(move);
                    
                    hsp = xscale * 6;
                    substate = UnknownEnum.Value_92;
                }
                
                break;
            
            case UnknownEnum.Value_92:
                if (key_jump)
                    playerid.input_buffer_jump = 0;
                
                if (grounded)
                    substate = UnknownEnum.Value_0;
                
                if (playerid.key_down2)
                {
                    substate = UnknownEnum.Value_108;
                    vsp = 20;
                    hsp = 0;
                }
                
                break;
            
            case UnknownEnum.Value_108:
                instance_destroy(instance_place(x, y + vsp, obj_metalblock));
                
                with (obj_destructibles)
                {
                    if (place_meeting(x, y - other.vsp, other))
                        instance_destroy();
                }
                
                if (grounded)
                {
                    substate = UnknownEnum.Value_0;
                    scr_soundeffect(27);
                    
                    with (obj_camera)
                    {
                        shake_mag = 3;
                        shake_mag_acc = 3 / room_speed;
                    }
                }
                
                break;
        }
        
        break;
}

scr_collide();
event_inherited();

enum UnknownEnum
{
    Value_0,
    Value_17 = 17,
    Value_92 = 92,
    Value_108 = 108
}
