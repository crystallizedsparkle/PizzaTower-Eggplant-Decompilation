var _angle, t, lx, ly;

event_inherited();

if (state == states.ghostpossess && substate == states.normal)
{
    _angle = point_direction(0, 0, moveX, moveY);
    t = 32;
    lx = lengthdir_x(t, _angle);
    ly = lengthdir_y(t, _angle);
    draw_sprite(spr_ball_move, 0, x + lx, y + ly);
}

enum UnknownEnum
{
    Value_0,
    Value_17 = 17
}
