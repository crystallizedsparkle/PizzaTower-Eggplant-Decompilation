var prevmask;

prevhsp = hsp;
prevmove = move;
prevmovespeed = movespeed;
previcemovespeed = icemovespeed;
prevxscale = xscale;
prevmask = mask_index;

switch (state)
{
    case states.normal:
        scr_player_normal();
        break;
    
    case states.revolver:
        scr_player_revolver();
        break;
    
    case states.dynamite:
        scr_player_dynamite();
        break;
    
    case states.boots:
        scr_player_boots();
        break;
    
    case states.grabbed:
        scr_player_grabbed();
        break;
    
    case states.finishingblow:
        scr_player_finishingblow();
        break;
    
    case states.tumble:
        scr_player_tumble();
        break;
    
    case states.titlescreen:
        scr_player_titlescreen();
        break;
    
    case states.ejected:
        scr_player_ejected();
        break;
    
    case states.firemouth:
        scr_player_firemouth();
        break;
    
    case states.fireass:
        scr_player_fireass();
        break;
    
    case states.transitioncutscene:
        scr_player_transitioncutscene();
        break;
    
    case states.hookshot:
        scr_playerN_hookshot();
        break;
    
    case states.slap:
        scr_player_slap();
        break;
    
    case states.tacklecharge:
        scr_player_tacklecharge();
        break;
    
    case states.cheesepep:
        scr_player_cheesepep();
        break;
    
    case states.cheesepepjump:
        scr_player_cheesepepjump();
        break;
    
    case states.cheesepepfling:
        scr_player_cheesepepfling();
        break;
    
    case states.cheeseball:
        scr_player_cheeseball();
        break;
    
    case states.cheeseballclimbwall:
        scr_player_cheeseballclimbwall();
        break;
    
    case states.cheesepepstickside:
        scr_player_cheesepepstickside();
        break;
    
    case states.cheesepepstickup:
        scr_player_cheesepepstickup();
        break;
    
    case states.cheesepepstick:
        scr_player_cheesepepstick();
        break;
    
    case states.cheesepeplaunch:
        scr_player_cheesepeplaunch();
        break;
    
    case states.boxxedpep:
        scr_player_boxxedpep();
        break;
    
    case states.boxxedpepjump:
        scr_player_boxxedpepjump();
        break;
    
    case states.boxxedpepspin:
        scr_player_boxxedpepspin();
        break;
    
    case states.pistolaim:
        scr_player_pistolaim();
        break;
    
    case states.climbwall:
        scr_player_climbwall();
        break;
    
    case states.knightpepslopes:
        scr_player_knightpepslopes();
        break;
    
    case states.portal:
        scr_player_portal();
        break;
    
    case states.secondjump:
        scr_player_secondjump();
        break;
    
    case states.chainsawbump:
        scr_player_chainsawbump();
        break;
    
    case states.handstandjump:
        scr_player_handstandjump();
        break;
    
    case states.lungeattack:
        scr_player_lungeattack();
        break;
    
    case states.lungegrab:
        scr_player_lungegrab();
        break;
    
    case states.dashtumble:
        scr_player_dashtumble();
        break;
    
    case states.shoulderbash:
        scr_player_shoulderbash();
        break;
    
    case states.gottreasure:
        scr_player_gottreasure();
        break;
    
    case states.knightpep:
        scr_player_knightpep();
        break;
    
    case states.knightpepattack:
        scr_player_knightpepattack();
        break;
    
    case states.knightpepbump:
        scr_player_knightpepbump();
        break;
    
    case states.meteorpep:
        scr_player_meteorpep();
        break;
    
    case states.bombpep:
        scr_player_bombpep();
        break;
    
    case states.bombpepup:
        scr_player_bombpepup();
        break;
    
    case states.bombpepside:
        scr_player_bombpepside();
        break;
    
    case states.bombgrab:
        scr_player_bombgrab();
        break;
    
    case states.grabbing:
        scr_player_grabbing();
        break;
    
    case states.chainsawpogo:
        scr_player_chainsawpogo();
        break;
    
    case states.shotgunjump:
        scr_player_shotgunjump();
        break;
    
    case states.stunned:
        scr_player_stunned();
        break;
    
    case states.highjump:
        scr_player_highjump();
        break;
    
    case states.chainsaw:
        scr_player_chainsaw();
        break;
    
    case states.hit:
        scr_player_hit();
        break;
    
    case states.thrown:
        scr_player_thrown();
        break;
    
    case states.facestomp:
        scr_player_facestomp();
        break;
    
    case states.timesup:
        scr_player_timesup();
        break;
    
    case states.machroll:
        scr_player_machroll();
        break;
    
    case states.pistol:
        scr_player_pistol();
        break;
    
    case states.shotgun:
        scr_player_shotgun();
        break;
    
    case states.shotguncrouch:
        scr_player_shotguncrouch();
        break;
    
    case states.shotguncrouchjump:
        scr_player_shotguncrouchjump();
        break;
    
    case states.shotgunshoot:
        scr_player_shotgunshoot();
        break;
    
    case states.shotgunfreefall:
        scr_player_shotgunfreefall();
        break;
    
    case states.shotgundash:
        scr_player_shotgundash();
        break;
    
    case states.machfreefall:
        scr_player_machfreefall();
        break;
    
    case states.throwing:
        scr_player_throwing();
        break;
    
    case states.superslam:
        scr_player_superslam();
        break;
    
    case states.slam:
        scr_player_slam();
        break;
    
    case states.skateboard:
        scr_player_skateboard();
        break;
    
    case states.grind:
        scr_player_grind();
        break;
    
    case states.grab:
        scr_player_grab();
        break;
    
    case states.punch:
        scr_player_punch();
        break;
    
    case states.backkick:
        scr_player_backkick();
        break;
    
    case states.uppunch:
        scr_player_uppunch();
        break;
    
    case states.shoulder:
        scr_player_shoulder();
        break;
    
    case states.backbreaker:
        scr_player_backbreaker();
        break;
    
    case states.graffiti:
        scr_player_graffiti();
        break;
    
    case states.bossdefeat:
        scr_player_bossdefeat();
        break;
    
    case states.bossintro:
        scr_player_bossintro();
        break;
    
    case states.smirk:
        scr_player_smirk();
        break;
    
    case states.pizzathrow:
        scr_player_pizzathrow();
        break;
    
    case states.gameover:
        scr_player_gameover();
        break;
    
    case states.Sjumpland:
        scr_player_Sjumpland();
        break;
    
    case states.freefallprep:
        scr_player_freefallprep();
        break;
    
    case states.runonball:
        scr_player_runonball();
        break;
    
    case states.boulder:
        scr_player_boulder();
        break;
    
    case states.keyget:
        scr_player_keyget();
        break;
    
    case states.tackle:
        scr_player_tackle();
        break;
    
    case states.slipnslide:
        scr_player_slipnslide();
        break;
    
    case states.ladder:
        scr_player_ladder();
        break;
    
    case states.jump:
        scr_player_jump();
        break;
    
    case states.victory:
        scr_player_victory();
        break;
    
    case states.comingoutdoor:
        scr_player_comingoutdoor();
        break;
    
    case states.Sjump:
        scr_player_Sjump();
        break;
    
    case states.Sjumpprep:
        scr_player_Sjumpprep();
        break;
    
    case states.crouch:
        scr_player_crouch();
        break;
    
    case states.crouchjump:
        scr_player_crouchjump();
        break;
    
    case states.crouchslide:
        scr_player_crouchslide();
        break;
    
    case states.mach1:
        scr_player_mach1();
        break;
    
    case states.mach2:
        scr_player_mach2();
        break;
    
    case states.mach3:
        scr_player_mach3();
        break;
    
    case states.machslide:
        scr_player_machslide();
        break;
    
    case states.bump:
        scr_player_bump();
        break;
    
    case states.hurt:
        scr_player_hurt();
        break;
    
    case states.freefall:
        scr_player_freefall();
        break;
    
    case states.freefallland:
        scr_player_freefallland();
        break;
    
    case states.hang:
        scr_player_hang();
        break;
    
    case states.door:
        scr_player_door();
        break;
    
    case states.barrel:
        scr_player_barrel();
        break;
    
    case states.barreljump:
        scr_player_barreljump();
        break;
    
    case states.barrelslide:
        scr_player_barrelslide();
        break;
    
    case states.barrelclimbwall:
        scr_player_barrelclimbwall();
        break;
    
    case states.current:
        scr_player_current();
        break;
    
    case states.taxi:
        scr_player_taxi();
        break;
    
    case states.taxi_police:
        scr_player_taxi();
        break;
    
    case states.pogo:
        scr_player_pogo();
        break;
    
    case states.rideweenie:
        scr_player_rideweenie();
        break;
    
    case states.motorcycle:
        scr_player_motorcycle();
        break;
    
    case states.faceplant:
        scr_player_faceplant();
        break;
    
    case states.ghost:
        scr_player_ghost();
        break;
    
    case states.ghostpossess:
        scr_player_ghostpossess();
        break;
    
    case states.mort:
        scr_player_mort();
        break;
    
    case states.mortjump:
        scr_player_mortjump();
        break;
    
    case states.mortattack:
        scr_player_mortattack();
        break;
    
    case states.morthook:
        scr_player_morthook();
        break;
    
    case states.hook:
        scr_player_hook();
        break;
    
    case states.arena_intro:
        scr_player_arenaintro();
        break;
    
    case states.actor:
        scr_player_actor();
        break;
    
    case states.parry:
        scr_player_parry();
        break;
    
    case states.golf:
        scr_player_golf();
        break;
    
    case states.tube:
        scr_player_tube();
        break;
    
    case states.pummel:
        scr_player_pummel();
        break;
    
    case states.slipbanan:
        scr_player_slipbanan();
        break;
    
    case states.bombdelete:
        scr_player_bombdelete();
        break;
    
    case states.rocket:
        scr_player_rocket();
        break;
    
    case states.rocketslide:
        scr_player_rocketslide();
        break;
    
    case states.gotoplayer:
        scr_player_gotoplayer();
        break;
    
    case states.trickjump:
        scr_player_trickjump();
        break;
    
    case states.ridecow:
        scr_player_ridecow();
        break;
    
    case states.ratmount:
        scr_player_ratmount();
        break;
    
    case states.ratmounthurt:
        scr_player_ratmounthurt();
        break;
    
    case states.ratmountjump:
        scr_player_ratmountjump();
        break;
    
    case states.ratmountattack:
        scr_player_ratmountattack();
        break;
    
    case states.ratmountspit:
        scr_player_ratmountspit();
        break;
    
    case states.ratmountclimbwall:
        scr_player_ratmountclimbwall();
        break;
    
    case states.ratmountgroundpound:
        scr_player_ratmountgroundpound();
        break;
    
    case states.ratmountbounce:
        scr_player_ratmountbounce();
        break;
    
    case states.ratmountballoon:
        scr_player_ratmountballoon();
        break;
    
    case states.ratmountgrind:
        scr_player_ratmountgrind();
        break;
    
    case states.ratmounttumble:
        scr_player_ratmounttumble();
        break;
    
    case UnknownEnum.Value_259:
        scr_player_ratmountpunch();
        break;
    
    case states.ratmounttrickjump:
        scr_player_ratmounttrickjump();
        break;
    
    case states.ratmountskid:
        scr_player_ratmountskid();
        break;
    
    case states.blockstance:
        scr_player_blockstance();
        break;
    
    case states.balloon:
        scr_player_balloon();
        break;
    
    case states.debugstate:
        scr_player_debugstate();
        break;
    
    case states.trashjump:
        scr_player_trashjump();
        break;
    
    case states.trashroll:
        scr_player_trashroll();
        break;
    
    case states.stringfling:
        scr_player_stringfling();
        break;
    
    case states.stringjump:
        scr_player_stringjump();
        break;
    
    case states.stringfall:
        scr_player_stringfall();
        break;
    
    case states.noisejetpack:
        scr_player_noisejetpack();
        break;
    
    case states.spiderweb:
        scr_player_spiderweb();
        break;
    
    case states.animatronic:
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
    if (prevstate == states.trashroll && prevsprite != 1727 && prevsprite != 1636)
        create_debris(x, y, 2511);
}

