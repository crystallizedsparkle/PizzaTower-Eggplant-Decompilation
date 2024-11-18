function scr_player_cheesepep()
{
    var _railinst;
    
    key_particles = false;
    mach2 = 0;
    momemtum = false;
    alarm[5] = 2;
    alarm[7] = 60;
    move = key_left + key_right;
    
    if (!place_meeting(x, y + 1, obj_railparent))
    {
        hsp = xscale * movespeed;
    }
    else
    {
        _railinst = instance_place(x, y + 1, obj_railparent);
        hsp = (xscale * movespeed) + (_railinst.movespeed * _railinst.dir);
    }
    
    if (key_jump)
        input_buffer_jump = 0;
    
    if (grounded && move != 0 && sprite_index == spr_cheesepepidle)
        sprite_index = spr_cheesepepwalk;
    else if (grounded && move == 0 && sprite_index == spr_cheesepepwalk)
        sprite_index = spr_cheesepepidle;
    
    if (move != 0 && sprite_index != spr_cheesepepjumpstart)
    {
        xscale = move;
        movespeed = Approach(movespeed, 3, 0.5);
    }
    else
    {
        movespeed = Approach(movespeed, 0, 0.25);
    }
    
    image_speed = 0.35;
    
    if ((grounded && (floor(image_index) % 4) == 0) && hsp != 0)
        create_debris(x, y + 43, 1136);
    
    if (!grounded)
    {
        state = UnknownEnum.Value_26;
        sprite_index = spr_cheesepepfall;
        jumpstop = true;
        movespeed = xscale * movespeed;
    }
    
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_cheesepepland || sprite_index == spr_cheesepepintro)
        {
            if (move != 0)
                sprite_index = spr_cheesepepwalk;
            else
                sprite_index = spr_cheesepepidle;
        }
    }
    
    if (input_buffer_jump < 8 && sprite_index != spr_cheesepepjumpstart && sprite_index != spr_cheesepepland)
    {
        image_index = 0;
        sprite_index = spr_cheesepepjumpstart;
    }
    
    if (sprite_index == spr_cheesepepjumpstart && floor(image_index) == (image_number - 1))
    {
        vsp = -11;
        image_index = 0;
        sprite_index = spr_cheesepepjump;
        state = UnknownEnum.Value_26;
    }
}

enum UnknownEnum
{
    Value_26 = 26
}