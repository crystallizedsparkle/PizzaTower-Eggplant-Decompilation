var prevmask;

prevhsp = hsp;
prevmove = move;
prevmovespeed = movespeed;
previcemovespeed = icemovespeed;
prevxscale = xscale;
prevmask = mask_index;

switch (state)
{
    case UnknownEnum.Value_0:
        scr_player_normal();
        break;
    
    case UnknownEnum.Value_1:
        scr_player_revolver();
        break;
    
    case UnknownEnum.Value_2:
        scr_player_dynamite();
        break;
    
    case UnknownEnum.Value_3:
        scr_player_boots();
        break;
    
    case UnknownEnum.Value_4:
        scr_player_grabbed();
        break;
    
    case UnknownEnum.Value_6:
        scr_player_finishingblow();
        break;
    
    case UnknownEnum.Value_5:
        scr_player_tumble();
        break;
    
    case UnknownEnum.Value_18:
        scr_player_titlescreen();
        break;
    
    case UnknownEnum.Value_7:
        scr_player_ejected();
        break;
    
    case UnknownEnum.Value_10:
        scr_player_firemouth();
        break;
    
    case UnknownEnum.Value_9:
        scr_player_fireass();
        break;
    
    case UnknownEnum.Value_8:
        scr_player_transitioncutscene();
        break;
    
    case UnknownEnum.Value_19:
        scr_playerN_hookshot();
        break;
    
    case UnknownEnum.Value_23:
        scr_player_slap();
        break;
    
    case UnknownEnum.Value_20:
        scr_player_tacklecharge();
        break;
    
    case UnknownEnum.Value_24:
        scr_player_cheesepep();
        break;
    
    case UnknownEnum.Value_26:
        scr_player_cheesepepjump();
        break;
    
    case UnknownEnum.Value_27:
        scr_player_cheesepepfling();
        break;
    
    case UnknownEnum.Value_21:
        scr_player_cheeseball();
        break;
    
    case UnknownEnum.Value_22:
        scr_player_cheeseballclimbwall();
        break;
    
    case UnknownEnum.Value_29:
        scr_player_cheesepepstickside();
        break;
    
    case UnknownEnum.Value_30:
        scr_player_cheesepepstickup();
        break;
    
    case UnknownEnum.Value_25:
        scr_player_cheesepepstick();
        break;
    
    case UnknownEnum.Value_28:
        scr_player_cheesepeplaunch();
        break;
    
    case UnknownEnum.Value_33:
        scr_player_boxxedpep();
        break;
    
    case UnknownEnum.Value_35:
        scr_player_boxxedpepjump();
        break;
    
    case UnknownEnum.Value_34:
        scr_player_boxxedpepspin();
        break;
    
    case UnknownEnum.Value_36:
        scr_player_pistolaim();
        break;
    
    case UnknownEnum.Value_37:
        scr_player_climbwall();
        break;
    
    case UnknownEnum.Value_38:
        scr_player_knightpepslopes();
        break;
    
    case UnknownEnum.Value_39:
        scr_player_portal();
        break;
    
    case UnknownEnum.Value_40:
        scr_player_secondjump();
        break;
    
    case UnknownEnum.Value_41:
        scr_player_chainsawbump();
        break;
    
    case UnknownEnum.Value_42:
        scr_player_handstandjump();
        break;
    
    case UnknownEnum.Value_43:
        scr_player_lungeattack();
        break;
    
    case UnknownEnum.Value_44:
        scr_player_lungegrab();
        break;
    
    case UnknownEnum.Value_45:
        scr_player_dashtumble();
        break;
    
    case UnknownEnum.Value_153:
        scr_player_shoulderbash();
        break;
    
    case UnknownEnum.Value_46:
        scr_player_gottreasure();
        break;
    
    case UnknownEnum.Value_47:
        scr_player_knightpep();
        break;
    
    case UnknownEnum.Value_48:
        scr_player_knightpepattack();
        break;
    
    case UnknownEnum.Value_49:
        scr_player_knightpepbump();
        break;
    
    case UnknownEnum.Value_50:
        scr_player_meteorpep();
        break;
    
    case UnknownEnum.Value_51:
        scr_player_bombpep();
        break;
    
    case UnknownEnum.Value_54:
        scr_player_bombpepup();
        break;
    
    case UnknownEnum.Value_53:
        scr_player_bombpepside();
        break;
    
    case UnknownEnum.Value_52:
        scr_player_bombgrab();
        break;
    
    case UnknownEnum.Value_55:
        scr_player_grabbing();
        break;
    
    case UnknownEnum.Value_56:
        scr_player_chainsawpogo();
        break;
    
    case UnknownEnum.Value_57:
        scr_player_shotgunjump();
        break;
    
    case UnknownEnum.Value_59:
        scr_player_stunned();
        break;
    
    case UnknownEnum.Value_60:
        scr_player_highjump();
        break;
    
    case UnknownEnum.Value_61:
        scr_player_chainsaw();
        break;
    
    case UnknownEnum.Value_137:
        scr_player_hit();
        break;
    
    case UnknownEnum.Value_156:
        scr_player_thrown();
        break;
    
    case UnknownEnum.Value_62:
        scr_player_facestomp();
        break;
    
    case UnknownEnum.Value_64:
        scr_player_timesup();
        break;
    
    case UnknownEnum.Value_65:
        scr_player_machroll();
        break;
    
    case UnknownEnum.Value_72:
        scr_player_pistol();
        break;
    
    case UnknownEnum.Value_66:
        scr_player_shotgun();
        break;
    
    case UnknownEnum.Value_67:
        scr_player_shotguncrouch();
        break;
    
    case UnknownEnum.Value_68:
        scr_player_shotguncrouchjump();
        break;
    
    case UnknownEnum.Value_69:
        scr_player_shotgunshoot();
        break;
    
    case UnknownEnum.Value_71:
        scr_player_shotgunfreefall();
        break;
    
    case UnknownEnum.Value_70:
        scr_player_shotgundash();
        break;
    
    case UnknownEnum.Value_73:
        scr_player_machfreefall();
        break;
    
    case UnknownEnum.Value_74:
        scr_player_throwing();
        break;
    
    case UnknownEnum.Value_76:
        scr_player_superslam();
        break;
    
    case UnknownEnum.Value_75:
        scr_player_slam();
        break;
    
    case UnknownEnum.Value_77:
        scr_player_skateboard();
        break;
    
    case UnknownEnum.Value_78:
        scr_player_grind();
        break;
    
    case UnknownEnum.Value_79:
        scr_player_grab();
        break;
    
    case UnknownEnum.Value_80:
        scr_player_punch();
        break;
    
    case UnknownEnum.Value_81:
        scr_player_backkick();
        break;
    
    case UnknownEnum.Value_82:
        scr_player_uppunch();
        break;
    
    case UnknownEnum.Value_83:
        scr_player_shoulder();
        break;
    
    case UnknownEnum.Value_84:
        scr_player_backbreaker();
        break;
    
    case UnknownEnum.Value_85:
        scr_player_graffiti();
        break;
    
    case UnknownEnum.Value_86:
        scr_player_bossdefeat();
        break;
    
    case UnknownEnum.Value_88:
        scr_player_bossintro();
        break;
    
    case UnknownEnum.Value_96:
        scr_player_smirk();
        break;
    
    case UnknownEnum.Value_87:
        scr_player_pizzathrow();
        break;
    
    case UnknownEnum.Value_89:
        scr_player_gameover();
        break;
    
    case UnknownEnum.Value_123:
        scr_player_Sjumpland();
        break;
    
    case UnknownEnum.Value_122:
        scr_player_freefallprep();
        break;
    
    case UnknownEnum.Value_120:
        scr_player_runonball();
        break;
    
    case UnknownEnum.Value_118:
        scr_player_boulder();
        break;
    
    case UnknownEnum.Value_90:
        scr_player_keyget();
        break;
    
    case UnknownEnum.Value_91:
        scr_player_tackle();
        break;
    
    case UnknownEnum.Value_94:
        scr_player_slipnslide();
        break;
    
    case UnknownEnum.Value_93:
        scr_player_ladder();
        break;
    
    case UnknownEnum.Value_92:
        scr_player_jump();
        break;
    
    case UnknownEnum.Value_98:
        scr_player_victory();
        break;
    
    case UnknownEnum.Value_95:
        scr_player_comingoutdoor();
        break;
    
    case UnknownEnum.Value_97:
        scr_player_Sjump();
        break;
    
    case UnknownEnum.Value_99:
        scr_player_Sjumpprep();
        break;
    
    case UnknownEnum.Value_100:
        scr_player_crouch();
        break;
    
    case UnknownEnum.Value_101:
        scr_player_crouchjump();
        break;
    
    case UnknownEnum.Value_102:
        scr_player_crouchslide();
        break;
    
    case UnknownEnum.Value_103:
        scr_player_mach1();
        break;
    
    case UnknownEnum.Value_104:
        scr_player_mach2();
        break;
    
    case UnknownEnum.Value_121:
        scr_player_mach3();
        break;
    
    case UnknownEnum.Value_105:
        scr_player_machslide();
        break;
    
    case UnknownEnum.Value_106:
        scr_player_bump();
        break;
    
    case UnknownEnum.Value_107:
        scr_player_hurt();
        break;
    
    case UnknownEnum.Value_108:
        scr_player_freefall();
        break;
    
    case UnknownEnum.Value_111:
        scr_player_freefallland();
        break;
    
    case UnknownEnum.Value_109:
        scr_player_hang();
        break;
    
    case UnknownEnum.Value_112:
        scr_player_door();
        break;
    
    case UnknownEnum.Value_113:
        scr_player_barrel();
        break;
    
    case UnknownEnum.Value_114:
        scr_player_barreljump();
        break;
    
    case UnknownEnum.Value_116:
        scr_player_barrelslide();
        break;
    
    case UnknownEnum.Value_115:
        scr_player_barrelclimbwall();
        break;
    
    case UnknownEnum.Value_117:
        scr_player_current();
        break;
    
    case UnknownEnum.Value_119:
        scr_player_taxi();
        break;
    
    case UnknownEnum.Value_152:
        scr_player_taxi();
        break;
    
    case UnknownEnum.Value_58:
        scr_player_pogo();
        break;
    
    case UnknownEnum.Value_31:
        scr_player_rideweenie();
        break;
    
    case UnknownEnum.Value_32:
        scr_player_motorcycle();
        break;
    
    case UnknownEnum.Value_124:
        scr_player_faceplant();
        break;
    
    case UnknownEnum.Value_16:
        scr_player_ghost();
        break;
    
    case UnknownEnum.Value_17:
        scr_player_ghostpossess();
        break;
    
    case UnknownEnum.Value_11:
        scr_player_mort();
        break;
    
    case UnknownEnum.Value_12:
        scr_player_mortjump();
        break;
    
    case UnknownEnum.Value_13:
        scr_player_mortattack();
        break;
    
    case UnknownEnum.Value_14:
        scr_player_morthook();
        break;
    
    case UnknownEnum.Value_15:
        scr_player_hook();
        break;
    
    case UnknownEnum.Value_144:
        scr_player_arenaintro();
        break;
    
    case UnknownEnum.Value_146:
        scr_player_actor();
        break;
    
    case UnknownEnum.Value_147:
        scr_player_parry();
        break;
    
    case UnknownEnum.Value_148:
        scr_player_golf();
        break;
    
    case UnknownEnum.Value_150:
        scr_player_tube();
        break;
    
    case UnknownEnum.Value_154:
        scr_player_pummel();
        break;
    
    case UnknownEnum.Value_165:
        scr_player_slipbanan();
        break;
    
    case UnknownEnum.Value_183:
        scr_player_bombdelete();
        break;
    
    case UnknownEnum.Value_184:
        scr_player_rocket();
        break;
    
    case UnknownEnum.Value_185:
        scr_player_rocketslide();
        break;
    
    case UnknownEnum.Value_186:
        scr_player_gotoplayer();
        break;
    
    case UnknownEnum.Value_187:
        scr_player_trickjump();
        break;
    
    case UnknownEnum.Value_190:
        scr_player_ridecow();
        break;
    
    case UnknownEnum.Value_191:
        scr_player_ratmount();
        break;
    
    case UnknownEnum.Value_196:
        scr_player_ratmounthurt();
        break;
    
    case UnknownEnum.Value_192:
        scr_player_ratmountjump();
        break;
    
    case UnknownEnum.Value_193:
        scr_player_ratmountattack();
        break;
    
    case UnknownEnum.Value_194:
        scr_player_ratmountspit();
        break;
    
    case UnknownEnum.Value_195:
        scr_player_ratmountclimbwall();
        break;
    
    case UnknownEnum.Value_197:
        scr_player_ratmountgroundpound();
        break;
    
    case UnknownEnum.Value_198:
        scr_player_ratmountbounce();
        break;
    
    case UnknownEnum.Value_200:
        scr_player_ratmountballoon();
        break;
    
    case UnknownEnum.Value_202:
        scr_player_ratmountgrind();
        break;
    
    case UnknownEnum.Value_201:
        scr_player_ratmounttumble();
        break;
    
    case UnknownEnum.Value_259:
        scr_player_ratmountpunch();
        break;
    
    case UnknownEnum.Value_203:
        scr_player_ratmounttrickjump();
        break;
    
    case UnknownEnum.Value_204:
        scr_player_ratmountskid();
        break;
    
    case UnknownEnum.Value_206:
        scr_player_blockstance();
        break;
    
    case UnknownEnum.Value_207:
        scr_player_balloon();
        break;
    
    case UnknownEnum.Value_208:
        scr_player_debugstate();
        break;
    
    case UnknownEnum.Value_210:
        scr_player_trashjump();
        break;
    
    case UnknownEnum.Value_211:
        scr_player_trashroll();
        break;
    
    case UnknownEnum.Value_212:
        scr_player_stringfling();
        break;
    
    case UnknownEnum.Value_213:
        scr_player_stringjump();
        break;
    
    case UnknownEnum.Value_214:
        scr_player_stringfall();
        break;
    
    case UnknownEnum.Value_215:
        scr_player_noisejetpack();
        break;
    
    case UnknownEnum.Value_216:
        scr_player_spiderweb();
        break;
    
    case UnknownEnum.Value_225:
        scr_player_animatronic();
        break;
    
    case UnknownEnum.Value_252:
        scr_player_playersuperattack();
        break;
    
    case UnknownEnum.Value_254:
        scr_player_jetpackjump();
        break;
    
    case UnknownEnum.Value_257:
        scr_player_bee();
        break;
    
    case UnknownEnum.Value_260:
        scr_player_ratmountcrouch();
        break;
    
    case UnknownEnum.Value_261:
        scr_player_ratmountladder();
        break;
    
    case UnknownEnum.Value_265:
        scr_player_antigrav();
        break;
}

