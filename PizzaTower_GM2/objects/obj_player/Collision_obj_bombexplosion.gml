var dir;

if (scr_transformationcheck() && state != UnknownEnum.Value_53 && state != UnknownEnum.Value_54 && state != UnknownEnum.Value_97 && state != UnknownEnum.Value_99)
{
    dir = point_direction(other.x, other.y, x, y);
    trace(dir);
    
    if (!grounded && dir >= 45 && dir < 135)
    {
        state = UnknownEnum.Value_54;
        bombup_dir = -1;
        sprite_index = spr_superspringplayer;
        image_index = 0;
    }
    
    if (grounded && x > (other.x - 8) && x < (other.x + 8))
    {
        state = UnknownEnum.Value_53;
        xscale = -1;
        movespeed = 14;
        sprite_index = spr_hurt;
    }
    
    if (state != UnknownEnum.Value_53 && state != UnknownEnum.Value_54)
    {
        if (dir >= 135 && dir < 270)
        {
            state = UnknownEnum.Value_53;
            xscale = -1;
            movespeed = 14;
            sprite_index = spr_hurt;
        }
        else if (dir >= 270 || dir < 45)
        {
            state = UnknownEnum.Value_53;
            sprite_index = spr_hurt;
            movespeed = 14;
            xscale = 1;
        }
    }
}

enum UnknownEnum
{
    Value_53 = 53,
    Value_54,
    Value_97 = 97,
    Value_99 = 99
}
