var _width, _height, _tmp, _top, _height2, collect_x, collect_y, tv_x, tv_y, _cx, _cy, _perc, _minX, _maxX, _tx, _ty, _str, num, i, char, _fill, _currentbarpos, _max_x, _barpos, _barfillpos, clip_x, clip_y;

if (room == editor_room)
    exit;

draw_set_font(global.bigfont);
draw_set_halign(fa_center);
draw_set_color(c_white);

if (is_bossroom())
    exit;

if (global.use_temperature)
{
    _width = sprite_get_width(spr_temperature_meterfill);
    _height = sprite_get_height(spr_temperature_meterfill);
    global.temperature = clamp(global.temperature, 0, global.temp_thresholdnumber * 100);
    _tmp = global.temperature / (global.temp_thresholdnumber * 100);
    _top = 0;
    _height2 = _height * _tmp;
    draw_sprite_part_ext(spr_temperature_meterfill, 0, 0, _top, _width, _height2, 864, 192 + _height, 1, -1, c_white, 1);
    draw_sprite(spr_temperature_meter, 0, 864, 192);
}

collect_x = irandom_range(-collect_shake, collect_shake);
collect_y = irandom_range(-collect_shake, collect_shake);
tv_x = 845;
tv_y = 80;
_cx = tv_x + combo_posX;
_cy = tv_y + 117 + hud_posY + combo_posY;
_perc = global.combotime / 60;
_minX = _cx - 56;
_maxX = _cx + 59;
combofill_x = lerp(combofill_x, _minX + ((_maxX - _minX) * _perc), 0.5);
combofill_y = _cy;
draw_sprite(spr_tv_combobubblefill, combofill_index, combofill_x, combofill_y);
draw_sprite(spr_tv_combobubble, -1, _cx, _cy);
draw_set_font(global.combofont2);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
_tx = _cx - 64;
_ty = _cy - 12;
_str = string(global.combo);
num = string_length(_str);

for (i = num; i > 0; i--)
{
    char = string_char_at(_str, i);
    draw_text(_tx, _ty, char);
    _tx -= 22;
    _ty -= 8;
}

if (room != strongcold_endscreen)
{
    draw_sprite_ext(spr_tv_bg, 0, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
    draw_sprite_ext(sprite_index, image_index, tv_x + collect_x, tv_y + collect_y + hud_posY, 1, 1, 0, c_white, alpha);
}

if (bubblespr != -4)
    draw_sprite_ext(bubblespr, bubbleindex, 512, 53, 1, 1, 1, c_white, alpha);

if (!surface_exists(promptsurface))
    promptsurface = surface_create(290, 102);

surface_set_target(promptsurface);
draw_clear_alpha(c_black, 0);
draw_set_font(font1);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

if (bubblespr == 1293)
{
    promptx -= promptspd;
    
    if (bubblespr != 433 && promptx < (350 - string_width(prompt)))
    {
        bubblespr = 433;
        bubbleindex = 0;
    }
    
    draw_text_color(promptx - 350, 50, prompt, c_black, c_black, c_black, c_black, 1);
}

draw_set_halign(fa_left);
surface_reset_target();
draw_surface(promptsurface, 350, 0);
draw_set_font(global.smallnumber_fnt);
draw_set_halign(fa_center);

if (instance_exists(obj_pizzaball))
    draw_text(832, 300, string(global.golfhit) + " " + "GOLF HIT");

if (global.panic)
{
    _fill = global.fill;
    _currentbarpos = chunkmax - _fill;
    _perc = _currentbarpos / chunkmax;
    _max_x = 299;
    _barpos = _max_x * _perc;
    
    if (!surface_exists(bar_surface))
        bar_surface = surface_create(298, 30);
    
    _barfillpos = floor(_barpos) + 13;
    
    if (_barfillpos > 0)
    {
        surface_resize(bar_surface, _barfillpos, 30);
        surface_set_target(bar_surface);
        draw_clear_alpha(c_black, 0);
        clip_x = timer_x + 3;
        clip_y = timer_y + 5;
        
        for (i = 0; i < 3; i++)
            draw_sprite(spr_timer_barfill, 0, barfill_x + (i * 173), 0);
        
        surface_reset_target();
        draw_surface(bar_surface, clip_x, clip_y);
    }
    
    draw_sprite(spr_timer_bar, -1, timer_x, timer_y);
    draw_sprite(johnface_sprite, johnface_index, timer_x + 13 + _barpos, timer_y + 20);
    draw_sprite(pizzaface_sprite, pizzaface_index, timer_x + 320, timer_y + 10);
}
