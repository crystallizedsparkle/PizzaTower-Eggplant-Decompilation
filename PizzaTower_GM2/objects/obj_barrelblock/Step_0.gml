with (obj_player)
{
    if (state == UnknownEnum.Value_113 && (place_meeting(x + 1, y, other) || place_meeting(x - 1, y, other)))
        instance_destroy(other);
}

enum UnknownEnum
{
    Value_113 = 113
}
