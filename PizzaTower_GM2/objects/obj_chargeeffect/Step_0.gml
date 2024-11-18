image_xscale = playerid.xscale;

if (playerid.state != UnknownEnum.Value_184 && playerid.state != UnknownEnum.Value_121 && playerid.state != UnknownEnum.Value_102 && playerid.state != UnknownEnum.Value_153)
    instance_destroy();

x = playerid.x + (((playerid.character == "M") ? 18 : 0) * playerid.xscale);
y = playerid.y - ((playerid.character == "M") ? 10 : 0);

if (playerid.state == UnknownEnum.Value_184)
    x = playerid.x + (playerid.xscale * 18);

visible = !(room == rank_room);

if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
    visible = false;

enum UnknownEnum
{
    Value_102 = 102,
    Value_121 = 121,
    Value_153 = 153,
    Value_184 = 184
}
