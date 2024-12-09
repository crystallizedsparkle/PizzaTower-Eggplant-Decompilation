function cutscene_set_player_visible(_bool)
{
    with (obj_player)
        visible = _bool;
    
    cutscene_end_action();
}
