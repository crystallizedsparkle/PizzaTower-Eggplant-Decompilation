function totem_empty(_obj)
{
    with (_obj)
    {
        for (var i = 0; i < array_length(cheeseID); i++)
        {
            if (cheeseID[i] == noone)
                return true;
        }
        
        return false;
    }
}

function totem_add(_obj1, _obj2)
{
    with (_obj1)
    {
        for (var i = 0; i < array_length(cheeseID); i++)
        {
            if (cheeseID[i] == noone)
            {
                cheeseID[i] = _obj2;
                return true;
            }
        }
        
        return false;
    }
}

function totem_clear(_obj)
{
    with (_obj)
    {
        for (var i = 0; i < array_length(cheeseID); i++)
        {
            if (cheeseID[i] != noone && (!instance_exists(cheeseID[i]) || cheeseID[i].state != states.totem))
            {
                if (instance_exists(cheeseID[i]))
                    cheeseID[i].totemID = noone;
                
                cheeseID[i] = noone;
            }
        }
    }
}

function totem_count(_obj)
{
    var c = 0;
    
    with (_obj)
    {
        for (var i = 0; i < array_length(cheeseID); i++)
        {
            if (cheeseID[i] != noone)
                c++;
        }
        
        return c;
    }
}

