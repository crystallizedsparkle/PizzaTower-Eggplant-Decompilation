with (obj_player)
{
    if (state == states.motorcycle && place_meeting(x + hsp, y, other))
    {
        other.destroy = true;
        instance_destroy(other);
    }
}

enum UnknownEnum
{
    Value_32 = 32
}
