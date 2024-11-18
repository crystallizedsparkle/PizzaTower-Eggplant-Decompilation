var _obj, _max, i;

_obj = id;

with (other)
{
    if (scr_transformationcheck() || state == UnknownEnum.Value_5)
    {
        if ((state != UnknownEnum.Value_106 || sprite_index != spr_player_catched) && (state != UnknownEnum.Value_5 || xscale != _obj.image_xscale) && state != UnknownEnum.Value_47 && state != UnknownEnum.Value_38 && state != UnknownEnum.Value_84 && state != UnknownEnum.Value_186)
        {
            state = UnknownEnum.Value_5;
            xscale = sign(other.image_xscale);
            mask_index = spr_crouchmask;
            movespeed = 14;
            vsp = 0;
            sprite_index = spr_tumble;
            other.image_index = 0;
            other.sprite_index = spr_goblinbot_kick;
            _max = 45;
            y = other.y - _max;
            
            if (place_meeting(x, y, obj_platform))
                y--;
            
            if (scr_solid(x, y))
            {
                i = 0;
                
                while (i <= _max)
                {
                    if (scr_solid(x, y))
                    {
                        x += xscale;
                        i++;
                    }
                    else
                    {
                        break;
                    }
                }
            }
            
            if (scr_solid(x, y))
            {
                i = 0;
                
                while (i <= _max)
                {
                    if (scr_solid(x, y))
                    {
                        y--;
                        i++;
                    }
                    else
                    {
                        break;
                    }
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_38 = 38,
    Value_47 = 47,
    Value_84 = 84,
    Value_106 = 106,
    Value_186 = 186
}
