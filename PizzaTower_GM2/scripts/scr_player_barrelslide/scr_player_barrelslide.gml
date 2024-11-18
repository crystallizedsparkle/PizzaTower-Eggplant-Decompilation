function scr_player_barrelslide()
{
    image_speed = abs(movespeed) / 8;
    
    if (image_speed < 0.35)
        image_speed = 0.35;
    
    if (image_speed > 0.85)
        image_speed = 0.85;
    
    hsp = movespeed;
    
    if (abs(movespeed) < 14)
        movespeed = Approach(movespeed, xscale * 14, 0.1);
    
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_player_barrelslipnslide)
            sprite_index = spr_player_barrelroll;
    }
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (!jumpstop && !key_jump2 && vsp < 0)
    {
        jumpstop = true;
        vsp /= 20;
    }
    
    if (input_buffer_jump < 8 && grounded)
    {
        scr_soundeffect(12);
        input_buffer_jump = 8;
        vsp = -8.5;
        jumpstop = false;
        create_particle(x, y, UnknownEnum.Value_3, 0);
    }
    
    if ((!key_attack && !place_meeting(x, y + 1, obj_current)) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
    {
        mask_index = spr_player_mask;
        
        if (!place_meeting(x, y, obj_solid))
        {
            if (grounded)
            {
                state = UnknownEnum.Value_113;
            }
            else
            {
                state = UnknownEnum.Value_114;
                sprite_index = spr_player_barrelfall;
            }
        }
    }
    
    with (instance_place(x + hsp, y, obj_destructibles))
        instance_destroy();
    
    with (instance_place(x + hsp, y, obj_baddie))
    {
        if (destroyable)
            instance_destroy();
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid))
    {
        if (scr_slope())
        {
            vsp = -12;
            state = UnknownEnum.Value_115;
            movespeed = 0;
        }
        else
        {
            xscale *= -1;
            movespeed = xscale * 8;
            instance_create(x + (xscale * 10), y + 10, obj_bumpeffect);
            
            if (place_meeting(x, y + 1, obj_current))
            {
                input_buffer_jump = 8;
                vsp = -8.5;
                jumpstop = true;
                create_particle(x, y, UnknownEnum.Value_3, 0);
            }
        }
    }
}

enum UnknownEnum
{
    Value_3 = 3,
    Value_113 = 113,
    Value_114,
    Value_115
}