function quick_ini_read_real(_savefile_ini, _section, _key, _default)
{
    ini_open_from_string(obj_savesystem.ini_str);
    var b = ini_read_real(_section, _key, _default);
    ini_close();
    return b;
}
