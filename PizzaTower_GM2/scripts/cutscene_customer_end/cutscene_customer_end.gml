function cutscene_customer_check(_gnome_id, _obj1, _obj2)
{
    with (obj_gnome_checklist)
        gnome_check[_gnome_id] = true;
    
    global.pizzasdelivered++;
    
    if (instance_exists(obj_gnomecustomerblock))
        instance_destroy(obj_gnomecustomerblock);
    
    with (instance_create(_obj1.x, _obj1.y, obj_pizzaboxunopen))
    {
        content = _obj2.content;
        depth = _obj1.depth;
        visible = false;
    }
    
    ds_list_add(global.saveroom, _obj2.id);
    cutscene_end_action();
}

function cutscene_customer_end(_arg)
{
    with (obj_customeractor)
        happy = true;
    
    cutscene_end_action();
}
