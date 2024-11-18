if (instance_exists(player) && player.state != UnknownEnum.Value_84 && player.sprite_index != player.spr_taunt)
    instance_destroy();

x = player.x;
y = player.y;
image_xscale = player.xscale;

enum UnknownEnum
{
    Value_84 = 84
}
