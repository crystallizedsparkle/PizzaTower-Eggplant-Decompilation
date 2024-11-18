var xs, i;

xs = sign(image_xscale);

for (i = 0; i < (abs(sprite_width) / 64); i++)
    draw_sprite(spr_ventilator, ventilator_index, x + (i * xs * 64), (y + sprite_height) - 32);
