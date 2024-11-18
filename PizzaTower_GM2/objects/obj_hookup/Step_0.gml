if (hooked)
{
    if (place_meeting(x, y - 50, obj_solid))
        instance_destroy();
    
    if (!blinking && place_meeting(x, y - 200, obj_solid))
    {
        blinking = true;
        alarm[0] = 1;
    }
    
    y -= movespeed;
    
    with (obj_player)
    {
        if (state == UnknownEnum.Value_93 && place_meeting(x, y, other))
            y -= 5;
    }
    
    if (y < -50)
        instance_destroy();
    
    with (obj_player1)
    {
        if (hooked)
        {
            x = other.x + 16;
            y = other.y + 40;
        }
    }
}

enum UnknownEnum
{
    Value_93 = 93
}