if (prevstate != state)
{
    if (prevstate == UnknownEnum.Value_211 && prevsprite != 1727 && prevsprite != 1636)
        create_debris(x, y, 2511);
}

if (!place_meeting(x, y + 1, obj_railparent))
{
    if (state == UnknownEnum.Value_121 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_5)
        railmovespeed = Approach(railmovespeed, 0, 0.1);
    else
        railmovespeed = Approach(railmovespeed, 0, 0.5);
}

if (state != UnknownEnum.Value_42 && state != UnknownEnum.Value_5)
    crouchslipbuffer = 0;

if (state != UnknownEnum.Value_121)
    mach4mode = false;

if (ratshootbuffer > 0)
    ratshootbuffer--;

if (state != UnknownEnum.Value_225)
{
    animatronic_buffer = 360;
    animatronic_collect_buffer = 0;
}

if (state == UnknownEnum.Value_33 && grounded && vsp > 0)
    boxxedpepjump = boxxedpepjumpmax;

if (verticalbuffer > 0)
    verticalbuffer--;

if (superchargecombo_buffer > 0)
{
    superchargecombo_buffer--;
}
else if (superchargecombo_buffer == 0)
{
    superchargecombo_buffer = -1;
    global.combotime = 4;
}

if (state != UnknownEnum.Value_0)
    breakdance_speed = 0.25;