if (!place_meeting(x, y + 1, obj_railparent))
{
    if (state == states.mach3 || state == states.mach2 || state == states.tumble)
        railmovespeed = Approach(railmovespeed, 0, 0.1);
    else
        railmovespeed = Approach(railmovespeed, 0, 0.5);
}

if (state != states.handstandjump && state != states.tumble)
    crouchslipbuffer = 0;

if (state != states.mach3)
    mach4mode = false;

if (ratshootbuffer > 0)
    ratshootbuffer--;

if (state != states.animatronic)
{
    animatronic_buffer = 360;
    animatronic_collect_buffer = 0;
}

if (state == states.boxxedpep && grounded && vsp > 0)
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

if (state != states.normal)
    breakdance_speed = 0.25;

if (!grounded && (state == states.trickjump || state == states.jump || state == states.mach1 || state == states.mach2 || state == states.mach3) && key_jump && global.noisejetpack == true)
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

if (grounded && vsp > 0 && state != states.noisejetpack)
    jetpackfuel = jetpackmax;

if (tauntstoredisgustavo)
{
    isgustavo = true;
    
    if (state != states.backbreaker && state != states.parry && state != states.graffiti)
        tauntstoredisgustavo = false;
}

if (state != states.mach3 && (state != states.machslide || sprite_index != spr_mach3boost))
{
    launch = false;
    launched = false;
    launch_buffer = 0;
}

