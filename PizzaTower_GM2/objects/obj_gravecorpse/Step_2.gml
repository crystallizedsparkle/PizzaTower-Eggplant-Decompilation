image_index = playerid.image_index;
image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;
visible = playerid.visible;

if (playerid.sprite_index == spr_player_corpsesurf)
    sprite_index = spr_corpsesurf;

if (playerid.sprite_index == spr_player_corpsestart)
    sprite_index = spr_corpsestart;

if (playerid.state != UnknownEnum.Value_211 && playerid.state != UnknownEnum.Value_61)
    instance_destroy();

enum UnknownEnum
{
    Value_61 = 61,
    Value_211 = 211
}
