function scr_loophallway(_obj)
{
    if (_obj.start)
    {
        var yy = y - _obj.y;
        var _per = yy / _obj.sprite_height;
        
        with (obj_loophallway)
        {
            if (id != _obj.id && !start)
            {
                other.x = x + (sprite_width / 2);
                other.y = (y + (sprite_height * _per)) - 1;
                
                if (other.object_index == obj_vigilanteboss)
                    other.oldtargetspot = noone;
            }
        }
    }
}
