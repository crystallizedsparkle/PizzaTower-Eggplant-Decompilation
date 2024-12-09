function scr_soundeffect()
{
    var snd = argument[irandom(argument_count - 1)];
    var snd_id = audio_play_sound(snd, 1, false);
    audio_sound_gain(snd_id, audio_sound_get_gain(snd_id) * global.option_sfx_volume, 0);
}

function sfx_gain(_snd)
{
    audio_sound_gain(_snd, audio_sound_get_gain(_snd) * global.option_sfx_volume, 0);
}