if (launch_buffer > 0)
    launch_buffer--;
else
    launched = false;

if (state != states.finishingblow)
    finishingblow = false;

if (dash_doubletap > 0)
    dash_doubletap--;

if (cow_buffer > 0)
    cow_buffer--;

if (state == states.lungeattack)
    lunge_buffer = 14;

if (blur_effect > 0)
{
    blur_effect--;
}
else if (breakdance_speed >= 0.6 || mach4mode == true || boxxeddash == true || state == states.ghost || state == states.tumble || state == states.ratmountbounce || state == states.ratmountattack || state == states.handstandjump || (state == states.barrelslide || (state == states.grab && sprite_index == spr_swingding && swingdingdash <= 0) || (state == states.punch && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend)) || state == states.freefall || state == states.lungeattack))
{
    if (visible && !place_meeting(x, y, obj_secretportal) && !place_meeting(x, y, obj_secretportalstart))
    {
        blur_effect = 2;
        
        with (create_blur_afterimage(x, y, sprite_index, image_index - 1, xscale))
            playerid = other.id;
    }
}

if (state != states.chainsaw && state != states.bump && state != states.boxxedpep && state != states.boxxedpepspin && state != states.boxxedpepjump)
{
    boxxed = false;
    boxxeddash = false;
}

