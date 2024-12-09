function scr_monster_activate()
{
    with (obj_monster)
    {
        if (state == states.robot_idle)
            state = states.robot_intro;
    }
    
    with (obj_monstergate)
    {
        if (!active)
        {
            active = true;
            instance_destroy(solidID);
            solidID = noone;
            image_speed = 0.35;
        }
    }
    
    warbg_init();
}

function get_triangle_points(_x, _y, _angle, _len, _size)
{
    var x2 = _x + lengthdir_x(_len, _angle - _size);
    var y2 = _y + lengthdir_y(_len, _angle - _size);
    var x3 = _x + lengthdir_x(_len, _angle + _size);
    var y3 = _y + lengthdir_y(_len, _angle + _size);
    return [x2, y2, x3, y3];
}

function scr_monster_detect(_detection_x, _detection_y, _obj)
{
    var _dir = (image_xscale > 0) ? (_obj.x > x) : (_obj.x < x);
    
    if (_dir && _obj.x < (x + _detection_x) && _obj.x > (x - _detection_x) && _obj.y < (y + _detection_y) && _obj.y > (y - _detection_y))
    {
        var detect = false;
        
        if (_obj.y > (y - 200))
        {
            with (_obj)
            {
                if (state != states.crouch || (!scr_solid(x, y - 24) && !place_meeting(x, y - 24, obj_platform)))
                    detect = true;
            }
        }
        
        if (detect)
            return true;
    }
    
    return false;
}

function scr_puppet_detect()
{
    with (obj_player)
    {
        if ((object_index != obj_player2 || global.coop) && !place_meeting(x, y, obj_puppetsafezone))
            return id;
    }
    
    return noone;
}

function scr_puppet_appear(_obj)
{
    var _xdir = 96;
    var i = 0;
    
    while (collision_line(_obj.x, _obj.y, _obj.x + (_xdir * _obj.xscale), _obj.y, obj_solid, false, true))
    {
        _xdir--;
        i++;
        
        if (i > room_width)
        {
            x = _obj.x;
            break;
        }
    }
    
    x = _obj.x + (abs(_xdir) * _obj.xscale);
    y = _obj.y;
    state = states.robot_chase;
    substate = states.fall;
    playerid = _obj;
    
    while (place_meeting(x, y, obj_solid))
    {
        x += ((_obj.x > x) ? 1 : -1);
        i++;
        
        if (i > room_width)
        {
            x = _obj.x;
            break;
        }
    }
    
    var _col = collision_line(x, y, x, y - room_height, obj_solid, true, false);
    
    if (_col != noone)
    {
        while (!place_meeting(x, y - 1, obj_solid))
            y--;
    }
}

function scr_monsterinvestigate(_detection_x, _sprite, _sprite2)
{
    targetplayer = instance_nearest(x, y, obj_player);
    image_speed = 0.35;
    
    switch (investigatestate)
    {
        case 0:
        case 1:
            sprite_index = _sprite;
            hsp = image_xscale * _detection_x;
            
            if (place_meeting(x + sign(hsp), y, obj_monstersolid) && (!place_meeting(x + sign(hsp), y, obj_monsterslope) || place_meeting(x + sign(hsp), y - 4, obj_solid)))
            {
                investigatestate++;
                image_xscale *= -1;
            }
            
            if (investigatestate == 1)
            {
                if ((image_xscale > 0 && x > (room_width / 2)) || (image_xscale < 0 && x < (room_width / 2)))
                {
                    investigatestate = 2;
                    waitbuffer = 100;
                }
            }
            
            break;
        
        case 2:
            sprite_index = _sprite2;
            hsp = 0;
            
            if (waitbuffer > 0)
            {
                waitbuffer--;
            }
            else
            {
                state = states.robot_walking;
                image_xscale *= -1;
                instance_create(x, y, obj_patroller);
            }
            
            break;
    }
    
    if (scr_monster_detect(300, room_height, targetplayer))
        state = states.robot_chase;
}

function scr_monster_detect_audio()
{
    if (scr_monster_audio_check())
    {
        if (!point_in_camera(x, y, view_camera[0]))
        {
            state = states.robot_investigate;
            investigatestate = 0;
        }
        else
        {
            targetplayer = instance_nearest(x, y, obj_player);
            
            if (object_index == obj_blobmonster)
            {
                state = states.fall;
                gravdir *= -1;
                chase = false;
            }
            else
            {
                state = states.robot_chase;
            }
        }
    }
}

function scr_monster_audio_check()
{
    if (audio_is_playing(sfx_groundpound) || audio_is_playing(sfx_scream5))
        return true;
    
    return false;
}

