function scr_player_pizzathrow()
{
    movespeed = 0;
    mach2 = 0;
    hsp = 0;
    xscale = -1;
    jumpstop = false;
    
    if (!global.shroomfollow && !global.cheesefollow && !global.tomatofollow && !global.sausagefollow && !global.pineapplefollow)
    {
        state = states.normal;
        landAnim = false;
        mach2 = 0;
        image_index = 0;
    }
}