if (!grounded && (state == UnknownEnum.Value_187 || state == UnknownEnum.Value_92 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_104 || state == UnknownEnum.Value_121) && key_jump && global.noisejetpack == true)
{
    vsp = -14;
    state = UnknownEnum.Value_254;
    sprite_index = spr_player_jetpackstart;
    doublejump = false;
    
    with (instance_create(x, y, obj_highjumpcloud2))
        sprite_index = spr_player_firemouthjumpdust;
}

if (walljumpbuffer > 0)
    walljumpbuffer--;

if (grounded && vsp > 0 && state != UnknownEnum.Value_215)
    jetpackfuel = jetpackmax;

if (tauntstoredisgustavo)
{
    isgustavo = true;
    
    if (state != UnknownEnum.Value_84 && state != UnknownEnum.Value_147 && state != UnknownEnum.Value_85)
        tauntstoredisgustavo = false;
}

if (state != UnknownEnum.Value_121 && (state != UnknownEnum.Value_105 || sprite_index != spr_mach3boost))
{
    launch = false;
    launched = false;
    launch_buffer = 0;
}

if (launch_buffer > 0)
    launch_buffer--;
else
    launched = false;

if (state != UnknownEnum.Value_6)
    finishingblow = false;

if (dash_doubletap > 0)
    dash_doubletap--;

