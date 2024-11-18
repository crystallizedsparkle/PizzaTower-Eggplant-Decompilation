event_inherited();
dmg = 30;
spd = 25;
parryable = true;

function player_hurt(argument0, argument1)
{
    var prevstate;
    
    if (!collisioned)
    {
        prevstate = argument1.state;
        SUPER_player_hurt(argument0, argument1);
        argument1.xscale = -image_xscale;
        argument1.hitxscale = -image_xscale;
        
        if (prevstate == UnknownEnum.Value_160)
        {
            argument1.hithsp = 0;
            argument1.hitvsp = 0;
            argument1.hitstate = UnknownEnum.Value_160;
            
            with (obj_vigilanteboss)
                duel_buffer = duel_max + irandom(duel_random);
        }
    }
}

function parry()
{
    var prevparried;
    
    prevparried = parried;
    SUPER_parry();
    
    if (prevparried != parried)
    {
        image_xscale *= -1;
        dmg = 100;
        spd = 30;
    }
}

enum UnknownEnum
{
    Value_160 = 160
}
