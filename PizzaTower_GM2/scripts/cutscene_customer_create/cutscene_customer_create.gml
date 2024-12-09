function cutscene_customer_create(_x, _y, _idle_sprite, _happy_sprite, sprite_xscale)
{
    var xx, yy, _idle, _happy, _xscale;
    
    var xx = _x;
    var yy = _y;
    var _idle = _idle_sprite;
    var _happy = _happy_sprite;
    var _xscale = sprite_xscale;
    
    with (instance_create(xx, yy, obj_customeractor))
    {
        image_xscale = _xscale;
        depth = other.depth - 1;
        sprite_index = _idle;
        spr_idle = _idle;
        spr_happy = _happy;
    }
    
    cutscene_end_action();
}