if (cow_buffer > 0)
    cow_buffer--;

if (state == UnknownEnum.Value_43)
    lunge_buffer = 14;

if (blur_effect > 0)
{
    blur_effect--;
}
else if (breakdance_speed >= 0.6 || mach4mode == true || boxxeddash == true || state == UnknownEnum.Value_16 || state == UnknownEnum.Value_5 || state == UnknownEnum.Value_198 || state == UnknownEnum.Value_193 || state == UnknownEnum.Value_42 || (state == UnknownEnum.Value_116 || (state == UnknownEnum.Value_79 && sprite_index == spr_swingding && swingdingdash <= 0) || (state == UnknownEnum.Value_80 && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend)) || state == UnknownEnum.Value_108 || state == UnknownEnum.Value_43))
{
    if (visible && !place_meeting(x, y, obj_secretportal) && !place_meeting(x, y, obj_secretportalstart))
    {
        blur_effect = 2;
        
        with (create_blur_afterimage(x, y, sprite_index, image_index - 1, xscale))
            playerid = other.id;
    }
}

if (state != UnknownEnum.Value_61 && state != UnknownEnum.Value_106 && state != UnknownEnum.Value_33 && state != UnknownEnum.Value_34 && state != UnknownEnum.Value_35)
{
    boxxed = false;
    boxxeddash = false;
}

if (state != UnknownEnum.Value_79)
    grabbingenemy = false;

if (state != UnknownEnum.Value_104 && state != UnknownEnum.Value_121 && state != UnknownEnum.Value_187 && state != UnknownEnum.Value_201 && state != UnknownEnum.Value_203)
{
    ramp = false;
    ramp_points = false;
}

if (state != UnknownEnum.Value_112 && state != UnknownEnum.Value_61 && state != UnknownEnum.Value_137 && place_meeting(x, y, obj_boxofpizza))
    state = UnknownEnum.Value_100;

if (shoot_buffer > 0)
    shoot_buffer--;

if (cheesepep_buffer > 0)
    cheesepep_buffer--;

if (state != UnknownEnum.Value_29)
    yscale = 1;

if (invhurt_buffer > 0)
    invhurt_buffer--;

if (state == UnknownEnum.Value_107)
{
    if (hurt_buffer > 0)
    {
        hurt_buffer--;
    }
    else
    {
        invhurt_buffer = invhurt_max;
        hurt_buffer = -1;
    }
}
else
{
    if (hurt_buffer > 0)
        invhurt_buffer = invhurt_max;
    
    hurt_buffer = -1;
}

if (room == Realtitlescreen && instance_exists(obj_mainmenuselect))
    state = UnknownEnum.Value_18;

if (wallclingcooldown < 10)
    wallclingcooldown++;

if (!instance_exists(superchargedeffectid) && supercharged)
{
    with (instance_create(x, y, obj_superchargeeffect))
    {
        playerid = other.id;
        other.superchargedeffectid = id;
    }
}

if (state != UnknownEnum.Value_97)
    sjumpvsp = -12;

if (state != UnknownEnum.Value_108)
    freefallvsp = 20;

if (supercharge > 9 && state != UnknownEnum.Value_84)
    supercharged = true;

