function scr_player_dashtumble()
{
    landAnim = false;
    momemtum = true;
    dir = xscale;
    hsp = xscale * movespeed;
    
    if (movespeed < 10 && grounded)
        movespeed += 0.5;
    else if (!grounded)
        movespeed = 10;
    
    if (key_jump && grounded && !key_down)
    {
        jumpstop = false;
        vsp = -11;
        state = UnknownEnum.Value_104;
        sprite_index = spr_mach2jump;
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        if (!grounded)
            sprite_index = spr_mach2jump;
        
        image_speed = 0.35;
        state = UnknownEnum.Value_104;
        grav = 0.5;
    }
    
    if (scr_solid(x + xscale, y) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + xscale, y, obj_destructibles))
    {
        jumpstop = true;
        state = UnknownEnum.Value_92;
        vsp = -4;
        sprite_index = spr_suplexbump;
        instance_create(x + (xscale * 10), y + 10, obj_bumpeffect);
    }
    
    if (!instance_exists(obj_slidecloud) && grounded && movespeed > 5)
    {
        with (instance_create(x, y, obj_slidecloud))
            image_xscale = other.xscale;
    }
    
    image_speed = 0.35;
}

enum UnknownEnum
{
    Value_92 = 92,
    Value_104 = 104
}