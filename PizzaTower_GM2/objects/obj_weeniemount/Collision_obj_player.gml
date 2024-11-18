with (other)
{
    if (state == UnknownEnum.Value_42 || state == UnknownEnum.Value_80)
    {
        state = UnknownEnum.Value_31;
        movespeed = hsp;
        sprite_index = spr_rideweenie;
        xscale = other.image_xscale;
        jumpstop = true;
        
        if (vsp < 0)
            vsp = 0;
        
        instance_destroy(other);
    }
}

enum UnknownEnum
{
    Value_31 = 31,
    Value_42 = 42,
    Value_80 = 80
}
