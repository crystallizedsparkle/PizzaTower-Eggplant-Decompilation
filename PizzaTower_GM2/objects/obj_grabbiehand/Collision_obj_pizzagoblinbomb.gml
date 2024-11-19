if (state != states.grabbing && x == xstart && y == ystart)
{
    with (other)
    {
        other.playerid = id;
        other.state = states.grabbing;
    }
}

enum UnknownEnum
{
    Value_55 = 55
}
