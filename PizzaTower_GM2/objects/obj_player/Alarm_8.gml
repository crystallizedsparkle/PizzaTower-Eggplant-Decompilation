var ty;

if (state == states.hurt)
{
    state = states.normal;
    movespeed = 0;
    
    if (scr_solid(x, y))
    {
        ty = try_solid(0, 1, 312, 32);
        
        if (ty != -1)
            y += ty;
    }
}
else if (state == states.ratmounthurt)
{
    state = states.ratmount;
    movespeed = 0;
}

enum UnknownEnum
{
    Value_0,
    Value_107 = 107,
    Value_191 = 191,
    Value_196 = 196
}
