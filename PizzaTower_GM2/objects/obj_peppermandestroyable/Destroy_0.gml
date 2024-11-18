var lay_id, map_id, data;

if (ds_list_find_index(global.saveroom, id) == -1)
{
    instance_create(x + 16, y, obj_debris);
    instance_create(x + 16, y, obj_debris);
    instance_create(x + 16, y, obj_debris);
    instance_create(x + 16, y, obj_debris);
    scr_soundeffect(15, 16);
    ds_list_add(global.saveroom, id);
    lay_id = layer_get_id("Tiles_1");
    map_id = layer_tilemap_get_id(lay_id);
    data = tilemap_get_at_pixel(map_id, x, y);
    data = tile_set_empty(data);
    tilemap_set_at_pixel(map_id, data, x, y);
}
