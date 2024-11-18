if (!global.horse && (obj_player1.state == UnknownEnum.Value_0 || obj_player1.state == UnknownEnum.Value_103 || obj_player1.state == UnknownEnum.Value_58 || obj_player1.state == UnknownEnum.Value_104 || obj_player1.state == UnknownEnum.Value_121 || obj_player1.state == UnknownEnum.Value_99) && obj_player1.key_up && obj_player1.grounded && (global.gerome == true || image_index == 1) && place_meeting(x, y, obj_player1))
{
    ds_list_add(global.saveroom, id);
    
    with (obj_player)
    {
        targetRoom = other.targetRoom;
        targetDoor = other.targetDoor;
    }
    
    if (global.gerome)
    {
        obj_geromefollow.visible = false;
        
        with (instance_create(obj_player1.x - 30, obj_player1.y, obj_geromeanim))
        {
            sprite_index = spr_gerome_opendoor;
            image_index = 0;
            image_speed = 0.35;
        }
        
        obj_player1.state = UnknownEnum.Value_98;
        obj_player1.image_index = 0;
        
        if (instance_exists(obj_player2) && global.coop == true)
        {
            obj_player2.x = obj_player1.x;
            obj_player2.y = obj_player1.y;
            obj_player2.state = UnknownEnum.Value_98;
            obj_player2.image_index = 0;
        }
        
        global.gerome = false;
    }
    else
    {
    }
    
    image_index = 1;
}

if (place_meeting(x, y, obj_player1) && floor(obj_player1.image_index) == (obj_player1.image_number - 1) && (obj_player1.state == UnknownEnum.Value_98 || obj_player1.state == UnknownEnum.Value_112))
{
    with (obj_player1)
    {
        obj_player1.targetDoor = other.targetDoor;
        obj_player1.targetRoom = other.targetRoom;
        
        if (instance_exists(obj_player2) && global.coop == true)
        {
            obj_player2.targetDoor = other.targetDoor;
            obj_player2.targetRoom = other.targetRoom;
        }
        
        if (!instance_exists(obj_fadeout))
            instance_create(x, y, obj_fadeout);
    }
}

if (place_meeting(x, y, obj_doorA))
    targetDoor = "A";

if (place_meeting(x, y, obj_doorB))
    targetDoor = "B";

if (place_meeting(x, y, obj_doorC))
    targetDoor = "C";

if (place_meeting(x, y, obj_doorD))
    targetDoor = "D";

if (place_meeting(x, y, obj_doorE))
    targetDoor = "E";

if (place_meeting(x, y, obj_doorF))
    targetDoor = "F";

enum UnknownEnum
{
    Value_0,
    Value_58 = 58,
    Value_98 = 98,
    Value_99,
    Value_103 = 103,
    Value_104,
    Value_112 = 112,
    Value_121 = 121
}
