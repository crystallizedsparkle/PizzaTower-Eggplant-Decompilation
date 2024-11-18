targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 324;

if (obj_bosscontroller.state == UnknownEnum.Value_144)
    exit;

if (hp <= 0 && state != UnknownEnum.Value_145 && state != UnknownEnum.Value_162)
{
    if (!thrown && !destroyable)
        boss_destroy(lastplayerid);
}

image_speed = 0.35;

if (knightbuffer > 0)
    knightbuffer--;

switch (phase)
{
    case 0:
        normal_func = boss_pizzaface_phase1normal;
        break;
    
    case 1:
        normal_func = boss_pizzahead_phase2normal;
        break;
    
    case 2:
        normal_func = boss_pizzahead_phase3normal;
        break;
}

switch (state)
{
    case UnknownEnum.Value_145:
        grav = 0.5;
        break;
    
    case UnknownEnum.Value_0:
        grav = 0.5;
        normal_func();
        break;
    
    case UnknownEnum.Value_230:
        grav = 0.5;
        boss_pizzaface_ram();
        break;
    
    case UnknownEnum.Value_226:
        grav = 0.5;
        boss_pizzaface_moustache();
        break;
    
    case UnknownEnum.Value_228:
        grav = 0.5;
        boss_pizzaface_eyes();
        break;
    
    case UnknownEnum.Value_227:
        grav = 0.5;
        boss_pizzaface_mouth();
        break;
    
    case UnknownEnum.Value_229:
        grav = 0.5;
        boss_pizzaface_nose();
        break;
    
    case UnknownEnum.Value_231:
        boss_pizzaface_phase2transition();
        break;
    
    case UnknownEnum.Value_232:
        boss_pizzahead_look();
        break;
    
    case UnknownEnum.Value_233:
        boss_pizzahead_fishing();
        break;
    
    case UnknownEnum.Value_235:
        boss_pizzahead_bombrun();
        break;
    
    case UnknownEnum.Value_236:
        boss_pizzahead_npcthrow();
        break;
    
    case UnknownEnum.Value_237:
        boss_pizzahead_portraitthrow();
        break;
    
    case UnknownEnum.Value_238:
        boss_pizzahead_enguarde();
        break;
    
    case UnknownEnum.Value_239:
        boss_pizzahead_sexypicture();
        break;
    
    case UnknownEnum.Value_240:
        boss_pizzahead_pullinglevel();
        break;
    
    case UnknownEnum.Value_241:
        boss_pizzahead_eat();
        break;
    
    case UnknownEnum.Value_242:
        boss_pizzahead_surprisebox();
        break;
    
    case UnknownEnum.Value_243:
        boss_pizzahead_spinningrun();
        break;
    
    case UnknownEnum.Value_244:
        boss_pizzahead_spinningkick();
        break;
    
    case UnknownEnum.Value_245:
        boss_pizzahead_spinningpunch();
        break;
    
    case UnknownEnum.Value_246:
        boss_pizzahead_groundpunch();
        break;
    
    case UnknownEnum.Value_247:
        boss_pizzahead_bigkick();
        break;
    
    case UnknownEnum.Value_248:
        boss_pizzahead_slamhead();
        break;
    
    case UnknownEnum.Value_249:
        boss_pizzahead_slamhead2();
        break;
    
    case UnknownEnum.Value_134:
        grav = 0.5;
        
        if (grounded)
            state = UnknownEnum.Value_0;
        
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
        stunned = 30;
        break;
    
    case UnknownEnum.Value_138:
        grav = 0.5;
        state_boss_stun();
        break;
}

if (phase == 0 && state != UnknownEnum.Value_230)
    invincible = true;
else
    invincible = false;

attacking = state == UnknownEnum.Value_230 || state == UnknownEnum.Value_229 || state == UnknownEnum.Value_244 || state == UnknownEnum.Value_245 || state == UnknownEnum.Value_246 || state == UnknownEnum.Value_248 || state == UnknownEnum.Value_249;
colliding = state != UnknownEnum.Value_230;

if (phase > 0)
{
    mask_index = spr_pizzahead_giddy;
    stunfallspr = spr_pizzahead_giddy;
    walkspr = spr_pizzahead_giddy;
}

enum UnknownEnum
{
    Value_0,
    Value_61 = 61,
    Value_84 = 84,
    Value_134 = 134,
    Value_137 = 137,
    Value_138,
    Value_144 = 144,
    Value_145,
    Value_147 = 147,
    Value_162 = 162,
    Value_226 = 226,
    Value_227,
    Value_228,
    Value_229,
    Value_230,
    Value_231,
    Value_232,
    Value_233,
    Value_235 = 235,
    Value_236,
    Value_237,
    Value_238,
    Value_239,
    Value_240,
    Value_241,
    Value_242,
    Value_243,
    Value_244,
    Value_245,
    Value_246,
    Value_247,
    Value_248,
    Value_249
}
