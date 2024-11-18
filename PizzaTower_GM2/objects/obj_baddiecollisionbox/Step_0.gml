var i, _obj_player, _playerindex, _ms, _prevstate, pepp_grab, lag;

if (!instance_exists(baddieID) && room != custom_lvl_room)
    instance_destroy();

if (instance_exists(baddieID))
{
    x = baddieID.x;
    y = baddieID.y;
    image_xscale = baddieID.image_xscale;
}

for (i = 0; i < 2; i++)
{
    _obj_player = asset_get_index(concat("obj_player", i + 1));
    _playerindex = i + 1;
    
    if (instance_exists(baddieID) && place_meeting(x, y, _obj_player) && _obj_player.cutscene == false)
    {
        if (baddieID.state != UnknownEnum.Value_4 && !baddieID.invincible && baddieID.state != UnknownEnum.Value_17)
        {
            with (_obj_player)
            {
                if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == false && !global.kungfu && sprite_index != spr_player_mach2jump && ((state == UnknownEnum.Value_3 && vsp > 0) || state == UnknownEnum.Value_92 || state == UnknownEnum.Value_103 || state == UnknownEnum.Value_79) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && !other.baddieID.invincible)
                {
                    scr_soundeffect(24);
                    image_index = 0;
                    
                    if (other.baddieID.object_index != obj_tank)
                    {
                        if (x != other.baddieID.x)
                            other.baddieID.image_xscale = -sign(other.baddieID.x - x);
                        
                        other.baddieID.hsp = xscale * 5;
                        other.baddieID.vsp = -5;
                        other.baddieID.state = UnknownEnum.Value_138;
                        
                        if (other.baddieID.stunned < 100)
                            other.baddieID.stunned = 100;
                        
                        other.baddieID.xscale = 1.4;
                        other.baddieID.yscale = 0.6;
                    }
                    
                    if (other.baddieID.object_index == obj_pizzaball)
                    {
                        with (other.baddieID)
                        {
                            scr_pizzaball_go_to_thrown(0, -5, false);
                            vsp = 5;
                        }
                    }
                    
                    if (key_jump2)
                    {
                        instance_create(x, y + 50, obj_stompeffect);
                        stompAnim = true;
                        vsp = -14;
                        
                        if (state == UnknownEnum.Value_92)
                            sprite_index = spr_stompprep;
                    }
                    else
                    {
                        instance_create(x, y + 50, obj_stompeffect);
                        stompAnim = true;
                        vsp = -9;
                        
                        if (state == UnknownEnum.Value_92)
                            sprite_index = spr_stompprep;
                    }
                }
                
                if (instance_exists(other.baddieID) && state == UnknownEnum.Value_44)
                {
                    other.baddieID.grabbedby = _playerindex;
                    other.baddieID.state = UnknownEnum.Value_4;
                    other.baddieID.hp = -99;
                    
                    if (key_down)
                    {
                        sprite_index = spr_piledriver;
                        vsp = -5;
                        state = UnknownEnum.Value_76;
                        image_index = 0;
                        image_speed = 0.35;
                    }
                    else
                    {
                        sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5);
                        image_index = 0;
                        hsp = 0;
                        movespeed = 0;
                        state = UnknownEnum.Value_6;
                    }
                }
                
                if (instance_exists(other.baddieID) && other.baddieID.state != UnknownEnum.Value_205 && !other.baddieID.invincible && state == UnknownEnum.Value_193)
                {
                    other.baddieID.ratplayerid = id;
                    other.baddieID.state = UnknownEnum.Value_205;
                    ratgrabbedID = other.baddieID.id;
                    state = UnknownEnum.Value_191;
                }
                
                if (instance_exists(other.baddieID) && other.baddieID.invtime == 0 && ((other.baddieID.object_index != obj_bigcheese && other.baddieID.object_index != obj_pepbat) || state != UnknownEnum.Value_5) && ((state == UnknownEnum.Value_42 && global.attackstyle == 1) || instakillmove == true) && other.baddieID.state != UnknownEnum.Value_4 && !other.baddieID.invincible && other.baddieID.instantkillable)
                {
                    Instakill();
                }
                else if (state == UnknownEnum.Value_42 && global.attackstyle == 0)
                {
                    image_index = 0;
                    
                    if (!key_up)
                    {
                        if (movespeed <= 10)
                            sprite_index = spr_haulingstart;
                        else
                            sprite_index = spr_swingding;
                        
                        if (!grounded)
                            vsp = -6;
                        
                        swingdingendcooldown = 0;
                        state = UnknownEnum.Value_79;
                        baddiegrabbedID = other.baddieID;
                        grabbingenemy = true;
                        other.baddieID.state = UnknownEnum.Value_4;
                        other.baddieID.grabbedby = _playerindex;
                    }
                    else if (key_up)
                    {
                        baddiegrabbedID = other.baddieID;
                        grabbingenemy = true;
                        other.baddieID.state = UnknownEnum.Value_4;
                        other.baddieID.grabbedby = _playerindex;
                        sprite_index = spr_piledriver;
                        vsp = -14;
                        state = UnknownEnum.Value_76;
                        image_index = 0;
                        image_speed = 0.35;
                    }
                }
                else if (state == UnknownEnum.Value_42 && global.attackstyle == 3)
                {
                    _ms = movespeed;
                    movespeed = 0;
                    baddiegrabbedID = other.baddieID;
                    grabbingenemy = true;
                    _prevstate = other.baddieID.state;
                    other.baddieID.state = UnknownEnum.Value_4;
                    other.baddieID.grabbedby = _playerindex;
                    
                    if (global.pummeltest)
                    {
                        if (image_index > 6)
                        {
                            if (key_up)
                            {
                                state = UnknownEnum.Value_6;
                                sprite_index = spr_uppercutfinishingblow;
                                image_index = 4;
                                movespeed = 0;
                            }
                            else if (key_down)
                            {
                                sprite_index = spr_piledriver;
                                vsp = -5;
                                state = UnknownEnum.Value_76;
                                image_index = 4;
                                image_speed = 0.35;
                            }
                            else
                            {
                                state = UnknownEnum.Value_6;
                                sprite_index = spr_player_lungehit;
                                image_index = 0;
                            }
                        }
                        else
                        {
                            other.baddieID.state = _prevstate;
                            grabbingenemy = false;
                            movespeed = _ms;
                        }
                    }
                    else
                    {
                        image_index = 0;
                        
                        if (key_up)
                        {
                            state = UnknownEnum.Value_6;
                            sprite_index = spr_uppercutfinishingblow;
                            image_index = 4;
                            movespeed = 0;
                        }
                        else if (key_down)
                        {
                            sprite_index = spr_piledriver;
                            vsp = -5;
                            state = UnknownEnum.Value_76;
                            image_index = 4;
                            image_speed = 0.35;
                        }
                        else
                        {
                            state = UnknownEnum.Value_6;
                            sprite_index = spr_player_lungehit;
                            image_index = 0;
                        }
                    }
                }
                
                if (place_meeting(x, y + 1, other) && state == UnknownEnum.Value_58 && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_playerN_pogobounce && !other.baddieID.invincible)
                {
                    switch (pogochargeactive)
                    {
                        case 0:
                            pogospeedprev = false;
                            other.baddieID.vsp = -3;
                            scr_soundeffect(24);
                            other.baddieID.state = UnknownEnum.Value_138;
                            
                            if (other.baddieID.stunned < 100)
                                other.baddieID.stunned = 100;
                            
                            sprite_index = spr_playerN_pogobounce;
                            break;
                        
                        case 1:
                            pogospeedprev = false;
                            scr_throwenemy();
                            sprite_index = spr_playerN_pogobouncemach;
                            break;
                    }
                    
                    instance_create(x, y + 50, obj_stompeffect);
                    image_index = 0;
                    movespeed = 0;
                    vsp = 0;
                }
                
                pepp_grab = false;
                
                if (character == "M" && instance_exists(other.baddieID) && (state == UnknownEnum.Value_0 || state == UnknownEnum.Value_92) && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw && other.baddieID.state == UnknownEnum.Value_138 && other.baddieID.stuntouchbuffer == 0 && !other.baddieID.thrown && !other.baddieID.invincible)
                {
                    other.baddieID.pepperman_grab = true;
                    pepperman_grabID = other.baddieID.id;
                    other.baddieID.state = UnknownEnum.Value_4;
                    other.baddieID.grabbedby = _playerindex;
                    pepp_grab = true;
                }
                
                if (instance_exists(other.baddieID) && other.baddieID.object_index != obj_bigcheese && (state == UnknownEnum.Value_5 || state == UnknownEnum.Value_104) && other.baddieID.state != UnknownEnum.Value_80 && other.baddieID.state != UnknownEnum.Value_137 && !pepp_grab && other.baddieID.thrown == false && other.baddieID.stuntouchbuffer <= 0 && other.baddieID.state != UnknownEnum.Value_4 && other.baddieID.state != UnknownEnum.Value_41 && other.baddieID.state != UnknownEnum.Value_61 && !other.baddieID.invincible)
                {
                    lag = 0;
                    other.baddieID.stuntouchbuffer = 15;
                    
                    with (other.baddieID)
                    {
                        xscale = 0.8;
                        yscale = 1.3;
                        instance_create(x, y, obj_bangeffect);
                        state = UnknownEnum.Value_137;
                        image_xscale = -other.xscale;
                        hithsp = other.xscale * 12;
                        hitvsp = (other.y - 180 - y) / 60;
                        trace([hithsp, hitvsp]);
                        hitLag = lag;
                        hitX = x;
                        hitY = y;
                        invtime = lag + 5;
                        flash = true;
                    }
                    
                    tauntstoredstate = state;
                    tauntstoredsprite = sprite_index;
                    tauntstoredmovespeed = movespeed;
                    tauntstoredvsp = vsp;
                    state = UnknownEnum.Value_61;
                    hitLag = lag;
                    hitX = x;
                    hitY = y;
                    
                    repeat (2)
                    {
                        with (create_debris(x, y, 1141))
                            vsp = irandom_range(-6, -11);
                    }
                }
                
                if (character != "M" && instance_exists(other.baddieID) && state == UnknownEnum.Value_55 && !other.baddieID.invincible)
                {
                    if (instance_exists(other.baddieID) && y < (other.baddieID.y - 50) && attacking == false && state != UnknownEnum.Value_42 && other.baddieID.state != UnknownEnum.Value_4 && sprite_index != spr_player_mach2jump && (state == UnknownEnum.Value_92 || state == UnknownEnum.Value_103 || (state == UnknownEnum.Value_79 && sprite_index != spr_swingding)) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && !other.baddieID.invincible)
                    {
                        scr_soundeffect(24);
                        
                        if (x != other.baddieID.x)
                            other.baddieID.image_xscale = -sign(other.baddieID.x - x);
                        
                        image_index = 0;
                        other.baddieID.state = UnknownEnum.Value_138;
                        
                        if (other.baddieID.stunned < 100)
                            other.baddieID.stunned = 100;
                        
                        if (key_jump2)
                        {
                            instance_create(x, y + 50, obj_stompeffect);
                            stompAnim = true;
                            other.baddieID.image_index = 0;
                            vsp = -14;
                            
                            if (state != UnknownEnum.Value_79)
                                sprite_index = spr_stompprep;
                        }
                        else
                        {
                            instance_create(x, y + 50, obj_stompeffect);
                            stompAnim = true;
                            other.baddieID.image_index = 0;
                            vsp = -9;
                            
                            if (state != UnknownEnum.Value_79)
                                sprite_index = spr_stompprep;
                        }
                    }
                    
                    if (other.baddieID.thrown == false && (character == "P" || character == "N"))
                    {
                        movespeed = 0;
                        image_index = 0;
                        sprite_index = spr_haulingstart;
                        state = UnknownEnum.Value_79;
                        other.baddieID.state = UnknownEnum.Value_4;
                        other.baddieID.grabbedby = _playerindex;
                    }
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_3 = 3,
    Value_4,
    Value_5,
    Value_6,
    Value_17 = 17,
    Value_41 = 41,
    Value_42,
    Value_44 = 44,
    Value_55 = 55,
    Value_58 = 58,
    Value_61 = 61,
    Value_76 = 76,
    Value_79 = 79,
    Value_80,
    Value_92 = 92,
    Value_103 = 103,
    Value_104,
    Value_137 = 137,
    Value_138,
    Value_191 = 191,
    Value_193 = 193,
    Value_205 = 205
}