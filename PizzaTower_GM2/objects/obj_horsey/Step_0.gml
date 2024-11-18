x += hsp;
y += vsp;

switch (state)
{
    case UnknownEnum.Value_0:
        image_speed = 0.35;
        sprite_index = spr_horsey;
        break;
    
    case UnknownEnum.Value_89:
        image_speed = 0.35;
        sprite_index = spr_horsey_lose;
        
        with (obj_objecticontracker)
        {
            if (objectID == other.id)
                instance_destroy();
        }
        
        break;
    
    case UnknownEnum.Value_6:
        image_speed = 0.1;
        sprite_index = spr_horsey_win;
        
        with (obj_objecticontracker)
        {
            if (objectID == other.id)
                instance_destroy();
        }
        
        break;
}

enum UnknownEnum
{
    Value_0,
    Value_6 = 6,
    Value_89 = 89
}
