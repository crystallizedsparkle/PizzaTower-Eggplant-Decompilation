with (instance_create(x, y, obj_afterimage))
{
    sprite_index = other.sprite_index;
    image_xscale = other.image_xscale;
}

flash = true;

if (charge)
    alarm[1] = 10;
