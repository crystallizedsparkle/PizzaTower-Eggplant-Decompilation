var tx, xx, yy, msk, ixs, _x, _y, uc;

if (followid != -4 && !instance_exists(obj_player1))
    exit;

playerid = obj_player1.id;

if (playerid.state != states.ladder && playerid.state != states.door && playerid.state != states.comingoutdoor)
{
    if (space < maxspace && dir == -1)
        space += spaceaccel;
    
    if (space > -maxspace && dir == 1)
        space -= spaceaccel;
}
else
{
    space = Approach(space, 0, spaceaccel);
}

if (dir != playerid.xscale)
    dir = playerid.xscale;

if (followid != -4 && !instance_exists(followid))
    followid = -4;

tx = round(xoffset * space);
xx = (followid == -4) ? playerid.x : followid.x;
yy = (followid == -4) ? playerid.y : followid.y;
msk = (followid == -4) ? playerid.mask_index : followid.mask_index;
ixs = (followid == -4) ? playerid.xscale : followid.image_xscale;
ds_queue_enqueue(followqueue, xx + tx);
ds_queue_enqueue(followqueue, yy);
ds_queue_enqueue(followqueue, msk);
ds_queue_enqueue(followqueue, ixs);

if (ds_queue_size(followqueue) > (LAG_STEPS * 2))
{
    _x = ds_queue_dequeue(followqueue);
    _y = ds_queue_dequeue(followqueue);
    uc = use_collision;
    
    if (lastplayerposx == _x && lastplayerposy == _y)
    {
        use_collision = true;
        interp = 0.1;
    }
    else
    {
        use_collision = false;
    }
    
    if (!use_collision)
    {
        x = _x;
        y = _y;
    }
    
    mask_index = ds_queue_dequeue(followqueue);
    image_xscale = ds_queue_dequeue(followqueue);
    lastplayerposx = _x;
    lastplayerposy = _y;
}

if (use_collision)
    scr_collide();

enum UnknownEnum
{
    Value_93 = 93,
    Value_95 = 95,
    Value_112 = 112
}
