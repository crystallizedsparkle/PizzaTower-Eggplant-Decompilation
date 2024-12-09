function create_afterimage(_x, _y, _sprite_index, _image_index)
{
    var q = 
    {
        x: _x,
        y: _y,
        sprite_index: _sprite_index,
        image_index: _image_index,
        alarm: [15, 3, -1],
        image_blend: choose(global.afterimage_color1, global.afterimage_color2),
        image_xscale: 1,
        identifier: afterimages.default_afterimage,
        visible: true,
        alpha: 1
    };
    ds_list_add(global.afterimage_list, q);
    return q;
}

function create_mach3effect(_x, _y, _sprite_index, _image_index)
{
    var q = 
    {
        x: _x,
        y: _y,
        sprite_index: _sprite_index,
        image_index: _image_index,
        alarm: [15, 6, -1],
        image_blend: choose(global.mach_color1, global.mach_color2),
        image_xscale: 1,
        visible: true,
        identifier: afterimages.mach3effect,
        playerid: obj_player1,
        alpha: 1
    };
    ds_list_add(global.afterimage_list, q);
    return q;
}

function create_heatattack_afterimage(_x, _y, _sprite_index, _image_index, _image_xscale)
{
    var _velocity = 6;
    
    with (create_afterimage(_x, _y, _sprite_index, _image_index))
    {
        identifier = afterimages.heatattack;
        alarm[1] = -1;
        alarm[2] = -1;
        alarm[0] = 8;
        image_xscale = _image_xscale;
        hsp = _velocity;
        vsp = 0;
    }
    
    with (create_afterimage(_x, _y, _sprite_index, _image_index))
    {
        identifier = afterimages.heatattack;
        alarm[1] = -1;
        alarm[2] = -1;
        alarm[0] = 8;
        image_xscale = _image_xscale;
        hsp = -_velocity;
        vsp = 0;
    }
    
    with (create_afterimage(_x, _y, _sprite_index, _image_index))
    {
        identifier = afterimages.heatattack;
        alarm[1] = -1;
        alarm[2] = -1;
        alarm[0] = 8;
        image_xscale = _image_xscale;
        hsp = 0;
        vsp = _velocity;
    }
    
    with (create_afterimage(_x, _y, _sprite_index, _image_index))
    {
        identifier = afterimages.heatattack;
        alarm[1] = -1;
        alarm[2] = -1;
        alarm[0] = 8;
        image_xscale = _image_xscale;
        hsp = 0;
        vsp = -_velocity;
    }
}

function create_firemouth_afterimage(_x, _y, _sprite_index, _image_index, _image_xscale)
{
    with (create_afterimage(_x, _y, _sprite_index, _image_index))
    {
        identifier = afterimages.firemouth;
        alarm[0] = -1;
        alarm[1] = -1;
        alarm[2] = -1;
        image_xscale = _image_xscale;
        image_blend = make_color_rgb(248, 112, 24);
        alpha = 1.25;
    }
}

function create_blue_afterimage(_x, _y, _sprite_index, _image_index, _image_xscale)
{
    with (create_afterimage(_x, _y, _sprite_index, _image_index))
    {
        identifier = afterimages.blue;
        alarm[0] = -1;
        alarm[1] = -1;
        alarm[2] = -1;
        image_xscale = _image_xscale;
        image_blend = make_color_rgb(44, 126, 228);
        alpha = 1.25;
    }
}

function create_blur_afterimage(_x, _y, _sprite_index, _image_index, _image_xscale)
{
    var b = create_afterimage(_x, _y, _sprite_index, _image_index);
    
    with (b)
    {
        identifier = afterimages.blur;
        alarm[0] = -1;
        alarm[1] = -1;
        alarm[2] = -1;
        image_blend = c_white;
        image_xscale = _image_xscale;
        alpha = 0.8;
        playerid = noone;
    }
    
    return b;
}
