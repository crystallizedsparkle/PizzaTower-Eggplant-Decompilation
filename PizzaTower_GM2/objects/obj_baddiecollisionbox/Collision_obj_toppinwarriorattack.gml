if (instance_exists(baddieID))
{
    if (baddieID.vsp > 0 && baddieID.state != UnknownEnum.Value_4)
    {
        instance_create(x, y, obj_bumpeffect);
        baddieID.stunned = 200;
        
        if (other.x != baddieID.x)
            baddieID.image_xscale = -sign(baddieID.x - other.x);
        
        baddieID.vsp = -5;
        baddieID.hsp = other.image_xscale * 2;
        baddieID.state = UnknownEnum.Value_138;
        baddieID.image_index = 0;
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_138 = 138
}
