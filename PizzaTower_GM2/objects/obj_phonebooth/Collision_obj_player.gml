if (sprite_index == spr_phone)
{
    obj_player.hsp = 0;
    obj_player.movespeed = 0;
    obj_player.sprite_index = spr_player_phoneidle;
    obj_player.state = UnknownEnum.Value_84;
    sprite_index = spr_phonepicked;
}

enum UnknownEnum
{
    Value_84 = 84
}
