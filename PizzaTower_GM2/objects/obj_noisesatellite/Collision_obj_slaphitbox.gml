if (state == UnknownEnum.Value_138 && hp == 0 && stunned > 40 && slapped == false)
{
    slapped = true;
    instance_create(x + (obj_player.xscale * 40), y, obj_punchdust);
    state = UnknownEnum.Value_4;
    obj_player.state = UnknownEnum.Value_79;
    instance_destroy(other);
}

if (hp == 0 && !(state == UnknownEnum.Value_138 && stunned > 40) && state != UnknownEnum.Value_4 && slapped == false)
{
    instance_create(x, y, obj_spikehurteffect);
    other.image_xscale = image_xscale;
    slapped = true;
    flash = true;
    instance_create(x, y, obj_bumpeffect);
    stunned = 200;
    
    if (other.x != x)
        image_xscale = -sign(x - other.x);
    
    vsp = -5;
    hsp = -image_xscale * 3;
    state = UnknownEnum.Value_138;
}
else if (state != UnknownEnum.Value_4 && slapped == false)
{
    if (hp > 0)
        hp -= 1;
    
    if (slapped == false)
        instance_create(x, y, obj_slapstar);
    
    with (instance_create(x, y, obj_spikehurteffect))
        other.image_xscale = image_xscale;
    
    slapped = true;
    state = UnknownEnum.Value_138;
    stunned = 40;
    
    if (other.x != x)
        image_xscale = -sign(x - other.x);
    
    vsp = -3;
    hsp = -image_xscale * 2;
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_79 = 79,
    Value_138 = 138
}
