if (floor(image_index) == (image_number - 1) && obj_player.state != UnknownEnum.Value_112)
{
    with (obj_player)
    {
        state = UnknownEnum.Value_112;
        image_index = 0;
    }
    
    alarm[0] = 200;
}

if (floor(image_index) == (image_number - 1))
    image_speed = 0;

enum UnknownEnum
{
    Value_112 = 112
}
