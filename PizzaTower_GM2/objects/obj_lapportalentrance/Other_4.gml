var p;

p = false;

with (obj_player)
{
    if (targetDoor == "LAP")
    {
        p = true;
        state = UnknownEnum.Value_146;
        x = other.x;
        y = other.y;
        roomstartx = x;
        roomstarty = y;
        visible = false;
        
        with (obj_pizzaface)
        {
            x = other.x;
            y = other.y;
        }
    }
}

if (!p)
    instance_destroy();
else
    active = true;

enum UnknownEnum
{
    Value_146 = 146
}