if (state != states.grab)
    grabbingenemy = false;

if (state != states.mach2 && state != states.mach3 && state != states.trickjump && state != states.ratmounttumble && state != states.ratmounttrickjump)
{
    ramp = false;
    ramp_points = false;
}

if (state != states.door && state != states.chainsaw && state != states.hit && place_meeting(x, y, obj_boxofpizza))
    state = states.crouch;

if (shoot_buffer > 0)
    shoot_buffer--;

if (cheesepep_buffer > 0)
    cheesepep_buffer--;

if (state != states.cheesepepstickside)
    yscale = 1;

if (invhurt_buffer > 0)
    invhurt_buffer--;

if (state == states.hurt)
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
    state = states.titlescreen;

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

if (state != states.Sjump)
    sjumpvsp = -12;

if (state != states.freefall)
    freefallvsp = 20;

if (supercharge > 9 && state != states.backbreaker)
    supercharged = true;

if (!instance_exists(pizzashieldid) && pizzashield == true)
{
    with (instance_create(x, y, obj_pizzashield))
    {
        playerid = other.object_index;
        other.pizzashieldid = id;
    }
}

if (visible == false && state == states.comingoutdoor)
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
    if ((state == states.punch || state == states.handstandjump) && !(obj_player2.state == states.punch || obj_player2.state == states.handstandjump))
        fightballadvantage = true;
    else if (!(obj_player2.state == states.punch || obj_player2.state == states.handstandjump))
        fightballadvantage = false;
}

if (state != states.pogo && state != states.backbreaker)
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

if (state != states.throwing)
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

if (state != states.mach3 && state != states.grabbed)
    fightball = false;

if (state != states.grabbed && state != states.hurt)
{
    if (grounded && state != states.grabbing)
        suplexmove = false;
}

if (state != states.freefall && (state != states.chainsaw || tauntstoredstate != states.freefall) && (state != states.backbreaker || tauntstoredstate != states.freefall))
    freefallsmash = -14;

if (global.playerhealth <= 0 && state != states.gameover)
{
    image_index = 0;
    sprite_index = spr_playerV_dead;
    state = states.gameover;
}

if (state == states.gameover && y > (room_height * 2))
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

if (baddiegrabbedID == 523 && (state == states.grab || state == states.superslam || state == states.tacklecharge))
    state = states.normal;

if (!(state == states.grab || state == states.superslam || state == states.mach2))
{
    baddiegrabbedID = 523;
    heavy = false;
}

if (cutscene == true && state != states.gotoplayer)
    global.heattime = 60;

if (anger == 0)
    angry = false;

