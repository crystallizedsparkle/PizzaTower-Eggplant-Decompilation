var num, i, b, t;

x += hsp;
y += vsp;
num = collision_line_list(x, y, xprevious, yprevious, 380, false, true, global.instancelist, false);

if (num > 0)
{
    for (i = 0; i < num; i++)
    {
        b = ds_list_find_value(global.instancelist, i);
        t = false;
        
        with (b)
        {
            if (state == states.normal)
            {
                state = states.transitioncutscene;
                
                if (other.func(b, other.id))
                {
                    t = true;
                }
                else
                {
                    state = states.normal;
                    t = false;
                }
            }
        }
        
        if (t)
        {
            instance_destroy();
            break;
        }
    }
}

ds_list_clear(global.instancelist);

enum UnknownEnum
{
    Value_0,
    Value_8 = 8
}
