var _state, _transfo, spr, b, change_pos, spd;

if (room == Realtitlescreen || room == rm_eggplantdisclaimer || room == rank_room || room == rm_levelselect || room == timesuproom || room == boss_room1 || room == characterselect || room == hub_loadingscreen)
{
    visible = false;
    sprite_index = spr_tv_off;
}
else
{
    visible = true;
}

if (instance_exists(obj_debugcontroller) && !obj_debugcontroller.showhud)
    visible = false;

image_speed = 0.35;

if (targetgolf != -4 && !instance_exists(targetgolf))
    targetgolf = -4;

if (targetgolf != -4 && !view_visible[1])
{
    view_visible[1] = true;
    view_enabled = true;
}

if (bubblespr != -4 && bubblespr != 1324)
{
    if (prompt != -4)
        prompt_buffer = 2;
    
    bubbleindex += image_speed;
    
    if (floor(bubbleindex) == sprite_get_number(bubblespr))
    {
        bubbleindex = 0;
        
        switch (bubblespr)
        {
            case 455:
                bubblespr = 1293;
                break;
            
            case 433:
                bubblespr = 1324;
                
                if (prompt == -4 || prompt == "")
                    bubblespr = -4;
                
                break;
        }
    }
}

switch (state)
{
    case states.normal:
        idlespr = 2700;
        
        if (!obj_player.ispeppino)
            idlespr = 802;
        
        if (obj_player.isgustavo)
        {
            idlespr = 2769;
            
            if (global.panic)
                idlespr = 1767;
        }
        
        _state = obj_player1.state;
        
        if (_state == states.backbreaker || _state == states.chainsaw)
            _state = obj_player1.tauntstoredstate;
        
        _transfo = true;
        
        switch (_state)
        {
            case states.knightpep:
            case states.knightpepattack:
            case states.knightpepslopes:
                idlespr = 596;
                break;
            
            case states.bombpep:
                idlespr = 2590;
                break;
            
            case states.fireass:
                idlespr = 550;
                
                if (obj_player1.sprite_index == obj_player1.spr_scaredjump1 || obj_player1.sprite_index == obj_player1.spr_scaredjump2)
                    idlespr = 2803;
                
                break;
            
            case states.tumble:
                if (obj_player1.sprite_index == obj_player1.spr_tumble || obj_player1.sprite_index == obj_player1.spr_tumblestart || obj_player1.sprite_index == obj_player1.spr_tumbleend)
                    idlespr = 1711;
                
                break;
            
            case states.firemouth:
                idlespr = 1139;
                break;
            
            case states.ghost:
            case states.ghostpossess:
                idlespr = 2147;
                break;
            
            case states.stunned:
                if (obj_player1.sprite_index == obj_player1.spr_squished)
                    idlespr = 339;
                
                break;
            
            case states.normal:
            case states.jump:
            case states.handstandjump:
            case states.crouch:
            case states.ladder:
                with (obj_player1)
                {
                    if (shotgunAnim)
                        other.idlespr = 334;
                    else if (global.mort)
                        other.idlespr = 2654;
                }
                
                break;
            
            case states.freefallprep:
            case states.freefall:
            case states.freefallland:
                if (obj_player1.shotgunAnim)
                    idlespr = 334;
                
                break;
            
            case states.pistol:
                if (global.mort)
                    idlespr = 2654;
                
                break;
            
            case states.shotgun:
            case states.shotgunfreefall:
            case states.shotgunjump:
            case states.shotgundash:
            case states.shotguncrouch:
            case states.shotguncrouchjump:
                idlespr = 334;
                break;
            
            case states.barrel:
                idlespr = 185;
                break;
            
            case states.golf:
                idlespr = 1296;
                break;
            
            case states.rocket:
                idlespr = 135;
                break;
            
            case states.cheeseball:
                idlespr = 2240;
                break;
            
            case states.cheesepep:
            case states.cheesepepstick:
            case states.cheesepepstickside:
            case states.cheesepepstickup:
                idlespr = 2457;
                break;
            
            case states.boxxedpep:
            case states.boxxedpepjump:
            case states.boxxedpepspin:
                idlespr = 2832;
                break;
            
            case states.mach2:
            case states.climbwall:
            case states.machroll:
            case states.grind:
                if (obj_player1.skateboarding)
                    idlespr = 1197;
                
                break;
            
            default:
                _transfo = false;
                break;
        }
        
        if (!obj_player1.ispeppino)
        {
            spr = sprite_get_name(idlespr);
            spr = asset_get_index(concat(spr, "N"));
            
            if (spr > -1)
                idlespr = spr;
        }
        
        if (!_transfo)
        {
            with (obj_player1)
            {
                if (mach4mode == true)
                    tv_do_expression(2845);
                else if (state == states.mach3 || sprite_index == spr_mach3boost)
                    tv_do_expression(855);
                else if (state == states.hurt)
                    tv_do_expression(1319);
                else if (state == states.ratmounthurt)
                    tv_do_expression(1497);
                else if (global.combo >= 3 && !obj_player.isgustavo)
                    tv_do_expression(2453);
                else if (global.stylethreshold >= 3 && !obj_player.isgustavo)
                    tv_do_expression(307);
            }
        }
        
        switch (sprite_index)
        {
            case spr_tv_off:
                if (visible)
                {
                    sprite_index = spr_tv_open;
                    image_index = 0;
                }
                
                break;
            
            case spr_tv_open:
                if (floor(image_index) == (image_number - 1))
                    sprite_index = idlespr;
                
                break;
            
            case spr_tv_idle:
            case spr_tv_idleN:
                if (idleanim > 0)
                    idleanim--;
                
                if (sprite_index != idlespr)
                    sprite_index = idlespr;
                
                if (idleanim <= 0 && floor(image_index) == (image_number - 1))
                {
                    sprite_index = choose(spr_tv_idleanim1, spr_tv_idleanim2);
                    
                    if (!obj_player1.ispeppino)
                    {
                        if (sprite_index == spr_tv_idleanim1)
                            sprite_index = spr_tv_idleanim1N;
                        
                        if (sprite_index == spr_tv_idleanim2)
                            sprite_index = spr_tv_idleanim2N;
                    }
                    
                    image_index = 0;
                }
                
                break;
            
            case spr_tv_idleanim1:
            case spr_tv_idleanim2:
            case spr_tv_idleanim1N:
            case spr_tv_idleanim2N:
                if (floor(image_index) == (image_number - 1))
                {
                    sprite_index = idlespr;
                    idleanim = 240 + (60 * irandom_range(-1, 2));
                }
                
                if (idlespr != 2700 && idlespr != 802)
                    sprite_index = idlespr;
                
                break;
            
            default:
                sprite_index = idlespr;
        }
        
        if (sprite_index != spr_tv_open)
        {
            if (!ds_list_empty(tvprompts_list))
            {
                b = ds_list_find_value(tvprompts_list, 0);
                prompt_buffer = prompt_max;
                
                if (b[0] != "" && b[0] != -4)
                {
                    bubblespr = 455;
                    bubbleindex = 0;
                    prompt = b[0];
                    promptspd = b[3];
                    promptx = promptxstart;
                }
                else
                {
                    if (bubblespr != -4 && bubblespr != 1324)
                        bubblespr = 433;
                    
                    if (bubblespr == 1324)
                        bubblespr = -4;
                    
                    bubbleindex = 0;
                    promptx = promptxstart;
                    prompt = -4;
                }
                
                if (b[1] == states.normal)
                {
                    sprite_index = spr_tv_open;
                    image_index = 0;
                    tvsprite = b[2];
                    
                    if (!obj_player1.ispeppino)
                    {
                        spr = sprite_get_name(tvsprite);
                        spr = asset_get_index(concat(spr, "N"));
                        
                        if (spr > -1)
                            tvsprite = spr;
                    }
                }
                else
                {
                    tvsprite = b[2];
                    
                    if (!obj_player1.ispeppino)
                    {
                        spr = sprite_get_name(tvsprite);
                        spr = asset_get_index(concat(spr, "N"));
                        
                        if (spr > -1)
                            tvsprite = spr;
                    }
                    
                    sprite_index = tvsprite;
                    image_index = 0;
                }
                
                state = states.transitioncutscene;
            }
            else
            {
                bubblespr = -4;
            }
        }
        
        break;
    
    case states.transitioncutscene:
        if (sprite_index == spr_tv_open && floor(image_index) == (image_number - 1))
            sprite_index = tvsprite;
        
        if (sprite_index == tvsprite)
        {
            if (prompt_buffer > 0)
            {
                prompt_buffer--;
            }
            else
            {
                promptx = promptxstart;
                ds_list_delete(tvprompts_list, 0);
                state = states.normal;
            }
        }
        
        break;
    
    case UnknownEnum.Value_250:
        sprite_index = spr_tv_whitenoise;
        
        if (noisebuffer > 0)
        {
            noisebuffer--;
        }
        else
        {
            noisebuffer = noisemax;
            
            if (expressionsprite != -4)
            {
                state = UnknownEnum.Value_251;
                sprite_index = expressionsprite;
            }
            else
            {
                state = states.normal;
            }
            
            image_index = 0;
        }
        
        break;
    
    case UnknownEnum.Value_251:
        switch (expressionsprite)
        {
            case 1319:
                if (obj_player1.state != states.hurt)
                {
                    if (expressionbuffer > 0)
                    {
                        expressionbuffer--;
                    }
                    else
                    {
                        state = UnknownEnum.Value_250;
                        expressionsprite = -4;
                    }
                }
                
                break;
            
            case 1497:
                if (obj_player1.state != states.ratmounthurt)
                {
                    if (expressionbuffer > 0)
                    {
                        expressionbuffer--;
                    }
                    else
                    {
                        state = UnknownEnum.Value_250;
                        expressionsprite = -4;
                    }
                }
                
                break;
            
            case 2453:
                if (global.combo < 3 || obj_player1.isgustavo)
                {
                    state = UnknownEnum.Value_250;
                    expressionsprite = -4;
                    
                    if (obj_player1.state == states.hurt)
                        tv_do_expression(1319);
                }
                
                break;
            
            case 731:
            case 263:
                if (expressionbuffer > 0)
                {
                    expressionbuffer--;
                }
                else
                {
                    state = UnknownEnum.Value_250;
                    expressionsprite = -4;
                }
                
                break;
            
            case 855:
                with (obj_player1)
                {
                    if (state != states.mach3 && (state != states.chainsaw || tauntstoredstate != states.mach3) && sprite_index != spr_mach3boost && mach4mode == false)
                    {
                        other.state = UnknownEnum.Value_250;
                        other.expressionsprite = -4;
                    }
                }
                
                break;
            
            case 2845:
                with (obj_player1)
                {
                    if (mach4mode == false)
                    {
                        other.state = UnknownEnum.Value_250;
                        other.expressionsprite = -4;
                    }
                }
                
                break;
            
            case 307:
                _transfo = false;
                
                with (obj_player1)
                {
                    if (!scr_transformationcheck())
                        _transfo = true;
                    
                    if (isgustavo)
                        _transfo = true;
                }
                
                if (global.stylethreshold < 3 || _transfo)
                {
                    state = UnknownEnum.Value_250;
                    expressionsprite = -4;
                }
                
                break;
        }
        
        if (!ds_list_empty(tvprompts_list))
        {
            state = UnknownEnum.Value_250;
            expressionsprite = -4;
        }
        
        break;
}

