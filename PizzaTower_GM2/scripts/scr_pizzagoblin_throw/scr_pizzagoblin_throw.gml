function scr_pizzagoblin_throw()
{
    var xx;
    
    if (!variable_global_exists("throw_frame"))
    {
        global.throw_frame = 0;
        global.throw_frame[444] = 11;
        global.throw_frame[446] = 13;
        global.throw_frame[445] = 18;
        global.throw_frame[440] = 6;
        global.throw_frame[460] = 2;
        global.throw_frame[195] = 7;
        global.throw_frame[30] = 2;
        global.throw_frame[462] = 2;
        global.throw_frame[442] = 2;
        global.throw_frame[443] = 8;
        global.throw_frame[450] = 6;
        global.throw_frame[455] = 3;
        global.throw_frame[777] = 8;
        global.throw_frame[453] = 15;
        global.throw_frame[452] = 10;
        global.throw_frame[451] = 2;
        global.throw_frame[219] = 6;
        global.throw_frame[432] = 9;
        global.throw_frame[433] = 9;
        global.throw_frame[408] = 9;
        global.throw_frame[222] = 13;
        global.throw_frame[470] = 3;
        global.throw_frame[805] = 7;
        global.throw_frame[281] = 11;
        global.throw_sprite = 0;
        global.throw_sprite[444] = 104;
        global.throw_sprite[446] = 125;
        global.throw_sprite[445] = 396;
        global.throw_sprite[440] = 216;
        global.throw_sprite[460] = 375;
        global.throw_sprite[195] = 414;
        global.throw_sprite[30] = 245;
        global.throw_sprite[462] = 281;
        global.throw_sprite[442] = 217;
        global.throw_sprite[443] = 303;
        global.throw_sprite[450] = 320;
        global.throw_sprite[455] = 227;
        global.throw_sprite[777] = 1224;
        global.throw_sprite[453] = 333;
        global.throw_sprite[452] = 276;
        global.throw_sprite[451] = 388;
        global.throw_sprite[219] = 414;
        global.throw_sprite[432] = 444;
        global.throw_sprite[433] = 444;
        global.throw_sprite[408] = 444;
        global.throw_sprite[222] = 1741;
        global.throw_sprite[470] = 2765;
        global.throw_sprite[805] = 19;
        global.throw_sprite[281] = 2460;
        global.reset_timer = 0;
        global.reset_timer[444] = 200;
        global.reset_timer[446] = 200;
        global.reset_timer[445] = 200;
        global.reset_timer[440] = 200;
        global.reset_timer[460] = 100;
        global.reset_timer[195] = 400;
        global.reset_timer[30] = 100;
        global.reset_timer[462] = 100;
        global.reset_timer[442] = 150;
        global.reset_timer[443] = 200;
        global.reset_timer[450] = 100;
        global.reset_timer[455] = 200;
        global.reset_timer[777] = 200;
        global.reset_timer[453] = 200;
        global.reset_timer[452] = 100;
        global.reset_timer[451] = 200;
        global.reset_timer[219] = 100;
        global.reset_timer[432] = 60;
        global.reset_timer[433] = 60;
        global.reset_timer[408] = 60;
        global.reset_timer[222] = 10;
        global.reset_timer[470] = 100;
        global.reset_timer[805] = 100;
        global.reset_timer[281] = 100;
    }
    
    hsp = 0;
    
    if (place_meeting(x, y + 1, obj_railh))
        hsp = -5;
    else if (place_meeting(x, y + 1, obj_railh2))
        hsp = 5;
    
    if (floor(image_index) == (image_number - 1))
    {
        state = UnknownEnum.Value_134;
        sprite_index = walkspr;
    }
    
    if (bombreset <= 0 && floor(image_index) == global.throw_frame[object_index])
    {
        bombreset = global.reset_timer[object_index];
        sprite_index = global.throw_sprite[object_index];
        
        if (point_in_rectangle(x, y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])))
            scr_soundeffect(20);
        
        switch (object_index)
        {
            case obj_pizzagoblin:
                with (instance_create(x, y, obj_pizzagoblinbomb))
                {
                    defused = true;
                    movespeed = 5;
                    image_xscale = other.image_xscale;
                    vsp = -10;
                    countdown = 80;
                }
                
                break;
            
            case obj_canongoblin:
                with (instance_create(x, y, obj_canongoblinbomb))
                    image_xscale = other.image_xscale;
                
                break;
            
            case obj_noisegoblin:
                with (instance_create(x, y, obj_noisegoblin_arrow))
                {
                }
                
                break;
            
            case obj_cheeserobot:
                with (instance_create(x, y, obj_cheeseblob))
                {
                    sprite_index = spr_cheeserobot_goop;
                    image_xscale = other.image_xscale;
                    hsp = other.image_xscale * 8;
                    vsp = 0;
                    grav = 0;
                }
                
                break;
            
            case obj_spitcheese:
                if (spitcheesespr == 375)
                {
                    with (instance_create(x + (image_xscale * 6), y - 6, obj_spitcheesespike))
                    {
                        image_xscale = other.image_xscale;
                        hsp = other.image_xscale * 5;
                        vsp = -6;
                    }
                }
                else
                {
                    with (instance_create(x + (image_xscale * 6), y - 6, obj_cheeseball))
                    {
                        image_xscale = other.image_xscale;
                        hsp = other.image_xscale * 5;
                        vsp = -6;
                    }
                }
                
                break;
            
            case obj_trash:
            case obj_invtrash:
                with (instance_create(x + (image_xscale * 6), y - 6, obj_cheeseball))
                {
                    image_xscale = other.image_xscale;
                    hsp = other.image_xscale * 5;
                    vsp = -4;
                }
                
                break;
            
            case obj_robot:
                with (instance_create(x + (image_xscale * 4), y, obj_robotknife))
                {
                    grav = 0;
                    image_xscale = other.image_xscale;
                    hsp = other.image_xscale * 5;
                }
                
                break;
            
            case obj_kentukykenny:
                with (instance_create(x, y, obj_kentukykenny_projectile))
                    image_xscale = other.image_xscale;
                
                break;
            
            case obj_pizzard:
                with (instance_create(x, y, obj_pizzard_bolt))
                    image_xscale = other.image_xscale;
                
                break;
            
            case obj_swedishmonkey:
                if (elite)
                {
                    with (instance_create(x, y, obj_evilbanana))
                    {
                        baddieID = other.id;
                        image_xscale = other.image_xscale;
                        hsp = -other.image_xscale * 4;
                        vsp = -5;
                    }
                }
                else
                {
                    with (instance_create(x, y, obj_slipnslide))
                    {
                        baddieID = other.id;
                        image_xscale = other.image_xscale;
                        hsp = -other.image_xscale * 4;
                        vsp = -5;
                    }
                }
                
                with (obj_slipnslide)
                {
                    if (baddieID == other.id)
                        banana += 1;
                }
                
                with (obj_evilbanana)
                {
                    if (baddieID == other.id)
                        banana += 1;
                }
                
                break;
            
            case obj_pepgoblin:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id;
                    image_xscale = other.image_xscale;
                }
                
                break;
            
            case obj_pepbat:
                with (instance_create(x, y, obj_pepgoblin_kickhitbox))
                {
                    baddieID = other.id;
                    image_xscale = other.image_xscale;
                }
                
                break;
            
            case obj_pickle:
                attacking = false;
                
                with (instance_create(x, y, obj_forkhitbox))
                {
                    ID = other.id;
                    image_xscale = other.image_xscale;
                    sprite_index = other.sprite_index;
                }
                
                break;
            
            case obj_tank:
                with (instance_create(x + (image_xscale * 6), y - 6, obj_canongoblinbomb))
                {
                    image_xscale = other.image_xscale;
                    hsp = other.image_xscale * 5;
                }
                
                break;
            
            case obj_thug_blue:
            case obj_thug_red:
                with (instance_create(x + (8 * image_xscale), y, obj_robotknife))
                {
                    image_xscale = other.image_xscale;
                    hsp = other.image_xscale * 5;
                }
                
                break;
            
            case obj_rancher:
                with (instance_create(x + (image_xscale * 6), y + 26, obj_rancher_bullet))
                    image_xscale = other.image_xscale;
                
                break;
            
            case obj_smokingpizzaslice:
                substate = choose(UnknownEnum.Value_134, UnknownEnum.Value_126, UnknownEnum.Value_126);
                
                if (substate == UnknownEnum.Value_134)
                    image_xscale = choose(-1, 1, -image_xscale);
                
                substate_buffer = substate_max;
                
                with (instance_create(x + (50 * image_xscale), y + 20, obj_smokingprojectile))
                    image_xscale = other.image_xscale;
                
                break;
            
            case obj_thug_green:
                with (instance_create(x + (8 * image_xscale), y, obj_junkenemy))
                {
                    image_xscale = other.image_xscale;
                    hsp = other.image_xscale * 7;
                    vsp = -8;
                }
                
                break;
            
            case obj_miniufo:
                instance_create(x, y, obj_warplaser);
                break;
            
            case obj_miniufo_grounded:
                with (instance_create(x + (8 * image_xscale), y, obj_enemybullet))
                {
                    sprite_index = spr_ufogrounded_bullet;
                    image_xscale = other.image_xscale;
                }
                
                break;
            
            case obj_kentukybomber:
                instance_create(x, y + 70, obj_kentukybomb);
                break;
            
            case obj_bazookabaddie:
                xx = x + (72 * image_xscale);
                instance_create(xx, y, obj_bazooka);
                create_particle(xx, y, UnknownEnum.Value_6);
                break;
        }
    }
    
    if (!grounded && hsp < 0)
        hsp += 0.1;
    else if (!grounded && hsp > 0)
        hsp -= 0.1;
}

enum UnknownEnum
{
    Value_6 = 6,
    Value_126 = 126,
    Value_134 = 134
}
