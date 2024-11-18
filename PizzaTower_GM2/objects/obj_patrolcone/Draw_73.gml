var p, t;

with (baddieID)
{
    if (alarm[5] != -1 || state == UnknownEnum.Value_80)
    {
        p = patroltimermax - patroltimer;
        
        if (state == UnknownEnum.Value_80)
            p++;
        
        t = (p * 3) + other.patrolalert_index;
        draw_sprite(spr_patrolalert_number, t, x, y - 100);
    }
}

enum UnknownEnum
{
    Value_80 = 80
}
