if (other.id != baddieID && other.state != UnknownEnum.Value_5 && other.state != UnknownEnum.Value_138)
{
    with (other)
    {
        stunstate = 1;
        stuntimer = stunmax;
        stunned = 0;
        state = UnknownEnum.Value_5;
        vsp = -6;
        stunstate = 1;
    }
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_138 = 138
}