if (!instance_exists(pizzashieldid) && pizzashield == true)
{
    with (instance_create(x, y, obj_pizzashield))
    {
        playerid = other.object_index;
        other.pizzashieldid = id;
    }
}

if (visible == false && state == UnknownEnum.Value_95)
{
    coopdelay++;
    image_index = 0;
    
    if (coopdelay == 50)
    {
        visible = true;
        coopdelay = 0;
    }
}

if (global.coop == true)
{
    if ((state == UnknownEnum.Value_80 || state == UnknownEnum.Value_42) && !(obj_player2.state == UnknownEnum.Value_80 || obj_player2.state == UnknownEnum.Value_42))
        fightballadvantage = true;
    else if (!(obj_player2.state == UnknownEnum.Value_80 || obj_player2.state == UnknownEnum.Value_42))
        fightballadvantage = false;
}

if (state != UnknownEnum.Value_58 && state != UnknownEnum.Value_84)
{
    pogospeed = 6;
    pogospeedprev = false;
}

scr_playersounds();

if (grounded)
    doublejump = false;

if (pogochargeactive == true)
{
    if (flashflicker == false)
    {
        if (pogochargeactive == true && sprite_index == spr_playerN_pogofall)
            sprite_index = spr_playerN_pogofallmach;
        
        if (pogochargeactive == true && sprite_index == spr_playerN_pogobounce)
            sprite_index = spr_playerN_pogobouncemach;
    }
    
    flashflicker = true;
    pogocharge--;
}
else
{
    flashflicker = false;
}

if (state != UnknownEnum.Value_74)
    kickbomb = false;

if (pogocharge == 0)
{
    pogochargeactive = false;
    pogocharge = 100;
}

if (flashflicker == true)
{
    flashflickertime++;
    
    if (flashflickertime == 20)
    {
        flash = true;
        flashflickertime = 0;
    }
}

if (state != UnknownEnum.Value_121 && state != UnknownEnum.Value_4)
    fightball = false;

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_107)
{
    if (grounded && state != UnknownEnum.Value_55)
        suplexmove = false;
}

if (state != UnknownEnum.Value_108 && (state != UnknownEnum.Value_61 || tauntstoredstate != UnknownEnum.Value_108) && (state != UnknownEnum.Value_84 || tauntstoredstate != UnknownEnum.Value_108))
    freefallsmash = -14;

if (global.playerhealth <= 0 && state != UnknownEnum.Value_89)
{
    image_index = 0;
    sprite_index = spr_playerV_dead;
    state = UnknownEnum.Value_89;
}

if (state == UnknownEnum.Value_89 && y > (room_height * 2))
{
    targetDoor = "A";
    scr_playerreset();
    
    if (global.coop == true)
    {
        with (obj_player2)
        {
            scr_playerreset();
            targetDoor = "A";
        }
    }
    
    with (obj_player)
    {
        targetDoor = "A";
        room = hub_reception;
        room = rm_levelselect;
    }
}

if (baddiegrabbedID == 523 && (state == UnknownEnum.Value_79 || state == UnknownEnum.Value_76 || state == UnknownEnum.Value_20))
    state = UnknownEnum.Value_0;

if (!(state == UnknownEnum.Value_79 || state == UnknownEnum.Value_76 || state == UnknownEnum.Value_104))
{
    baddiegrabbedID = 523;
    heavy = false;
}

if (cutscene == true && state != UnknownEnum.Value_186)
    global.heattime = 60;

if (anger == 0)
    angry = false;

if (anger > 0)
{
    angry = true;
    anger -= 1;
}

if (sprite_index == spr_winding && state != UnknownEnum.Value_0)
    windingAnim = 0;

if (state != UnknownEnum.Value_79)
    swingdingbuffer = 0;

if (state == UnknownEnum.Value_265 || state == UnknownEnum.Value_184 || state == UnknownEnum.Value_185)
    grav = 0;
else if (state == UnknownEnum.Value_113)
    grav = 0.6;
else if (state == UnknownEnum.Value_16 || state == UnknownEnum.Value_17)
    grav = 0;
else if (boxxed && state != UnknownEnum.Value_34)
    grav = 0.3;
else if (state == UnknownEnum.Value_254)
    grav = 0.5;
else if (state == UnknownEnum.Value_34)
    grav = 0.6;
else
    grav = 0.5;

if (state == UnknownEnum.Value_113 && key_jump2 && !jumpstop)
    grav = 0.4;

if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    instance_create(x + random_range(-5, 5), y + 46, obj_vomit);

if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (instance_create(x + random_range(-5, 5), y + 46, obj_vomit))
        sprite_index = spr_vomit2;
}

if (global.stylethreshold >= 2 && !instance_exists(angryeffectid) && state == UnknownEnum.Value_0 && character != "V")
{
    with (instance_create(x, y, obj_angrycloud))
    {
        playerid = other.object_index;
        other.angryeffectid = id;
    }
}

