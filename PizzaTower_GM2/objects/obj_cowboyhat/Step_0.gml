x = obj_player.x;
y = (sprite_get_bbox_top(obj_player.sprite_index) + obj_player.y) - 40;
image_xscale = obj_player.xscale;

if (obj_player.state == UnknownEnum.Value_38 || obj_player.state == UnknownEnum.Value_47 || room == rank_room)
    visible = false;
else if (global.cowboyhat == true)
    visible = true;
else
    visible = false;

enum UnknownEnum
{
    Value_38 = 38,
    Value_47 = 47
}
