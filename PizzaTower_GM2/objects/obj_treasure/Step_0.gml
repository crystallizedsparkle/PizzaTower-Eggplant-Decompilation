var num, i, _player;

if (player == 1)
{
    if (got && obj_player1.state != UnknownEnum.Value_46)
        instance_destroy();
}

if (player == 2)
{
    if (got && obj_player2.state != UnknownEnum.Value_46)
        instance_destroy();
}

if (player == 0 && place_meeting(x, y, obj_player))
{
    num = instance_place_list(x, y, 322, global.instancelist, false);
    
    for (i = 0; i < num; i++)
    {
        _player = ds_list_find_value(global.instancelist, i);
        
        with (_player)
        {
            if (state != UnknownEnum.Value_186)
            {
                treasure_x = x;
                treasure_y = y;
                treasure_room = room;
                global.combotime = 60;
                
                if (grounded)
                {
                    ds_list_add(global.saveroom, other.id);
                    global.treasure = true;
                    hsp = 0;
                    vsp = 0;
                    
                    if (!other.got)
                    {
                        other.alarm[0] = 150;
                        state = UnknownEnum.Value_46;
                        scr_soundeffect(21);
                    }
                    
                    other.got = true;
                    other.x = x - 18;
                    other.y = y - 35;
                    other.effectid = instance_create(other.x + 18, other.y, obj_treasureeffect);
                    other.vsp = 0;
                    obj_tv.showtext = true;
                    obj_tv.message = "YOU GOT A TOWER SECRET TREASURE!!!";
                    obj_tv.alarm[0] = 200;
                    other.player = (object_index == obj_player1) ? 1 : 2;
                }
                
                ds_list_clear(global.instancelist);
                break;
            }
        }
    }
    
    ds_list_clear(global.instancelist);
}

enum UnknownEnum
{
    Value_46 = 46,
    Value_186 = 186
}
