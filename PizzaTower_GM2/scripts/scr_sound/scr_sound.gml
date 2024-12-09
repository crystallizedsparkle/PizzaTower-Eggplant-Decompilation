function scr_sound()
{
    var snd = argument[irandom(argument_count - 1)];
    global.music = audio_play_sound(snd, 10, true);
    audio_sound_gain(global.music, 0.6 * global.option_music_volume, 0);
}

function scr_music(_snd)
{
    var m = audio_play_sound(_snd, 10, true);
    audio_sound_gain(m, audio_sound_get_gain(_snd) * 0.8 * global.option_music_volume, 0);
    return m;
}

function set_master_gain(_gain)
{
    var num = audio_get_listener_count();
    
    for (var i = 0; i < num; i++)
    {
        var info = audio_get_listener_info(i);
        audio_set_master_gain(ds_map_find_value(info, "index"), _gain);
        ds_map_destroy(info);
    }
}
