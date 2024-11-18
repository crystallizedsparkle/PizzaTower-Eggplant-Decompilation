with (instance_create(x, y, obj_sausageman_dead))
{
    scr_soundeffect(23);
    sprite_index = other.sprite_index;
    image_xscale = other.image_xscale;
}

instance_destroy();
