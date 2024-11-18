var _transfo, p, val, i;

_transfo = false;

with (other)
{
    if (!scr_transformationcheck())
    {
        if (state == UnknownEnum.Value_11 || state == UnknownEnum.Value_12 || state == UnknownEnum.Value_14 || state == UnknownEnum.Value_12 || state == UnknownEnum.Value_33 || state == UnknownEnum.Value_35 || state == UnknownEnum.Value_34)
        {
            if (hsp != 0)
                xscale = sign(hsp);
            
            movespeed = abs(hsp);
        }
        
        state = UnknownEnum.Value_0;
        dir = xscale;
        _transfo = true;
        create_particle(x, y, UnknownEnum.Value_9);
    }
}

if (_transfo)
{
    p = other.id;
    
    with (instance_create(other.x - 540, camera_get_view_y(view_camera[0]) - 100, obj_priestangel))
    {
        priestID = other.id;
        playerid = p;
    }
    
    if (sprite_index != spr_angelpriest)
        sprite_index = spr_priest_pray;
    
    if (collect && ds_list_find_index(global.saveroom, id) == -1)
    {
        ds_list_add(global.saveroom, id);
        val = 500;
        global.collect += val;
        global.combotime = 60;
        
        with (instance_create(x + 16, y, obj_smallnumber))
            number = string(val);
        
        scr_soundeffect(17);
        i = 0;
        
        while (i < val)
        {
            create_collect(other.x + irandom_range(-60, 60), other.y + irandom_range(-60, 60), choose(1559, 1561, 1562, 1563, 1560));
            i += round(val / 16);
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_9 = 9,
    Value_11 = 11,
    Value_12,
    Value_14 = 14,
    Value_33 = 33,
    Value_34,
    Value_35
}
