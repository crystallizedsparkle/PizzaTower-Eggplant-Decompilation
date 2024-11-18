function scr_player_highjump()
{
    move = key_left + key_right;
    
    if (momemtum == false)
        hsp = move * movespeed;
    else
        hsp = xscale * movespeed;
    
    if (move == 0 && momemtum == false)
        movespeed = 0;
    
    if (move != 0 && movespeed < 6)
        movespeed += 0.5;
    
    if (((scr_solid(x + 1, y) && move == 1) || (scr_solid(x - 1, y) && move == -1)) && !place_meeting(x + sign(hsp), y, obj_slope))
        movespeed = 0;
    
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 2;
    }
    
    landAnim = true;
    
    if (!key_jump2 && jumpstop == false && vsp < 0)
    {
        vsp /= 2;
        jumpstop = true;
    }
    
    if (ladderbuffer > 0)
        ladderbuffer--;
    
    if (scr_solid(x, y - 1) && jumpstop == false && jumpAnim == true)
    {
        vsp = grav;
        jumpstop = true;
    }
    
    if (grounded && vsp > 0)
    {
        if (key_attack)
            landAnim = false;
        
        state = UnknownEnum.Value_0;
        jumpAnim = true;
        jumpstop = false;
        image_index = 0;
        freefallstart = 0;
    }
    
    if (grounded && input_buffer_jump < 8 && !key_attack && !key_down && vsp > 0)
    {
        vsp = -9;
        state = UnknownEnum.Value_92;
        jumpAnim = true;
        jumpstop = false;
        image_index = 0;
        freefallstart = 0;
        audio_sound_gain(sfx_jump, 0.7, 0);
        
        if (!audio_is_playing(sfx_jump))
            audio_play_sound(sfx_jump, 1, false);
    }
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (jumpAnim == true)
    {
        sprite_index = spr_player_Sjumpstart;
        
        if (floor(image_index) == 3)
            jumpAnim = false;
    }
    
    if (jumpAnim == false)
        sprite_index = spr_player_Sjump;
    
    if (move != 0)
        xscale = move;
    
    image_speed = 0.35;
    
    if (!grounded && key_down)
    {
        vsp = 0;
        mach2 = 0;
        image_index = 0;
        vsp = -7;
        state = UnknownEnum.Value_122;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_92 = 92,
    Value_122 = 122
}