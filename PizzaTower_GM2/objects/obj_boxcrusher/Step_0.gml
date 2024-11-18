if (y == ystart && obj_player.boxxed == false && obj_player.state != UnknownEnum.Value_33 && obj_player.state != UnknownEnum.Value_34 && obj_player.state != UnknownEnum.Value_35 && (obj_player.x > (x - 50) && obj_player.x < (x + 50)) && (obj_player.y > y && obj_player.y < (y + 200)))
{
    vsp = 10;
    sprite_index = spr_boxcrusher_fall;
}

if (sprite_index == spr_boxcrusher_fall && grounded)
{
    with (obj_camera)
    {
        shake_mag = 10;
        shake_mag_acc = 30 / room_speed;
    }
    
    vsp = 0;
    image_index = 0;
    sprite_index = spr_boxcrusher_land;
}

if (sprite_index == spr_boxcrusher_land && floor(image_index) == (image_number - 1))
{
    sprite_index = spr_boxcrusher_idle;
    gobackup = true;
}

if (gobackup == true)
    y = Approach(y, ystart, 2);

if (y == ystart)
    gobackup = false;

scr_collide();

enum UnknownEnum
{
    Value_33 = 33,
    Value_34,
    Value_35
}