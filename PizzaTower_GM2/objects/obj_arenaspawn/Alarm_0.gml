if (state != UnknownEnum.Value_145)
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
                if (state != UnknownEnum.Value_7)
                {
                    vsp = -11;
                    state = UnknownEnum.Value_7;
                    targetRoom = lastroom;
                }
            }
        }
    }
}

if (state == UnknownEnum.Value_143 || state == UnknownEnum.Value_142)
    alarm[0] = 60;

enum UnknownEnum
{
    Value_7 = 7,
    Value_142 = 142,
    Value_143,
    Value_145 = 145
}
