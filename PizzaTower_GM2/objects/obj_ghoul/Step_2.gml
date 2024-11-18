event_inherited();

if (state == UnknownEnum.Value_138)
{
    if (!scr_solid(x, y))
    {
        scr_collide();
    }
    else
    {
        x += hsp;
        y += vsp;
    }
}

enum UnknownEnum
{
    Value_138 = 138
}
