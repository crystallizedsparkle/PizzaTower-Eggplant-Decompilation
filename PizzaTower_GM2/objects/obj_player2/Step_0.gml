if (room == rm_editor)
{
    visible = 0;
    exit;
}

scr_getinput2();
event_inherited();

if (!global.coop)
{
    obj_player1.spotlight = true;
    x = -1000;
    y = 500;
    state = UnknownEnum.Value_18;
    
    if (instance_exists(obj_coopflag))
        instance_destroy(obj_coopflag);
    
    if (instance_exists(obj_cooppointer))
        instance_destroy(obj_cooppointer);
}
else if (key_start && !fightball && obj_player1.state != UnknownEnum.Value_121 && obj_player1.state != UnknownEnum.Value_4)
{
    state = UnknownEnum.Value_186;
}

if (!visible && state == UnknownEnum.Value_95)
{
    coopdelay++;
    image_index = 0;
    
    if (coopdelay == 50)
    {
        visible = true;
        coopdelay = 0;
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_18 = 18,
    Value_95 = 95,
    Value_121 = 121,
    Value_186 = 186
}
