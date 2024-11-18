function __init_action()
{
    var i;
    
    global.__part_emit = [];
    global.__part_type = [];
    
    for (i = 0; i <= 15; i++)
    {
        global.__part_type[i] = -1;
        global.__part_emit[i] = -1;
    }
}
