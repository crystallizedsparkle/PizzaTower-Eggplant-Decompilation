function scr_destroy_tiles(argument0, argument1, argument2 = 0)
{
    var lay_id, map_id, w, h, ix, iy, yy, xx;
    
    lay_id = layer_get_id(argument1);
    
    if (lay_id != -1)
    {
        map_id = layer_tilemap_get_id(lay_id);
        w = abs(sprite_width) / argument0;
        h = abs(sprite_height) / argument0;
        ix = sign(image_xscale);
        iy = sign(image_yscale);
        
        if (ix < 0)
            w++;
        
        yy = 0 - argument2;
        
        while (yy < (h + argument2))
        {
            xx = 0 - argument2;
            
            while (xx < (w + argument2))
            {
                scr_destroy_tile(x + (xx * argument0 * ix), y + (yy * argument0 * iy), map_id);
                xx++;
            }
            
            yy++;
        }
    }
}

function scr_destroy_tile(argument0, argument1, argument2)
{
    var data;
    
    data = tilemap_get_at_pixel(argument2, argument0, argument1);
    data = tile_set_empty(data);
    tilemap_set_at_pixel(argument2, data, argument0, argument1);
}

function scr_solid_line(argument0)
{
    if (collision_line(x, y, argument0.x, argument0.y, obj_solid, false, true) != -4)
        return true;
    
    if (collision_line(x, y, argument0.x, argument0.y, obj_slope, false, true) != -4)
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
