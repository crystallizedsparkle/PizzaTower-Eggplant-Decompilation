function quick_ini_read_real(argument0, argument1, argument2, argument3)
{
    var b;
    
    ini_open_from_string(obj_savesystem.ini_str);
    b = ini_read_real(argument1, argument2, argument3);
    ini_close();
    return b;
}
