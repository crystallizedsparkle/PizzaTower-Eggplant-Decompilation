function pal_swap_set_tiles()
{
    var _low, _high, _end_exists;
    
    _low = argument[2] + 1;
    _high = argument[3] - 1;
    
    if (_low < _high)
    {
        _low = argument[3] - 1;
        _high = argument[2] + 1;
    }
    
    _end_exists = false;
    
    if (depth == _high)
    {
        _end_exists = true;
        active = true;
    }
    
    if (!_end_exists)
    {
        active = true;
        depth = _high;
    }
}
