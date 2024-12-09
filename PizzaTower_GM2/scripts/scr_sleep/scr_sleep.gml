function scr_sleep(_time)
{
    var time, ms;
    
    time = current_time;
    ms = _time;
    
    do
    {
    }
    until ((current_time - time) >= round(ms));
    
    return current_time - time;
}
