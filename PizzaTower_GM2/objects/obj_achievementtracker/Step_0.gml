var i, b, q;

for (i = 0; i < ds_list_size(achievements_update); i++)
{
    b = ds_list_find_value(achievements_update, i);
    
    with (b)
    {
        if (!unlocked)
        {
            if (frames >= update_rate)
            {
                frames = 0;
                update_func();
            }
            
            frames++;
        }
    }
}

while (!ds_queue_empty(notify_queue))
{
    b = ds_queue_dequeue(notify_queue);
    
    for (i = 0; i < ds_list_size(achievements_notify); i++)
    {
        q = ds_list_find_value(achievements_notify, i);
        
        with (q)
        {
            if (!unlocked)
                func(b);
        }
    }
}
