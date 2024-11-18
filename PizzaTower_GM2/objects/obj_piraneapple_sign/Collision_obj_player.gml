var _sign_id;

if (!active)
{
    _sign_id = id;
    
    with (obj_piraneapple_spawn)
    {
        if (trigger == other.trigger)
        {
            with (instance_create(x, y, obj_piraneapple))
            {
                state = UnknownEnum.Value_8;
                sign_id = _sign_id;
            }
        }
    }
    
    active = true;
}

enum UnknownEnum
{
    Value_8 = 8
}
