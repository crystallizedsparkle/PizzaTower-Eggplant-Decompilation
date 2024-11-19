with (other)
{
    if ((!instakillmove || state == states.mach2) && state != states.bump && other.state == states.walk && state != states.chainsaw)
    {
        scr_soundeffect(28);
        vsp = -4;
        hsp = -3 * xscale;
        state = states.bump;
        sprite_index = spr_bump;
        image_index = 0;
        other.state = states.bump;
        other.sprite_index = spr_clownmato_bounce;
        other.image_index = 0;
    }
}

enum UnknownEnum
{
    Value_61 = 61,
    Value_104 = 104,
    Value_106 = 106,
    Value_134 = 134
}