if (object_index == obj_player1)
{
    if (global.combo != global.previouscombo)
    {
        global.previouscombo = global.combo;
        
        if ((global.combo % 5) == 0 && global.combo != 0)
        {
            with (instance_create(x, y - 80, obj_combotitle))
            {
                title = floor(global.combo / 5);
                title = clamp(title, 0, floor(sprite_get_number(spr_comboend_title1) / 5));
            }
        }
    }
    
    if (!(state == UnknownEnum.Value_112 || state == UnknownEnum.Value_150 || state == UnknownEnum.Value_119 || state == UnknownEnum.Value_46 || state == UnknownEnum.Value_98 || state == UnknownEnum.Value_46 || state == UnknownEnum.Value_146 || state == UnknownEnum.Value_95 || (state == UnknownEnum.Value_47 && (sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder)) || instance_exists(obj_fadeout) || place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart)))
    {
        if (global.combotime > 0)
            global.combotime -= 0.15;
    }
    
    if (global.heattime > 0)
        global.heattime -= 0.15;
    
    if (global.combotime <= 0 && global.combo != 0)
    {
        global.savedcombo = global.combo;
        global.combotime = 0;
        global.combo = 0;
        supercharge = 0;
    }
    
    if (global.heattime <= 0 && global.style > -1 && global.stylelock == false)
        global.style -= 0.05;
}

if (key_jump && !grounded && (state == UnknownEnum.Value_104 || state == UnknownEnum.Value_121) && (state != (UnknownEnum.Value_37 & walljumpbuffer)) <= 0)
    input_buffer_walljump = 24;

if (input_buffer_jump < 8)
    input_buffer_jump++;

if (input_buffer_secondjump < 8)
    input_buffer_secondjump++;

if (input_buffer_highjump < 8)
    input_buffer_highjump++;

if (input_attack_buffer > 0)
    input_attack_buffer--;

if (input_finisher_buffer > 0)
    input_finisher_buffer--;

if (input_up_buffer > 0)
    input_up_buffer--;

if (input_down_buffer > 0)
    input_down_buffer--;

if (input_buffer_walljump > 0)
    input_buffer_walljump--;

if (input_buffer_slap < 8)
    input_buffer_slap++;

if (key_particles == true)
    create_particle(x + random_range(-25, 25), y + random_range(-35, 25), UnknownEnum.Value_10, 0);

if (inv_frames == false && hurted == false && state != UnknownEnum.Value_16)
    image_alpha = 1;

if (state == UnknownEnum.Value_80 || (state == UnknownEnum.Value_92 && sprite_index == spr_playerN_noisebombspinjump) || state == UnknownEnum.Value_20 || state == UnknownEnum.Value_77 || state == UnknownEnum.Value_47 || state == UnknownEnum.Value_24 || state == UnknownEnum.Value_38 || state == UnknownEnum.Value_48 || state == UnknownEnum.Value_51 || state == UnknownEnum.Value_62 || state == UnknownEnum.Value_73 || state == UnknownEnum.Value_62 || state == UnknownEnum.Value_121 || state == UnknownEnum.Value_108 || state == UnknownEnum.Value_97)
    attacking = true;
else
    attacking = false;

if (state == UnknownEnum.Value_74 || state == UnknownEnum.Value_81 || state == UnknownEnum.Value_83 || state == UnknownEnum.Value_82)
    grabbing = true;
else
    grabbing = false;

if ((state == UnknownEnum.Value_198 && vsp >= 0) || sprite_index == spr_player_Sjumpcancel || sprite_index == spr_swingding || sprite_index == spr_tumble || state == UnknownEnum.Value_34 || state == UnknownEnum.Value_211 || state == UnknownEnum.Value_210 || state == UnknownEnum.Value_70 || (state == UnknownEnum.Value_71 && (sprite_index == spr_shotgunjump2 || sprite_index == spr_shotgunjump3)) || state == UnknownEnum.Value_97 || state == UnknownEnum.Value_184 || state == UnknownEnum.Value_185 || state == UnknownEnum.Value_41 || state == UnknownEnum.Value_80 || state == UnknownEnum.Value_124 || state == UnknownEnum.Value_31 || state == UnknownEnum.Value_121 || (state == UnknownEnum.Value_92 && sprite_index == spr_playerN_noisebombspinjump) || state == UnknownEnum.Value_108 || state == UnknownEnum.Value_9 || state == UnknownEnum.Value_254 || state == UnknownEnum.Value_10 || state == UnknownEnum.Value_19 || state == UnknownEnum.Value_254 || state == UnknownEnum.Value_77 || state == UnknownEnum.Value_63 || state == UnknownEnum.Value_97 || state == UnknownEnum.Value_73 || state == UnknownEnum.Value_20 || (state == UnknownEnum.Value_76 && sprite_index == spr_piledriver) || state == UnknownEnum.Value_47 || state == UnknownEnum.Value_48 || state == UnknownEnum.Value_38 || state == UnknownEnum.Value_187 || state == UnknownEnum.Value_24 || state == UnknownEnum.Value_21 || state == UnknownEnum.Value_201 || state == UnknownEnum.Value_197 || state == UnknownEnum.Value_259 || state == UnknownEnum.Value_265 || ratmount_movespeed == 12 || state == UnknownEnum.Value_165 || state == UnknownEnum.Value_153)
    instakillmove = true;
else
    instakillmove = false;

if (state == UnknownEnum.Value_198 && vsp < 0)
    stunmove = true;
else
    stunmove = false;

