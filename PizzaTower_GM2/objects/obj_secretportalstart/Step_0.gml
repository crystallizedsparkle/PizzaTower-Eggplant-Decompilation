image_speed = 0.35;

switch (sprite_index)
{
    case spr_secretportal_spawnopen:
        with (obj_heatafterimage)
            visible = false;
        
        with (obj_player)
        {
            if (object_index != obj_player2 || global.coop)
            {
                x = other.x;
                y = other.y;
                roomstartx = x;
                roomstarty = y;
                hsp = 0;
                vsp = 0;
                cutscene = true;
                visible = false;
                
                if (!isgustavo && state != UnknownEnum.Value_47 && state != UnknownEnum.Value_38 && state != UnknownEnum.Value_49)
                    state = UnknownEnum.Value_0;
            }
        }
        
        waitbuffer = 80;
        drop = false;
        
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_secretportal_spawnidle;
            
            with (obj_player)
            {
                if (object_index != obj_player2 || global.coop)
                {
                    if (!isgustavo && state != UnknownEnum.Value_47 && state != UnknownEnum.Value_38 && state != UnknownEnum.Value_49)
                    {
                        visible = true;
                        cutscene = false;
                        sprite_index = spr_bodyslamstart;
                        image_index = 0;
                        state = UnknownEnum.Value_122;
                        vsp = (character == "P") ? -5 : -7;
                    }
                }
            }
        }
        
        break;
    
    case spr_secretportal_spawnidle:
        if (!drop)
        {
            with (obj_heatafterimage)
                visible = false;
            
            with (obj_player)
            {
                if (check_player_coop())
                {
                    x = other.x;
                    y = other.y - 10;
                    visible = true;
                    hsp = 0;
                    vsp = 10;
                    scale_xs = Approach(scale_xs, 1, 0.05);
                    scale_ys = Approach(scale_ys, 1, 0.05);
                    fallinganimation = 0;
                    
                    if (scale_xs == 1)
                        other.drop = true;
                }
            }
        }
        
        if (drop)
        {
            if (waitbuffer > 0)
            {
                waitbuffer--;
            }
            else
            {
                sprite_index = spr_secretportal_spawnclose;
                image_index = 0;
            }
        }
        
        break;
    
    case spr_secretportal_spawnclose:
        if (floor(image_index) == (image_number - 1))
        {
            image_index = image_number - 1;
            instance_destroy();
        }
        
        break;
}

enum UnknownEnum
{
    Value_0,
    Value_38 = 38,
    Value_47 = 47,
    Value_49 = 49,
    Value_122 = 122
}