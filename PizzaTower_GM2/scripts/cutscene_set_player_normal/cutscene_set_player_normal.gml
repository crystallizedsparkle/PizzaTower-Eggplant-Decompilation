function cutscene_set_player_normal()
{
    with (obj_player)
    {
        if (check_player_coop())
            state = UnknownEnum.Value_0;
    }
    
    cutscene_end_action();
}

enum UnknownEnum
{
    Value_0
}