if (flash == true && alarm[0] <= 0)
    alarm[0] = 0.15 * room_speed;

if (state != UnknownEnum.Value_93)
    hooked = false;

if (state != UnknownEnum.Value_121 && state != UnknownEnum.Value_105)
    autodash = false;

if ((state != UnknownEnum.Value_92 && state != UnknownEnum.Value_101 && state != UnknownEnum.Value_23) || vsp < 0)
    fallinganimation = 0;

if (state != UnknownEnum.Value_111 && state != UnknownEnum.Value_0 && state != UnknownEnum.Value_105 && state != UnknownEnum.Value_92)
    facehurt = false;

if (state != UnknownEnum.Value_0 && state != UnknownEnum.Value_105)
    machslideAnim = false;

if (state != UnknownEnum.Value_0 && state != UnknownEnum.Value_191)
{
    idle = 0;
    dashdust = false;
}

if (state != UnknownEnum.Value_103 && state != UnknownEnum.Value_26 && state != UnknownEnum.Value_92 && state != UnknownEnum.Value_19 && state != UnknownEnum.Value_42 && state != UnknownEnum.Value_0 && state != UnknownEnum.Value_104 && state != UnknownEnum.Value_121 && state != UnknownEnum.Value_122 && state != UnknownEnum.Value_47 && state != UnknownEnum.Value_66 && state != UnknownEnum.Value_38)
    momemtum = false;

if (state != UnknownEnum.Value_97 && state != UnknownEnum.Value_99)
    a = 0;

if (state != UnknownEnum.Value_62)
    facestompAnim = false;

if (state != UnknownEnum.Value_108 && state != UnknownEnum.Value_62 && state != UnknownEnum.Value_76 && state != UnknownEnum.Value_111)
    superslam = 0;

if (state != UnknownEnum.Value_104)
    machpunchAnim = false;

if (ladderbuffer > 0)
    ladderbuffer--;

if (state != UnknownEnum.Value_92)
    stompAnim = false;

if (state == UnknownEnum.Value_121 || state == UnknownEnum.Value_104 || ratmount_movespeed == 12)
{
    if (macheffect == false)
    {
        macheffect = true;
        toomuchalarm1 = 6;
        
        with (create_mach3effect(x, y, sprite_index, image_index - 1))
        {
            playerid = other.object_index;
            image_xscale = other.xscale;
        }
    }
}

if (!(state == UnknownEnum.Value_121) && !(state == UnknownEnum.Value_104) && ratmount_movespeed < 12)
    macheffect = false;

if (toomuchalarm1 > 0)
{
    toomuchalarm1 -= 1;
    
    if (toomuchalarm1 <= 0 && (state == UnknownEnum.Value_121 || state == UnknownEnum.Value_104 || ratmount_movespeed == 12))
    {
        with (create_mach3effect(x, y, sprite_index, image_index - 1))
        {
            playerid = other.object_index;
            image_xscale = other.xscale;
        }
        
        toomuchalarm1 = 6;
    }
}

if ((y > (room_height + 300) || y < -800) && !place_meeting(x, y, obj_verticalhallway) && !verticalhallway && room != custom_lvl_room && state != UnknownEnum.Value_89 && state != UnknownEnum.Value_186)
{
    x = roomstartx;
    y = roomstarty;
    visible = true;
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
    
    if (state == UnknownEnum.Value_17)
    {
        state = UnknownEnum.Value_16;
        sprite_index = spr_ghostidle;
    }
    
    state = UnknownEnum.Value_146;
    visible = false;
    hsp = 0;
    vsp = 0;
    scr_soundeffect(27);
    
    with (instance_create(x, y + 540, obj_technicaldifficulty))
    {
        playerid = other.id;
        
        if (!other.isgustavo)
            sprite = choose(264, 896, 2780);
        else
            sprite = 2787;
    }
    
    with (obj_ghostfollow)
    {
        x = xstart;
        y = ystart;
    }
    
    vsp = 10;
}

if (character == "S")
{
    if (state == UnknownEnum.Value_101 || state == UnknownEnum.Value_100)
        state = UnknownEnum.Value_0;
}

if (character != "M")
{
    if (!scr_solid_player(x, y))
    {
        if (state != UnknownEnum.Value_260 && state != UnknownEnum.Value_35 && state != UnknownEnum.Value_34 && !(state == UnknownEnum.Value_106 && sprite_index == spr_tumbleend) && (state != UnknownEnum.Value_116 && state != UnknownEnum.Value_115) && sprite_index != spr_player_breakdancesuper && sprite_index != spr_player_barrelslipnslide && sprite_index != spr_player_barrelroll && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != UnknownEnum.Value_59 && state != UnknownEnum.Value_100 && state != UnknownEnum.Value_67 && state != UnknownEnum.Value_68 && state != UnknownEnum.Value_33 && (state != UnknownEnum.Value_72 && sprite_index != spr_player_crouchshoot) && state != UnknownEnum.Value_99 && state != UnknownEnum.Value_102 && state != UnknownEnum.Value_61 && state != UnknownEnum.Value_65 && state != UnknownEnum.Value_107 && state != UnknownEnum.Value_101 && state != UnknownEnum.Value_30 && state != UnknownEnum.Value_29 && state != UnknownEnum.Value_5)
            mask_index = spr_player_mask;
        else
            mask_index = spr_crouchmask;
    }
    else
    {
        mask_index = spr_crouchmask;
    }
}
else
{
    mask_index = spr_pepperman_mask;
}

