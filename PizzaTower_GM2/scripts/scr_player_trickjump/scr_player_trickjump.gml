function scr_player_trickjump()
{
    hsp = movespeed * xscale;
    
    if (sprite_index != spr_supertaunt1 && sprite_index != spr_supertaunt2 && sprite_index != spr_supertaunt3 && sprite_index != spr_supertaunt4)
    {
        image_speed = 0.35;
        
        if (sprite_index == spr_player_rampjump && floor(image_index) == (image_number - 1))
            image_index = image_number - 1;
    }
    else
    {
        image_speed = 0.5;
        
        if (floor(image_index) == (image_number - 1))
            sprite_index = spr_player_rampjump;
    }
    
    if (scr_solid(x + xscale, y) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
    {
        state = UnknownEnum.Value_106;
        image_index = 0;
        sprite_index = spr_player_wallsplat;
    }
    
    if (ramp_buffer > 0)
        ramp_buffer--;
    
    if (grounded && ramp_buffer <= 0)
    {
        image_speed = 0.5;
        
        if (sprite_index == spr_player_rampjump)
        {
            sprite_index = spr_rollgetup;
            
            if (movespeed < 12)
                state = UnknownEnum.Value_104;
            else
                state = UnknownEnum.Value_121;
        }
        else
        {
            ramp_points = 0;
            scr_soundeffect(27);
            state = UnknownEnum.Value_111;
            sprite_index = spr_bodyslamland;
            image_index = 0;
        }
        
        global.collect += (ramp_points * 100);
        ramp = false;
    }
}

enum UnknownEnum
{
    Value_104 = 104,
    Value_106 = 106,
    Value_111 = 111,
    Value_121 = 121
}
