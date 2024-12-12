func = function(arg0)
{
    if (!active && arg0.state == UnknownEnum.Value_42)
    {
        active = true;
        obj_secretmanager.hittriggers++;
        
        with (arg0)
            scr_pummel();
    }
};
