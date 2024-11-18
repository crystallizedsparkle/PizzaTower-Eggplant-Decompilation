if (picked == false)
{
    hsp = 0;
    vsp = 0;
    grav = 0;
    
    if (other.object_index == obj_player1)
        playerid = 324;
    else
        playerid = 323;
    
    alarm[0] = 150;
    y = playerid.y - 50;
    x = playerid.x;
    
    with (playerid)
    {
        state = UnknownEnum.Value_46;
        scr_soundeffect(21);
        global.giantkey = true;
    }
    
    obj_tv.showtext = true;
    obj_tv.message = "GOT THE GIANT KEY!!!";
    obj_tv.alarm[0] = 200;
    global.heattime = 60;
    picked = true;
}

enum UnknownEnum
{
    Value_46 = 46
}
