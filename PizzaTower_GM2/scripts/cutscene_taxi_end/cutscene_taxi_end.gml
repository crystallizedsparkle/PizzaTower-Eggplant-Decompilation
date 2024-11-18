function cutscene_taxi_end(argument0, argument1)
{
    var player, target_room, handler;
    
    player = argument0;
    target_room = argument1;
    
    with (player)
    {
        handler = other;
        cutscene = true;
        state = UnknownEnum.Value_146;
        
        if (grounded && state != UnknownEnum.Value_107)
        {
            hsp = 0;
            vsp = 0;
            
            with (instance_create(x - 1000, y, obj_taxi_cutscene))
            {
                targetplayer = player;
                depth = -127;
                targetDoor = "E";
                targetRoom = target_room;
            }
            
            with (handler)
            {
                global.failcutscene = true;
                cutscene_end_action();
            }
        }
    }
}

enum UnknownEnum
{
    Value_107 = 107,
    Value_146 = 146
}
