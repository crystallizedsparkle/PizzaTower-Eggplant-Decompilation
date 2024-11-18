var s;

if (state == UnknownEnum.Value_134 && !other.brick && other.state == UnknownEnum.Value_259)
{
    s = other.state;
    scr_hurtplayer(other);
    
    if (s != other.state)
    {
        if (state == UnknownEnum.Value_134)
        {
            state = UnknownEnum.Value_80;
            sprite_index = spr_playerN_spin;
            image_index = 0;
        }
    }
}

enum UnknownEnum
{
    Value_80 = 80,
    Value_134 = 134,
    Value_259 = 259
}
