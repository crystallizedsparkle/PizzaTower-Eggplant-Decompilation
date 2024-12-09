function cutscene_player_pos_lerp(_target_x, _target_y, _amount)
{
    var _finish = false;
    
    with (obj_player)
    {
        hsp = 0;
        vsp = 0;
        
        if (object_index != obj_player2 || global.coop)
        {
            x = lerp(x, _target_x, _amount);
            y = lerp(y, _target_y, _amount);
            
            if (x > (_target_x - 4) && x < (x + 4) && y > (_target_y - 4) && y < (_target_y + 4))
                _finish = true;
        }
    }
    
    if (_finish)
        cutscene_end_action();
}

