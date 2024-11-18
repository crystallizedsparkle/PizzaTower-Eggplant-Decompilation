function scr_add_wave(argument0, argument1, argument2, argument3, argument4)
{
    var _wave, _enemynumber, _obj, _random, _spawnpoint;
    
    _wave = argument0;
    _enemynumber = argument1;
    _obj = argument2;
    _random = argument3;
    _spawnpoint = argument4;
    baddie_arr[_wave][_enemynumber] = _obj;
    baddie_random[_wave][_enemynumber] = _random;
    
    if (!_random)
        baddie_spawnpoint[_wave][_enemynumber] = _spawnpoint;
}
