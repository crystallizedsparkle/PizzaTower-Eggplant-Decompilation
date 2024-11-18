var _boss, hb, upb, sb, p, pstate, pmovespeed, psprite;

_boss = other.id;
hb = id;

if (collisioned)
    exit;

with (_boss)
{
    upb = ds_map_find_value(boss_unparryablestates, state);
    sb = ds_map_find_value(boss_hurtstates, state);
    
    if (!is_undefined(sb) && is_undefined(upb))
    {
        p = (hb.player_id == 1) ? obj_player1.id : obj_player2.id;
        pstate = p.tauntstoredstate;
        pmovespeed = p.tauntstoredmovespeed;
        psprite = p.tauntstoredsprite;
        
        if (object_index == obj_pizzafaceboss && phase > 1)
        {
            SUPER_boss_hurt(30, p);
        }
        else
        {
            boss_hurt(30, p);
            hitvsp = -14;
            movespeed = 0;
            hithsp = 0;
        }
        
        with (hb)
        {
            if (!collisioned)
                event_user(0);
        }
        
        with (p)
        {
            tauntstoredstate = pstate;
            tauntstoredmovespeed = pmovespeed;
            tauntstoredsprite = psprite;
        }
    }
}
