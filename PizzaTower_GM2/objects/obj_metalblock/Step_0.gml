with (obj_player1)
{
    if (character != "V")
    {
        if ((place_meeting(x + hsp, y, other) || place_meeting(x + xscale, y, other)) && (obj_player1.state == states.mach3 || obj_player1.state == states.rocket || obj_player1.state == states.knightpepslopes || obj_player1.state == states.shoulderbash))
        {
            playerindex = 0;
            instance_destroy(other);
        }
    }
}

if (place_meeting(x, y + 1, obj_player1) || place_meeting(x, y - 1, obj_player1) || place_meeting(x - 1, y, obj_player1) || place_meeting(x + 1, y, obj_player1))
{
    if (place_meeting(x, y - 1, obj_player1) && (obj_player1.state == states.freefall && obj_player1.freefallsmash >= 10))
    {
        with (instance_place(x, y - 1, obj_player1))
        {
            if (character == "M")
            {
                state = states.jump;
                vsp = -7;
                sprite_index = spr_jump;
            }
        }
        
        playerindex = 0;
        instance_destroy();
    }
    
    if (place_meeting(x, y - 1, obj_player1) && (obj_player1.state == states.knightpep || obj_player1.state == states.hookshot))
    {
        playerindex = 0;
        instance_destroy();
        tile_layer_delete_at(1, x, y);
    }
}

with (obj_player2)
{
    if ((place_meeting(x + hsp, y, other) || place_meeting(x + xscale, y, other)) && (obj_player2.state == states.mach3 || obj_player2.state == states.knightpepslopes || obj_player2.state == states.shoulderbash))
    {
        playerindex = 1;
        instance_destroy(other);
    }
}

if (place_meeting(x, y + 1, obj_player2) || place_meeting(x, y - 1, obj_player2) || place_meeting(x - 1, y, obj_player2) || place_meeting(x + 1, y, obj_player2))
{
    if (place_meeting(x, y - 1, obj_player2) && (obj_player2.state == states.freefall && obj_player2.freefallsmash >= 10))
    {
        playerindex = 1;
        instance_destroy();
    }
    
    if (place_meeting(x, y - 1, obj_player2) && (obj_player2.state == states.knightpep || obj_player2.state == states.hookshot))
    {
        playerindex = 1;
        instance_destroy();
        tile_layer_delete_at(1, x, y);
    }
}

enum UnknownEnum
{
    Value_19 = 19,
    Value_38 = 38,
    Value_47 = 47,
    Value_92 = 92,
    Value_108 = 108,
    Value_121 = 121,
    Value_153 = 153,
    Value_184 = 184
}
