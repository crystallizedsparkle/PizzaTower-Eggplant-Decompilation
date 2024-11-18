with (other)
{
    if (state != UnknownEnum.Value_190 && vsp > 0 && !place_meeting(x, yprevious, other))
    {
        if (state == UnknownEnum.Value_11 || state == UnknownEnum.Value_12 || state == UnknownEnum.Value_13)
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
