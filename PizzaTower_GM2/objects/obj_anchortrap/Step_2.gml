var num, i;

switch (state)
{
    case states.normal:
        hsp = 0;
        vsp = 0;
        break;
    
    case states.fall:
        num = instance_place_list(x, y + vsp + 1, 332, global.instancelist, false);
        
        for (i = 0; i < num; i++)
            instance_destroy(ds_list_find_value(global.instancelist, i));
        
        ds_list_clear(global.instancelist);
        instance_destroy(instance_place(x, y + vsp + 1, obj_metalblock));
        scr_collide();
        
        if (grounded)
        {
            scr_soundeffect(27);
            create_particle(x, y, particles.landcloud);
            state = states.jump;
            
            with (obj_camera)
            {
                shake_mag = 5;
                shake_mag_acc = 3 / room_speed;
            }
        }
        
        break;
    
    case states.jump:
        y = Approach(y, ystart, 2);
        
        if (y == ystart)
            state = states.normal;
        
        break;
}

if (!place_meeting(x, y, obj_trapghost) && !place_meeting(xstart, ystart, obj_trapghost))
    sprite_index = spr_kingghost_anchor;

enum UnknownEnum
{
    Value_0,
    Value_12 = 12,
    Value_92 = 92,
    Value_135 = 135
}
