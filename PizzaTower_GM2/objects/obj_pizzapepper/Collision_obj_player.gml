if (visible == true)
{
    if (audio_is_playing(sfx_collecttopping))
        audio_stop_sound(sfx_collecttopping);
    
    scr_soundeffect(17);
    visible = false;
    
    repeat (6)
        instance_create(x, y, obj_slimedebris);
    
    with (other)
    {
        vsp = -14;
        state = UnknownEnum.Value_254;
        sprite_index = spr_player_jetpackstart;
        doublejump = false;
        
        with (instance_create(x, y, obj_highjumpcloud2))
            sprite_index = spr_player_firemouthjumpdust;
    }
    
    timetovisible = 100;
}

enum UnknownEnum
{
    Value_254 = 254
}
