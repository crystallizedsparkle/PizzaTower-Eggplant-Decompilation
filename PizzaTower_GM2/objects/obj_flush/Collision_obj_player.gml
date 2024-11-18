var _found;

if (state == UnknownEnum.Value_223)
{
    state = UnknownEnum.Value_224;
    image_index = 0;
    
    switch (type)
    {
        case 0:
            sprite_index = spr_flush_pizzatransition;
            break;
        
        case 1:
            sprite_index = spr_flush_skulltransition;
            break;
        
        case 2:
            sprite_index = spr_flush_rattransition;
            break;
    }
    
    _found = false;
    
    with (obj_flush)
    {
        if (state == UnknownEnum.Value_223 && trigger == other.trigger)
            _found = true;
    }
    
    if (!_found)
    {
        with (obj_flush)
        {
            if (trigger == other.trigger)
                instance_destroy();
        }
    }
}

enum UnknownEnum
{
    Value_223 = 223,
    Value_224
}
