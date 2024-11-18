var _actor;

_actor = false;

with (obj_player)
{
    if (state == UnknownEnum.Value_146)
        _actor = true;
}

if (_actor)
    exit;

with (other)
{
    if (key_up && grounded && !instance_exists(obj_option) && (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_58 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_99))
    {
        instance_create(x, y, obj_option);
        state = UnknownEnum.Value_146;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_58 = 58,
    Value_99 = 99,
    Value_103 = 103,
    Value_104,
    Value_121 = 121,
    Value_146 = 146
}
