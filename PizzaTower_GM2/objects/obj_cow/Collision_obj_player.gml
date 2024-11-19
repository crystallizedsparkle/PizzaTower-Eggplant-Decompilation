with (other)
{
    if (state != states.ridecow && vsp > 0 && !place_meeting(x, yprevious, other))
    {
        if (state == states.mort || state == states.mortjump || state == states.mortattack)
            has_mort = true;
        else
            has_mort = false;
    }
}

enum UnknownEnum
{
    Value_11 = 11,
    Value_12,
    Value_13,
    Value_190 = 190
}
