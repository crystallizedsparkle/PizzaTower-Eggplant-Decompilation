if (drop == false)
{
    scr_soundeffect(22);
    instance_create(x, y, obj_stompeffect);
    other.image_index = 0;
    other.state = UnknownEnum.Value_59;
    other.sprite_index = other.spr_stunned;
    vsp = -5;
    hsp = 3;
    
    with (obj_camera)
    {
        shake_mag = 10;
        shake_mag_acc = 30 / room_speed;
    }
    
    drop = true;
}

enum UnknownEnum
{
    Value_59 = 59
}