if (state == UnknownEnum.Value_46 || sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder || state == UnknownEnum.Value_90 || state == UnknownEnum.Value_61 || state == UnknownEnum.Value_112 || state == UnknownEnum.Value_7 || state == UnknownEnum.Value_98 || state == UnknownEnum.Value_95 || state == UnknownEnum.Value_89 || state == UnknownEnum.Value_186 || state == UnknownEnum.Value_152 || state == UnknownEnum.Value_146 || place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
    cutscene = true;
else
    cutscene = false;

if (((place_meeting(x, y, obj_door) && !place_meeting(x, y, obj_doorblocked)) || place_meeting(x, y, obj_taxi) || place_meeting(x, y, obj_dialognpc) || place_meeting(x, y, obj_dresser) || (place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_filedoor) || place_meeting(x, y, obj_optiondoor)) || (place_meeting(x, y, obj_exitgate) && global.panic == true)) && !instance_exists(obj_uparrow) && scr_solid(x, y + 1) && state == UnknownEnum.Value_0 && obj_player1.spotlight == true)
{
    with (instance_create(x, y, obj_uparrow))
        playerid = other.object_index;
}

if (movespeed >= 16 && state == UnknownEnum.Value_121 && !instance_exists(speedlineseffectid))
{
    with (instance_create(x, y, obj_speedlines))
    {
        playerid = other.object_index;
        other.speedlineseffectid = id;
    }
}

with (obj_ratblock)
    scr_ratblock_destroy();

scr_collide_destructibles();

if (state != UnknownEnum.Value_17 && state != UnknownEnum.Value_186 && state != UnknownEnum.Value_208 && state != UnknownEnum.Value_18 && state != UnknownEnum.Value_150 && state != UnknownEnum.Value_4 && state != UnknownEnum.Value_112 && state != UnknownEnum.Value_97 && state != UnknownEnum.Value_7 && state != UnknownEnum.Value_95 && state != UnknownEnum.Value_118 && state != UnknownEnum.Value_90 && state != UnknownEnum.Value_98 && state != UnknownEnum.Value_39 && state != UnknownEnum.Value_64 && state != UnknownEnum.Value_46 && state != UnknownEnum.Value_89)
    scr_collide_player();

if (state == UnknownEnum.Value_150 || state == UnknownEnum.Value_186 || state == UnknownEnum.Value_208)
{
    x += hsp;
    y += vsp;
}

if (state == UnknownEnum.Value_118)
    scr_collide_player();

if (state != UnknownEnum.Value_95)
    image_blend = c_white;

prevstate = state;
prevsprite = sprite_index;

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_47,
    Value_48,
    Value_49,
    Value_50,
    Value_51,
    Value_52,
    Value_53,
    Value_54,
    Value_55,
    Value_56,
    Value_57,
    Value_58,
    Value_59,
    Value_60,
    Value_61,
    Value_62,
    Value_63,
    Value_64,
    Value_65,
    Value_66,
    Value_67,
    Value_68,
    Value_69,
    Value_70,
    Value_71,
    Value_72,
    Value_73,
    Value_74,
    Value_75,
    Value_76,
    Value_77,
    Value_78,
    Value_79,
    Value_80,
    Value_81,
    Value_82,
    Value_83,
    Value_84,
    Value_85,
    Value_86,
    Value_87,
    Value_88,
    Value_89,
    Value_90,
    Value_91,
    Value_92,
    Value_93,
    Value_94,
    Value_95,
    Value_96,
    Value_97,
    Value_98,
    Value_99,
    Value_100,
    Value_101,
    Value_102,
    Value_103,
    Value_104,
    Value_105,
    Value_106,
    Value_107,
    Value_108,
    Value_109,
    Value_111 = 111,
    Value_112,
    Value_113,
    Value_114,
    Value_115,
    Value_116,
    Value_117,
    Value_118,
    Value_119,
    Value_120,
    Value_121,
    Value_122,
    Value_123,
    Value_124,
    Value_137 = 137,
    Value_144 = 144,
    Value_146 = 146,
    Value_147,
    Value_148,
    Value_150 = 150,
    Value_152 = 152,
    Value_153,
    Value_154,
    Value_156 = 156,
    Value_165 = 165,
    Value_183 = 183,
    Value_184,
    Value_185,
    Value_186,
    Value_187,
    Value_190 = 190,
    Value_191,
    Value_192,
    Value_193,
    Value_194,
    Value_195,
    Value_196,
    Value_197,
    Value_198,
    Value_200 = 200,
    Value_201,
    Value_202,
    Value_203,
    Value_204,
    Value_206 = 206,
    Value_207,
    Value_208,
    Value_210 = 210,
    Value_211,
    Value_212,
    Value_213,
    Value_214,
    Value_215,
    Value_216,
    Value_225 = 225,
    Value_252 = 252,
    Value_254 = 254,
    Value_257 = 257,
    Value_259 = 259,
    Value_260,
    Value_261,
    Value_265 = 265
}
