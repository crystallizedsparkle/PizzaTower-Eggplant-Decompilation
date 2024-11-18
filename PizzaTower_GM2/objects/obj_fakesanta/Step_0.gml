var _instY, c, _col, n, ii;

if (room == rm_editor)
    exit;

if (point_in_camera(x, y, view_camera[0]))
    activated = true;

if (activated == true)
{
    switch (state)
    {
        case UnknownEnum.Value_138:
            scr_enemy_stun();
            break;
        
        case UnknownEnum.Value_137:
            scr_enemy_hit();
            break;
        
        case UnknownEnum.Value_4:
            scr_enemy_grabbed();
            break;
        
        case UnknownEnum.Value_154:
            scr_enemy_pummel();
            break;
        
        case UnknownEnum.Value_155:
            scr_enemy_staggered();
            break;
    }
    
    if (state == UnknownEnum.Value_134)
    {
        highest_y = -250;
        _instY = collision_line(obj_player1.x, obj_player1.y, obj_player1.x, obj_player1.y - 270, obj_solid, false, true);
        
        if (_instY != -4)
            highest_y = -abs(obj_player1.y - (_instY.y + _instY.sprite_height)) - 32;
        
        if (random_buffer > 0)
        {
            random_buffer--;
        }
        else
        {
            c = 0;
            
            with (obj_baddie)
            {
                if (santaID == other.id)
                    c++;
            }
            
            if (c < 3)
            {
                _col = collision_line(x, y, obj_player1.x, obj_player1.y, obj_solid, false, true);
                
                if (sprite_index != spr_fakesanta_dropenemy)
                {
                    sprite_index = spr_fakesanta_dropenemy;
                    image_index = 0;
                    shot = false;
                }
                else
                {
                    if (floor(image_index) == 8)
                    {
                        if (!shot)
                        {
                            image_index = 8;
                            
                            if (!place_meeting(x, y, obj_solid) && !place_meeting(x, y, obj_slope) && _col == -4)
                            {
                                shot = true;
                                n = irandom(array_length(content) - 1);
                                
                                with (instance_create(x, y + 50, obj_fakesantapresent))
                                {
                                    baddieID = other.id;
                                    content = other.content[n];
                                }
                            }
                        }
                    }
                    
                    if (floor(image_index) == (image_number - 1))
                    {
                        sprite_index = spr_fakesanta_idle;
                        random_buffer = random_max;
                    }
                }
            }
            else
            {
                random_buffer = random_max;
            }
        }
        
        hsp = Wave(-288, 288, 7, 0);
        vsp = Wave(highest_y + 78, highest_y + 170, 1, 0);
        x = lerp(x, obj_player1.x + hsp, 0.08);
        y = lerp(y, obj_player1.y + obj_player1.vsp + vsp, 0.04);
    }
    else if (state == UnknownEnum.Value_80)
    {
        ii = floor(image_index);
        hsp = 0;
        vsp = 0;
        
        if (!shot)
        {
        }
        
        if (ii == (image_number - 1))
            state = UnknownEnum.Value_134;
    }
    
    if (flash == true && alarm[2] <= 0)
        alarm[2] = 0.15 * room_speed;
    
    if (state != UnknownEnum.Value_4)
        depth = 0;
    
    if (state != UnknownEnum.Value_138)
        thrown = false;
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_80 = 80,
    Value_134 = 134,
    Value_137 = 137,
    Value_138,
    Value_154 = 154,
    Value_155
}
