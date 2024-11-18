var s;

if (state == UnknownEnum.Value_153)
{
    s = other.state;
    scr_hurtplayer(other);
    
    if (s != other.state && other.state == UnknownEnum.Value_107)
        pepperman_nearestspot();
}

enum UnknownEnum
{
    Value_107 = 107,
    Value_153 = 153
}
