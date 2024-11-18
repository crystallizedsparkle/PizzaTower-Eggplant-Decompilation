with (other)
{
    if (state != UnknownEnum.Value_211 && state != UnknownEnum.Value_210 && state != UnknownEnum.Value_21)
    {
        sprite_index = spr_slipbanan1;
        other.drop = true;
        vsp = -11;
        movespeed += 2;
        
        if (movespeed > 14)
            movespeed = 14;
        
        hsp = movespeed * xscale;
        image_index = 0;
        state = UnknownEnum.Value_165;
    }
    
    instance_destroy(other);
}

enum UnknownEnum
{
    Value_21 = 21,
    Value_165 = 165,
    Value_210 = 210,
    Value_211
}
