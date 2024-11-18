var p;

prevpillar_on_camera = pillar_on_camera;

if (instance_exists(obj_hungrypillar))
{
    p = false;
    
    with (obj_hungrypillar)
    {
        if (bbox_in_camera(view_camera[0], 0))
            p = true;
    }
    
    if (p != pillar_on_camera)
        pillar_on_camera = p;
}
else
{
    pillar_on_camera = false;
}

if (prevpillar_on_camera != pillar_on_camera)
{
    if (pillar_on_camera)
    {
        audio_sound_gain(pillarmusicID, 0.6 * global.option_music_volume, 2000);
        audio_sound_gain(musicID, 0, 2000);
    }
    else
    {
        audio_sound_gain(pillarmusicID, 0, 2000);
        audio_sound_gain(musicID, 0.6 * global.option_music_volume, 2000);
    }
}

if (global.panic)
{
    if (music != 105 && music != 2)
    {
        music = 105;
        audio_stop_sound(musicID);
        musicID = scr_music(music);
        
        if (pillarmusicID != -4)
            audio_stop_sound(pillarmusicID);
        
        pillarmusicID = -4;
    }
}
