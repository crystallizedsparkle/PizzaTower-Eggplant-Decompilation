function Vector2(_x, _y) constructor
{
    static Update = function(_x, _y)
    {
        x = _x;
        y = _y;
    };
    
    static UpdateVector = function(_vector)
    {
        x = _vector.x;
        y = _vector.y;
    };
    
    static Add = function(_x, _y)
    {
        x += _x;
        y += _y;
    };
    
    static AddVector = function(_vector)
    {
        x += _vector.x;
        y += _vector.y;
    };
    
    static Multiply = function(_x, _y)
    {
        x *= _x;
        y *= _y;
    };
    
    static Divide = function(_x, _y)
    {
        x /= _x;
        y /= _y;
    };
    
    static MultiplyVector = function(_vector)
    {
        x *= _vector.x;
        y *= _vector.y;
    };
    
    static DivideVector = function(_vector)
    {
        x /= _vector.x;
        y /= _vector.y;
    };
    
    x = _x;
    y = _y;
}

function cycle(_val, _min, _max)
{
    var delta = _max - _min;
    var result = (_val - _min) % delta;
    
    if (result < 0)
        result += delta;
    
    return result + _min;
}

function angle_rotate(_angle, _target, _speed)
{
    var diff = cycle(_target - _angle, -180, 180);
    
    if (diff < -_speed)
        return _angle - _speed;
    
    if (diff > _speed)
        return _angle + _speed;
    
    return _target;
}

function get_velocity(_var1, _var2)
{
    return _var1 / _var2;
}

function Wave(_from, _to, _duration, _offset)
{
    var a4 = (_to - _from) * 0.5;
    return _from + a4 + (sin((((current_time * 0.001) + (_duration * _offset)) / _duration) * (2 * pi)) * a4);
}

function distance_to_pos(_x1, _y1, _x2, _y2, _x_threshold, _y_threshold)
{
    return abs(_x1 - _x2) <= _x_threshold && abs(_y1 - _y2) <= _y_threshold;
}

function distance_between_points(_x1, _y1, _x2, _y2)
{
    return sqrt(sqr(_x2 - _x1) + sqr(_y2 - _y1));
}

function calculate_jump_velocity_alt(_target_x, _target_y, _speed, _grav)
{
    var xx = _target_x - x;
    var yy = _target_y - y;
    var g = _grav;
    var tmp = power(_speed, 4) - (g * ((g * power(xx, 2)) + (2 * yy * power(_speed, 2))));
    
    if (tmp > 0)
    {
        if (xx == 0)
        {
            var a1 = pi / 2;
            
            if (yy < 0)
                var a2 = -pi / 2;
            else
                var a2 = pi / 2;
        }
        else
        {
            a1 = arctan2(power(_speed, 2) + sqrt(tmp), g * xx);
            a2 = arctan2(power(_speed, 2) - sqrt(tmp), g * xx);
        }
        
        hsp = cos(a1) * _speed * 1.2;
        vsp = cos(a2) * _speed;
        
        if (vsp > 0)
            vsp *= -1;
        
        hsp = abs(hsp) * sign(xx);
    }
}

function calculate_jump_velocity(_target_x, _target_y, _spd, _grav)
{
    var a = get_projectile_angle(x, y, _target_x, _target_y, _spd, _grav);
    hsp = lengthdir_x(_spd, a);
    vsp = lengthdir_y(_spd, a);
}

function get_projectile_angle(_x, _y, _target_x, _target_y, _spd, _grav)
{
    var xt = floor(_target_x - _x);
    var yt = -floor(_target_y - _y);
    var root = power(_spd, 4) - (_grav * ((_grav * sqr(xt)) + (2 * sqr(_spd) * yt)));
    var angle = 0;
    
    if (root > 0)
    {
        angle = radtodeg(arctan((sqr(_spd) + sqrt(root)) / (_grav * xt)));
        
        if (xt < 0)
            angle -= 180;
    }
    else if (xt > 0)
    {
        angle = 45;
    }
    else
    {
        angle = 135;
    }
    
    return angle;
}
