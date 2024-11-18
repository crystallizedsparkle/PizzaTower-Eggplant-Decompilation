if (other.cutscene || other.state == UnknownEnum.Value_10)
    exit;

with (other)
{
    vsp = -18;
    sprite_index = spr_machfreefall;
    jumpstop = true;
    state = UnknownEnum.Value_92;
}

sprite_index = spr_clownmato_bounce;
image_index = 0;

enum UnknownEnum
{
    Value_10 = 10,
    Value_92 = 92
}
