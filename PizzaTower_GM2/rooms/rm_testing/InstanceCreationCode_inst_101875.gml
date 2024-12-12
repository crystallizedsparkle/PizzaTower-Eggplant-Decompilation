func = function(arg0)
{
    if (!active && arg0.state == UnknownEnum.Value_84)
    {
        active = true;
        obj_secretmanager.totems++;
    }
};

stepfunc = function()
{
    if (active)
    {
        with (instance_place(x, y, obj_totem))
            sprite_index = spr_totemcheese_pep;
    }
};

visible = false;
