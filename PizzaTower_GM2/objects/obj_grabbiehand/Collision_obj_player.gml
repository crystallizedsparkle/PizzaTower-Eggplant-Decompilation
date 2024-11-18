if (state != UnknownEnum.Value_55 && x == xstart && y == ystart)
{
    with (other)
    {
        if (state != UnknownEnum.Value_61)
        {
            tauntstoredmovespeed = movespeed;
            tauntstoredvsp = vsp;
            tauntstoredsprite = sprite_index;
            tauntstoredstate = state;
        }
        
        state = UnknownEnum.Value_106;
        
        if (boxxed == false)
            sprite_index = spr_player_catched;
        else
            sprite_index = spr_boxxedpep_air;
        
        other.playerid = id;
        other.state = UnknownEnum.Value_55;
    }
}

enum UnknownEnum
{
    Value_55 = 55,
    Value_61 = 61,
    Value_106 = 106
}
