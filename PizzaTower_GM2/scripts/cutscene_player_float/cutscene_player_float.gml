function cutscene_player_float(_bool)
{
    with (obj_player)
        float = _bool;
    
    cutscene_end_action();
}
