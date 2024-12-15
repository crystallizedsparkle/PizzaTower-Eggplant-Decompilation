func = function(_inst)
{
    if (!active && _inst.state == states.backbreaker)
    {
        active = true;
        obj_secretmanager.touchedtriggers += 1;
    }
};
