with (other)
{
    if ((other.state == states.stun && other.thrown == true) || (other.state == states.grabbed && obj_player.state == states.superslam))
        instance_destroy();
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_76 = 76,
    Value_138 = 138
}
