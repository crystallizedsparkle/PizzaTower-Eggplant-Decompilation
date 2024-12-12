trigger = 1;

func = function(arg0)
{
    if (!active)
    {
        if (arg0.state == states.freefallland)
            active = true;
    }
};