change_pos = false;

if (obj_player.x > (room_width - 224) && obj_player.y < 187)
    change_pos = true;

if (bubblespr != -4 && obj_player.x > 316 && obj_player.y < 101)
    change_pos = true;

spd = 15;

if (change_pos)
    hud_posY = Approach(hud_posY, -300, spd);
else
    hud_posY = Approach(hud_posY, 0, spd);

pizzaface_index += 0.35;
hand_index += 0.35;
johnface_index += 0.35;

if (global.panic && global.fill > 0)
{
    showtime_buffer = 100;
    
    if (!instance_exists(obj_ghostcollectibles))
        timer_y = Approach(timer_y, timer_ystart, 1);
    else
        timer_y = Approach(timer_y, timer_ystart + 212, 4);
}
else if (global.panic)
{
    if (pizzaface_sprite == 2201)
    {
        pizzaface_sprite = 906;
        pizzaface_index = 0;
    }
    else if (pizzaface_sprite == 906)
    {
        if (floor(pizzaface_index) == (sprite_get_number(pizzaface_sprite) - 1))
        {
            pizzaface_sprite = 2662;
            pizzaface_index = 0;
        }
    }
    else if (showtime_buffer > 0)
    {
        showtime_buffer--;
    }
    else
    {
        timer_y = Approach(timer_y, timer_ystart + 212, 1);
    }
}
else
{
    pizzaface_sprite = 2201;
    hand_sprite = 1117;
    timer_y = timer_ystart + 212;
}

