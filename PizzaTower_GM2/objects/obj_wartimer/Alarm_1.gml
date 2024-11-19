if (room != rank_room)
{
    instance_destroy(obj_fadeout);
    
    with (obj_player)
    {
        targetDoor = "A";
        room = timesuproom;
        state = states.timesup;
        sprite_index = spr_Timesup;
        image_index = 0;
        audio_stop_all();
        scr_soundeffect(120);
    }
    
    instance_create(0, 0, obj_timesupwar);
    instance_destroy();
}

enum UnknownEnum
{
    Value_64 = 64
}
