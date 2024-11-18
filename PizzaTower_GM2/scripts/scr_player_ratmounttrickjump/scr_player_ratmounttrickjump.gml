function scr_player_ratmounttrickjump()
{
    hsp = movespeed * xscale;
    
    if (sprite_index != spr_supertaunt1)
    {
        image_speed = 0.35;
    }
    else
    {
        image_speed = 0.5;
        
        if (floor(image_index) == (image_number - 1))
            sprite_index = spr_player_ratmountwalljump;
    }
    
    if (ramp_buffer > 0)
        ramp_buffer--;
    
    if (grounded && ramp_buffer <= 0)
    {
        if (sprite_index == spr_mach2jump)
        {
            if (movespeed > 2)
                state = UnknownEnum.Value_201;
            else
                state = UnknownEnum.Value_0;
        }
        else
        {
            ramp_points = 0;
            scr_soundeffect(27);
            state = UnknownEnum.Value_191;
            sprite_index = spr_player_ratmountland;
            image_index = 0;
            landAnim = true;
        }
        
        global.collect += (ramp_points * 100);
        ramp = false;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_191 = 191,
    Value_201 = 201
}
