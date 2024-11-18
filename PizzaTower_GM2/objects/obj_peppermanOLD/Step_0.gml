targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 324;

if (obj_bosscontroller.state == UnknownEnum.Value_144)
    exit;

if (hp <= 0 && state != UnknownEnum.Value_145 && state != UnknownEnum.Value_162)
{
    if (!thrown && !destroyable)
        boss_destroy(lastplayerid);
}

if (chooseparry_buffer > 0)
    chooseparry_buffer--;

switch (phase)
{
    case 1:
    case 2:
        normal_func = boss_pepperman_normal;
        break;
    
    case 3:
    case 4:
    case 5:
    case 6:
        normal_func = boss_pepperman_phase3normal;
        break;
}

switch (state)
{
    case UnknownEnum.Value_145:
        grav = 0.5;
        state_boss_arenaround();
        break;
    
    case UnknownEnum.Value_0:
        grav = 0.5;
        normal_func();
        break;
    
    case UnknownEnum.Value_92:
        grav = 0.5;
        boss_pepperman_jump();
        invincible = true;
        inv_timer = 2;
        break;
    
    case UnknownEnum.Value_108:
        grav = 0.5;
        boss_pepperman_freefall();
        break;
    
    case UnknownEnum.Value_111:
        grav = 0.5;
        boss_pepperman_freefallland();
        break;
    
    case UnknownEnum.Value_122:
        grav = 0.5;
        boss_pepperman_freefallprep();
        break;
    
    case UnknownEnum.Value_153:
        grav = 0.5;
        boss_pepperman_shoulderbash();
        break;
    
    case UnknownEnum.Value_157:
        grav = 0.5;
        boss_pepperman_supershoulderbash();
        break;
    
    case UnknownEnum.Value_158:
        grav = 0.5;
        boss_pepperman_superattackstart();
        break;
    
    case UnknownEnum.Value_159:
        grav = 0.5;
        boss_pepperman_superattackcharge();
        break;
    
    case UnknownEnum.Value_76:
        grav = 0.5;
        boss_pepperman_superslam();
        break;
    
    case UnknownEnum.Value_162:
        grav = 0.5;
        boss_pepperman_fistmatch();
        break;
    
    case UnknownEnum.Value_163:
        grav = 0.5;
        boss_pepperman_fistmatchend();
        break;
    
    case UnknownEnum.Value_83:
        grav = 0.5;
        boss_pepperman_shoulder();
        break;
    
    case UnknownEnum.Value_161:
        grav = 0.5;
        boss_pepperman_shoulderturn();
        break;
    
    case UnknownEnum.Value_134:
        grav = 0.5;
        state_boss_walk(boss_pepperman_decide_attack);
        invincible = true;
        inv_timer = 2;
        break;
    
    case UnknownEnum.Value_128:
        grav = 0.5;
        boss_pepperman_charge();
        invincible = true;
        inv_timer = 2;
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

xscale = image_xscale;
colliding = !(state == UnknownEnum.Value_76 || state == UnknownEnum.Value_162 || state == UnknownEnum.Value_158 || state == UnknownEnum.Value_159);
attacking = state == UnknownEnum.Value_153 || state == UnknownEnum.Value_108 || state == UnknownEnum.Value_122 || state == UnknownEnum.Value_157 || state == UnknownEnum.Value_83 || state == UnknownEnum.Value_76 || state == UnknownEnum.Value_162 || state == UnknownEnum.Value_158 || state == UnknownEnum.Value_159 || state == UnknownEnum.Value_134;

enum UnknownEnum
{
    Value_0,
    Value_61 = 61,
    Value_76 = 76,
    Value_83 = 83,
    Value_84,
    Value_92 = 92,
    Value_108 = 108,
    Value_111 = 111,
    Value_122 = 122,
    Value_128 = 128,
    Value_134 = 134,
    Value_137 = 137,
    Value_138,
    Value_144 = 144,
    Value_145,
    Value_147 = 147,
    Value_153 = 153,
    Value_157 = 157,
    Value_158,
    Value_159,
    Value_161 = 161,
    Value_162,
    Value_163
}
