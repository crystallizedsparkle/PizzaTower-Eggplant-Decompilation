if (active)
{
    with (obj_player)
    {
        state = UnknownEnum.Value_146;
        hsp = 0;
        vsp = 0;
        visible = false;
    }
}

if (floor(image_index) == (image_number - 1))
{
    switch (sprite_index)
    {
        case spr_pizzaportal_appear:
            sprite_index = spr_pizzaportalentrancestart;
            break;
        
        case spr_pizzaportalentrancestart:
            sprite_index = spr_pizzaportal_disappear;
            
            with (obj_player)
            {
                state = UnknownEnum.Value_0;
                visible = true;
            }
            
            active = false;
            break;
        
        case spr_pizzaportal_disappear:
            instance_destroy();
            break;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_146 = 146
}