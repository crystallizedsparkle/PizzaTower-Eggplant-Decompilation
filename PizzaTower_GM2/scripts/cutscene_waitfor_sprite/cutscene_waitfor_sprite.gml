function cutscene_waitfor_sprite(argument0)
{
    var _obj, finish;
    
    _obj = argument0;
    finish = false;
    
    with (_obj)
    {
        if (image_index > (image_number - 1))
        {
            finish = true;
            image_index = image_number - 1;
        }
    }
    
    if (finish)
        cutscene_end_action();
}
