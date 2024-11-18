var i, arr, tombRoom, X, Y;

if (storedx != -4 && storedy != -4)
{
    i = 0;
    
    if (!ds_list_empty(global.baddietomb))
    {
        repeat (ds_list_size(global.baddietomb))
        {
            arr = ds_list_find_value(global.baddietomb, i);
            tombRoom = arr[0];
            X = arr[1];
            Y = arr[2];
            
            if (tombRoom == room && X == storedx && Y == storedy)
            {
                ds_list_delete(global.baddietomb, i);
                break;
            }
            
            i++;
        }
    }
}
