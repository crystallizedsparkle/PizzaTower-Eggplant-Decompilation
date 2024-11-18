var lag;

if (!other.baddieID.invincible && other.baddieID.destroyable && playerid.state != UnknownEnum.Value_61 && other.baddieID.state != UnknownEnum.Value_137 && !other.baddieID.thrown)
{
    with (other)
    {
        scr_soundeffect(46);
        
        if (!baddieID.elite || baddieID.elitehit <= 0)
        {
            instance_destroy();
            instance_destroy(baddieID);
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
    
    Mort_DownMovement();
}

enum UnknownEnum
{
    Value_61 = 61,
    Value_137 = 137
}