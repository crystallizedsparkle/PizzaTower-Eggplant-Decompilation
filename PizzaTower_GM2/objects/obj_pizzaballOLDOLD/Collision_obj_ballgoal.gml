if (vsp > 0)
{
    instance_destroy();
    instance_destroy(obj_pizzaballblock);
    obj_player.state = UnknownEnum.Value_84;
    
    if (obj_player.character == "P")
        obj_player.sprite_index = spr_player_levelcomplete;
    else
        obj_player.sprite_index = spr_playerN_victory;
    
    obj_player.image_index = 0;
}

enum UnknownEnum
{
    Value_84 = 84
}
