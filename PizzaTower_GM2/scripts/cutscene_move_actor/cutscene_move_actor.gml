function cutscene_move_actor(argument0, argument1, argument2, argument3)
{
    var _obj, xx, yy, interp, finish;
    
    _obj = argument0;
    xx = argument1;
    yy = argument2;
    interp = argument3;
    finish = false;
    
    with (_obj)
    {
        x = lerp(x, xx, interp);
        y = lerp(y, yy, interp);
        
        if (x > (xx - 6) && x < (xx + 6) && y > (yy - 6) && y < (yy + 6))
            finish = true;
    }
    
    if (finish)
        cutscene_end_action();
}
