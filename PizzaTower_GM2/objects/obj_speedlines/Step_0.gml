x = playerid.x;
y = playerid.y;
image_xscale = playerid.xscale;

if (abs(playerid.hsp) <= 0 || playerid.movespeed < 16 || playerid.state == UnknownEnum.Value_95 || playerid.state == UnknownEnum.Value_112 || room == timesuproom)
    instance_destroy();

if (room == timesuproom)
    instance_destroy();

enum UnknownEnum
{
    Value_95 = 95,
    Value_112 = 112
}
