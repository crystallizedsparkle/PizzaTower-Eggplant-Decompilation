if (obj_player.state != UnknownEnum.Value_39 && global.panic == true)
{
    obj_player.hsp = 0;
    sprite_index = spr_pizzaportalend;
    image_index = 0;
    obj_player.state = UnknownEnum.Value_39;
    obj_player.grav = 0;
    obj_player.visible = false;
}

enum UnknownEnum
{
    Value_39 = 39
}