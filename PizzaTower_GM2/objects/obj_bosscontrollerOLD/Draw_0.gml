var cx, cy, cw, ch, _super_bg, i;

if (state == UnknownEnum.Value_8 || state == UnknownEnum.Value_98 || state == UnknownEnum.Value_89)
{
    draw_set_alpha(fade);
    cx = camera_get_view_x(view_camera[0]);
    cy = camera_get_view_y(view_camera[0]);
    cw = camera_get_view_width(view_camera[0]);
    ch = camera_get_view_height(view_camera[0]);
    draw_rectangle_color(cx, cy, cx + cw, cy + ch, c_white, c_white, c_white, c_white, false);
    draw_set_alpha(1);
}

_super_bg = false;

with (obj_player)
{
    if (state == UnknownEnum.Value_252 && superattackstate == UnknownEnum.Value_80)
        _super_bg = true;
}

if (_super_bg)
{
    for (i = 0; i < 2; i++)
        draw_sprite(spr_superattack_bg, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + bg_super_y + (540 * i));
}

enum UnknownEnum
{
    Value_8 = 8,
    Value_80 = 80,
    Value_89 = 89,
    Value_98 = 98,
    Value_252 = 252
}
