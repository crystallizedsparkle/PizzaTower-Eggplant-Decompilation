if (floor(image_index) == 2 && canthrowbomb == true)
{
    with (instance_create(x + (image_xscale * 10), y - 20, obj_bomb))
    {
        hsp = other.image_xscale * 4;
        drop = true;
        vsp = -5;
    }
    
    canthrowbomb = false;
}

if (floor(image_index) == (image_number - 1) && canthrowbomb == false)
    image_speed = 0;
else
    image_speed = 0.35;

if (!instance_exists(obj_bomb) && obj_player.state != UnknownEnum.Value_51)
    canthrowbomb = true;
else
    canthrowbomb = false;

enum UnknownEnum
{
    Value_51 = 51
}