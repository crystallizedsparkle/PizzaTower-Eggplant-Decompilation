switch (state)
{
    case states.idle:
        scr_enemy_idle();
        break;
    
    case states.turn:
        scr_enemy_turn();
        break;
    
    case states.walk:
        scr_enemy_walk();
        break;
    
    case states.land:
        scr_enemy_land();
        break;
    
    case states.hit:
        scr_enemy_hit();
        break;
    
    case states.stun:
        scr_enemy_stun();
        break;
    
    case states.grabbed:
        scr_enemy_grabbed();
        break;
}

if (!instance_exists(obj_slaphitbox))
    slapped = false;

stunned = 100;

if (cigar == false)
{
    landspr = 25;
    idlespr = 25;
    fallspr = 25;
    hitceillingspr = 25;
    stunfalltransspr = 25;
    hitwallspr = 25;
    stunfallspr = 23;
    rollingspr = 25;
    walkspr = 25;
    turnspr = 25;
    flyingspr = 25;
    hitspr = 25;
    stunlandspr = 25;
    stunspr = 25;
    recoveryspr = 25;
    stompedspr = 25;
    grabbedspr = 23;
}

if (state != states.grabbed)
    depth = 0;

if (state != states.stun)
    thrown = false;

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

enum UnknownEnum
{
    Value_4 = 4,
    Value_126 = 126,
    Value_130 = 130,
    Value_134 = 134,
    Value_136 = 136,
    Value_137,
    Value_138
}
