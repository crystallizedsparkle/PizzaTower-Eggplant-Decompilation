with (other)
{
    vsp = Approach(vsp, -5, 5);
    jumpstop = true;
    
    if (state == UnknownEnum.Value_105)
    {
        state = UnknownEnum.Value_92;
        
        if (sprite_index == spr_mach3boost || sprite_index == spr_machslideboost)
            xscale *= -1;
        
        sprite_index = spr_machfreefall;
    }
}

enum UnknownEnum
{
    Value_92 = 92,
    Value_105 = 105
}