if (anger > 0)
{
    angry = true;
    anger -= 1;
}

if (sprite_index == spr_winding && state != states.normal)
    windingAnim = 0;

if (state != states.grab)
    swingdingbuffer = 0;

if (state == UnknownEnum.Value_265 || state == states.rocket || state == states.rocketslide)
    grav = 0;
else if (state == states.barrel)
    grav = 0.6;
else if (state == states.ghost || state == states.ghostpossess)
    grav = 0;
else if (boxxed && state != states.boxxedpepspin)
    grav = 0.3;
else if (state == UnknownEnum.Value_254)
    grav = 0.5;
else if (state == states.boxxedpepspin)
    grav = 0.6;
else
    grav = 0.5;

if (state == states.barrel && key_jump2 && !jumpstop)
    grav = 0.4;

if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    instance_create(x + random_range(-5, 5), y + 46, obj_vomit);

if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (instance_create(x + random_range(-5, 5), y + 46, obj_vomit))
        sprite_index = spr_vomit2;
}

if (global.stylethreshold >= 2 && !instance_exists(angryeffectid) && state == states.normal && character != "V")
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
    
    if (!(state == states.door || state == states.tube || state == states.taxi || state == states.gottreasure || state == states.victory || state == states.gottreasure || state == states.actor || state == states.comingoutdoor || (state == states.knightpep && (sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder)) || instance_exists(obj_fadeout) || place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart)))
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

if (key_jump && !grounded && (state == states.mach2 || state == states.mach3) && (state != (states.climbwall & walljumpbuffer)) <= 0)
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
    create_particle(x + random_range(-25, 25), y + random_range(-35, 25), particles.keyparticles, 0);

if (inv_frames == false && hurted == false && state != states.ghost)
    image_alpha = 1;

if (state == states.punch || (state == states.jump && sprite_index == spr_playerN_noisebombspinjump) || state == states.tacklecharge || state == states.skateboard || state == states.knightpep || state == states.cheesepep || state == states.knightpepslopes || state == states.knightpepattack || state == states.bombpep || state == states.facestomp || state == states.machfreefall || state == states.facestomp || state == states.mach3 || state == states.freefall || state == states.Sjump)
    attacking = true;
else
    attacking = false;

if (state == states.throwing || state == states.backkick || state == states.shoulder || state == states.uppunch)
    grabbing = true;
else
    grabbing = false;

if ((state == states.ratmountbounce && vsp >= 0) || sprite_index == spr_player_Sjumpcancel || sprite_index == spr_swingding || sprite_index == spr_tumble || state == states.boxxedpepspin || state == states.trashroll || state == states.trashjump || state == states.shotgundash || (state == states.shotgunfreefall && (sprite_index == spr_shotgunjump2 || sprite_index == spr_shotgunjump3)) || state == states.Sjump || state == states.rocket || state == states.rocketslide || state == states.chainsawbump || state == states.punch || state == states.faceplant || state == states.rideweenie || state == states.mach3 || (state == states.jump && sprite_index == spr_playerN_noisebombspinjump) || state == states.freefall || state == states.fireass || state == UnknownEnum.Value_254 || state == states.firemouth || state == states.hookshot || state == UnknownEnum.Value_254 || state == states.skateboard || state == states.mach4 || state == states.Sjump || state == states.machfreefall || state == states.tacklecharge || (state == states.superslam && sprite_index == spr_piledriver) || state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes || state == states.trickjump || state == states.cheesepep || state == states.cheeseball || state == states.ratmounttumble || state == states.ratmountgroundpound || state == UnknownEnum.Value_259 || state == UnknownEnum.Value_265 || ratmount_movespeed == 12 || state == states.slipbanan || state == states.shoulderbash)
    instakillmove = true;
else
    instakillmove = false;

if (state == states.ratmountbounce && vsp < 0)
    stunmove = true;
else
    stunmove = false;

if (flash == true && alarm[0] <= 0)
    alarm[0] = 0.15 * room_speed;

if (state != states.ladder)
    hooked = false;

if (state != states.mach3 && state != states.machslide)
    autodash = false;

if ((state != states.jump && state != states.crouchjump && state != states.slap) || vsp < 0)
    fallinganimation = 0;

if (state != states.freefallland && state != states.normal && state != states.machslide && state != states.jump)
    facehurt = false;

if (state != states.normal && state != states.machslide)
    machslideAnim = false;

if (state != states.normal && state != states.ratmount)
{
    idle = 0;
    dashdust = false;
}

