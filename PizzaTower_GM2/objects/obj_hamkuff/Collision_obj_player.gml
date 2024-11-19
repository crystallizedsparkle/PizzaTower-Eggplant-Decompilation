if (state != states.stun)
{
    if (!other.isgustavo)
    {
        if (other.state != states.mach3 || !other.launched)
        {
            if (state != states.blockstance)
            {
                sprite_index = spr_hamkuff_chain1;
                state = states.blockstance;
                playerid = other.id;
            }
        }
        else
        {
            scr_soundeffect(46);
            instance_destroy();
        }
    }
    else if (other.brick && state != states.blockstance)
    {
        other.brick = false;
        state = states.blockstance;
        sprite_index = spr_hamkuff_chain1;
        state = states.blockstance;
        
        with (other)
        {
            state = states.ratmounthurt;
            xscale = -other.image_xscale;
            vsp = -10;
        }
        
        with (instance_create(other.x, other.y, obj_brickcomeback))
        {
            trapped = true;
            baddieID = other.id;
            other.playerid = id;
        }
    }
    else if (other.state == UnknownEnum.Value_259)
    {
        scr_soundeffect(46);
        instance_destroy();
    }
    else
    {
        with (other)
        {
            state = states.ratmounthurt;
            xscale = other.image_xscale;
            vsp = -10;
        }
    }
}

enum UnknownEnum
{
    Value_121 = 121,
    Value_138 = 138,
    Value_196 = 196,
    Value_206 = 206,
    Value_259 = 259
}
