var _currentbarpos, _perc, _max_x, _barpos, _barfillpos, clip_x, clip_y, i;

_currentbarpos = round_timermax - round_timer;
_perc = _currentbarpos / round_timermax;
_max_x = 430;
_barpos = _max_x * _perc;

if (!surface_exists(bar_surface))
    bar_surface = surface_create(_max_x, 38);

_barfillpos = floor(_barpos) + 6;

if (_barfillpos > 0)
{
    surface_resize(bar_surface, _barfillpos, 30);
    surface_set_target(bar_surface);
    draw_clear_alpha(c_black, 0);
    clip_x = bosstimer_x + 8;
    clip_y = bosstimer_y + 8;
    barfill_x += 0.4;
    
    if (barfill_x > 23)
        barfill_x = 0;
    
    for (i = -1; i < round(_max_x / 23); i++)
        draw_sprite(spr_bosstimer_barfill, 0, barfill_x + (i * 23), 0);
    
    surface_reset_target();
    draw_surface(bar_surface, clip_x, clip_y);
}

draw_sprite(spr_bosstimer_bar, -1, bosstimer_x, bosstimer_y);

if (bell_sprite != 1436)
    draw_sprite(spr_bosstimer_hammer, -1, bosstimer_x + 11 + _barpos, bosstimer_y + 12);

draw_sprite(bell_sprite, bell_index, bosstimer_x + 440, bosstimer_y + 21);
