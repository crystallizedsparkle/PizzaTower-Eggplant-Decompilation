if (room == rm_editor)
    exit;

if (charge && grounded)
    hsp = image_xscale * movespeed;
else if (stun && !grounded)
    hsp = -image_xscale * movespeed;
else if (stun && grounded)
    hsp = 0;

if (stun == false && chargebuffer > 0)
    chargebuffer--;

if (!boundbox)
{
    with (instance_create(x, y, obj_baddiecollisionboxother))
    {
        sprite_index = other.sprite_index;
        mask_index = other.sprite_index;
        baddieID = other.id;
        other.boundbox = true;
    }
}

if ((obj_player1.x > (x - 400) && obj_player1.x < (x + 400)) && (y <= (obj_player1.y + 20) && y >= (obj_player1.y - 20)) && !charge && !stun && chargebuffer == 0)
{
    vsp = -7;
    charge = true;
    sprite_index = spr_weeniesquire_charge;
    image_index = 0;
    movespeed = 1;
    alarm[1] = 10;
    image_speed = 0.5;
}

if (charge)
    movespeed += 0.1;

if (flash && alarm[2] <= 0)
    alarm[2] = 0.05 * room_speed;

if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x, y, obj_slope) && charge)
{
    instance_create(x + (image_xscale * 30), y, obj_bumpeffect);
    stunned = 80;
    stun = true;
    movespeed = 5;
    vsp = -10;
    
    with (obj_camera)
    {
        shake_mag = 10;
        shake_mag_acc = 30 / room_speed;
    }
    
    sprite_index = spr_weeniesquire_stun;
    charge = false;
    image_speed = 0.35;
}

if (stun)
{
    stunned--;
    
    if (stunned == 0)
    {
        if (x != obj_player1.x)
            image_xscale = -sign(x - obj_player1.x);
        
        vsp = -5;
        sprite_index = spr_weeniesquire_idle;
        stun = false;
    }
    
    chargebuffer = 80;
}

if (!hitboxcreate && !stun)
{
    hitboxcreate = true;
    
    with (instance_create(x, y, obj_forkhitbox))
    {
        sprite_index = spr_weeniesquire_hitbox;
        ID = other.id;
    }
}

if (charge && scr_solid(x, y + 1))
    steppy--;

if (steppy == 0)
{
    instance_create(x, y + 43, obj_cloudeffect);
    steppy = 20;
}

scr_collide();
