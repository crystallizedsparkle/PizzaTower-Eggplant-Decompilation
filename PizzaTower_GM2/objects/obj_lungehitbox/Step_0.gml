if (playerid.state != UnknownEnum.Value_43 && playerid.state != UnknownEnum.Value_42)
{
    instance_destroy();
    exit;
}

x = playerid.x + (24 * playerid.xscale);
y = playerid.y;

enum UnknownEnum
{
    Value_42 = 42,
    Value_43
}
