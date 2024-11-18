with (other)
{
    if (state != UnknownEnum.Value_186)
    {
        if (state == UnknownEnum.Value_53 || state == UnknownEnum.Value_32 || state == UnknownEnum.Value_94 || state == UnknownEnum.Value_184 || state == UnknownEnum.Value_78 || state == UnknownEnum.Value_5 || state == UnknownEnum.Value_21 || state == UnknownEnum.Value_38 || state == UnknownEnum.Value_65 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_104)
        {
            other.sprite_index = spr_sidespringblock_bounce;
            other.image_index = 0;
            
            if (xscale != other.image_xscale)
                xscale = other.image_xscale;
        }
    }
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_21 = 21,
    Value_32 = 32,
    Value_38 = 38,
    Value_53 = 53,
    Value_65 = 65,
    Value_78 = 78,
    Value_94 = 94,
    Value_104 = 104,
    Value_121 = 121,
    Value_184 = 184,
    Value_186 = 186
}
