var _destroyed = false;

if (ds_list_find_index(global.baddieroom, id) != -1)
{
    _destroyed = true;
    instance_destroy();
}

if (escape && !_destroyed)
{
    var b = false;
    
    with (obj_escapespawn)
    {
        if (baddieID == other.id && state != 0)
            b = true;
    }
    
    if (!b)
    {
        instance_deactivate_object(id);
        
        with (instance_create(x, y, obj_escapespawn))
            baddieID = other.id;
    }
}

if (elite)
{
    hp += 1;
    elitehp = hp;
}
