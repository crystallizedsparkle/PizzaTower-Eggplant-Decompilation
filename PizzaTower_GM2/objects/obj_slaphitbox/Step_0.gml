image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;

if ((playerid.image_index > 3 || playerid.state != UnknownEnum.Value_23) && playerid.state != UnknownEnum.Value_42 && playerid.state != UnknownEnum.Value_19)
    instance_destroy();

enum UnknownEnum
{
    Value_19 = 19,
    Value_23 = 23,
    Value_42 = 42
}
