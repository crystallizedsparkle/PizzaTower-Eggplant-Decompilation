if (!horseyfinish && start)
{
    with (obj_horsey)
    {
        spd = 0;
        hsp = 0;
        vsp = 0;
        state = UnknownEnum.Value_89;
        
        with (obj_objecticontracker)
        {
            if (objectID == other.id)
                instance_destroy();
        }
    }
    
    with (obj_horseyright)
        used = true;
    
    with (obj_racestart)
        ds_list_add(global.saveroom, id);
    
    global.horse = false;
    instance_destroy(obj_horseyblock);
}

enum UnknownEnum
{
    Value_89 = 89
}
