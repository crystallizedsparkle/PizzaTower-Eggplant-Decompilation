if (playerid.visible == false)
{
    with (obj_player1)
    {
        scr_soundeffect(93);
        
        if (isgustavo)
            state = states.ratmount;
        else
            state = states.normal;
        
        instance_create(x, y, obj_genericpoofeffect);
        cutscene = false;
    }
    
    if (global.coop == true)
    {
        with (obj_player2)
        {
            state = states.normal;
            cutscene = false;
        }
    }
    
    obj_player1.visible = true;
    obj_player2.visible = true;
}

enum UnknownEnum
{
    Value_0,
    Value_191 = 191
}
