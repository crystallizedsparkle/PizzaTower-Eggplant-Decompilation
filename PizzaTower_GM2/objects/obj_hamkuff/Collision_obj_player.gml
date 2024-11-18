if (state != UnknownEnum.Value_138)
{
    if (!other.isgustavo)
    {
        if (other.state != UnknownEnum.Value_121 || !other.launched)
        {
            if (state != UnknownEnum.Value_206)
            {
                sprite_index = spr_hamkuff_chain1;
                state = UnknownEnum.Value_206;
                playerid = other.id;
            }
        }
        else
        {
            scr_soundeffect(46);
            instance_destroy();
        }
    }
    else if (other.brick && state != UnknownEnum.Value_206)
    {
        other.brick = false;
        state = UnknownEnum.Value_206;
        sprite_index = spr_hamkuff_chain1;
        state = UnknownEnum.Value_206;
        
        with (other)
        {
            state = UnknownEnum.Value_196;
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
            state = UnknownEnum.Value_196;
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
