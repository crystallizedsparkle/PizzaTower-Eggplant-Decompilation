with (other)
{
    if (key_up && ladderbuffer == 0 && (state == UnknownEnum.Value_9 || state == UnknownEnum.Value_0 || state == UnknownEnum.Value_58 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_57 || state == UnknownEnum.Value_92 || state == UnknownEnum.Value_60) && state != UnknownEnum.Value_107 && state != UnknownEnum.Value_105 && state != UnknownEnum.Value_108 && state != UnknownEnum.Value_111)
    {
        other.hooked = true;
        hooked = true;
        mach2 = 0;
        state = UnknownEnum.Value_93;
        x = other.x + 16;
        y = other.y + 40;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_9 = 9,
    Value_57 = 57,
    Value_58,
    Value_60 = 60,
    Value_92 = 92,
    Value_93,
    Value_103 = 103,
    Value_104,
    Value_105,
    Value_107 = 107,
    Value_108,
    Value_111 = 111,
    Value_121 = 121
}
