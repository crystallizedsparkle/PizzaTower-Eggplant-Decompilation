if (!global.panic)
{
    with (obj_player1)
    {
        lastroom = room;
        state = UnknownEnum.Value_0;
        room_goto(targetRoom);
        
        if (targetDoor == "S")
        {
            targetDoor = lastTargetDoor;
            lastTargetDoor = "S";
        }
    }
}
else
{
    with (obj_player)
    {
        if (check_player_coop())
            state = UnknownEnum.Value_225;
    }
    
    instance_destroy();
}

enum UnknownEnum
{
    Value_0,
    Value_225 = 225
}
