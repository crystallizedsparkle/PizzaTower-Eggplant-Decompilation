function scr_savescore(_level)
{
    if ((global.collect + global.collectN) >= global.srank)
    {
        global.rank = "s";
        
        if (!global.combodropped)
            global.rank = "p";
        
        if (global.snickchallenge == true)
            global.SAGEsnicksrank = true;
    }
    else if ((global.collect + global.collectN) > global.arank)
    {
        global.rank = "a";
    }
    else if ((global.collect + global.collectN) > global.brank)
    {
        global.rank = "b";
    }
    else if ((global.collect + global.collectN) > global.crank)
    {
        global.rank = "c";
    }
    else
    {
        global.rank = "d";
    }
    
    scr_soundeffect(mu_rankd);
    audio_stop_sound(mu_pizzatime);
    audio_stop_sound(mu_noiseescape);
    audio_stop_sound(mu_dragonlair);
    audio_stop_sound(mu_snickchallenge);
    audio_stop_sound(mu_snickchallengeend);
    ini_open_from_string(obj_savesystem.ini_str);
    
    if (ini_read_real("Highscore", _level, 0) < global.collect)
        ini_write_real("Highscore", _level, global.collect);
    
    if (ini_read_real("Treasure", _level, 0) == 0)
        ini_write_real("Treasure", _level, global.treasure);
    
    if (global.secretfound > 3)
        global.secretfound = 3;
    
    if (ini_read_real("Secret", _level, 0) < global.secretfound)
        ini_write_string("Secret", _level, global.secretfound);
    
    if (ini_read_real("Toppin", _level + "1", false) == 0)
        ini_write_real("Toppin", _level + "1", global.shroomfollow);
    
    if (ini_read_real("Toppin", _level + "2", false) == 0)
        ini_write_real("Toppin", _level + "2", global.cheesefollow);
    
    if (ini_read_real("Toppin", _level + "3", false) == 0)
        ini_write_real("Toppin", _level + "3", global.tomatofollow);
    
    if (ini_read_real("Toppin", _level + "4", false) == 0)
        ini_write_real("Toppin", _level + "4", global.sausagefollow);
    
    if (ini_read_real("Toppin", _level + "5", false) == 0)
        ini_write_real("Toppin", _level + "5", global.pineapplefollow);
    
    ini_write_string("Ranks", _level, global.rank);
    obj_savesystem.ini_str = ini_close();
}
