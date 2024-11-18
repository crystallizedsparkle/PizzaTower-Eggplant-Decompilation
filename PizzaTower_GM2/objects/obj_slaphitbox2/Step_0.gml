image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;

if (playerid.image_index > 3 || playerid.state != UnknownEnum.Value_23)
    instance_destroy();

enum UnknownEnum
{
    Value_23 = 23
}
