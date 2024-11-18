function scr_player_shotgundash()
{
    image_speed = 0.35;
    hsp = xscale * movespeed;
    
    if (floor(image_index) == (image_number - 1) || !key_attack)
    {
        state = UnknownEnum.Value_66;
        sprite_index = spr_shotgunidle;
        landAnim = false;
        movespeed = 6;
        
        if (!grounded)
        {
            state = UnknownEnum.Value_57;
            sprite_index = spr_shotgunfall;
        }
    }
}

enum UnknownEnum
{
    Value_57 = 57,
    Value_66 = 66
}
