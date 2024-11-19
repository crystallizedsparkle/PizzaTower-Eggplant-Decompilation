if (state != states.grabbing && x == xstart && y == ystart)
{
    with (other)
    {
        if (state != states.chainsaw)
        {
            tauntstoredmovespeed = movespeed;
            tauntstoredvsp = vsp;
            tauntstoredsprite = sprite_index;
            tauntstoredstate = state;
        }
        
        state = states.bump;
        
        if (boxxed == false)
            sprite_index = spr_player_catched;
        else
            sprite_index = spr_boxxedpep_air;
        
        other.playerid = id;
        other.state = states.grabbing;
    }
}

enum UnknownEnum
{
    Value_55 = 55,
    Value_61 = 61,
    Value_106 = 106
}
