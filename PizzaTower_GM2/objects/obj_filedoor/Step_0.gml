var str;

if (distance_to_object(obj_player1) < 50)
{
    str = "";
    
    if (obj_player1.state == UnknownEnum.Value_183)
        str = "DELETE ";
    
    with (obj_tv)
    {
        showtext = true;
        alarm[0] = 2;
        message = concat(str, "FILE ", other.file);
    }
}

enum UnknownEnum
{
    Value_183 = 183
}
