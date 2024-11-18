var _player, _pizzaball;

if ((other.state == UnknownEnum.Value_42 || other.state == UnknownEnum.Value_43) && state != UnknownEnum.Value_148)
{
    _player = other.id;
    _pizzaball = id;
    
    with (_player)
    {
        if (scr_transformationcheck())
        {
            if (state != UnknownEnum.Value_148)
            {
                golfid = _pizzaball;
                image_speed = 0.35;
                image_index = 0;
                sprite_index = spr_golfidle;
                other.y = y;
                hsp = 0;
                movespeed = 0;
                slopespeed = 0;
                state = UnknownEnum.Value_148;
                _pizzaball.state = UnknownEnum.Value_148;
                _pizzaball.player = id;
                
                if (xscale > 0)
                    _pizzaball.m_angle = 0;
                else
                    _pizzaball.m_angle = 180;
                
                with (obj_camera)
                    targetgolf = _pizzaball;
            }
        }
    }
}

enum UnknownEnum
{
    Value_42 = 42,
    Value_43,
    Value_148 = 148
}
