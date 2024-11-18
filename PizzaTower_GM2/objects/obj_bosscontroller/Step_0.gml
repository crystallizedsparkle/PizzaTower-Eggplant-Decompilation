if (!round_timer_init)
{
    round_timer = round_timermax;
    round_timer_init = true;
}

round_timer--;

if (round_timer <= 0)
{
    round_timer = 0;
    
    if (bell_sprite != 1436)
    {
        bell_sprite = 1436;
        bell_index = 0;
    }
    else if (floor(bell_index) == (sprite_get_number(spr_bosstimer_hitbell) - 1) && !instance_exists(obj_fadeout))
    {
        with (obj_player1)
        {
            targetDoor = "A";
            room = timesuproom;
            state = UnknownEnum.Value_64;
            sprite_index = spr_Timesup;
            image_index = 0;
            audio_stop_all();
            scr_soundeffect(120);
        }
    }
}

bell_index += 0.35;

if (!instance_exists(bossID) && !bossdead)
{
    bossdead = true;
    alarm[0] = 150;
    
    with (obj_player1)
    {
        sprite_index = spr_player_levelcomplete;
        image_speed = 0.35;
        image_index = 0;
        state = UnknownEnum.Value_144;
    }
}

enum UnknownEnum
{
    Value_64 = 64,
    Value_144 = 144
}
