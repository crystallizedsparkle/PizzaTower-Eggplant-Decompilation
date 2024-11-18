if (!instance_exists(ID) && obj_player.state != UnknownEnum.Value_13 && obj_player.state != UnknownEnum.Value_11 && obj_player.state != UnknownEnum.Value_12 && obj_player.state != UnknownEnum.Value_14 && place_meeting(x, y, obj_player))
{
    instance_destroy(obj_mort);
    
    with (instance_create(x, y - 50, obj_mort))
        other.ID = id;
}

enum UnknownEnum
{
    Value_11 = 11,
    Value_12,
    Value_13,
    Value_14
}
