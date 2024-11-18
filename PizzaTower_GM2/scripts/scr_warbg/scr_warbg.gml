function warbg_start()
{
    var time, size, strength;
    
    if (event_type == ev_draw && event_number == 0)
    {
        time = shader_get_uniform(shd_war, "time");
        size = shader_get_uniform(shd_war, "size");
        strength = shader_get_uniform(shd_war, "strength");
        shader_set(shd_war);
        shader_set_uniform_f(time, current_time / 1000);
        shader_set_uniform_f(size, 512, 512, Wave(0, 0.8, 8, 0));
        shader_set_uniform_f(strength, Wave(0, 0.2, 5, 0));
    }
}

function warbg_end()
{
    if (event_type == ev_draw && event_number == 0)
        shader_reset();
}

function warbg_init()
{
    var arr, i, _id;
    
    arr = ["Backgrounds_1", "Backgrounds_Ground1", "Backgrounds_still1"];
    
    for (i = 0; i < array_length(arr); i++)
    {
        _id = layer_get_id(arr[i]);
        
        if (_id != -1)
        {
            layer_script_begin(_id, warbg_start);
            layer_script_end(_id, warbg_end);
        }
    }
}
