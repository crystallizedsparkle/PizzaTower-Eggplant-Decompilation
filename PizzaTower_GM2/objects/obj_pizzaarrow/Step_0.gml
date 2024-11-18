var num, i, b;

old_x = x;
x += (image_xscale * 5);
num = collision_line_list(x, y, old_x, y, 322, false, true, global.instancelist, false);

if (num > 0)
{
    for (i = 0; i < num; i++)
    {
        b = ds_list_find_value(global.instancelist, i);
        scr_hurtplayer(b);
    }
}

ds_list_clear(global.instancelist);

if (scr_solid(x + image_xscale, y))
    instance_destroy();
