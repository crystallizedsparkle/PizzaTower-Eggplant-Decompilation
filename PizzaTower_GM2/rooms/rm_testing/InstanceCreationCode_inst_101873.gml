func = function(_inst)
{
    if (!active && _inst.state == states.backbreaker)
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
