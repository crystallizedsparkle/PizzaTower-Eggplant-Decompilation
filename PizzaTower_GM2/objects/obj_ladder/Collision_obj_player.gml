with (other)
{
    if (key_up && ladderbuffer == 0 && (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_58 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_57 || state == UnknownEnum.Value_92 || state == UnknownEnum.Value_60) && state != UnknownEnum.Value_107 && state != UnknownEnum.Value_105 && state != UnknownEnum.Value_108 && state != UnknownEnum.Value_111)
    {
        state = UnknownEnum.Value_93;
        x = other.x + 16;
        y = floor(y);
        
        if ((y % 2) == 1)
            y -= 1;
    }
    
    if (key_up && ladderbuffer == 0 && (state == UnknownEnum.Value_192 || state == UnknownEnum.Value_191))
    {
        state = UnknownEnum.Value_261;
        
        if (brick == true)
        {
            with (instance_create(x, y, obj_brickcomeback))
            {
                wait = true;
                instance_create(x, y, obj_genericpoofeffect);
            }
        }
        
        brick = false;
        x = other.x + 16;
        y = floor(y);
        
        if ((y % 2) == 1)
            y -= 1;
    }
}

enum UnknownEnum
{
    Value_0,
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
    Value_121 = 121,
    Value_191 = 191,
    Value_192,
    Value_261 = 261
}
