if (ds_list_find_index(global.baddieroom, id) == -1)
{
    obj_tv.image_index = random_range(0, 4);
    ds_list_add(global.baddieroom, id);
    
    repeat (3)
    {
        with (create_debris(x, y, spr_slapstar))
        {
            hsp = random_range(-5, 5);
            vsp = random_range(-10, 10);
        }
    }
    
    if (!reset)
    {
        instance_create(x, y, obj_bangeffect);
        
        if (!stomped && !shot)
        {
            if (cigar)
            {
                with (obj_camera)
                {
                    shake_mag = 5;
                    shake_mag_acc = 20 / room_speed;
                }
                
                instance_create(x, y, obj_baddiegibs);
                instance_create(x, y, obj_baddiegibs);
                instance_create(x, y, obj_baddiegibs);
                
                with (instance_create(x, y, obj_sausageman_dead))
                    cigar = true;
            }
            else
            {
                with (obj_camera)
                {
                    shake_mag = 5;
                    shake_mag_acc = 20 / room_speed;
                }
                
                instance_create(x, y, obj_baddiegibs);
                instance_create(x, y, obj_baddiegibs);
                instance_create(x, y, obj_baddiegibs);
                instance_create(x, y, obj_sausageman_dead);
            }
        }
        
        if (stomped && !shot)
        {
            if (cigar)
            {
                with (instance_create(x, y, obj_sausageman_dead))
                {
                    with (obj_camera)
                    {
                        shake_mag = 5;
                        shake_mag_acc = 20 / room_speed;
                    }
                    
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    hsp = 0;
                    vsp = 0;
                    cigar = true;
                    sprite_index = spr_sausageman_stomped;
                }
            }
            else
            {
                with (instance_create(x, y, obj_sausageman_dead))
                {
                    with (obj_camera)
                    {
                        shake_mag = 5;
                        shake_mag_acc = 20 / room_speed;
                    }
                    
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    hsp = 0;
                    vsp = 0;
                    sprite_index = spr_sausageman_stomped;
                }
            }
        }
        
        if (shot && !stomped)
        {
            if (cigar)
            {
                with (instance_create(x, y, obj_sausageman_dead))
                {
                    with (obj_camera)
                    {
                        shake_mag = 20;
                        shake_mag_acc = 40 / room_speed;
                    }
                    
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    hsp *= 3;
                    vsp *= 3;
                    cigar = true;
                }
            }
            else
            {
                with (instance_create(x, y, obj_sausageman_dead))
                {
                    with (obj_camera)
                    {
                        shake_mag = 20;
                        shake_mag_acc = 40 / room_speed;
                    }
                    
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    instance_create(x, y, obj_baddiegibs);
                    hsp *= 3;
                    vsp *= 3;
                }
            }
        }
        
        global.combo += 1;
        
        if (global.combo == 1)
            global.collect += 10;
        
        if (global.combo == 2)
        {
            instance_create(x, y, obj_20);
            global.collect += 20;
        }
        
        if (global.combo == 3)
        {
            instance_create(x, y, obj_40);
            global.collect += 40;
        }
        
        if (global.combo >= 4)
        {
            instance_create(x, y, obj_80);
            global.collect += 80;
        }
        
        global.heattime = 60;
    }
}
