trigger = 3;

stepfunc = function()
{
    active = false;
    
    if (place_meeting(x, y, obj_baddie))
        active = true;
    
    with (obj_player)
    {
        if (state == UnknownEnum.Value_55 && place_meeting(x, y, other))
            other.active = true;
    }
};

enum UnknownEnum
{
    Value_55 = 55
}
