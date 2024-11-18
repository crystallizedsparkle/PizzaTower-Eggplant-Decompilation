if (place_meeting(x, y - 1, obj_player1))
{
    with (obj_player1)
    {
        if (place_meeting(x, y + 1, obj_stairs) && !place_meeting(other.x + 16, y + 1, obj_solid) && !place_meeting(x, y + 1, obj_solid) && key_down && (state == UnknownEnum.Value_100 || ((character == "S" || character == "M") && (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_103))) && place_meeting(x, y + 1, obj_platform))
        {
            y += 5;
            state = UnknownEnum.Value_93;
            y = floor(y);
            
            if ((y % 2) == 1)
                y -= 1;
        }
    }
}

if (instance_exists(obj_player2))
{
    if (place_meeting(x, y - 2, obj_player2))
    {
        with (obj_player2)
        {
            if (place_meeting(x, y + 2, obj_ladder) && !place_meeting(other.x + 16, y + 2, obj_solid) && !place_meeting(x, y + 1, obj_solid) && key_down && (state == UnknownEnum.Value_100 || (character == "S" && (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_103))) && place_meeting(x, y + 1, obj_platform))
            {
                y += 5;
                state = UnknownEnum.Value_93;
                y = floor(y);
                
                if ((y % 2) == 1)
                    y -= 1;
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_93 = 93,
    Value_100 = 100,
    Value_103 = 103
}
