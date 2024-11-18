function scr_player_golf()
{
    landAnim = false;
    jumpAnim = false;
    image_speed = 0.35;
    global.combotime = 60;
    global.heattime = 60;
    
    if (sprite_index == spr_golfidle)
    {
        move = key_left + key_right;
        
        if (move != 0)
            xscale = move;
        
        if (key_slap2)
        {
            sprite_index = spr_golfswing;
            image_index = 0;
        }
    }
    
    if (sprite_index == spr_golfswing && floor(image_index) == (image_number - 1))
        state = UnknownEnum.Value_0;
    
    if (instance_exists(golfid) && golfid.state != UnknownEnum.Value_148 && golfid.state != UnknownEnum.Value_156)
        state = UnknownEnum.Value_0;
}

enum UnknownEnum
{
    Value_0,
    Value_148 = 148,
    Value_156 = 156
}