function scr_ghostcollectible()
{
    var q, b;
    
    q = -4;
    b = id;
    
    with (obj_ghostcollectibles)
    {
        q = 
        {
            x: b.xstart,
            y: b.ystart,
            sprite_index: b.sprite_index,
            image_speed: b.image_speed,
            image_number: b.image_number,
            image_alpha: 0.5,
            image_index: 0
        };
        trace(q);
        ds_list_add(collectiblelist, q);
    }
    
    return q;
}
