image_xscale = obj_player.xscale;

if (obj_player.state == UnknownEnum.Value_61)
{
    x = obj_player.x;
    y = obj_player.y;
}

if (obj_player.state == UnknownEnum.Value_56)
{
    x = obj_player.x + (-obj_player.image_xscale * 20);
    y = obj_player.y + 30;
}

if (obj_player.state != UnknownEnum.Value_61 && obj_player.state != UnknownEnum.Value_56)
    instance_destroy();

image_speed = 0.35;

enum UnknownEnum
{
    Value_56 = 56,
    Value_61 = 61
}
