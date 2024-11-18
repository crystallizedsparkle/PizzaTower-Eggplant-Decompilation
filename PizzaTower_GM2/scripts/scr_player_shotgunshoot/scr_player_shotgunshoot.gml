function scr_player_shotgunshoot()
{
    image_speed = 0.4;
    move = key_left + key_right;
    hsp = xscale * movespeed;
    
    if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope))
        movespeed = 0;
    
    if (move != 0)
    {
        if (move == xscale)
            movespeed = Approach(movespeed, 4, 0.25);
        else
            movespeed = Approach(movespeed, -8, 0.2);
    }
    else
    {
        movespeed = Approach(movespeed, 0, 0.1);
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        if (grounded)
            state = UnknownEnum.Value_0;
        else
            state = UnknownEnum.Value_92;
        
        if (move == -xscale)
        {
            xscale = move;
            dir = xscale;
            movespeed = abs(movespeed);
            momemtum = true;
        }
    }
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (key_slap2)
        input_buffer_slap = 0;
    
    if (key_shoot2 && image_index > (image_number - 3))
        scr_shotgunshoot();
}

enum UnknownEnum
{
    Value_0,
    Value_92 = 92
}