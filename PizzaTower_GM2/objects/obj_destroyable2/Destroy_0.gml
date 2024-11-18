var val;

if (room == rm_editor)
    exit;

if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == false)
{
    repeat (6)
    {
        with (create_debris(x + 16, y, sprite_index))
        {
            if (sprite_index == spr_destroyable2)
                sprite_index = spr_debris;
            else
                sprite_index = spr_halloweendebris;
        }
    }
    
    with (instance_create(x + 16, y + 16, obj_parryeffect))
        sprite_index = spr_pizzablockdead;
    
    scr_sleep(5);
    create_baddiegibsticks(x + 16, y + 16);
    
    if (audio_is_playing(sfx_collecttopping))
        audio_stop_sound(sfx_collecttopping);
    
    scr_soundeffect(17);
    global.heattime += 10;
    global.heattime = clamp(global.heattime, 0, 60);
    global.combotime += 10;
    global.combotime = clamp(global.combotime, 0, 60);
    val = heat_calculate(10);
    
    if (other.object_index == obj_player1)
        global.collect += val;
    else
        global.collectN += val;
    
    with (instance_create(x + 16, y, obj_smallnumber))
        number = string(val);
    
    tile_layer_delete_at(1, x, y);
    
    if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2))
    {
        audio_stop_sound(sfx_breakblock1);
        audio_stop_sound(sfx_breakblock2);
    }
    
    scr_soundeffect(15, 16);
    ds_list_add(global.saveroom, id);
}
