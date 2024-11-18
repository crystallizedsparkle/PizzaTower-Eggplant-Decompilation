var num, i, b;

if (ds_list_find_index(global.saveroom, id) != -1)
{
    instance_destroy();
}
else
{
    num = instance_place_list(x, y, 407, global.instancelist, false);
    
    for (i = 0; i < num; i++)
    {
        b = ds_list_find_value(global.instancelist, i);
        
        with (b)
        {
            secretjumped = false;
            savedsecretinvincible = invincible;
            state = UnknownEnum.Value_266;
        }
    }
    
    ds_list_clear(global.instancelist);
}

enum UnknownEnum
{
    Value_266 = 266
}
