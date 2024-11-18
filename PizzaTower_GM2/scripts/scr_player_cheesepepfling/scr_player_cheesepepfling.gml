function scr_player_cheesepepfling()
{
    hsp = 0;
    sprite_index = spr_cheesepepintro;
    
    if (fling < 30)
        fling += 0.2;
    
    if (!key_attack)
    {
        if (fling > 0.5)
        {
            movespeed = fling;
            hsp = movespeed * xscale;
            vsp = -6;
            state = UnknownEnum.Value_28;
            sprite_index = spr_cheesepepjumpstart;
            image_index = 0;
        }
        else
        {
            state = UnknownEnum.Value_24;
            sprite_index = spr_cheesepepintro;
            image_index = 0;
        }
    }
}

enum UnknownEnum
{
    Value_24 = 24,
    Value_28 = 28
}
