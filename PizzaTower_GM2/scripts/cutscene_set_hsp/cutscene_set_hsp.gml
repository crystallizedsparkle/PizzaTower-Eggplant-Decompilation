function cutscene_set_hsp(_object, _horizontal_speed)
{
    var _obj = _object;
    var _hsp = _horizontal_speed;
    
    with (_obj)
        hsp = _hsp;
    
    cutscene_end_action();
}

function cutscene_set_vsp(_object, _vsp)
{
    with (_object)
        vsp = _vsp;
    
    cutscene_end_action();
}
