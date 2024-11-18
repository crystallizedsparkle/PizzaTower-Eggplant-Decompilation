function scr_player_graffiti()
{
    hsp = 0;
    vsp = -grav;
    image_speed = 0.5;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = UnknownEnum.Value_0;
        
        if (tauntstoredisgustavo)
            state = UnknownEnum.Value_191;
        
        if (global.graffiticount >= global.graffitimax)
            instance_create(x, y, obj_key);
    }
}

enum UnknownEnum
{
    Value_0,
    Value_191 = 191
}
