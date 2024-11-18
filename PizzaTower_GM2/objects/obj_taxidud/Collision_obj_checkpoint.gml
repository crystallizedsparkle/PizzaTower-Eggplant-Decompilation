if (playerid.visible == false)
{
    global.hp = 8;
    global.failcutscene = false;
    
    with (obj_player1)
    {
        scr_soundeffect(93);
        state = UnknownEnum.Value_0;
        instance_create(x, y, obj_genericpoofeffect);
        cutscene = false;
    }
    
    if (global.coop == true)
    {
        with (obj_player2)
        {
            state = UnknownEnum.Value_0;
            cutscene = false;
        }
    }
    
    obj_player1.visible = true;
    obj_player2.visible = true;
}

enum UnknownEnum
{
    Value_0
}