function scr_player_ratmountpunch()
{
    image_speed = 0.5;
    hsp = movespeed;
    move = key_left + key_right;
    landAnim = false;
    sprite_index = spr_lonegustavo_punch;
    
    if (move != 0)
    {
        dir = move;
        movespeed = Approach(movespeed, move * ratmount_movespeed, 0.5);
    }
    else
    {
        movespeed = Approach(movespeed, 0, 0.5);
    }
    
    ratmountpunchtimer--;
    
    if (ratmountpunchtimer < 0)
    {
        state = UnknownEnum.Value_191;
        
        if (hsp != 0)
        {
            dir = sign(hsp);
            xscale = dir;
        }
    }
    
    if (punch_afterimage > 0)
    {
        punch_afterimage--;
    }
    else
    {
        punch_afterimage = 5;
        create_blue_afterimage(x, y, sprite_index, image_index, xscale);
    }
}

enum UnknownEnum
{
    Value_191 = 191
}