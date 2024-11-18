var ch;

targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 324;

if (hp <= 0 && state != UnknownEnum.Value_145 && state != UnknownEnum.Value_162)
{
    if (!thrown && !destroyable)
        boss_destroy(lastplayerid);
}

if ((state == UnknownEnum.Value_103 || state == UnknownEnum.Value_105 || state == UnknownEnum.Value_102 || state == UnknownEnum.Value_82 || state == UnknownEnum.Value_80 || state == UnknownEnum.Value_166 || state == UnknownEnum.Value_42) && alarm[0] <= 0)
    alarm[0] = 6;

if (chooseparry_buffer > 0)
    chooseparry_buffer--;

if (important && honor && nexthonor && phase > 3 && state != UnknownEnum.Value_160)
{
    ch = false;
    
    with (obj_player)
    {
        if (state == UnknownEnum.Value_41)
            ch = true;
    }
    
    if (instance_exists(obj_shotgunbullet) || ch)
    {
        nexthonor = false;
        
        with (obj_tv)
        {
            showtext = true;
            message = "NO HONOR";
            alarm[0] = 200;
        }
    }
}

switch (phase)
{
    case 4:
    case 5:
    case 6:
        normal_func = boss_vigilante_normal_phase4;
        break;
    
    default:
        normal_func = boss_vigilante_normal;
}

switch (state)
{
    case UnknownEnum.Value_145:
        grav = 0.5;
        state_boss_arenaround();
        honor = nexthonor;
        break;
    
    case UnknownEnum.Value_0:
        grav = 0.5;
        normal_func();
        break;
    
    case UnknownEnum.Value_149:
        grav = 0.5;
        boss_vigilante_float();
        break;
    
    case UnknownEnum.Value_1:
        grav = 0.5;
        boss_vigilante_revolver();
        break;
    
    case UnknownEnum.Value_103:
        grav = 0.5;
        boss_vigilante_mach1();
        break;
    
    case UnknownEnum.Value_102:
        grav = 0.5;
        boss_vigilante_crouchslide();
        break;
    
    case UnknownEnum.Value_105:
        grav = 0.5;
        boss_vigilante_machslide();
        break;
    
    case UnknownEnum.Value_106:
        grav = 0.5;
        state_boss_bump();
        break;
    
    case UnknownEnum.Value_92:
        grav = 0.5;
        boss_vigilante_jump();
        break;
    
    case UnknownEnum.Value_2:
        grav = 0.5;
        boss_vigilante_dynamite();
        break;
    
    case UnknownEnum.Value_128:
        grav = 0.5;
        boss_vigilante_charge();
        break;
    
    case UnknownEnum.Value_80:
        grav = 0.5;
        boss_vigilante_punch();
        break;
    
    case UnknownEnum.Value_164:
        grav = 0.5;
        boss_vigilante_groundpunchstart();
        break;
    
    case UnknownEnum.Value_122:
        grav = 0.5;
        boss_vigilante_freefallprep();
        break;
    
    case UnknownEnum.Value_108:
        grav = 0.5;
        boss_vigilante_freefall();
        break;
    
    case UnknownEnum.Value_111:
        grav = 0.5;
        boss_vigilante_freefallland();
        break;
    
    case UnknownEnum.Value_166:
        grav = 0.5;
        boss_vigilante_millionpunch();
        break;
    
    case UnknownEnum.Value_82:
        grav = 0.5;
        boss_vigilante_uppunch();
        break;
    
    case UnknownEnum.Value_42:
        grav = 0.5;
        boss_vigilante_handstandjump();
        break;
    
    case UnknownEnum.Value_158:
        grav = 0.5;
        boss_vigilante_superattackstart();
        break;
    
    case UnknownEnum.Value_160:
        grav = 0.5;
        boss_vigilante_superattack();
        break;
    
    case UnknownEnum.Value_134:
        grav = 0.5;
        state_boss_walk(boss_vigilante_decide_attack);
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
        normalattack_cooldown = normalattack_max[phase - 1];
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

if (hitstate == UnknownEnum.Value_160 || state == UnknownEnum.Value_160)
{
    with (lastplayerid)
    {
        if (state != UnknownEnum.Value_137 && state != UnknownEnum.Value_156)
        {
            if (sprite_index == spr_player_pistolshot && image_index > (image_number - 1))
                sprite_index = spr_player_pistolidle;
            
            if (sprite_index != spr_player_pistolshot && sprite_index != spr_idle && other.state == UnknownEnum.Value_160 && other.duel_buffer > 0)
                sprite_index = spr_idle;
        }
    }
}

attacking = state == UnknownEnum.Value_1 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_128 || state == UnknownEnum.Value_80 || state == UnknownEnum.Value_164 || state == UnknownEnum.Value_166 || state == UnknownEnum.Value_108 || state == UnknownEnum.Value_82 || state == UnknownEnum.Value_42 || state == UnknownEnum.Value_160 || state == UnknownEnum.Value_158 || state == UnknownEnum.Value_102;

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_41 = 41,
    Value_42,
    Value_61 = 61,
    Value_80 = 80,
    Value_82 = 82,
    Value_84 = 84,
    Value_92 = 92,
    Value_102 = 102,
    Value_103,
    Value_105 = 105,
    Value_106,
    Value_108 = 108,
    Value_111 = 111,
    Value_122 = 122,
    Value_128 = 128,
    Value_134 = 134,
    Value_137 = 137,
    Value_138,
    Value_145 = 145,
    Value_147 = 147,
    Value_149 = 149,
    Value_156 = 156,
    Value_158 = 158,
    Value_160 = 160,
    Value_162 = 162,
    Value_164 = 164,
    Value_166 = 166
}
