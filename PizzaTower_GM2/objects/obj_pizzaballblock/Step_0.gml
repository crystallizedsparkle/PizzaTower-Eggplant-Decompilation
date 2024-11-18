with (obj_player)
{
    if (place_meeting(x + xscale, y, other) && state == UnknownEnum.Value_84)
        instance_destroy(other);
}

with (obj_player)
{
    if (place_meeting(x, y + 1, other) && state == UnknownEnum.Value_84)
        instance_destroy(other);
}

enum UnknownEnum
{
    Value_84 = 84
}
