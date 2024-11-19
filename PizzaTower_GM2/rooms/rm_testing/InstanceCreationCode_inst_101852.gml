func = function(argument0)
{
    if (!active && argument0.state == states.handstandjump)
    {
        active = true;
        obj_secretmanager.hittriggers++;
        
        with (argument0)
            scr_pummel();
    }
};

enum UnknownEnum
{
    Value_42 = 42
}
