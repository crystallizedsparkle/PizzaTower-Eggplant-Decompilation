function scr_hurtplayer(argument0)
{
    var _hurt, loseamount;
    
    _hurt = false;
    
    with (argument0)
    {
        if (global.failcutscene)
        {
        }
        else if (state == UnknownEnum.Value_147 || state == UnknownEnum.Value_208 || state == UnknownEnum.Value_148 || state == UnknownEnum.Value_165)
        {
        }
        else if (state == UnknownEnum.Value_42 && flash == true)
        {
        }
        else if (state == UnknownEnum.Value_84 || state == UnknownEnum.Value_61)
        {
        }
        else if (global.kungfu)
        {
            if (state == UnknownEnum.Value_206)
            {
                if (sprite_index != spr_player_airattackstart)
                {
                    instance_create(x, y, obj_parryeffect);
                    image_index = 0;
                }
                
                sprite_index = spr_player_airattackstart;
                hsp = -xscale * 2;
            }
            else if (state != UnknownEnum.Value_156 && state != UnknownEnum.Value_137 && !hurted)
            {
                instance_create(x, y, obj_parryeffect);
                
                repeat (5)
                {
                    with (create_debris(x, y, 1141))
                        vsp = irandom_range(-6, -11);
                }
                
                hitLag = 3;
                hitxscale = (x != other.x) ? sign(other.x - x) : -other.image_xscale;
                state = UnknownEnum.Value_137;
                hitstunned = 50;
                hurted = true;
                alarm[7] = hitstunned + 30;
                hithsp = 12;
                hitvsp = -5;
                hitX = x;
                hitY = y;
                sprite_index = spr_hurt;
                
                if (global.hp > 1)
                {
                    global.hp--;
                    
                    with (obj_camera)
                        healthshaketime = 60;
                }
                else
                {
                    with (obj_music)
                        arena = false;
                    
                    global.kungfu = false;
                    
                    if (!instance_exists(obj_fadeout))
                    {
                        with (obj_player)
                            targetRoom = lastroom;
                        
                        instance_create(x, y, obj_fadeout);
                    }
                }
            }
        }
        else if (isgustavo)
        {
            if (!hurted)
            {
                state = UnknownEnum.Value_196;
                movespeed = 6;
                vsp = -9;
                flash = true;
                scr_soundeffect(22);
                alarm[8] = 100;
                hurted = true;
                instance_create(x, y, obj_spikehurteffect);
                _hurt = true;
            }
        }
        else if (state == UnknownEnum.Value_70)
        {
        }
        else if ((state == UnknownEnum.Value_47 || state == UnknownEnum.Value_48 || state == UnknownEnum.Value_38 || state == UnknownEnum.Value_49) && cutscene == false)
        {
        }
        else if (state == UnknownEnum.Value_16)
        {
        }
        else if (state == UnknownEnum.Value_17)
        {
            if (instance_exists(possessID) && object_get_parent(possessID) == 407)
            {
                state = UnknownEnum.Value_16;
                
                with (obj_baddie)
                {
                    if (is_controllable && state == UnknownEnum.Value_17 && playerid == other.id)
                        instance_destroy();
                }
            }
        }
        else if (state == UnknownEnum.Value_94)
        {
        }
        else if (state == UnknownEnum.Value_187)
        {
        }
        else if (state == UnknownEnum.Value_41)
        {
        }
        else if (state == UnknownEnum.Value_51 && hurted == false)
        {
        }
        else if (state == UnknownEnum.Value_31)
        {
        }
        else if (state == UnknownEnum.Value_94)
        {
        }
        else if (state == UnknownEnum.Value_33)
        {
            hsp = -xscale * 4;
            vsp = -5;
            state = UnknownEnum.Value_106;
            sprite_index = spr_bump;
            alarm[5] = 2;
            alarm[8] = 60;
            alarm[7] = 120;
            hurted = true;
        }
        else if (pizzashield == true)
        {
            pizzashield = false;
            
            with (instance_create(x, y, obj_sausageman_dead))
                sprite_index = spr_pizzashield_collectible;
            
            hsp = -xscale * 4;
            vsp = -5;
            state = UnknownEnum.Value_106;
            sprite_index = spr_bump;
            invhurt_buffer = 120;
            alarm[8] = 60;
            alarm[7] = 120;
            hurted = true;
            scr_soundeffect(22);
        }
        else if (state != UnknownEnum.Value_107 && state != UnknownEnum.Value_196 && state != UnknownEnum.Value_4 && (hurted == false || state == UnknownEnum.Value_24 || state == UnknownEnum.Value_29 || state == UnknownEnum.Value_30) && cutscene == false)
        {
            if (state == UnknownEnum.Value_11 || state == UnknownEnum.Value_14 || state == UnknownEnum.Value_12 || state == UnknownEnum.Value_13)
            {
                with (instance_create(x, y, obj_mortflyaway))
                    image_xscale = -other.xscale;
            }
            
            if (instance_exists(obj_hardmode))
                global.heatmeter_count = (global.heatmeter_threshold - 1) * global.heatmeter_threshold_count;
            
            _hurt = true;
            
            if (character == "V")
                global.playerhealth -= 25;
            
            if (state == UnknownEnum.Value_113 || state == UnknownEnum.Value_115 || state == UnknownEnum.Value_114 || state == UnknownEnum.Value_116)
            {
                repeat (4)
                    create_debris(x, y, 398);
            }
            
            if (global.kungfu)
            {
                if (global.hp > 1)
                {
                    global.hp--;
                    
                    with (obj_camera)
                        healthshaketime = 60;
                }
                else
                {
                    with (obj_music)
                        arena = false;
                    
                    global.kungfu = false;
                    
                    if (!instance_exists(obj_fadeout))
                    {
                        with (obj_player)
                            targetRoom = lastroom;
                        
                        instance_create(x, y, obj_fadeout);
                    }
                }
            }
            
            if (state == UnknownEnum.Value_4)
            {
                if (object_index == obj_player1)
                    y = obj_player2.y;
                else
                    y = obj_player1.y;
            }
            
            scr_soundeffect(22);
            alarm[8] = 100;
            alarm[7] = 50;
            hurted = true;
            
            if (xscale == other.image_xscale)
                sprite_index = spr_hurtjump;
            else
                sprite_index = spr_hurt;
            
            movespeed = 8;
            vsp = -14;
            timeuntilhpback = 300;
            instance_create(x, y, obj_spikehurteffect);
            state = UnknownEnum.Value_107;
            image_index = 0;
            flash = true;
        }
        
        if (_hurt)
        {
            global.combotime -= 25;
            global.style -= 25;
            global.hurtcounter += 1;
            loseamount = 50 * (global.stylethreshold + 1);
            
            if (!global.pizzadelivery)
            {
                if (global.collect > loseamount)
                    global.collect -= loseamount;
                else
                    global.collect = 0;
                
                if (global.collect != 0)
                {
                    if (character == "P" || character == "V")
                    {
                        repeat (10)
                        {
                            with (instance_create(x, y, obj_pizzaloss))
                                sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect);
                        }
                    }
                    else
                    {
                        repeat (10)
                            instance_create(x, y, obj_pizzaloss);
                    }
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_11 = 11,
    Value_12,
    Value_13,
    Value_14,
    Value_16 = 16,
    Value_17,
    Value_24 = 24,
    Value_29 = 29,
    Value_30,
    Value_31,
    Value_33 = 33,
    Value_38 = 38,
    Value_41 = 41,
    Value_42,
    Value_47 = 47,
    Value_48,
    Value_49,
    Value_51 = 51,
    Value_61 = 61,
    Value_70 = 70,
    Value_84 = 84,
    Value_94 = 94,
    Value_106 = 106,
    Value_107,
    Value_113 = 113,
    Value_114,
    Value_115,
    Value_116,
    Value_137 = 137,
    Value_147 = 147,
    Value_148,
    Value_156 = 156,
    Value_165 = 165,
    Value_187 = 187,
    Value_196 = 196,
    Value_206 = 206,
    Value_208 = 208
}
