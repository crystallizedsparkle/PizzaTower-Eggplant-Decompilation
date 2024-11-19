with (instance_create(x, y, obj_fadeout))
{
    obj_player1.targetRoom = 364;
    obj_player1.targetDoor = "A";
    obj_player1.state = states.normal;
    
    if (global.coop == true)
    {
        obj_player2.state = states.normal;
        obj_player2.targetDoor = "A";
    }
}

gamesave_async_load();

enum UnknownEnum
{
    Value_0
}
