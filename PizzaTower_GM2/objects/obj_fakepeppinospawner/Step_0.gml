if (!released)
{
    if (!instance_exists(inst) && global.chase)
    {
        released = true;
        image_speed = 0.35;
    }
}
else if (!instance_exists(inst))
{
    inst = instance_create(x, y + 18, obj_fakepeppino);
    
    with (inst)
    {
        targetDoor = other.targetDoor;
        targetRoom = other.targetRoom;
    }
}

if (global.key_inv && obj_player.state != states.keyget)
    global.chase = true;

if (global.panic)
    global.chase = true;