if (global.panic && global.fill < (chunkmax / 5))
    hand_sprite = 2670;

barfill_x -= 0.2;

if (barfill_x < -173)
    barfill_x = 0;

if (pizzaface_index > (sprite_get_number(pizzaface_sprite) - 1))
    pizzaface_index = frac(pizzaface_index);

if (hand_index > (sprite_get_number(hand_sprite) - 1))
    hand_index = frac(hand_index);

if (johnface_index > (sprite_get_number(johnface_sprite) - 1))
    johnface_index = frac(johnface_index);

combo_posX = Wave(-5, 5, 2, 20);

if (global.combotime > 0 && global.combo != 0)
{
    switch (combo_state)
    {
        case 0:
            combo_posY += combo_vsp;
            combo_vsp += 0.5;
            
            if (combo_posY > 20)
                combo_state++;
            
            break;
        
        case 1:
            combo_posY = lerp(combo_posY, 0, 0.05);
            
            if (combo_posY < 1)
            {
                combo_posY = 0;
                combo_vsp = 0;
                combo_state++;
            }
            
            break;
        
        case 2:
            if (global.combotime < 30)
            {
                combo_posY += combo_vsp;
                
                if (combo_vsp < 20)
                    combo_vsp += 0.5;
                
                if (combo_posY > 0)
                {
                    combo_posY = 0;
                    combo_vsp = -1;
                    
                    if (global.combotime < 15)
                        combo_vsp = -2;
                }
            }
            else
            {
                combo_posY = Approach(combo_posY, 0, 10);
            }
            
            break;
    }
}
else
{
    combo_posY = Approach(combo_posY, -500, 5);
    combo_vsp = 0;
    combo_state = 0;
}

