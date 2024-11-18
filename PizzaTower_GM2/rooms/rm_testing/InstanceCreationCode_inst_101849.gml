trigger = 1;

func = function(argument0)
{
    if (!active)
    {
        if (argument0.state == UnknownEnum.Value_111)
            active = true;
    }
};

enum UnknownEnum
{
    Value_111 = 111
}
