if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id);
    
    if (audio_is_playing(sfx_collecttopping))
        audio_stop_sound(sfx_collecttopping);
    
    scr_soundeffect(17);
    global.heattime += 10;
    global.heattime = clamp(global.heattime, 0, 60);
    
    with (obj_camera)
        healthshaketime = 30;
    
    global.collect += 50;
    
    with (instance_create(x, y, obj_smallnumber))
        number = string(50);
    
    create_particle(x, y, particles.genericpoofeffect, 0);
}

enum UnknownEnum
{
    Value_9 = 9
}
