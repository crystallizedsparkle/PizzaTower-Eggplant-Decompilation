function scr_do_command(_command)
{
    with (obj_editor)
    {
        while (undo > 1)
        {
            undo--;
            var t = ds_list_size(commandlist) - undo;
            ds_list_find_value(commandlist, t).OnDelete();
            ds_list_delete(commandlist, t);
        }
        
        _command.Do();
        ds_list_add(commandlist, argument0);
    }
}

function scr_undo_command()
{
    if (!ds_list_empty(commandlist))
    {
        var b = ds_list_find_value(commandlist, ds_list_size(commandlist) - undo);
        
        if (b.state == 1)
        {
            b.Undo();
            b.state = 0;
        }
        
        if (undo < ds_list_size(commandlist))
            undo++;
    }
}

function scr_redo_command()
{
    if (!ds_list_empty(commandlist))
    {
        var b = ds_list_find_value(commandlist, ds_list_size(commandlist) - undo);
        
        if (b.state == 0)
        {
            b.Do();
            b.state = 1;
        }
        
        if (undo > 1)
            undo--;
    }
}
