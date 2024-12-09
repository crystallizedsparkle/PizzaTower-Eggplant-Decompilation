function scr_player_addslopemomentum(_arg0, _arg1)
{
    with (instance_place(x, y + 1, obj_slope))
    {
        if (sign(image_xscale) == -sign(other.xscale))
        {
            if (abs(image_yscale) < abs(image_xscale))
                other.movespeed += _arg0;
            else
                other.movespeed += _arg1;
        }
        else if (abs(image_yscale) < abs(image_xscale))
        {
            other.movespeed -= _arg0;
        }
        else
        {
            other.movespeed -= _arg1;
        }
    }
}

function scr_pizzaball_addslopemomentum(_arg0, _arg1)
{
    with (instance_place(x, y + 1, obj_slope))
    {
        if (sign(image_xscale) == -sign(other.image_xscale))
        {
            if (abs(image_yscale) < abs(image_xscale))
                other.slopespeed += _arg0;
            else
                other.slopespeed += _arg1;
        }
        else if (abs(image_yscale) < abs(image_xscale))
        {
            other.slopespeed -= _arg0;
        }
        else
        {
            other.slopespeed -= _arg1;
        }
    }
    
    if (slopespeed < 0)
        slopespeed = 0;
    
    if (slopespeed > 10)
        slopespeed = 10;
    
    if (movespeed < 1)
        slopespeed = 0;
}
