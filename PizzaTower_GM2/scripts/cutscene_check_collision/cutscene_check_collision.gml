function cutscene_check_collision(_object, _object_to_collide)
{
    var obj1 = _object;
    var obj2 = _object_to_collide;
    var finish = false;
    
    with (obj1)
    {
        if (place_meeting(x, y, obj2))
            finish = true;
    }
    
    if (finish)
        cutscene_end_action();
}
