function cutscene_move_actor(_object_index, _x, _y, _interp)
{
    var _obj = _object_index;
    var xx = _x;
    var yy = _y;
    var interp = _interp;
    var finish = false;
    
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
