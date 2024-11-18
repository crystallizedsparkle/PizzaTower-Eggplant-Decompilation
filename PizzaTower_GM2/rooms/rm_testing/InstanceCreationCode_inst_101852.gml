func = function(argument0)
{
    if (!active && argument0.state == UnknownEnum.Value_42)
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
