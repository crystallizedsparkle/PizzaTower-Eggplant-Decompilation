var _is_brick, _xs, dis, m, tx, ty, _dir, _dis, x1, y1;

if (room == rm_editor)
    exit;

switch (state)
{
    case states.idle:
        scr_enemy_idle();
        break;
    
    case states.turn:
        scr_enemy_turn();
        break;
    
    case states.walk:
        break;
    
    case states.blockstance:
        if (!instance_exists(playerid))
        {
            state = states.walk;
            break;
        }
        
        if (x != playerid.x)
            image_xscale = -sign(x - playerid.x);
        
        _is_brick = playerid.object_index == obj_brickcomeback;
        
        if (!_is_brick)
        {
            with (playerid)
            {
                if (state == states.taxi_police)
                {
                    other.state = states.walk;
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
                    
                    if (!(state == states.machslide && sprite_index == spr_mach3boost))
                        hsp_carry = _xs * abs(m);
                    else
                        hsp_carry = -hsp;
                    
                    if (state == states.mach3 || (state == states.machslide && sprite_index == spr_mach3boost))
                        launch = true;
                    
                    if (state == states.machslide && sprite_index == spr_mach3boost && launch)
                        movespeed -= 0.6;
                    
                    freefallsmash = 0;
                    
                    if (state == states.grind || state == states.climbwall || state == states.Sjumpprep || state == states.Sjump || state == states.Sjumpland || y < (other.y - 400))
                    {
                        scr_soundeffect(28);
                        vsp = -4;
                        hsp = -3 * xscale;
                        state = states.bump;
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
                        state = states.normal;
                    }
                    
                    if (other.attract_player)
                    {
                        launched = false;
                        x = other.x;
                        y = other.y;
                        sprite_index = spr_machfreefall;
                        state = states.jump;
                        other.attract_player = false;
                    }
                    
                    if (launched)
                    {
                        other.state = states.walk;
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
    
    case states.land:
        scr_enemy_land();
        break;
    
    case states.hit:
        scr_enemy_hit();
        break;
    
    case states.stun:
        scr_enemy_stun();
        break;
    
    case states.enemy_throw:
        scr_pizzagoblin_throw();
        break;
    
    case states.grabbed:
        scr_enemy_grabbed();
        break;
    
    case states.pummel:
        scr_enemy_pummel();
        break;
    
    case states.staggered:
        scr_enemy_staggered();
        break;
    
    case states.rage:
        scr_enemy_rage();
        break;
    
    case states.ghostpossess:
        scr_enemy_ghostpossess();
        break;
}

if (state == states.stun && stunned > 100 && birdcreated == false)
{
    birdcreated = true;
    
    with (instance_create(x, y, obj_enemybird))
        ID = other.id;
}

if (state != states.walk)
    attract_player = false;

_dis = 300;

if (state == states.walk && obj_player1.isgustavo && !obj_player1.cutscene && obj_player1.state != states.taxi && ((distance_to_object(obj_player) < _dis && obj_player1.brick) || distance_to_object(obj_ratmountgroundpound) < _dis || (distance_to_object(obj_brickcomeback) < _dis && instance_exists(obj_brickcomeback) && !obj_brickcomeback.trapped) || distance_to_object(obj_brickball) < _dis))
{
    state = states.blockstance;
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
        state = states.ratmount;
    }
}

if (state != states.stun)
    birdcreated = false;

if (flash == true && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed;

if (state != states.grabbed)
    depth = 0;

if (state != states.stun)
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