if (state != states.mach1 && state != states.cheesepepjump && state != states.jump && state != states.hookshot && state != states.handstandjump && state != states.normal && state != states.mach2 && state != states.mach3 && state != states.freefallprep && state != states.knightpep && state != states.shotgun && state != states.knightpepslopes)
    momemtum = false;

if (state != states.Sjump && state != states.Sjumpprep)
    a = 0;

if (state != states.facestomp)
    facestompAnim = false;

if (state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefallland)
    superslam = 0;

if (state != states.mach2)
    machpunchAnim = false;

if (ladderbuffer > 0)
    ladderbuffer--;

if (state != states.jump)
    stompAnim = false;

if (state == states.mach3 || state == states.mach2 || ratmount_movespeed == 12)
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

if (!(state == states.mach3) && !(state == states.mach2) && ratmount_movespeed < 12)
    macheffect = false;

if (toomuchalarm1 > 0)
{
    toomuchalarm1 -= 1;
    
    if (toomuchalarm1 <= 0 && (state == states.mach3 || state == states.mach2 || ratmount_movespeed == 12))
    {
        with (create_mach3effect(x, y, sprite_index, image_index - 1))
        {
            playerid = other.object_index;
            image_xscale = other.xscale;
        }
        
        toomuchalarm1 = 6;
    }
}

if ((y > (room_height + 300) || y < -800) && !place_meeting(x, y, obj_verticalhallway) && !verticalhallway && room != custom_lvl_room && state != states.gameover && state != states.gotoplayer)
{
    x = roomstartx;
    y = roomstarty;
    visible = true;
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
    
    if (state == states.ghostpossess)
    {
        state = states.ghost;
        sprite_index = spr_ghostidle;
    }
    
    state = states.actor;
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
    if (state == states.crouchjump || state == states.crouch)
        state = states.normal;
}

if (character != "M")
{
    if (!scr_solid_player(x, y))
    {
        if (state != UnknownEnum.Value_260 && state != states.boxxedpepjump && state != states.boxxedpepspin && !(state == states.bump && sprite_index == spr_tumbleend) && (state != states.barrelslide && state != states.barrelclimbwall) && sprite_index != spr_player_breakdancesuper && sprite_index != spr_player_barrelslipnslide && sprite_index != spr_player_barrelroll && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != states.stunned && state != states.crouch && state != states.shotguncrouch && state != states.shotguncrouchjump && state != states.boxxedpep && (state != states.pistol && sprite_index != spr_player_crouchshoot) && state != states.Sjumpprep && state != states.crouchslide && state != states.chainsaw && state != states.machroll && state != states.hurt && state != states.crouchjump && state != states.cheesepepstickup && state != states.cheesepepstickside && state != states.tumble)
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

if (state == states.gottreasure || sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder || state == states.keyget || state == states.chainsaw || state == states.door || state == states.ejected || state == states.victory || state == states.comingoutdoor || state == states.gameover || state == states.gotoplayer || state == states.taxi_police || state == states.actor || place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
    cutscene = true;
else
    cutscene = false;

if (((place_meeting(x, y, obj_door) && !place_meeting(x, y, obj_doorblocked)) || place_meeting(x, y, obj_taxi) || place_meeting(x, y, obj_dialognpc) || place_meeting(x, y, obj_dresser) || (place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_filedoor) || place_meeting(x, y, obj_optiondoor)) || (place_meeting(x, y, obj_exitgate) && global.panic == true)) && !instance_exists(obj_uparrow) && scr_solid(x, y + 1) && state == states.normal && obj_player1.spotlight == true)
{
    with (instance_create(x, y, obj_uparrow))
        playerid = other.object_index;
}

if (movespeed >= 16 && state == states.mach3 && !instance_exists(speedlineseffectid))
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

if (state != states.ghostpossess && state != states.gotoplayer && state != states.debugstate && state != states.titlescreen && state != states.tube && state != states.grabbed && state != states.door && state != states.Sjump && state != states.ejected && state != states.comingoutdoor && state != states.boulder && state != states.keyget && state != states.victory && state != states.portal && state != states.timesup && state != states.gottreasure && state != states.gameover)
    scr_collide_player();

if (state == states.tube || state == states.gotoplayer || state == states.debugstate)
{
    x += hsp;
    y += vsp;
}

if (state == states.boulder)
    scr_collide_player();

if (state != states.comingoutdoor)
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
