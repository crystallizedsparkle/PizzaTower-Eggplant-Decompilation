var i, b, q, t;

if (global.panic)
{
    image_alpha = 1;
    
    if (sprite_index == spr_pizzaportal)
    {
        playerid = -4;
        
        with (obj_player)
        {
            if (other.playerid == -4 && place_meeting(x, y, other))
            {
                state = states.actor;
                visible = false;
                other.sprite_index = spr_pizzaportalend;
                other.image_index = 0;
                other.playerid = id;
            }
        }
    }
    else if (sprite_index == spr_pizzaportalend)
    {
        with (playerid)
        {
            hsp = 0;
            vsp = 0;
            visible = false;
        }
        
        if (floor(image_index) == (image_number - 1))
        {
            image_index = image_number - 1;
            image_speed = 0;
            
            if (!instance_exists(obj_fadeout))
            {
                with (obj_player)
                {
                    targetDoor = "LAP";
                    targetRoom = other.targetRoom;
                }
                
                for (i = 0; i < ds_list_size(global.escaperoom); i++)
                {
                    b = ds_list_find_value(global.escaperoom, i);
                    q = ds_list_find_index(global.baddieroom, b);
                    t = false;
                    
                    if (q == -1)
                    {
                        q = ds_list_find_index(global.saveroom, b);
                        t = true;
                    }
                    
                    if (q != -1)
                    {
                        if (!t)
                            ds_list_delete(global.baddieroom, q);
                        else
                            ds_list_delete(global.saveroom, q);
                    }
                }
                
                global.laps++;
                global.lap = true;
                instance_create(0, 0, obj_fadeout);
            }
        }
    }
}
else
{
    image_alpha = 0.5;
}

enum UnknownEnum
{
    Value_146 = 146
}
