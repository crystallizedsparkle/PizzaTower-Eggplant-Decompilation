if (instance_exists(ID))
{
    x = ID.x;
    
    if (ID.object_index == obj_bigcheese)
        y = ID.y - 60;
    else
        y = ID.y - 40;
    
    if (ID.state != UnknownEnum.Value_138 || ID.stunned < 100)
    {
        ID.birdcreated = false;
        instance_destroy();
    }
}

enum UnknownEnum
{
    Value_138 = 138
}