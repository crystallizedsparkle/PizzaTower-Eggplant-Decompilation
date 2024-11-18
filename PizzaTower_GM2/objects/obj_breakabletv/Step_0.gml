if (place_meeting(x, y, obj_player))
{
    with (obj_player)
    {
        if (state == UnknownEnum.Value_103 || state == UnknownEnum.Value_104)
        {
            state = UnknownEnum.Value_6;
            sprite_index = spr_player_finishingblow1;
            image_index = 0;
            hsp = 0;
            movespeed = 0;
        }
        
        if (state == UnknownEnum.Value_121)
        {
            hsp = -xscale * 3;
            state = UnknownEnum.Value_106;
            mach2 = 0;
            image_index = 0;
            vsp = -5;
            instance_destroy(other);
        }
    }
}

if (grabbed == true)
{
    image_xscale = -obj_player.xscale;
    grav = 0;
    obj_player.baddiegrabbedID = id;
    
    if (obj_player.state == UnknownEnum.Value_55 || obj_player.state == UnknownEnum.Value_79 || obj_player.state == UnknownEnum.Value_74 || obj_player.state == UnknownEnum.Value_75 || obj_player.state == UnknownEnum.Value_20)
    {
        grounded = false;
        x = obj_player.x;
        
        if (obj_player.sprite_index != spr_player_haulingstart)
            y = obj_player.y - 40;
        else if (floor(obj_player.image_index) == 0)
            y = obj_player.y;
        else if (floor(obj_player.image_index) == 1)
            y = obj_player.y - 10;
        else if (floor(obj_player.image_index) == 2)
            y = obj_player.y - 20;
        else if (floor(obj_player.image_index) == 3)
            y = obj_player.y - 30;
        
        image_xscale = -obj_player.xscale;
    }
    
    with (obj_player)
    {
        move = key_left2 + key_right2;
        
        if (!(state == UnknownEnum.Value_79 || state == UnknownEnum.Value_55 || state == UnknownEnum.Value_74 || state == UnknownEnum.Value_75 || state == UnknownEnum.Value_20 || state == UnknownEnum.Value_80 || state == UnknownEnum.Value_76 || state == UnknownEnum.Value_81 || state == UnknownEnum.Value_82 || state == UnknownEnum.Value_83))
        {
            other.x = x;
            other.y = y;
            other.grabbed = false;
        }
    }
    
    hsp = 0;
    
    if (obj_player.state == UnknownEnum.Value_80)
    {
        instance_create(x + (obj_player.xscale * 30), y, obj_bumpeffect);
        grabbed = false;
        grav = 0.5;
        x = obj_player.x;
        vsp = 0;
        y = obj_player.y - 5;
        thrown = true;
        hsp = -image_xscale * 25;
        grav = 0;
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_baddiegibs);
        
        with (obj_camera)
        {
            shake_mag = 3;
            shake_mag_acc = 3 / room_speed;
        }
    }
    
    if (obj_player.state == UnknownEnum.Value_83)
    {
        grav = 0.5;
        instance_create(x, y + 20, obj_bumpeffect);
        grabbed = false;
        thrown = true;
        x = obj_player.x;
        y = obj_player.y;
        
        if (obj_player.sprite_index == spr_player_shoulder)
            vsp = 15;
        
        if (obj_player.sprite_index == spr_player_diagonaldownthrow)
        {
            hsp = -image_xscale * 10;
            vsp = 15;
        }
        
        if (obj_player.sprite_index == spr_player_diagonalupthrow)
        {
            hsp = -image_xscale * 10;
            vsp = -15;
        }
        
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_baddiegibs);
        
        with (obj_camera)
        {
            shake_mag = 3;
            shake_mag_acc = 3 / room_speed;
        }
    }
    
    if (obj_player.state == UnknownEnum.Value_74)
    {
        grav = 0.5;
        grabbed = false;
        thrown = true;
        x = obj_player.x;
        y = obj_player.y;
        hsp = -image_xscale * 10;
        vsp = -10;
    }
    
    if (obj_player.state == UnknownEnum.Value_82)
    {
        instance_create(x + (-obj_player.xscale * 15), y - 50, obj_bumpeffect);
        grav = 0.5;
        thrown = true;
        x = obj_player.x;
        y = obj_player.y;
        hsp = -image_xscale * 2;
        grabbed = false;
        vsp = -20;
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_baddiegibs);
        flash = true;
        
        with (obj_camera)
        {
            shake_mag = 3;
            shake_mag_acc = 3 / room_speed;
        }
    }
    
    if (obj_player.state == UnknownEnum.Value_20)
    {
        x = obj_player.x + (obj_player.xscale * 15);
        y = obj_player.y;
    }
    
    if (obj_player.state == UnknownEnum.Value_76)
    {
        if (obj_player.character == "P")
        {
            if (floor(obj_player.image_index) == 0)
            {
                depth = 0;
                x = obj_player.x + (obj_player.xscale * 10);
                y = obj_player.y;
            }
            
            if (floor(obj_player.image_index) == 1)
            {
                depth = 0;
                x = obj_player.x + (obj_player.xscale * 5);
                y = obj_player.y;
            }
            
            if (floor(obj_player.image_index) == 2)
            {
                depth = 0;
                x = obj_player.x;
                y = obj_player.y;
            }
            
            if (floor(obj_player.image_index) == 3)
            {
                depth = 0;
                x = obj_player.x + (obj_player.xscale * -5);
                y = obj_player.y;
            }
            
            if (floor(obj_player.image_index) == 4)
            {
                depth = 0;
                x = obj_player.x + (obj_player.xscale * -10);
                y = obj_player.y;
            }
            
            if (floor(obj_player.image_index) == 5)
            {
                depth = -8;
                x = obj_player.x + (obj_player.xscale * -5);
                y = obj_player.y;
            }
            
            if (floor(obj_player.image_index) == 6)
            {
                depth = -8;
                x = obj_player.x;
                y = obj_player.y;
            }
            
            if (floor(obj_player.image_index) == 7)
            {
                depth = -8;
                x = obj_player.x + (obj_player.xscale * 5);
                y = obj_player.y;
            }
        }
        else
        {
            depth = -7;
            x = obj_player.x;
            y = obj_player.y - 40;
        }
        
        if (obj_player.sprite_index == obj_player.spr_piledriverland)
        {
            instance_create(x, y, obj_slapstar);
            instance_create(x, y, obj_baddiegibs);
            grabbed = false;
            thrown = true;
            x = obj_player.x;
            y = obj_player.y;
            grav = 0.5;
            hsp = -image_xscale * 10;
            vsp = -10;
        }
    }
}

if (vsp > 0 && grounded)
    hsp = 0;

if (place_meeting(x + hsp, y, obj_solid) && thrown == true)
    instance_destroy();

if (grounded == true && thrown == true && vsp > 0)
    instance_destroy();

if (grabbed == false)
    scr_collide();

enum UnknownEnum
{
    Value_6 = 6,
    Value_20 = 20,
    Value_55 = 55,
    Value_74 = 74,
    Value_75,
    Value_76,
    Value_79 = 79,
    Value_80,
    Value_81,
    Value_82,
    Value_83,
    Value_103 = 103,
    Value_104,
    Value_106 = 106,
    Value_121 = 121
}
