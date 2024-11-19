if (!playerid.state == states.mach3 && !playerid.state == states.mach2)
    instance_destroy();

visible = playerid.visible;

if (playerid.state == states.mach2)
    image_alpha = playerid.movespeed / 16;

enum UnknownEnum
{
    Value_104 = 104,
    Value_121 = 121
}
