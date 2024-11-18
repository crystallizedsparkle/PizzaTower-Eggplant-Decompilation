var _block;

_block = id;

with (obj_player)
{
    if (state != UnknownEnum.Value_89 && place_meeting(x, y + 1, _block))
    {
        vsp = -11;
        _block.image_index = 0;
        _block.image_speed = 0.35;
    }
}

enum UnknownEnum
{
    Value_89 = 89
}
