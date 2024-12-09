function cutscene_wait(_time_in_ms)
{
    timer++;
    
    if (timer >= _time_in_ms)
    {
        timer = 0;
        cutscene_end_action();
    }
}