combofill_index += 0.35;

if (combofill_index > (sprite_get_number(spr_tv_combobubblefill) - 1))
    combofill_index = frac(combofill_index);

enum UnknownEnum
{
    Value_0,
    Value_5 = 5,
    Value_8 = 8,
    Value_9,
    Value_10,
    Value_16 = 16,
    Value_17,
    Value_21 = 21,
    Value_24 = 24,
    Value_25,
    Value_29 = 29,
    Value_30,
    Value_33 = 33,
    Value_34,
    Value_35,
    Value_37 = 37,
    Value_38,
    Value_42 = 42,
    Value_47 = 47,
    Value_48,
    Value_51 = 51,
    Value_57 = 57,
    Value_59 = 59,
    Value_61 = 61,
    Value_65 = 65,
    Value_66,
    Value_67,
    Value_68,
    Value_70 = 70,
    Value_71,
    Value_72,
    Value_78 = 78,
    Value_84 = 84,
    Value_92 = 92,
    Value_93,
    Value_100 = 100,
    Value_104 = 104,
    Value_107 = 107,
    Value_108,
    Value_111 = 111,
    Value_113 = 113,
    Value_121 = 121,
    Value_122,
    Value_148 = 148,
    Value_184 = 184,
    Value_196 = 196,
    Value_250 = 250,
    Value_251
}
