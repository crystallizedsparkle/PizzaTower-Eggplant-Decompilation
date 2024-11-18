with (obj_player)
{
    if (state == UnknownEnum.Value_121 && movespeed > 16 && place_meeting(x + hsp, y, other))
        instance_destroy(other);
}

enum UnknownEnum
{
    Value_121 = 121
}
