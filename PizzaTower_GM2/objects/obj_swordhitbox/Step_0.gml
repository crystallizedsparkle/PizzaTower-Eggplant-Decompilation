image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;

if (playerid.sprite_index != spr_knightpep_attack && playerid.state != UnknownEnum.Value_147 && playerid.state != UnknownEnum.Value_6)
    instance_destroy();

enum UnknownEnum
{
    Value_6 = 6,
    Value_147 = 147
}
