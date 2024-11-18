targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 324;

if (hp <= 0 && state != UnknownEnum.Value_145)
{
    if (!destroyed && !thrown && !destroyable)
        boss_destroy(lastplayerid);
}

if (chooseparry_buffer > 0)
    chooseparry_buffer--;

if ((state == UnknownEnum.Value_42 || state == UnknownEnum.Value_102 || state == UnknownEnum.Value_167 || state == UnknownEnum.Value_171 || state == UnknownEnum.Value_173 || (state == UnknownEnum.Value_58 && pogochargeactive) || state == UnknownEnum.Value_77) && alarm[0] <= 0)
    alarm[0] = 6;

switch (state)
{
    case UnknownEnum.Value_145:
        grav = 0.5;
        state_boss_arenaround();
        movespeed = 0;
        inv_timer = 2;
        invincible = true;
        break;
    
    case UnknownEnum.Value_0:
        grav = 0.5;
        boss_noise_normal();
        break;
    
    case UnknownEnum.Value_106:
        grav = 0.5;
        state_boss_bump();
        break;
    
    case UnknownEnum.Value_42:
        grav = 0.5;
        boss_noise_handstandjump();
        break;
    
    case UnknownEnum.Value_102:
        grav = 0.5;
        boss_noise_crouchslide();
        break;
    
    case UnknownEnum.Value_77:
        grav = 0.5;
        boss_noise_skateboard();
        break;
    
    case UnknownEnum.Value_167:
        grav = 0.5;
        boss_noise_skateboardturn();
        break;
    
    case UnknownEnum.Value_92:
        grav = 0.5;
        boss_noise_jump();
        break;
    
    case UnknownEnum.Value_74:
        grav = 0.5;
        boss_noise_throwing();
        break;
    
    case UnknownEnum.Value_58:
        grav = 0.5;
        boss_noise_pogo();
        break;
    
    case UnknownEnum.Value_170:
        grav = 0.5;
        boss_noise_jetpackstart();
        break;
    
    case UnknownEnum.Value_171:
        grav = 0.5;
        boss_noise_jetpack();
        break;
    
    case UnknownEnum.Value_173:
        grav = 0.5;
        boss_noise_jetpackspin();
        break;
    
    case UnknownEnum.Value_134:
        grav = 0.5;
        state_boss_walk(boss_noise_do_attack);
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

angry = phase > 6;
attacking = state == UnknownEnum.Value_42 || state == UnknownEnum.Value_102 || state == UnknownEnum.Value_77 || state == UnknownEnum.Value_167 || state == UnknownEnum.Value_58 || state == UnknownEnum.Value_170 || state == UnknownEnum.Value_171 || state == UnknownEnum.Value_173 || state == UnknownEnum.Value_74;

enum UnknownEnum
{
    Value_0,
    Value_42 = 42,
    Value_58 = 58,
    Value_61 = 61,
    Value_74 = 74,
    Value_77 = 77,
    Value_84 = 84,
    Value_92 = 92,
    Value_102 = 102,
    Value_106 = 106,
    Value_134 = 134,
    Value_137 = 137,
    Value_138,
    Value_145 = 145,
    Value_147 = 147,
    Value_167 = 167,
    Value_170 = 170,
    Value_171,
    Value_173 = 173
}
