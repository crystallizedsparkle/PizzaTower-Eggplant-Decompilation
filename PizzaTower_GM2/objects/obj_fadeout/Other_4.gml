if (room == Titlescreen && obj_player.state == UnknownEnum.Value_18)
{
    obj_player1.sprite_index = spr_player_machfreefall;
    obj_player1.state = UnknownEnum.Value_84;
    obj_player1.movespeed = 6;
    obj_player1.vsp = 5;
    obj_player1.xscale = 1;
    obj_player1.player_x = 50;
    obj_player1.player_y = 50;
}

if (obj_player.state == UnknownEnum.Value_119)
{
    if (!global.pizzadelivery)
    {
        with (instance_create(obj_stopsign.x - 480, obj_stopsign.y, obj_taxidud))
            playerid = 324;
    }
    else
    {
        with (instance_create(obj_checkpoint.x - 480, obj_checkpoint.y - 50, obj_taxidud))
            playerid = 324;
        
        with (obj_player)
        {
            x = obj_checkpoint.x;
            y = obj_checkpoint.y - 50;
        }
    }
}

if (obj_player.state == UnknownEnum.Value_152)
{
    with (obj_player)
    {
        visible = true;
        state = UnknownEnum.Value_0;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_18 = 18,
    Value_84 = 84,
    Value_119 = 119,
    Value_152 = 152
}
