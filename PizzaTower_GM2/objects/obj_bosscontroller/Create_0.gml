if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

bossID = noone;
bossdead = false;
bosstimer_x = 257;
bosstimer_y = 466;
bell_sprite = spr_bosstimer_bell;
bell_index = 0;
bell_buffer = 0;
bar_surface = noone;
barfill_x = 0;
round_timermax = 7200;
round_timer = round_timermax;
round_timer_init = false;
