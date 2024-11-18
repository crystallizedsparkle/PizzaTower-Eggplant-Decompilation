function scr_player_balloon()
{
    sprite_index = spr_player_ratballoon;
    hsp = movespeed;
    move = key_left + key_right;
    vsp = -5;
    
    if (move != 0)
        movespeed = Approach(movespeed, move * 6, 0.35);
    else
        movespeed = Approach(movespeed, 0, 0.35);
    
    if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope))
        movespeed = 0;
    
    if (balloonbuffer > 0)
    {
        balloonbuffer--;
    }
    else
    {
        create_particle(x, y - 20, UnknownEnum.Value_9, 0);
        instance_create(x, y - 20, obj_balloongrabbableeffect);
        state = UnknownEnum.Value_92;
        sprite_index = spr_fall;
        jumpAnim = false;
    }
    
    if (key_jump)
    {
        create_particle(x, y - 20, UnknownEnum.Value_9, 0);
        instance_create(x, y - 20, obj_balloongrabbableeffect);
        state = UnknownEnum.Value_92;
        sprite_index = spr_jump;
        image_index = 0;
        jumpAnim = true;
        movespeed = abs(movespeed);
        vsp = -11;
        jumpstop = false;
    }
}

enum UnknownEnum
{
    Value_9 = 9,
    Value_92 = 92
}