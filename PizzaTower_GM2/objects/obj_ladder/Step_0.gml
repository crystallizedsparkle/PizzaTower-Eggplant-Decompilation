if (place_meeting(x, y - 1, obj_player1))
{
    with (obj_player1)
    {
        if (place_meeting(x, y + 1, obj_ladder) && !place_meeting(other.x + 16, y + 1, obj_solid) && key_down && (state == states.crouch || ((character == "S" || character == "M") && (state == states.normal || state == states.mach1))) && place_meeting(x, y + 1, obj_platform))
        {
            y += 5;
            state = states.ladder;
            x = other.x + 16;
            y = floor(y);
            
            if ((y % 2) == 1)
                y -= 1;
        }
        
        if (key_down && place_meeting(x, y + 1, obj_ladder) && !place_meeting(other.x + 16, y + 1, obj_solid) && state == UnknownEnum.Value_260 && place_meeting(x, y + 1, obj_platform))
        {
            state = UnknownEnum.Value_261;
            
            if (brick == true)
            {
                with (instance_create(x, y, obj_brickcomeback))
                {
                    wait = true;
                    instance_create(x, y, obj_genericpoofeffect);
                }
            }
            
            y += 5;
            brick = false;
            x = other.x + 16;
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
            if (place_meeting(x, y + 2, obj_ladder) && !place_meeting(other.x + 16, y + 2, obj_solid) && key_down && (state == states.crouch || (character == "S" && (state == states.normal || state == states.mach1))) && place_meeting(x, y + 1, obj_platform))
            {
                y += 5;
                state = states.ladder;
                x = other.x + 16;
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
    Value_103 = 103,
    Value_260 = 260,
    Value_261
}
