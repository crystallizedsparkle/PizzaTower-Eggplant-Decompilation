function totem_empty(argument0)
{
    var i;
    
    with (argument0)
    {
        for (i = 0; i < array_length(cheeseID); i++)
        {
            if (cheeseID[i] == -4)
                return true;
        }
        
        return false;
    }
}

function totem_add(argument0, argument1)
{
    var i;
    
    with (argument0)
    {
        for (i = 0; i < array_length(cheeseID); i++)
        {
            if (cheeseID[i] == -4)
            {
                cheeseID[i] = argument1;
                return true;
            }
        }
        
        return false;
    }
}

function totem_clear(argument0)
{
    var i;
    
    with (argument0)
    {
        for (i = 0; i < array_length(cheeseID); i++)
        {
            if (cheeseID[i] != -4 && (!instance_exists(cheeseID[i]) || cheeseID[i].state != states.totem))
            {
                if (instance_exists(cheeseID[i]))
                    cheeseID[i].totemID = -4;
                
                cheeseID[i] = -4;
            }
        }
    }
}

function totem_count(argument0)
{
    var c, i;
    
    c = 0;
    
    with (argument0)
    {
        for (i = 0; i < array_length(cheeseID); i++)
        {
            if (cheeseID[i] != -4)
                c++;
        }
        
        return c;
    }
}

enum UnknownEnum
{
    Value_188 = 188
}
