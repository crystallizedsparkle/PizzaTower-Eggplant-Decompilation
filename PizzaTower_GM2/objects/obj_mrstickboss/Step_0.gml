targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 324;

if (hp <= 0 && state != UnknownEnum.Value_145)
{
    if (!destroyed && !thrown && !destroyable)
        boss_destroy(lastplayerid);
}

switch (state)
{
    case UnknownEnum.Value_145:
        grav = 0.5;
        state_boss_arenaround();
        break;
    
    case UnknownEnum.Value_0:
        grav = 0.5;
        boss_mrstick_normal();
        break;
    
    case UnknownEnum.Value_174:
        grav = 0.5;
        boss_mrstick_shield();
        break;
    
    case UnknownEnum.Value_175:
        grav = 0.5;
        boss_mrstick_helicopterhat();
        break;
    
    case UnknownEnum.Value_176:
        grav = 0.5;
        boss_mrstick_panicjump();
        break;
    
    case UnknownEnum.Value_92:
        grav = 0.5;
        boss_mrstick_jump();
        break;
    
    case UnknownEnum.Value_177:
        grav = 0.5;
        boss_mrstick_smokebombstart();
        break;
    
    case UnknownEnum.Value_178:
        grav = 0.5;
        boss_mrstick_smokebombcrawl();
        break;
    
    case UnknownEnum.Value_179:
        grav = 0.5;
        boss_mrstick_springshoes();
        break;
    
    case UnknownEnum.Value_180:
        grav = 0.5;
        boss_mrstick_cardboard();
        break;
    
    case UnknownEnum.Value_181:
        grav = 0.5;
        boss_mrstick_cardboardend();
        break;
    
    case UnknownEnum.Value_182:
        grav = 0.5;
        boss_mrstick_mockery();
        break;
    
    case UnknownEnum.Value_134:
        grav = 0.5;
        state_boss_walk(boss_mrstick_decide_attack);
        inv_timer = 2;
        invincible = true;
        break;
    
    case UnknownEnum.Value_61:
        grav = 0.5;
        state_boss_chainsaw();
        break;
    
    case UnknownEnum.Value_84:
        grav = 0.5;
        state_boss_taunt();
        invincible = true;
        inv_timer = 2;
        break;
    
    case UnknownEnum.Value_147:
        grav = 0.5;
        state_boss_parry();
        invincible = true;
        inv_timer = 2;
        break;
    
    case UnknownEnum.Value_137:
        grav = 0.5;
        scr_enemy_hit();
        stunned = targetstunned;
        break;
    
    case UnknownEnum.Value_138:
        grav = 0.5;
        state_boss_stun();
        break;
}

colliding = !(state == UnknownEnum.Value_92 || state == UnknownEnum.Value_180 || state == UnknownEnum.Value_181);
attacking = state == UnknownEnum.Value_174 || state == UnknownEnum.Value_92 || state == UnknownEnum.Value_180 || state == UnknownEnum.Value_181 || state == UnknownEnum.Value_177;

enum UnknownEnum
{
    Value_0,
    Value_61 = 61,
    Value_84 = 84,
    Value_92 = 92,
    Value_134 = 134,
    Value_137 = 137,
    Value_138,
    Value_145 = 145,
    Value_147 = 147,
    Value_174 = 174,
    Value_175,
    Value_176,
    Value_177,
    Value_178,
    Value_179,
    Value_180,
    Value_181,
    Value_182
}
