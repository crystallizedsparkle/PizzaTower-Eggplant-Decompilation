if (instance_exists(baddieID) && baddieID.stun == true && (other.state == UnknownEnum.Value_42 || other.state == UnknownEnum.Value_80 || other.instakillmove == true))
{
    with (other)
    {
        sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch);
        image_index = 0;
        state = UnknownEnum.Value_91;
        movespeed = 3;
        vsp = -3;
        instance_destroy(other);
    }
    
    scr_soundeffect(23);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_baddiegibs);
    instance_create(x, y, obj_bangeffect);
    instance_destroy(baddieID);
    instance_destroy();
}

enum UnknownEnum
{
    Value_42 = 42,
    Value_80 = 80,
    Value_91 = 91
}