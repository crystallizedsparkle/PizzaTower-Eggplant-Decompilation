var s;

if (state == states.shoulderbash)
{
    s = other.state;
    scr_hurtplayer(other);
    
    if (s != other.state && other.state == states.hurt)
        pepperman_nearestspot();
}

enum UnknownEnum
{
    Value_107 = 107,
    Value_153 = 153
}
