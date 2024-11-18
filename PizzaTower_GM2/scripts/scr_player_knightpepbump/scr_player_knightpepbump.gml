function scr_player_knightpepbump()
{
    alarm[5] = 2;
    alarm[7] = 60;
    hsp = -xscale * movespeed;
    
    if (grounded && vsp > 0)
    {
        state = UnknownEnum.Value_47;
        sprite_index = spr_knightpepland;
        image_index = 0;
        scr_soundeffect(27);
        create_particle(x, y, UnknownEnum.Value_12, 0);
        
        if (hurted)
            hurted = false;
    }
    
    if (floor(image_index) == (image_number - 1))
        image_index = image_number - 1;
}

enum UnknownEnum
{
    Value_12 = 12,
    Value_47 = 47
}
