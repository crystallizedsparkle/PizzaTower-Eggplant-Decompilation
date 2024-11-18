function Instakill()
{
    var lag;
    
    if (other.baddieID.elitegrab == false)
    {
        other.baddieID.grabbedby = 1;
        
        if (object_index == obj_player2)
            other.baddieID.grabbedby = 2;
        
        if (state == UnknownEnum.Value_121 && sprite_index != spr_mach3hit && (character == "P" || character == "V"))
        {
            if (fightball == false)
                sprite_index = spr_mach3hit;
            
            image_index = 0;
        }
        
        if (state == UnknownEnum.Value_41 && sprite_index != spr_player_chainsawhit)
        {
            image_index = 0;
            sprite_index = spr_player_chainsawhit;
        }
        
        other.baddieID.invtime = 25;
        suplexmove = true;
        
        if (object_index == obj_player1)
            other.baddieID.grabbedby = 1;
        else
            other.baddieID.grabbedby = 2;
        
        scr_soundeffect(46);
        
        if (other.baddieID.elite && other.baddieID.object_index != obj_robot)
            other.baddieID.elitehit = 0;
        
        if (!other.baddieID.important)
            global.style += (2 + global.combo);
        
        if (!other.baddieID.elite || other.baddieID.elitehit <= 0)
            other.baddieID.mach3destroy = true;
        
        if (!other.baddieID.killprotection && !global.kungfu && (!other.baddieID.elite || other.baddieID.elitehit <= 0))
        {
            other.baddieID.instakilled = true;
        }
        else
        {
        }
        
        if (!other.baddieID.important)
        {
            global.combotime = 60;
            global.heattime = 60;
        }
        
        global.hit += 1;
        
        if (!grounded && state != UnknownEnum.Value_34 && state != UnknownEnum.Value_108 && (key_jump2 || input_buffer_jump == 0))
        {
            if (state == UnknownEnum.Value_121 && fightball == false)
                sprite_index = spr_player_mach2jump;
            
            suplexmove = false;
            vsp = -11;
        }
        
        if (state == UnknownEnum.Value_34)
        {
            if (key_jump2)
                vsp = -10;
            
            boxxedpepjump = 10;
        }
        
        if (character == "M" && state == UnknownEnum.Value_108)
        {
            vsp = -11;
            state = UnknownEnum.Value_92;
            sprite_index = spr_jump;
        }
        
        if (state != UnknownEnum.Value_61)
        {
            tauntstoredmovespeed = movespeed;
            tauntstoredsprite = sprite_index;
            tauntstoredstate = state;
            tauntstoredvsp = vsp;
        }
        
        if (state == UnknownEnum.Value_42 && !key_slap)
        {
            image_index = random_range(0, image_number - 1);
            
            if (grounded)
                sprite_index = spr_player_groundedattack;
            else
                sprite_index = spr_player_ungroundedattack;
        }
        
        if (state == UnknownEnum.Value_41 && !global.kungfu)
        {
            sprite_index = spr_player_chainsawhit;
            image_index = 0;
        }
        
        lag = 5;
        other.baddieID.hitLag = lag;
        other.baddieID.hitX = other.baddieID.x;
        other.baddieID.hitY = other.baddieID.y;
        other.baddieID.hp -= 1;
        hitLag = lag;
        hitX = x;
        hitY = y;
        instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect);
        other.baddieID.alarm[3] = 3;
        other.baddieID.state = UnknownEnum.Value_137;
        other.baddieID.image_xscale = -xscale;
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_baddiegibs);
        instance_create(x, y, obj_baddiegibs);
        instance_create(x, y, obj_baddiegibs);
        
        with (obj_camera)
        {
            shake_mag = 3;
            shake_mag_acc = 3 / room_speed;
        }
        
        if (state != UnknownEnum.Value_104 && state != UnknownEnum.Value_5)
        {
            with (instance_create(other.baddieID.x, other.baddieID.y, obj_parryeffect))
                sprite_index = spr_kungfueffect;
        }
        
        other.baddieID.hithsp = xscale * (movespeed + 2);
        
        if (abs(other.baddieID.hithsp) < 10)
            other.baddieID.hithsp = xscale * 10;
        
        other.baddieID.hitvsp = -5;
        state = UnknownEnum.Value_61;
    }
    else
    {
        other.baddieID.state = UnknownEnum.Value_138;
        other.baddieID.vsp = -4;
        other.baddieID.stunned = 40;
        scr_hurtplayer(id);
    }
}

enum UnknownEnum
{
    Value_5 = 5,
    Value_34 = 34,
    Value_41 = 41,
    Value_42,
    Value_61 = 61,
    Value_92 = 92,
    Value_104 = 104,
    Value_108 = 108,
    Value_121 = 121,
    Value_137 = 137,
    Value_138
}
