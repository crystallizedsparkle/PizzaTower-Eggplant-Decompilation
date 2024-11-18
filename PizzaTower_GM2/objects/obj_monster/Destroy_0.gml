if (destroy)
{
    repeat (3)
    {
        with (create_debris(x, y, 1141))
        {
            hsp = random_range(-5, 5);
            vsp = random_range(-10, 10);
        }
    }
    
    scr_soundeffect(23);
    instance_create(x, y, obj_bangeffect);
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
    
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.spr_dead;
}
