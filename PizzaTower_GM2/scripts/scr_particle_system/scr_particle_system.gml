function declare_particle(_particle_index, _particle_sprite, _particle_speed, _particle_depth)
{
    ds_map_set(global.part_map, _particle_index, part_type_create());
    ds_map_set(global.part_depth, _particle_index, _particle_depth);
    var p = ds_map_find_value(global.part_map, _particle_index);
    part_type_sprite(p, _particle_sprite, true, true, false);
    var t = sprite_get_number(_particle_sprite);
    var s = _particle_speed;
    var spd = t / s;
    part_type_life(p, spd, spd);
    return p;
}

function particle_set_scale(_particle_index, _xscale, _yscale)
{
    part_type_scale(ds_map_find_value(global.part_map, _particle_index), _xscale, _yscale);
}

function create_debris(_x, _y, _sprite, _is_animated = false)
{
    var q = 
    {
        x: _x,
        y: _y,
        sprite_index: _sprite,
        image_number: sprite_get_number(_sprite),
        image_index: irandom(image_number - 1),
        image_angle: random_range(1, 270),
        image_speed: 0.35,
        sprw: sprite_get_width(_sprite),
        sprh: sprite_get_height(_sprite),
        hsp: random_range(-4, 4),
        vsp: random_range(-4, 0),
        alpha: 1,
        grav: 0.4,
        type: debris.default_type,
        animated: _is_animated,
        destroyonanimation: false
    };
    ds_list_add(global.debris_list, q);
    return q;
}

function create_heatpuff(_x, _y)
{
    var q = create_debris(_x, _y, spr_heatpuff, true);
    q.grav = 0;
    q.hsp = 0;
    q.vsp = irandom_range(-4, -1);
    q.destroyonanimation = true;
    return q;
}

function create_collect(_x, _y, _sprite)
{   
    _x -= camera_get_view_x(view_camera[0]);
    _y -= camera_get_view_y(view_camera[0]);
    var q = 
    {
        x: _x,
        y: _y,
        sprite_index: _sprite,
        image_index: 0,
        image_number: sprite_get_number(_sprite),
        hsp: 0,
        vsp: 0
    };
    ds_list_add(global.collect_list, q);
    return q;
}

function create_particle(_x, _y, _particle_index, _size = 0)
{
    // this is NOT a decompilation error
    if (_size == undefined)
        _size = 0;
    
    var _depth = ds_map_find_value(global.part_depth, _particle_index);
    
    if (is_undefined(_depth))
        _depth = object_get_depth(object_index);
    
    part_system_depth(global.particle_system, _depth);
    part_emitter_region(global.particle_system, global.part_emitter, _x - _size, _x + _size, _y - _size, _y + _size, 0, 0);
    part_emitter_burst(global.particle_system, global.part_emitter, ds_map_find_value(global.part_map, _particle_index), 1);
}

