trigger = 1;

func = function(_inst)
{
    if (!active)
    {
        if (_inst.state == states.freefallland)
            active = true;
    }
};
