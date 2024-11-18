function scr_player_current()
{
    if (!place_meeting(x, y, obj_current))
        state = UnknownEnum.Value_0;
    
    sprite_index = spr_player_slipnslide;
    image_speed = 0.35;
}

enum UnknownEnum
{
    Value_0
}
