if (sprite_index == spr_gustavoswitch2 && floor(image_index) == (image_number - 1))
{
    with (obj_player1)
    {
        visible = true;
        create_particle(x, y, UnknownEnum.Value_9);
        ratmount_movespeed = 8;
        gustavodash = 0;
        isgustavo = true;
        state = UnknownEnum.Value_191;
        brick = true;
        x = obj_gustavoswitch.x;
        y = obj_gustavoswitch.y;
        global.switchbuffer = 100;
    }
    
    sprite_index = spr_pepsign;
}

enum UnknownEnum
{
    Value_9 = 9,
    Value_191 = 191
}