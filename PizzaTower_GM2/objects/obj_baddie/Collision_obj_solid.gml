if (state != states.grabbed && state != states.pummel && state != states.hit && state != UnknownEnum.Value_266 && (!place_meeting(x, y, obj_destructibles) || place_meeting(x, y, obj_onewaybigblock)))
    instance_destroy();

enum UnknownEnum
{
    Value_4 = 4,
    Value_137 = 137,
    Value_154 = 154,
    Value_266 = 266
}
