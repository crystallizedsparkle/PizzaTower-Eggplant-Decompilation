function scr_player_tubeenter()
{
    var _offset_x, _offset_y;
    
    visible = false;
    
    with (tube_id)
    {
        _offset_x = 32 * image_xscale;
        _offset_y = 14 * image_yscale;
        other.x = Approach(other.x, x + _offset_x, other.stored_hsp);
        other.y = Approach(other.y, y + _offset_y, other.stored_vsp);
        
        if (floor(other.x) == (x + _offset_x) && floor(other.y) == (y + _offset_y))
        {
            switch (object_index)
            {
                case obj_tubeenter:
                    if (state != UnknownEnum.Value_0)
                    {
                        if (floor(image_index) == (image_number - 1))
                        {
                            other.state = UnknownEnum.Value_150;
                            other.hsp = hsp * other.stored_hsp;
                            other.vsp = vsp * other.stored_vsp;
                            other.tube_vsp = vsp * other.stored_vsp;
                            state = UnknownEnum.Value_0;
                        }
                    }
                    else
                    {
                        state = UnknownEnum.Value_150;
                        image_index = 0;
                    }
                    
                    break;
                
                default:
                    other.state = UnknownEnum.Value_150;
                    other.hsp = hsp * other.stored_hsp;
                    other.vsp = vsp * other.stored_vsp;
                    other.tube_vsp = vsp * other.stored_vsp;
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_150 = 150
}
