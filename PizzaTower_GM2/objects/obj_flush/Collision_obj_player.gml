if (state == states.flush_idle)
{
    state = states.flush_transition;
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
    
    var _found = false;
    
    with (obj_flush)
    {
        if (state == states.flush_idle && trigger == other.trigger)
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

