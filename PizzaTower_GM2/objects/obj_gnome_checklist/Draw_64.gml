draw_sprite_ext(spr_gnome_checklist, 0, xx, yy, 1, 1, image_angle, image_blend, image_alpha);

for (var i = 0; i < array_length_1d(gnome_check); i++)
{
    if (gnome_check[i])
        draw_sprite_ext(spr_check, 0, xx + gnome_xx[i], yy + gnome_yy[i], 1, 1, image_angle, image_blend, image_alpha);
}
