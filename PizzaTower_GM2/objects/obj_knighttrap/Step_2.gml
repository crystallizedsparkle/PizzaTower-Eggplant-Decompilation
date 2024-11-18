switch (state)
{
    case UnknownEnum.Value_80:
        if (attackbuffer > 0)
            attackbuffer--;
        else
            state = UnknownEnum.Value_0;
        
        break;
}

if (!place_meeting(x, y, obj_trapghost))
{
    sprite_index = spr_kingghost_spike;
    state = UnknownEnum.Value_0;
}

if (cooldown > 0 && state != UnknownEnum.Value_80)
    cooldown--;

enum UnknownEnum
{
    Value_0,
    Value_80 = 80
}
