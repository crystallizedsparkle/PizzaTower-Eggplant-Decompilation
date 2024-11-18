with (obj_trapghost)
{
    if (point_distance(obj_player1.x, obj_player1.y, other.x, other.y) < other.ghost_distance_threshold && (state == UnknownEnum.Value_0 || trapid == -4 || (point_distance(obj_player1.x, obj_player1.y, trapid.x, trapid.y) > point_distance(obj_player1.x, obj_player1.y, other.x, other.y) && trapid.object_index != obj_tvtrap)))
    {
        state = UnknownEnum.Value_8;
        trapid = other.id;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_8 = 8
}
