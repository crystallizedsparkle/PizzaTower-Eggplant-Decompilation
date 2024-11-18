function scr_enemy_lungeattack()
{
    var _l;
    
    hsp = -image_xscale * 4;
    vsp = 0;
    _l = false;
    
    with (obj_player)
    {
        if (state == UnknownEnum.Value_43 && image_index <= 4)
            _l = true;
    }
    
    if (!_l)
        hitLag = 0;
    
    if (hitLag > 0)
    {
        hitLag--;
    }
    else
    {
        state = UnknownEnum.Value_138;
        hsp = hithsp;
        vsp = hitvsp;
        stunned = 200;
    }
}

enum UnknownEnum
{
    Value_43 = 43,
    Value_138 = 138
}
