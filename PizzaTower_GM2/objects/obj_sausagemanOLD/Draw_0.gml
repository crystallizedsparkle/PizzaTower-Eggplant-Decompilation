if (cigar)
{
    pal_swap_set(60, 1, false);
    draw_self();
    shader_reset();
}
else
{
    draw_self();
}

if (flash)
{
    shader_set(shd_hit);
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    shader_reset();
}
else
{
}
