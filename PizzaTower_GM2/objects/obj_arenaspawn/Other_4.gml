if (ds_list_find_index(global.saveroom, id) != -1)
{
    instance_destroy();
    state = UnknownEnum.Value_98;
}
else
{
    with (obj_baddie)
    {
        if (arena)
        {
            ds_list_add(other.baddielist, [wave, id]);
            
            if (wave > other.maxwave)
                other.maxwave = wave;
            
            maxhp = hp;
            instance_deactivate_object(id);
        }
    }
    
    with (obj_arenadoor)
    {
        if (objectlist != -4 && (array_length(objectlist) - 1) > other.maxwave)
            other.maxwave = array_length(objectlist) - 1;
    }
}

enum UnknownEnum
{
    Value_98 = 98
}
