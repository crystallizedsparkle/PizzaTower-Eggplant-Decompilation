function scr_player_antigrav()
{
    sprite_index = spr_currentplayer;
    move = key_right + key_left;
    hsp = Approach(hsp, move * 8, 0.5);
    movespeed = hsp;
    
    if (vsp > -14)
        vsp -= 0.5;
    
    if (key_jump)
    {
        movespeed = abs(hsp);
        state = UnknownEnum.Value_92;
        sprite_index = spr_machfreefall;
        scr_soundeffect(148);
    }
    
    if (scr_solid(x, y - 1))
    {
        audio_stop_sound(sfx_antigrav1);
        audio_stop_sound(sfx_antigrav2);
        scr_soundeffect(7, 145);
        vsp = 8;
        
        with (create_debris(x, y, 1141))
        {
            hsp = random_range(-5, 5);
            vsp = random_range(-10, 10);
        }
    }
    
    if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_ratblock) && !place_meeting(x + hsp, y, obj_destructibles))
    {
        scr_soundeffect(147);
        hsp = -hsp * 0.8;
        
        repeat (3)
        {
            with (create_debris(x, y, 1141))
            {
                hsp = random_range(-5, 5);
                vsp = random_range(-10, 10);
            }
        }
    }
    
    image_speed = abs(vsp) / 15;
}

enum UnknownEnum
{
    Value_92 = 92
}
