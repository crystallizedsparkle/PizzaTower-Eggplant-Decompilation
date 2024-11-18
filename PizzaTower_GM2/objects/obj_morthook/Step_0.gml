var _found;

_found = false;

with (obj_player)
{
    if (state == UnknownEnum.Value_11 || state == UnknownEnum.Value_12 || state == UnknownEnum.Value_13 || state == UnknownEnum.Value_14)
        _found = true;
}

if (_found)
    image_alpha = 1;
else
    image_alpha = 0.5;

enum UnknownEnum
{
    Value_11 = 11,
    Value_12,
    Value_13,
    Value_14
}
