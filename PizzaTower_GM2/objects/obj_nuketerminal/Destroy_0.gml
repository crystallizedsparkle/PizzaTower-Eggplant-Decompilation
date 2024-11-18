var i;

if (ds_list_find_index(global.saveroom, id) == -1)
{
    instance_create_unique(0, 0, 251);
    
    with (obj_wartimer)
    {
        for (addseconds += other.seconds; other.minutes > 0; addseconds += 60)
            other.minutes--;
        
        alarm[0] = -1;
        alarm[2] = 1;
    }
    
    for (i = 0; i < sprite_get_number(spr_warterminal_debris); i++)
    {
        with (create_debris(x, y, 2236))
            image_index = i;
    }
    
    tile_layer_delete_at(1, x, y);
    tile_layer_delete_at(1, x + 32, y);
    tile_layer_delete_at(1, x + 32, y + 32);
    tile_layer_delete_at(1, x, y + 32);
    
    if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2))
    {
        audio_stop_sound(sfx_breakblock1);
        audio_stop_sound(sfx_breakblock2);
    }
    
    scr_soundeffect(15, 16);
    ds_list_add(global.saveroom, id);
}
