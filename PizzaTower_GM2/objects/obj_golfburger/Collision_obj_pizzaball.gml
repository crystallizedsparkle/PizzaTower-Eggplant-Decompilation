if (state != UnknownEnum.Value_74 && state != UnknownEnum.Value_138 && state != UnknownEnum.Value_4)
{
    if (other.state == UnknownEnum.Value_134)
    {
        golfid = other.id;
        shot = false;
        state = UnknownEnum.Value_74;
        sprite_index = spr_golfburger_golf;
        image_index = 0;
        
        if (shootdir == 0)
            image_xscale = choose(-1, 1);
        else
            image_xscale = shootdir;
    }
    else if (other.state == UnknownEnum.Value_156)
    {
        instance_destroy();
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_74 = 74,
    Value_134 = 134,
    Value_138 = 138,
    Value_156 = 156
}
