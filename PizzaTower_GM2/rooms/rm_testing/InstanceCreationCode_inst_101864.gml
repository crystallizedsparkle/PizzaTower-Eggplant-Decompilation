func = function(_inst)
{
    if (!active && _inst.state == states.handstandjump)
    {
        active = true;
        obj_secretmanager.hittriggers++;
        
        with (_inst)
            scr_pummel();
    }
};
