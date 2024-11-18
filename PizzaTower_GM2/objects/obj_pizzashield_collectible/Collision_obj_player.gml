if (other.state != UnknownEnum.Value_186)
{
    if (audio_is_playing(sfx_collecttopping))
        audio_stop_sound(sfx_collecttopping);
    
    scr_soundeffect(17);
    
    with (other)
        pizzashield = true;
    
    instance_destroy();
}

enum UnknownEnum
{
    Value_186 = 186
}
