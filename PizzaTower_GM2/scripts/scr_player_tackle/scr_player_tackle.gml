function scr_player_tackle()
{
    combo = 0;
    mach2 = 0;
    hsp = -xscale * movespeed;
    start_running = true;
    jumpAnim = true;
    dashAnim = true;
    landAnim = false;
    moveAnim = true;
    stopAnim = true;
    crouchslideAnim = true;
    crouchAnim = true;
    
    if (sprite_index != spr_golfswing)
    {
        if (grounded && vsp > 0.5)
            state = UnknownEnum.Value_0;
    }
    else if (floor(image_index) == (image_number - 1))
    {
        state = UnknownEnum.Value_0;
    }
    
    if (floor(image_index) != (image_number - 1))
        image_speed = 0.35;
    else
        image_speed = 0;
}

enum UnknownEnum
{
    Value_0
}
