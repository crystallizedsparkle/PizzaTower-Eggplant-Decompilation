function cutscene_image_index(_object, _image_index)
{
    var _obj = _object;
    var _index = _image_index;
    
    with (_obj)
        image_index = _index;
    
    cutscene_end_action();
}
