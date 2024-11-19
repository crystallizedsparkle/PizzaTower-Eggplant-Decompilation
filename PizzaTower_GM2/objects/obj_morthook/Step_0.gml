var _found;

_found = false;

with (obj_player)
{
    if (state == states.mort || state == states.mortjump || state == states.mortattack || state == states.morthook)
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
