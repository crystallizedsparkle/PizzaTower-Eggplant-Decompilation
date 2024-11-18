var pid, dir;

image_speed = 0.35;
depth = -10;

switch (state)
{
    case UnknownEnum.Value_217:
        sprite_index = spr_introidle;
        image_speed = 0.35;
        break;
    
    case UnknownEnum.Value_218:
        if (sprite_index != spr_intro)
        {
            sprite_index = spr_intro;
            image_index = 0;
        }
        
        if (floor(image_index) == (image_number - 1))
            state = UnknownEnum.Value_220;
        
        break;
    
    case UnknownEnum.Value_219:
        sprite_index = spr_monstertomato_idle;
        x = camera_get_view_x(view_camera[0]) + 480;
        y = camera_get_view_y(view_camera[0]) + yy;
        
        switch (substate)
        {
            case UnknownEnum.Value_135:
                yy += 2;
                
                if (yy > 440)
                {
                    pid = scr_puppet_detect();
                    trace(pid);
                    
                    if (pid != -4)
                    {
                        playerid = pid;
                        substate = UnknownEnum.Value_141;
                    }
                    else
                    {
                        substate = UnknownEnum.Value_92;
                    }
                }
                
                break;
            
            case UnknownEnum.Value_92:
                yy -= 3;
                
                if (yy < -100)
                {
                    destroy = false;
                    
                    with (obj_monstertrackingrooms)
                    {
                        sound_buffer = 0;
                        monster_pos[other.monsterid].x = last_puppet_pos.x;
                        monster_pos[other.monsterid].y = last_puppet_pos.y;
                    }
                    
                    state = UnknownEnum.Value_217;
                }
                
                break;
            
            case UnknownEnum.Value_141:
                yy -= 10;
                
                if (yy < -100)
                    scr_puppet_appear(playerid);
                
                break;
        }
        
        break;
    
    case UnknownEnum.Value_220:
        playerid = instance_nearest(x, y, obj_player);
        sprite_index = spr_monstertomato_chase;
        dir = point_direction(x, y, playerid.x, playerid.y);
        
        if (!(x > (playerid.x - 8) && x < (playerid.x + 8) && y > (playerid.y - 8) && y < (playerid.y + 8)))
        {
            x += lengthdir_x(6, dir);
            y += lengthdir_y(6, dir);
        }
        
        if (x != playerid.x)
            image_xscale = sign(playerid.x - x);
        
        break;
}

if (state != UnknownEnum.Value_217)
    inactivebuffer = 900;

depth = (state == UnknownEnum.Value_219) ? 100 : -6;

enum UnknownEnum
{
    Value_92 = 92,
    Value_135 = 135,
    Value_141 = 141,
    Value_217 = 217,
    Value_218,
    Value_219,
    Value_220
}
