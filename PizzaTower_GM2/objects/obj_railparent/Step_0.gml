var i, b, num, j, t;

for (i = 0; i < array_length(objectlist); i++)
{
    b = objectlist[i];
    num = instance_place_list(x, y - 1, b, global.instancelist, false);
    
    if (num > 0)
    {
        for (j = 0; j < ds_list_size(global.instancelist); j++)
        {
            t = ds_list_find_value(global.instancelist, j);
            
            with (t)
                hsp_carry = other.dir * other.movespeed;
        }
    }
    
    ds_list_clear(global.instancelist);
}

ds_list_clear(global.instancelist);
