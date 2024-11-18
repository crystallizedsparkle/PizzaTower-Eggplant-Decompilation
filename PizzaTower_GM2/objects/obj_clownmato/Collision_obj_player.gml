with (other)
{
    if ((!instakillmove || state == UnknownEnum.Value_104) && state != UnknownEnum.Value_106 && other.state == UnknownEnum.Value_134 && state != UnknownEnum.Value_61)
    {
        scr_soundeffect(28);
        vsp = -4;
        hsp = -3 * xscale;
        state = UnknownEnum.Value_106;
        sprite_index = spr_bump;
        image_index = 0;
        other.state = UnknownEnum.Value_106;
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
