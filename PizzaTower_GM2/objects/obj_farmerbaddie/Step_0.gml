var x1, t, b, q;

if (room == rm_editor)
    exit;

switch (state)
{
    case UnknownEnum.Value_126:
        scr_enemy_idle();
        break;
    
    case UnknownEnum.Value_130:
        scr_enemy_turn();
        break;
    
    case UnknownEnum.Value_134:
        if (!idle)
        {
            scr_enemy_walk();
        }
        else
        {
            sprite_index = idlespr;
            hsp = 0;
        }
        
        break;
    
    case UnknownEnum.Value_136:
        scr_enemy_land();
        break;
    
    case UnknownEnum.Value_137:
        scr_enemy_hit();
        break;
    
    case UnknownEnum.Value_138:
        scr_enemy_stun();
        break;
    
    case UnknownEnum.Value_129:
        scr_pizzagoblin_throw();
        break;
    
    case UnknownEnum.Value_4:
        scr_enemy_grabbed();
        break;
    
    case UnknownEnum.Value_154:
        scr_enemy_pummel();
        break;
    
    case UnknownEnum.Value_155:
        scr_enemy_staggered();
        break;
    
    case UnknownEnum.Value_125:
        scr_enemy_rage();
        break;
    
    case UnknownEnum.Value_17:
        scr_enemy_ghostpossess();
        break;
}

scr_scareenemy();

if (state != UnknownEnum.Value_134)
    idle = false;

if (state == UnknownEnum.Value_134)
{
    x1 = 270;
    playerid = instance_nearest(x, y, obj_player);
    t = playerid.x > (x - x1) && playerid.x < (x + x1) && playerid.y > (y - 100) && playerid.y < (y + 100);
    
    if (cooldown > 0)
    {
        cooldown--;
    }
    else if (t && collision_line(x, y, playerid.x, playerid.y, obj_solid, false, true) == -4)
    {
        b = id;
        
        with (obj_farmerbaddie)
        {
            if ((id == b || distance_to_object(other) < 300) && state != UnknownEnum.Value_4 && state != UnknownEnum.Value_138 && state != UnknownEnum.Value_137 && state != UnknownEnum.Value_266)
            {
                state = UnknownEnum.Value_92;
                sprite_index = ragespr;
                vsp = -5;
                hsp = 0;
                
                if (other.playerid.x != x)
                    image_xscale = sign(other.playerid.x - x);
                
                if (id != b)
                    leaderID = b;
                else
                    leaderID = -4;
            }
        }
    }
}
else if (state == UnknownEnum.Value_92)
{
    if (grounded && vsp > 0)
    {
        state = UnknownEnum.Value_80;
        sprite_index = ragespr;
        attackspeed = 8;
    }
}
else if (state == UnknownEnum.Value_80)
{
    if (object_index != obj_farmerbaddie3 && !instance_exists(hitboxID))
    {
        with (instance_create(x, y, obj_forkhitbox))
        {
            ID = other.id;
            other.hitboxID = id;
        }
    }
    
    x1 = 450;
    playerid = instance_nearest(x, y, obj_player);
    t = playerid.x > (x - x1) && playerid.x < (x + x1) && playerid.y > (y - 400) && playerid.y < (y + 400);
    hsp = image_xscale * attackspeed;
    q = outofsight;
    
    if (leaderID == -4)
    {
        if (!t || collision_line(x, y, playerid.x, playerid.y, obj_solid, true, false) != -4)
            outofsight = true;
        
        if (t)
            outofsight = false;
    }
    else if (instance_exists(leaderID) && leaderID.state == UnknownEnum.Value_80)
    {
        outofsight = leaderID.outofsight;
    }
    else
    {
        leaderID = -4;
    }
    
    if (outofsight)
    {
        if (q != outofsight)
            waitbuffer = 30;
        
        if (waitbuffer > 0)
            waitbuffer--;
        else
            attackspeed = Approach(attackspeed, 0, 0.1);
    }
    else
    {
        attackspeed = Approach(attackspeed, attackmaxspeed, 1);
    }
    
    if (attackspeed <= 0)
    {
        cooldown = 60;
        state = UnknownEnum.Value_134;
        idle = false;
        hsp = 0;
        sprite_index = walkspr;
    }
    
    if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope))
        image_xscale *= -1;
}

if (state != UnknownEnum.Value_80 && hitboxID != -4 && instance_exists(hitboxID))
{
    instance_destroy(hitboxID);
    hitboxID = -4;
}

if (state == UnknownEnum.Value_138 && stunned > 100 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != UnknownEnum.Value_138)
    birdcreated = false;

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != UnknownEnum.Value_4)
    depth = 0;

if (state != UnknownEnum.Value_138)
    thrown = false;

if (boundbox == false)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index;
        mask_index = other.sprite_index;
        baddieID = other.id;
        other.boundbox = true;
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_17 = 17,
    Value_80 = 80,
    Value_92 = 92,
    Value_125 = 125,
    Value_126,
    Value_129 = 129,
    Value_130,
    Value_134 = 134,
    Value_136 = 136,
    Value_137,
    Value_138,
    Value_154 = 154,
    Value_155,
    Value_266 = 266
}
