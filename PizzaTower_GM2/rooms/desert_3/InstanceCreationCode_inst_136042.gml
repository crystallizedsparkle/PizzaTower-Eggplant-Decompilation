func = function(argument0)
{
    if (active == false && argument0.state == states.backbreaker)
    {
        active = true;
        obj_secretmanager.touchedtriggers += 1;
    }
};

enum UnknownEnum
{
    Value_84 = 84
}
