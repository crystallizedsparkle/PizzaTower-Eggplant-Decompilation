var dis, b;

with (obj_player)
{
    dis = abs(x - other.x);
    
    if (!instance_exists(obj_dialogcontroller))
    {
        if (!other.warned)
        {
            if (dis < 300)
            {
                with (other)
                {
                    dialog[0] = dialog_create("Not one step closer!", -4, vigilante_add_battle);
                    do_dialog(dialog);
                    dialog = -4;
                    warned = true;
                }
            }
        }
        else if (dis < 200)
        {
            if (state == UnknownEnum.Value_17)
            {
                with (possessID)
                {
                    state = UnknownEnum.Value_138;
                    stunned = 50;
                }
                
                state = UnknownEnum.Value_0;
            }
            
            with (other)
            {
                scr_hurtplayer(other);
                waitforhurt = true;
            }
        }
    }
}

if (waitforhurt && !instance_exists(obj_dialogcontroller))
{
    b = false;
    
    with (obj_player)
    {
        if (state == UnknownEnum.Value_107)
            b = true;
    }
    
    if (!b)
    {
        waitforhurt = false;
        dialog[0] = dialog_create("You gotta fight me!", -4, vigilante_add_battle);
        do_dialog(dialog);
        dialog = -4;
        warned = true;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_17 = 17,
    Value_107 = 107,
    Value_138 = 138
}
