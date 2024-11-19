if (state != states.arena_round)
{
    wave_seconds--;
    
    if (wave_seconds < 0)
    {
        if (wave_minutes > 0)
        {
            wave_seconds = 59;
            wave_minutes--;
        }
        else
        {
            wave_seconds = 0;
            
            with (obj_player1)
            {
                if (state != states.ejected)
                {
                    vsp = -11;
                    state = states.ejected;
                    targetRoom = lastroom;
                }
            }
        }
    }
}

if (state == states.arena || state == states.arena_spawn)
    alarm[0] = 60;

enum UnknownEnum
{
    Value_7 = 7,
    Value_142 = 142,
    Value_143,
    Value_145 = 145
}
