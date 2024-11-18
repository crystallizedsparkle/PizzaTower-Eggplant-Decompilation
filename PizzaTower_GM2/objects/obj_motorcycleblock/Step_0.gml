with (obj_player)
{
    if (state == UnknownEnum.Value_32 && place_meeting(x + hsp, y, other))
    {
        other.destroy = true;
        instance_destroy(other);
    }
}

enum UnknownEnum
{
    Value_32 = 32
}
