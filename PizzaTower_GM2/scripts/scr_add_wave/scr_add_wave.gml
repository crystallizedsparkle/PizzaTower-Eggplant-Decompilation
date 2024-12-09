function scr_add_wave(__wave, __enemynumber, __obj, __random, __spawnpoint)
{
    var _wave = __wave;
    var _enemynumber = __enemynumber;
    var _obj = __obj;
    var _random = __random;
    var _spawnpoint = __spawnpoint;
    baddie_arr[_wave][_enemynumber] = _obj;
    baddie_random[_wave][_enemynumber] = _random;
    
    if (!_random)
        baddie_spawnpoint[_wave][_enemynumber] = _spawnpoint;
}
