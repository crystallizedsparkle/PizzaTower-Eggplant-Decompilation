var p;

if (state == states.tube)
{
    if (floor(image_index) >= 6)
    {
        with (playerid)
        {
            visible = true;
            state = states.freefall;
            vsp = 10;
            sprite_index = spr_player_rockethitwall;
            
            if (place_meeting(x, y, obj_solid))
            {
                while (place_meeting(x, y, obj_solid))
                    y--;
            }
            
            p = (object_index == obj_player1) ? 0 : 1;
            GamepadSetVibration(p, 1, 1, 0.9);
        }
    }
    
    with (playerid)
    {
        if (!place_meeting(x, y, other.id))
        {
            with (other)
            {
                playerid = -1;
                state = states.normal;
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_108 = 108,
    Value_150 = 150
}
