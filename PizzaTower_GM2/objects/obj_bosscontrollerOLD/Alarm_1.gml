if (!fakedeath)
{
    scr_playerreset();
    
    with (obj_player)
    {
        if (object_index == obj_player1 || global.coop)
        {
            state = states.normal;
            targetDoor = "A";
        }
    }
    
    gamesave_async_save();
    room = hub_mrstickarena;
}
else
{
    extrarounds = true;
    round_count = 1;
    round_max = extrarounds_count;
    fakedeath = false;
    timer_buffer = timer_max;
    state = states.arena_round;
    fade = 1;
    
    with (par_boss)
    {
        destroyed = false;
        destroyable = true;
        max_hp /= 2;
        max_hp = floor(max_hp);
        hp = max_hp;
        stunned = 0;
        targetstunned = 0;
        phase++;
        phase = clamp(phase, 0, max_phase);
        state = states.arena_round;
        vsp = -11;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_145 = 145
}
