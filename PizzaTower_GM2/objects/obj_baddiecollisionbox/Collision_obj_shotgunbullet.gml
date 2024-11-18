var lag;

if (instance_exists(baddieID) && baddieID.invtime == 0 && baddieID.state != UnknownEnum.Value_4 && baddieID.state != UnknownEnum.Value_137 && !baddieID.invincible && baddieID.instantkillable)
{
    scr_soundeffect(46);
    
    if (!baddieID.important)
    {
        global.style += (5 + global.combo);
        global.combotime = 60;
        global.heattime = 60;
    }
    
    if (!baddieID.elite || baddieID.elitehit <= 0)
    {
        if (baddieID.destroyable)
        {
            instance_destroy();
            instance_destroy(baddieID);
        }
        
        if (other.object_index == obj_playernoisearrow)
            instance_destroy(other);
    }
    else
    {
        lag = 2;
        baddieID.hitLag = lag;
        baddieID.hitX = baddieID.x;
        baddieID.hitY = baddieID.y;
        baddieID.hp -= 1;
        instance_create(baddieID.x, baddieID.y, obj_parryeffect);
        baddieID.alarm[3] = 3;
        baddieID.state = UnknownEnum.Value_137;
        baddieID.image_xscale = -other.image_xscale;
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_baddiegibs);
        instance_create(x, y, obj_baddiegibs);
        instance_create(x, y, obj_baddiegibs);
        
        with (obj_camera)
        {
            shake_mag = 3;
            shake_mag_acc = 3 / room_speed;
        }
        
        baddieID.hitvsp = -4;
        baddieID.hithsp = other.image_xscale * 10;
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_137 = 137
}