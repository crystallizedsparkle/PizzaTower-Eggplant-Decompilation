var _vinst, bbox_size, i, _inst;

savedhallwaydirection = hallwaydirection;
savedhallway = hallway;
savedvhallwaydirection = vhallwaydirection;
savedverticalhallway = verticalhallway;

with (obj_secretportal)
{
    if (secret)
    {
        if (!instance_exists(obj_ghostcollectibles))
        {
            instance_create(0, 0, obj_ghostcollectibles);
            trace(instance_number(obj_ghostcollectibles));
        }
    }
}

if (!is_bossroom())
    hitstunned = 0;

if (global.levelreset)
{
    scr_playerreset();
    global.levelreset = false;
}

if (state == UnknownEnum.Value_95 && global.coop == true && !place_meeting(x, y, obj_exitgate))
{
    if (object_index == obj_player1 && obj_player1.spotlight == false)
        visible = false;
    
    if (object_index == obj_player2 && obj_player1.spotlight == true)
        visible = false;
}

if (global.coop == true)
{
    scr_changetoppings();
    
    if (!instance_exists(obj_cooppointer))
        instance_create(x, y, obj_cooppointer);
    
    if (!instance_exists(obj_coopflag))
        instance_create(x, y, obj_coopflag);
}

if (state == UnknownEnum.Value_79)
    state = UnknownEnum.Value_0;

if (place_meeting(x, y, obj_boxofpizza) || place_meeting(x, y - 1, obj_boxofpizza))
{
    box = true;
    hallway = false;
    state = UnknownEnum.Value_100;
}

if (object_index != obj_player2 || global.coop == true)
{
    if (targetDoor == "A" && instance_exists(obj_doorA))
    {
        if (hallway == true)
            x = obj_doorA.x + (hallwaydirection * 100);
        else if (box == true)
            x = obj_doorA.x + 32;
        else
            x = obj_doorA.x + 16;
        
        y = obj_doorA.y - 14;
    }
    
    if (targetDoor == "B" && instance_exists(obj_doorB))
    {
        if (hallway == true)
            x = obj_doorB.x + (hallwaydirection * 100);
        else if (box == true)
            x = obj_doorB.x + 32;
        else
            x = obj_doorB.x + 16;
        
        y = obj_doorB.y - 14;
    }
    
    if (targetDoor == "C" && instance_exists(obj_doorC))
    {
        if (hallway == true)
            x = obj_doorC.x + (hallwaydirection * 100);
        else if (box == true)
            x = obj_doorC.x + 32;
        else
            x = obj_doorC.x + 16;
        
        y = obj_doorC.y - 14;
    }
    
    if (targetDoor == "D" && instance_exists(obj_doorD))
    {
        if (hallway == true)
            x = obj_doorD.x + (hallwaydirection * 100);
        else if (box == true)
            x = obj_doorD.x + 32;
        else
            x = obj_doorD.x + 16;
        
        y = obj_doorD.y - 14;
    }
    
    if (targetDoor == "E" && instance_exists(obj_doorE))
    {
        if (hallway == true)
            x = obj_doorE.x + (hallwaydirection * 100);
        else if (box == true)
            x = obj_doorE.x + 32;
        else
            x = obj_doorE.x + 16;
        
        y = obj_doorE.y - 14;
    }
    
    if (targetDoor == "F" && instance_exists(obj_doorF))
    {
        if (hallway == true)
            x = obj_doorF.x + (hallwaydirection * 100);
        else if (box == true)
            x = obj_doorF.x + 32;
        else
            x = obj_doorF.x + 16;
        
        y = obj_doorF.y - 14;
    }
}

if (verticalhallway)
{
    verticalbuffer = 2;
    _vinst = -4;
    
    with (obj_verticalhallway)
    {
        event_perform(ev_step, ev_step_normal);
        
        if (targetDoor == other.targetDoor)
            _vinst = id;
    }
    
    if (_vinst != -4)
    {
        x = _vinst.x + (_vinst.sprite_width * vertical_x);
        bbox_size = abs(bbox_right - bbox_left);
        x = clamp(x, _vinst.x + bbox_size, _vinst.bbox_right - bbox_size);
        trace(x, _vinst.x);
        
        if (vhallwaydirection > 0)
            y = _vinst.bbox_bottom + 32;
        else
            y = _vinst.bbox_top - 78;
        
        if (verticalstate == UnknownEnum.Value_37)
            state = UnknownEnum.Value_37;
        
        if (state == UnknownEnum.Value_37)
        {
            x = round(x);
            i = 0;
            
            while (!scr_solid(x + xscale, y))
            {
                x += xscale;
                trace(x);
                i++;
                
                if (i > room_width)
                    break;
            }
        }
        
        y += verticalhall_vsp;
        vsp = verticalhall_vsp;
    }
    
    y += (vhallwaydirection * 20);
    y = floor(y);
    verticalstate = UnknownEnum.Value_0;
}

if (character == "M" && place_meeting(x, y, obj_boxofpizza))
{
    while (place_meeting(x, y, obj_boxofpizza))
    {
        _inst = instance_place(x, y, obj_boxofpizza);
        y -= _inst.image_yscale;
    }
}

if (state == UnknownEnum.Value_119)
{
    x = obj_stopsign.x;
    y = obj_stopsign.y;
}

hallway = false;
verticalhallway = false;
box = false;

if (isgustavo)
    brick = true;

if (place_meeting(x, y, obj_exitgate))
{
    with (instance_place(x, y, obj_exitgate))
        other.x = x;
}

if (room == rank_room)
{
    x = rankpos_x;
    y = rankpos_y;
}

roomstartx = x;
roomstarty = y;

enum UnknownEnum
{
    Value_0,
    Value_37 = 37,
    Value_79 = 79,
    Value_95 = 95,
    Value_100 = 100,
    Value_119 = 119
}
