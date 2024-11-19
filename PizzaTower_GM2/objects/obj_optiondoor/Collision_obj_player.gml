var _actor;

_actor = false;

with (obj_player)
{
    if (state == states.actor)
        _actor = true;
}

if (_actor)
    exit;

with (other)
{
    if (key_up && grounded && !instance_exists(obj_option) && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.pogo || state == states.mach3 || state == states.Sjumpprep))
    {
        instance_create(x, y, obj_option);
        state = states.actor;
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
