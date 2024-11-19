var pid, dir;

image_speed = 0.35;
depth = -10;

switch (state)
{
    case states.robot_idle:
        sprite_index = spr_introidle;
        image_speed = 0.35;
        break;
    
    case states.robot_intro:
        if (sprite_index != spr_intro)
        {
            sprite_index = spr_intro;
            image_index = 0;
        }
        
        if (floor(image_index) == (image_number - 1))
            state = states.robot_chase;
        
        break;
    
    case states.robot_walking:
        sprite_index = spr_monstertomato_idle;
        x = camera_get_view_x(view_camera[0]) + 480;
        y = camera_get_view_y(view_camera[0]) + yy;
        
        switch (substate)
        {
            case states.fall:
                yy += 2;
                
                if (yy > 440)
                {
                    pid = scr_puppet_detect();
                    trace(pid);
                    
                    if (pid != -4)
                    {
                        playerid = pid;
                        substate = states.chase;
                    }
                    else
                    {
                        substate = states.jump;
                    }
                }
                
                break;
            
            case states.jump:
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
                    
                    state = states.robot_idle;
                }
                
                break;
            
            case states.chase:
                yy -= 10;
                
                if (yy < -100)
                    scr_puppet_appear(playerid);
                
                break;
        }
        
        break;
    
    case states.robot_chase:
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

if (state != states.robot_idle)
    inactivebuffer = 900;

depth = (state == states.robot_walking) ? 100 : -6;

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
