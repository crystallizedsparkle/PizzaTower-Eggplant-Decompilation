with (other)
{
    if (key_up2)
    {
        if (state == UnknownEnum.Value_0)
            state = UnknownEnum.Value_191;
        else if (state == UnknownEnum.Value_191)
            state = UnknownEnum.Value_0;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_191 = 191
}
