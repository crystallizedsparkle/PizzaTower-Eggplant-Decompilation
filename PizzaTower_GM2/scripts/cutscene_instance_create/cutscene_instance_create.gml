function cutscene_instance_create(_object_index, _x, _y, _image_xscale)
{
    var _obj = _object_index;
    var xx = _x;
    var yy = _y;
    var _xscale = _image_xscale;
    
    with (instance_create(xx, yy, _obj))
    {
        depth = other.depth;
        image_xscale = _xscale;
        xscale = _xscale;
    }
    
    cutscene_end_action();
}
