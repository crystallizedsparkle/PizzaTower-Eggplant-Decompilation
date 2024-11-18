var _is_brick, _xs, dis, m, tx, ty, _dir, _dis, x1, y1;

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
        break;
    
    case UnknownEnum.Value_206:
        if (!instance_exists(playerid))
        {
            state = UnknownEnum.Value_134;
            break;
        }
        
        if (x != playerid.x)
            image_xscale = -sign(x - playerid.x);
        
        _is_brick = playerid.object_index == obj_brickcomeback;
        
        if (!_is_brick)
        {
            with (playerid)
            {
                if (state == UnknownEnum.Value_152)
                {
                    other.state = UnknownEnum.Value_134;
                }
                else if (!launched)
                {
                    _xs = 0;
                    
                    if (x != other.x)
                        _xs = -sign(x - other.x);
                    
                    dis = (abs(hsp) < 12) ? 100 : 180;
                    m = (abs(x - other.x) > dis) ? abs(hsp) : (abs(hsp) - max(0, abs(hsp) - 2));
                    
                    if (hsp == 0)
                        m = _xs;
                    
                    if (!(state == UnknownEnum.Value_105 && sprite_index == spr_mach3boost))
                        hsp_carry = _xs * abs(m);
                    else
                        hsp_carry = -hsp;
                    
                    if (state == UnknownEnum.Value_121 || (state == UnknownEnum.Value_105 && sprite_index == spr_mach3boost))
                        launch = true;
                    
                    if (state == UnknownEnum.Value_105 && sprite_index == spr_mach3boost && launch)
                        movespeed -= 0.6;
                    
                    freefallsmash = 0;
                    
                    if (state == UnknownEnum.Value_78 || state == UnknownEnum.Value_37 || state == UnknownEnum.Value_99 || state == UnknownEnum.Value_97 || state == UnknownEnum.Value_123 || y < (other.y - 400))
                    {
                        scr_soundeffect(28);
                        vsp = -4;
                        hsp = -3 * xscale;
                        state = UnknownEnum.Value_106;
                        sprite_index = spr_bump;
                        image_index = 0;
                    }
                    
                    if (distance_to_object(other) > 300)
                    {
                        other.attract_player = true;
                        launched = false;
                    }
                    else if (other.attract_player && x == other.x && y == other.y)
                    {
                        launched = false;
                        other.attract_player = false;
                        state = UnknownEnum.Value_0;
                    }
                    
                    if (other.attract_player)
                    {
                        launched = false;
                        x = other.x;
                        y = other.y;
                        sprite_index = spr_machfreefall;
                        state = UnknownEnum.Value_92;
                        other.attract_player = false;
                    }
                    
                    if (launched)
                    {
                        other.state = UnknownEnum.Value_134;
                        instance_destroy(other);
                        global.combotime = 60;
                    }
                }
            }
            
            if (playerid.launch)
                sprite_index = spr_hamkuff_chain2;
            else
                sprite_index = spr_hamkuff_chain1;
        }
        else
        {
            with (playerid)
            {
                tx = other.x + (other.image_xscale * 32);
                ty = other.y;
                
                if (distance_between_points(x, y, tx, ty) > 10)
                {
                    _dir = point_direction(x, y, tx, ty);
                    x += lengthdir_x(10, _dir);
                    y += lengthdir_y(10, _dir);
                }
            }
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

if (state == UnknownEnum.Value_138 && stunned > 100 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != UnknownEnum.Value_134)
    attract_player = false;

_dis = 300;

if (state == UnknownEnum.Value_134 && obj_player1.isgustavo && !obj_player1.cutscene && obj_player1.state != UnknownEnum.Value_119 && ((distance_to_object(obj_player) < _dis && obj_player1.brick) || distance_to_object(obj_ratmountgroundpound) < _dis || (distance_to_object(obj_brickcomeback) < _dis && instance_exists(obj_brickcomeback) && !obj_brickcomeback.trapped) || distance_to_object(obj_brickball) < _dis))
{
    state = UnknownEnum.Value_206;
    sprite_index = spr_hamkuff_chain1;
    x1 = obj_player1.x;
    y1 = obj_player1.y;
    
    if (instance_exists(obj_ratmountgroundpound))
    {
        x1 = obj_ratmountgroundpound.x;
        y1 = obj_ratmountgroundpound.y;
    }
    else if (instance_exists(obj_brickcomeback))
    {
        x1 = obj_brickcomeback.x;
        y1 = obj_brickcomeback.y;
    }
    else if (instance_exists(obj_brickball))
    {
        x1 = obj_brickball.x;
        y1 = obj_brickball.y;
    }
    
    instance_destroy(obj_ratmountgroundpound, false);
    instance_destroy(obj_brickcomeback, false);
    instance_destroy(obj_brickball, false);
    
    with (instance_create(x1, y1, obj_brickcomeback))
    {
        trapped = true;
        baddieID = other.id;
        other.playerid = id;
    }
    
    with (obj_player1)
    {
        brick = false;
        sprite_index = spr_lonegustavo_idle;
        state = UnknownEnum.Value_191;
    }
}

if (state != UnknownEnum.Value_138)
    birdcreated = false;

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != UnknownEnum.Value_4)
    depth = 0;

if (state != UnknownEnum.Value_138)
    thrown = false;

enum UnknownEnum
{
    Value_0,
    Value_4 = 4,
    Value_17 = 17,
    Value_37 = 37,
    Value_78 = 78,
    Value_92 = 92,
    Value_97 = 97,
    Value_99 = 99,
    Value_105 = 105,
    Value_106,
    Value_119 = 119,
    Value_121 = 121,
    Value_123 = 123,
    Value_125 = 125,
    Value_126,
    Value_129 = 129,
    Value_130,
    Value_134 = 134,
    Value_136 = 136,
    Value_137,
    Value_138,
    Value_152 = 152,
    Value_154 = 154,
    Value_155,
    Value_191 = 191,
    Value_206 = 206
}
