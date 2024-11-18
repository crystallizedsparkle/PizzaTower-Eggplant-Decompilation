function scr_player_ridecow()
{
    doublejump = false;
    hsp = 0;
    vsp = 0;
    movespeed = 0;
    
    if (!instance_exists(cowID))
    {
        if (has_mort)
        {
            state = UnknownEnum.Value_12;
            sprite_index = spr_fall;
        }
        else
        {
            state = UnknownEnum.Value_92;
            sprite_index = spr_fall;
        }
        
        exit;
    }
    
    image_speed = 0.35;
    sprite_index = spr_rideweenie;
    x = cowID.x;
    y = cowID.y - 42;
    xscale = cowID.image_xscale;
    
    if (key_jump)
    {
        cow_buffer = 20;
        vsp = -11;
        image_index = 0;
        
        if (has_mort)
        {
            state = UnknownEnum.Value_12;
            sprite_index = spr_jump;
        }
        else
        {
            state = UnknownEnum.Value_92;
            sprite_index = spr_jump;
        }
    }
}

enum UnknownEnum
{
    Value_12 = 12,
    Value_92 = 92
}
