function scr_pizzaball_hit()
{
    var s;
    
    x = hitX + irandom_range(-6, 6);
    y = hitY + irandom_range(-6, 6);
    hitLag--;
    sprite_index = stunfallspr;
    
    if (hitLag <= 0)
    {
        x = hitX;
        y = hitY;
        s = -1;
        
        with (instance_nearest(x, y, obj_player))
            s = tauntstoredstate;
        
        if (s != UnknownEnum.Value_104)
            scr_pizzaball_go_to_thrown(hithsp * 1.5, -12);
        else
            scr_pizzaball_go_to_thrown(hithsp * 0.5, hitvsp * 0.5);
        
        global.golfhit++;
    }
}

function scr_pizzaball_grabbed()
{
    var pl;
    
    pl = (grabbedby == 1) ? 324 : 323;
    
    with (pl)
    {
        sprite_index = spr_golfidle;
        image_index = 0;
        state = UnknownEnum.Value_148;
        golfid = other.id;
        hsp = 0;
        vsp = 0;
    }
    
    player = pl;
    state = UnknownEnum.Value_148;
}

function scr_pizzaball_go_to_thrown(argument0, argument1, argument2 = true)
{
    hitspeed = abs(argument0);
    
    if (sign(argument0) != 0)
        image_xscale = sign(argument0);
    
    jumpspeed = abs(argument1);
    
    if (argument2 && jumpspeed < 12)
        jumpspeed = 12;
    
    vsp = -jumpspeed;
    bounced = false;
    state = UnknownEnum.Value_156;
    substate = UnknownEnum.Value_156;
}

enum UnknownEnum
{
    Value_104 = 104,
    Value_148 = 148,
    Value_156 = 156
}
