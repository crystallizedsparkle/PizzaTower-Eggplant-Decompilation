if (!playerid.state == UnknownEnum.Value_121 && !playerid.state == UnknownEnum.Value_104)
    instance_destroy();

visible = playerid.visible;

if (playerid.state == UnknownEnum.Value_104)
    image_alpha = playerid.movespeed / 16;

enum UnknownEnum
{
    Value_104 = 104,
    Value_121 = 121
}
