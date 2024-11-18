if (room == rm_editor)
    exit;

if (obj_player.state == UnknownEnum.Value_47 || (obj_player.state == UnknownEnum.Value_61 && (obj_player.tauntstoredstate == UnknownEnum.Value_47 || obj_player.tauntstoredstate == UnknownEnum.Value_38)) || obj_player.state == UnknownEnum.Value_48 || obj_player.state == UnknownEnum.Value_38 || obj_player.state == UnknownEnum.Value_49)
    sprite_index = spr_swordstonetaken;
else
    sprite_index = spr_swordstone;

if (sprite_index == spr_swordstone && !instance_exists(ID))
{
    with (instance_create(x, y - 20, obj_grabmarker))
        other.ID = id;
}
else if (sprite_index == spr_swordstonetaken && instance_exists(ID))
{
    instance_destroy(ID);
}

enum UnknownEnum
{
    Value_38 = 38,
    Value_47 = 47,
    Value_48,
    Value_49,
    Value_61 = 61
}
