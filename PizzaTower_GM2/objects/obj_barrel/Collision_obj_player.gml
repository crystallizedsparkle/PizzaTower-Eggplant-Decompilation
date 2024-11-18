if (active)
{
    if (place_meeting(x, y - 1, other) && other.vsp > 1 && other.state != UnknownEnum.Value_113 && other.state != UnknownEnum.Value_116 && other.state != UnknownEnum.Value_114 && other.state != UnknownEnum.Value_115)
    {
        with (other)
        {
            instance_create(x, y, obj_genericpoofeffect);
            movespeed = hsp;
            state = UnknownEnum.Value_113;
            image_index = 0;
        }
        
        active = false;
        alarm[0] = 150;
    }
}

enum UnknownEnum
{
    Value_113 = 113,
    Value_114,
    Value_115,
    Value_116
}
