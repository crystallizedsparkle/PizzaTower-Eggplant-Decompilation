with (other)
{
    if (character == "V")
    {
        scr_hurtplayer(object_index);
    }
    else if (scr_transformationcheck())
    {
        if (instance_exists(other.baddieID) && sprite_index != spr_tumbleend && state != UnknownEnum.Value_5 && state != UnknownEnum.Value_47 && state != UnknownEnum.Value_38 && state != UnknownEnum.Value_147)
        {
            scr_losepoints();
            state = UnknownEnum.Value_5;
            xscale = other.baddieID.image_xscale;
            movespeed = 10;
            vsp = 0;
            sprite_index = spr_tumble;
            
            if (other.baddieID.object_index == obj_pepbat)
                other.baddieID.hit = true;
        }
    }
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_38 = 38,
    Value_47 = 47,
    Value_147 = 147
}
