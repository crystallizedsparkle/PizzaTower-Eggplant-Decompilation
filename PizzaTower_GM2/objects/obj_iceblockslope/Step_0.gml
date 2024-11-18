var _dir;

if (place_meeting(x, y - 1, obj_player))
{
    _dir = sign(image_xscale);
    
    with (obj_player)
    {
        if (state != UnknownEnum.Value_37 && (icemovespeed < 2 || place_meeting(x, y + 1, obj_iceblock)) && place_meeting(x, y + 1, other) && scr_slope())
        {
            icemovespeed = 2;
            icedir = -_dir;
        }
        
        if (state == UnknownEnum.Value_37)
            icemovespeed = 0;
    }
}

enum UnknownEnum
{
    Value_37 = 37
}
