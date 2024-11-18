function scr_player_grind()
{
    sprite_index = !skateboarding ? spr_grind : spr_clown;
    image_speed = 0.35;
    machhitAnim = false;
    crouchslideAnim = true;
    hsp = xscale * movespeed;
    
    if (movespeed < 10)
        movespeed = Approach(movespeed, 10, 0.5);
    
    if (!place_meeting(x, y + 18, obj_grindrail) && !place_meeting(x, y + 18, obj_grindrailslope))
    {
        if (movespeed < 12 || skateboarding)
        {
            state = UnknownEnum.Value_104;
            sprite_index = spr_mach2jump;
        }
        else
        {
            state = UnknownEnum.Value_121;
            sprite_index = spr_mach3jump;
        }
    }
    
    if (place_meeting(x + xscale, y, obj_solid) && !place_meeting(x, y + 18, obj_grindrailslope) && !place_meeting(x, y + 1, obj_slope))
    {
        state = UnknownEnum.Value_106;
        hsp = -xscale * 5;
        vsp = 1;
    }
    
    if (key_jump)
    {
        vsp = -11;
        jumpstop = false;
        
        if (skateboarding)
        {
            sprite_index = spr_clownjump;
            image_index = 0;
        }
        
        if (movespeed < 12 || skateboarding)
        {
            state = UnknownEnum.Value_104;
            sprite_index = spr_mach2jump;
        }
        else
        {
            state = UnknownEnum.Value_121;
            sprite_index = spr_mach3jump;
        }
    }
    
    if (!instance_exists(obj_grindeffect))
        instance_create(x, y, obj_grindeffect);
}

enum UnknownEnum
{
    Value_104 = 104,
    Value_106 = 106,
    Value_121 = 121
}
