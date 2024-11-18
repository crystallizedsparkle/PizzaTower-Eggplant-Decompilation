if (state == UnknownEnum.Value_138 && thrown && other.state != UnknownEnum.Value_5 && other.state != UnknownEnum.Value_138)
{
    with (other)
    {
        state = UnknownEnum.Value_138;
        vsp = -5;
        stunstate = 0;
        stunned = 100;
    }
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_138 = 138
}
