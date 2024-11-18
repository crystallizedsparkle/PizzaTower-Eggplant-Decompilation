var b_hp, p_hp;

if (state == UnknownEnum.Value_8)
    exit;

if (state == UnknownEnum.Value_98)
    exit;

if (obj_player.state != UnknownEnum.Value_252)
{
    round_timer--;
    
    if (round_timer <= 0)
    {
        instance_destroy(obj_baddiespawner);
        instance_destroy(obj_noisey);
        
        if (endroundfunc != -4)
            endroundfunc();
        
        if (round_count < round_max)
        {
            round_count++;
            minutes = maxminutes;
            seconds = maxseconds;
            state = UnknownEnum.Value_145;
            timer_buffer = timer_max;
            bell_sprite = 1436;
            bell_index = 0;
            bell_buffer = 70;
            
            with (par_boss)
            {
                phase++;
                phase = clamp(phase, 0, max_phase);
                
                if (colliding && state != UnknownEnum.Value_180 && state != UnknownEnum.Value_181)
                    state = UnknownEnum.Value_145;
            }
        }
        else if (instance_exists(bossID))
        {
            b_hp = (bossID.hp / bossID.max_hp) * 100;
            p_hp = (player_hp / player_hpmax) * 100;
            
            if (b_hp <= p_hp)
            {
                depth = obj_player1.depth + 1;
                state = UnknownEnum.Value_8;
                
                with (bossID)
                {
                    with (lastplayerid)
                    {
                        xscale = 1;
                        suplexmove = true;
                        sfx_gain(suplexdashsnd);
                        state = UnknownEnum.Value_42;
                        movespeed = 10;
                        image_index = random_range(0, image_number - 1);
                        sprite_index = spr_player_groundedattack;
                    }
                    
                    hp = 0;
                    boss_destroy(lastplayerid);
                }
            }
            else
            {
                with (bossID)
                {
                    sprite_index = defeatplayerspr;
                    fakedeath = false;
                }
                
                fakedeath = false;
                player_hp = 0;
            }
        }
    }
}

if (state != UnknownEnum.Value_145 && state != UnknownEnum.Value_98 && state != UnknownEnum.Value_8)
    alarm[0] = 1;

enum UnknownEnum
{
    Value_8 = 8,
    Value_42 = 42,
    Value_98 = 98,
    Value_145 = 145,
    Value_180 = 180,
    Value_181,
    Value_252 = 252
}
