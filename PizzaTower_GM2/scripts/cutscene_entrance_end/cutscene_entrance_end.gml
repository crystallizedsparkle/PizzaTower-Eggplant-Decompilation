function cutscene_entrance_end()
{
    with (obj_player)
    {
        state = UnknownEnum.Value_0;
        x = backtohubstartx;
        y = backtohubstarty;
    }
    
    global.levelcomplete = false;
    global.entrancecutscene = true;
    quick_ini_write_real(get_savefile_ini(), "cutscene", "entrance", true);
    cutscene_end_action();
}

function cutscene_factory_end()
{
    with (obj_player)
    {
        state = UnknownEnum.Value_0;
        x = backtohubstartx;
        y = backtohubstarty;
    }
    
    global.levelcomplete = false;
    global.factorycutscene = true;
    quick_ini_write_real(get_savefile_ini(), "cutscene", "factory", true);
    cutscene_end_action();
}

function cutscene_save_game()
{
    gamesave_async_save();
    cutscene_end_action();
}

enum UnknownEnum
{
    Value_0
}