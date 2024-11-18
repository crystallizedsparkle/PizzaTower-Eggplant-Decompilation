switch (state)
{
    case UnknownEnum.Value_126:
        scr_enemy_idle();
        break;
    
    case UnknownEnum.Value_130:
        scr_enemy_turn();
        break;
    
    case UnknownEnum.Value_134:
        scr_enemy_walk();
        break;
    
    case UnknownEnum.Value_136:
        scr_enemy_land();
        break;
    
    case UnknownEnum.Value_137:
        scr_enemy_hit();
        break;
    
    case UnknownEnum.Value_138:
        scr_enemy_stun();
        break;
    
    case UnknownEnum.Value_4:
        scr_enemy_grabbed();
        break;
}

if (state == UnknownEnum.Value_138 && stunned > 40 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != UnknownEnum.Value_138)
    birdcreated = false;

if (hp <= 0)
    instance_destroy();

if (cigar == true)
{
    landspr = 89;
    idlespr = 100;
    fallspr = 93;
    hitceillingspr = 82;
    stunfalltransspr = 80;
    hitwallspr = 73;
    stunfallspr = 77;
    rollingspr = 67;
    walkspr = 97;
    turnspr = 95;
    flyingspr = 84;
    hitspr = 86;
    stunlandspr = 71;
    stunspr = 69;
    recoveryspr = 65;
    stompedspr = 75;
    grabbedspr = 63;
}

if (cigar == false)
{
    landspr = 87;
    idlespr = 99;
    fallspr = 92;
    hitceillingspr = 81;
    stunfalltransspr = 79;
    hitwallspr = 72;
    stunfallspr = 76;
    rollingspr = 66;
    walkspr = 96;
    turnspr = 94;
    flyingspr = 83;
    hitspr = 85;
    stunlandspr = 70;
    stunspr = 68;
    recoveryspr = 64;
    stompedspr = 74;
    grabbedspr = 61;
}

if (cigar == true && cigarcreate == false && (state == UnknownEnum.Value_126 || state == UnknownEnum.Value_134 || state == UnknownEnum.Value_130 || state == UnknownEnum.Value_136))
{
    cigarcreate = true;
    
    with (instance_create(x, y, obj_sausagemancigar))
        ID = other.id;
}

if (state != UnknownEnum.Value_4)
    depth = 0;

if (state != UnknownEnum.Value_138)
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