image_speed = 0.35;
image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;

if (global.stylethreshold < 2 || playerid.state != UnknownEnum.Value_0)
    instance_destroy();

enum UnknownEnum
{
    Value_0
}
