var p;

p = other.id;

with (instance_create(x, y - 60, obj_grabbiehand))
{
    playerid = p;
    state = states.grabbing;
    fake = true;
}

instance_destroy();

enum UnknownEnum
{
    Value_55 = 55
}
