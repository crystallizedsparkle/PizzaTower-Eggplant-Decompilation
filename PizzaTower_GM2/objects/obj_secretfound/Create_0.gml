if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == false)
{
    global.secretfound += 1;
    
    with (obj_tv)
    {
        message = "YOU HAVE FOUND " + string(global.secretfound) + " SECRET OUT OF 6";
        showtext = true;
        alarm[0] = 150;
    }
    
    scr_soundeffect(21);
    ds_list_add(global.saveroom, id);
}
