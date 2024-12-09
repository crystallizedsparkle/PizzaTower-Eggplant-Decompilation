function cutscene_set_sprite(_object_index, _sprite_index, _image_speed, _image_xscale)
{
    var _obj = _object_index;
    var _spr = _sprite_index;
    var _spd = _image_speed;
    var _xscale = _image_xscale;
    
    with (_obj)
    {
        sprite_index = _spr;
        image_speed = _spd;
        image_xscale = _xscale;
        image_index = 0;
        xscale = _xscale;
    }
    
    cutscene_end_action();
}
