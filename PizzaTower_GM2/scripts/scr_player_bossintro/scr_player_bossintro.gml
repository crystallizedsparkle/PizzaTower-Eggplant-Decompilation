function scr_player_bossintro()
{
    hsp = 0;
    xscale = 1;
    hurted = false;
    inv_frames = false;
    
    if (sprite_index == spr_player_bossintro && floor(image_index) == (image_number - 1))
    {
        state = UnknownEnum.Value_0;
        image_index = 0;
    }
    
    if (sprite_index == spr_player_levelcomplete && floor(image_index) == (image_number - 1))
        image_speed = 0;
    else
        image_speed = 0.35;
}

enum UnknownEnum
{
    Value_0
}