function scr_destroy_tiles(_tile_size, _tile_layer, _spread = 0)
{
    var lay_id = layer_get_id(_tile_layer);
    
    if (lay_id != -1)
    {
        var map_id = layer_tilemap_get_id(lay_id);
        var w = abs(sprite_width) / _tile_size;
        var h = abs(sprite_height) / _tile_size;
        var ix = sign(image_xscale);
        var iy = sign(image_yscale);
        
        if (ix < 0)
            w++;
        
        var yy = 0 - _spread;
        
        while (yy < (h + _spread))
        {
            var xx = 0 - _spread;
            
            while (xx < (w + _spread))
            {
                scr_destroy_tile(x + (xx * _tile_size * ix), y + (yy * _tile_size * iy), map_id);
                xx++;
            }
            
            yy++;
        }
    }
}

function scr_destroy_tile(_x, _y, _tilemap)
{
    var data = tilemap_get_at_pixel(_tilemap, _x, _y);
    data = tile_set_empty(data);
    tilemap_set_at_pixel(_tilemap, data, _x, _y);
}

function scr_solid_line(_obj)
{
    if (collision_line(x, y, _obj.x, _obj.y, obj_solid, false, true) != noone)
        return true;
    
    if (collision_line(x, y, _obj.x, _obj.y, obj_slope, false, true) != noone)
        return true;
    
    return false;
}

function scr_destroy_nearby_tiles()
{
    instance_destroy(instance_place(x + 1, y, obj_tiledestroy));
    instance_destroy(instance_place(x - 1, y, obj_tiledestroy));
    instance_destroy(instance_place(x, y + 1, obj_tiledestroy));
    instance_destroy(instance_place(x, y - 1, obj_tiledestroy));
}
