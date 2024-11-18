function cutscene_instance_create(argument0, argument1, argument2, argument3)
{
    var _obj, xx, yy, _xscale;
    
    _obj = argument0;
    xx = argument1;
    yy = argument2;
    _xscale = argument3;
    
    with (instance_create(xx, yy, _obj))
    {
        depth = other.depth;
        image_xscale = _xscale;
        xscale = _xscale;
    }
    
    cutscene_end_action();
}
