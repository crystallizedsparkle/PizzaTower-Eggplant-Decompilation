var p;

if (state == UnknownEnum.Value_150)
{
    if (floor(image_index) >= 6)
    {
        with (playerid)
        {
            visible = true;
            sprite_index = spr_superspringplayer;
            state = UnknownEnum.Value_97;
            vsp = -10;
            
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
                state = UnknownEnum.Value_0;
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_97 = 97,
    Value_150 = 150
}
