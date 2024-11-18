function cutscene_player_check_ground(argument0)
{
    var player, finish;
    
    player = argument0;
    finish = false;
    
    with (player)
    {
        if (grounded)
            finish = true;
    }
    
    if (finish)
        cutscene_end_action();
}
