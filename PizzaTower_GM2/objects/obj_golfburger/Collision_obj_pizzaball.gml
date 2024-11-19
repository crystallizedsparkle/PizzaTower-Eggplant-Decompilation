if (state != states.throwing && state != states.stun && state != states.grabbed)
{
    if (other.state == states.walk)
    {
        golfid = other.id;
        shot = false;
        state = states.throwing;
        sprite_index = spr_golfburger_golf;
        image_index = 0;
        
        if (shootdir == 0)
            image_xscale = choose(-1, 1);
        else
            image_xscale = shootdir;
    }
    else if (other.state == states.thrown)
    {
        instance_destroy();
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_74 = 74,
    Value_134 = 134,
    Value_138 = 138,
    Value_156 = 156
}
