if (place_meeting(x, y - 1, obj_player))
{
    with (obj_player)
    {
        if ((state != UnknownEnum.Value_148 && state != UnknownEnum.Value_91 && state != UnknownEnum.Value_186) && state != UnknownEnum.Value_210 && state != UnknownEnum.Value_211)
        {
            if (place_meeting(x, y + 1, other))
            {
                if (state != UnknownEnum.Value_113 && state != UnknownEnum.Value_114 && state != UnknownEnum.Value_116 && state != UnknownEnum.Value_115)
                {
                    state = UnknownEnum.Value_94;
                    sprite_index = spr_currentplayer;
                }
                else
                {
                    state = UnknownEnum.Value_116;
                    
                    if (sprite_index != spr_player_barrelslipnslide)
                        sprite_index = spr_player_barrelroll;
                }
                
                xscale = sign(other.image_xscale);
                movespeed = 20;
            }
        }
        else
        {
            vsp = -6;
            image_index = 0;
        }
    }
}

enum UnknownEnum
{
    Value_91 = 91,
    Value_94 = 94,
    Value_113 = 113,
    Value_114,
    Value_115,
    Value_116,
    Value_148 = 148,
    Value_186 = 186,
    Value_210 = 210,
    Value_211
}
