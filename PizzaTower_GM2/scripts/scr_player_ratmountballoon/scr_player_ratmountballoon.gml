function scr_player_ratmountballoon()
{
    var _jump;
    
    sprite_index = spr_player_ratmountballoon;
    hsp = movespeed;
    move = key_left + key_right;
    
    if (vsp < 2)
        vsp += 0.1;
    else
        vsp = 2;
    
    if (move != 0)
        movespeed = Approach(movespeed, move * 8, 0.5);
    else
        movespeed = Approach(movespeed, 0, 0.5);
    
    _jump = false;
    
    if (balloonbuffer > 0)
        balloonbuffer--;
    else
        _jump = true;
    
    if (key_jump)
        _jump = true;
    
    if (_jump)
    {
        create_particle(x, y, particles.ratmountballooncloud, 0);
        state = states.ratmountjump;
        sprite_index = spr_player_ratmountballoonend1;
        image_index = 0;
        jumpAnim = true;
        vsp = -20;
        jumpstop = true;
    }
}

enum UnknownEnum
{
    Value_13 = 13,
    Value_192 = 192
}
