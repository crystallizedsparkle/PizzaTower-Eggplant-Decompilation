function scr_farmerpeasanto_projectile(argument0, argument1)
{
    with (argument0)
    {
        if (sprite_index != spr_haystackburning && sprite_index != spr_haystackburningup)
        {
            sprite_index = spr_haystackburningup;
            image_index = 0;
            state = states.normal;
            return true;
        }
    }
    
    return false;
}

function scr_farmer2_projectile(argument0, argument1)
{
    with (argument0)
    {
        x_to = x + (64 * argument1.image_xscale);
        dir = argument1.image_xscale;
    }
    
    return true;
}

function scr_farmer3_projectile(argument0, argument1)
{
    with (argument0)
    {
        x_to = x + (64 * -argument1.image_xscale);
        dir = -argument1.image_xscale;
    }
    
    return true;
}

function scr_shoot_farmerprojectile()
{
    var inst;
    
    if (global.hasfarmer[farmerpos])
    {
        inst = 243;
        
        if (farmerpos == 1)
            inst = 127;
        else if (farmerpos == 2)
            inst = 87;
        
        with (instance_create(x, y, inst))
        {
            image_xscale = other.xscale;
            hsp = 20 * image_xscale;
        }
    }
}

function scr_change_farmers()
{
    var i;
    
    i = 0;
    
    while (i < 3)
    {
        farmerpos++;
        
        if (farmerpos > (array_length(global.hasfarmer) - 1))
            farmerpos = 0;
        
        if (global.hasfarmer[farmerpos])
            break;
    }
    
    farmer_rearrange();
}

