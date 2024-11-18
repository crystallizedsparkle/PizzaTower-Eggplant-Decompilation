if (fadealpha > 1)
{
    fadein = true;
    
    if (instance_exists(obj_player))
    {
        if (custom_level == false)
        {
            with (obj_player)
            {
                if (place_meeting(x, y, obj_goldendoor))
                    game_restart();
            }
            
            if (room != obj_player1.targetRoom || roomreset)
            {
                scr_room_goto(obj_player1.targetRoom);
                
                with (obj_player)
                {
                    if (state == UnknownEnum.Value_7 || state == UnknownEnum.Value_152)
                    {
                        visible = true;
                        state = UnknownEnum.Value_0;
                    }
                }
            }
            
            if (global.coop == true)
            {
                if (room != obj_player2.targetRoom || roomreset)
                    scr_room_goto(obj_player1.targetRoom);
                
                with (obj_player)
                {
                    if (state == UnknownEnum.Value_7)
                        state = UnknownEnum.Value_0;
                }
                
                with (obj_player2)
                {
                    if (instance_exists(obj_coopplayerfollow))
                        state = UnknownEnum.Value_186;
                }
            }
        }
    }
}

if (fadein == false)
    fadealpha += 0.1;
else if (fadein == true)
    fadealpha -= 0.1;

if (instance_exists(obj_player))
{
    with (obj_player1)
    {
        if (other.fadein == true && (obj_player1.state == UnknownEnum.Value_112 || obj_player1.state == UnknownEnum.Value_98) && (sprite_index == spr_victory || place_meeting(x, y, obj_door) || place_meeting(x, y, obj_startgate)))
        {
            state = UnknownEnum.Value_95;
            image_index = 0;
            
            if (global.coop == true)
            {
                obj_player2.state = UnknownEnum.Value_95;
                obj_player2.image_index = 0;
            }
        }
        
        if (other.fadein == true && obj_player1.state == UnknownEnum.Value_112 && (obj_player1.sprite_index == spr_downpizzabox || obj_player1.sprite_index == spr_uppizzabox))
        {
            state = UnknownEnum.Value_101;
            
            if (global.coop == true)
                obj_player2.state = UnknownEnum.Value_101;
        }
    }
    
    if (instance_exists(obj_player2))
    {
        with (obj_player2)
        {
            if (other.fadein == true && (obj_player2.state == UnknownEnum.Value_112 || obj_player2.state == UnknownEnum.Value_98) && (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_startgate)))
            {
                state = UnknownEnum.Value_95;
                image_index = 0;
                
                if (global.coop == true)
                {
                    obj_player1.state = UnknownEnum.Value_95;
                    obj_player1.image_index = 0;
                }
            }
            
            if (other.fadein == true && obj_player2.state == UnknownEnum.Value_112 && (obj_player2.sprite_index == spr_downpizzabox || obj_player2.sprite_index == spr_uppizzabox))
            {
                state = UnknownEnum.Value_101;
                
                if (global.coop == true)
                    obj_player1.state = UnknownEnum.Value_101;
            }
        }
    }
    
    with (obj_player2)
    {
        if (instance_exists(obj_coopplayerfollow))
            state = UnknownEnum.Value_186;
    }
}

if (fadein == true && fadealpha < 0)
    instance_destroy();

enum UnknownEnum
{
    Value_0,
    Value_7 = 7,
    Value_95 = 95,
    Value_98 = 98,
    Value_101 = 101,
    Value_112 = 112,
    Value_152 = 152,
    Value_186 = 186
}
