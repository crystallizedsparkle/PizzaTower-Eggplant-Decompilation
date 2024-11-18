var i, b;

draw_set_color(c_white);

for (i = 0; i < ds_list_size(collectiblelist); i++)
{
    b = ds_list_find_value(collectiblelist, i);
    draw_sprite_ext(b.sprite_index, b.image_index, b.x, b.y, 1, 1, 0, c_white, b.image_alpha);
}
