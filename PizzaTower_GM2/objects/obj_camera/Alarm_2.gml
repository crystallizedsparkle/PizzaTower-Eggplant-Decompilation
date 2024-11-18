if (global.timedgate == true)
{
    global.timedgate = false;
    global.seconds = 30;
    ded = false;
    alarm[2] = -1;
}

if (global.miniboss == true)
{
    with (obj_player)
    {
        instance_create(x, y, obj_bangeffect);
        
        repeat (6)
            instance_create(x, y, obj_slapstar);
        
        state = UnknownEnum.Value_7;
        vsp = -10;
        audio_stop_all();
        scr_soundeffect(120);
    }
    
    alarm[2] = -1;
    global.miniboss = false;
}

enum UnknownEnum
{
    Value_7 = 7
}
