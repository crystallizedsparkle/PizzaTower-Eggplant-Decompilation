function scr_player_pizzathrow()
{
    movespeed = 0;
    mach2 = 0;
    hsp = 0;
    xscale = -1;
    jumpstop = false;
    
    if (global.shroomfollow == false && global.cheesefollow == false && global.tomatofollow == false && global.sausagefollow == false && global.pineapplefollow == false)
    {
        state = UnknownEnum.Value_0;
        landAnim = false;
        mach2 = 0;
        image_index = 0;
    }
}

enum UnknownEnum
{
    Value_0
}
