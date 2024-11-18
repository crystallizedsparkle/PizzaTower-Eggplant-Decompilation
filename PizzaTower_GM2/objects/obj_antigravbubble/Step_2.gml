x = playerid.x;
y = playerid.y;
mask_index = playerid.mask_index;
xs = Approach(xs, 1, 0.12);
image_xscale = xs;
image_yscale = xs;

if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
    visible = false;
else
    visible = playerid.visible;

if (playerid.state != UnknownEnum.Value_265 && playerid.state != UnknownEnum.Value_61 && (playerid.state != UnknownEnum.Value_84 || playerid.tauntstoredstate != UnknownEnum.Value_265))
    instance_destroy();

enum UnknownEnum
{
    Value_61 = 61,
    Value_84 = 84,
    Value_265 = 265
}
