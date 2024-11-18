function scr_player_mortattack()
{
    image_speed = 0.45;
    hsp = movespeed;
    
    if (floor(image_index) == (image_number - 1))
    {
        if (grounded && vsp > 0)
        {
            state = UnknownEnum.Value_11;
            sprite_index = spr_player_mortidle;
            landAnim = false;
        }
        else
        {
            state = UnknownEnum.Value_12;
            sprite_index = spr_player_mortjump;
        }
    }
    
    if (punch_afterimage > 0)
    {
        punch_afterimage--;
    }
    else
    {
        punch_afterimage = 5;
        create_blue_afterimage(x, y, sprite_index, image_index, xscale);
    }
}

enum UnknownEnum
{
    Value_11 = 11,
    Value_12
}
