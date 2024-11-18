var old_halign, old_valign, old_color;

draw_self();
old_halign = draw_get_halign();
old_valign = draw_get_valign();
old_color = draw_get_color();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x + 16, y + 16, string(threshold));
draw_set_halign(old_halign);
draw_set_valign(old_valign);
draw_set_color(old_color);
