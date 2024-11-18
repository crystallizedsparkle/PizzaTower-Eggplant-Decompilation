var moveH, moveV, spd;

mask_index = spr_player_mask;

switch (state)
{
    case UnknownEnum.Value_0:
        launch_buffer = 120;
        break;
    
    case UnknownEnum.Value_17:
        switch (substate)
        {
            case UnknownEnum.Value_0:
                moveH = playerid.key_left + playerid.key_right;
                moveV = playerid.key_down - playerid.key_up;
                
                if (moveH != 0 || moveV != 0)
                {
                    moveX = moveH;
                    moveY = moveV;
                }
                
                hsp = 0;
                vsp = 0;
                angle += 32;
                
                if (launch_buffer > 0)
                    launch_buffer--;
                else
                    substate = UnknownEnum.Value_92;
                
                break;
            
            case UnknownEnum.Value_92:
                spd = 24;
                hsp = moveX * spd;
                vsp = moveY * spd;
                angle += 64;
                
                with (obj_destructibles)
                {
                    if (place_meeting(x - other.hsp, y - other.vsp, other))
                        instance_destroy();
                }
                
                with (obj_metalblock)
                {
                    if (place_meeting(x - other.hsp, y - other.vsp, other))
                        instance_destroy();
                }
                
                if (place_meeting(x + hsp, y + vsp, obj_solid))
                {
                    instance_destroy();
                    
                    with (playerid)
                    {
                        state = UnknownEnum.Value_16;
                        visible = true;
                    }
                    
                    state = UnknownEnum.Value_0;
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
    Value_16 = 16,
    Value_17,
    Value_92 = 92
}