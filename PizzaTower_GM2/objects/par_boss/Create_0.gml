mach3destroy = false;
platformid = -4;
hsp_carry = 0;
vsp_carry = 0;
thrown = false;
depth = obj_drawcontroller.depth + 1;
hsp = 0;
vsp = 0;
grav = 0.5;
grounded = false;
movespeed = 0;
state = UnknownEnum.Value_0;
team = 1;
important = true;
mach3destroy = false;
jugglecount = 0;
max_hp = 400;
hp = 0;
invincible = false;
inv_timer = -1;
inv_max = 25;
player_hurtstates = ds_map_create();
boss_hurtstates = ds_map_create();
boss_unparryablestates = ds_map_create();
destroyable = false;
stuntouchbuffer = 0;
lungehurt = true;
hitLag = 0;
hitX = x;
hitY = y;
hithsp = 0;
hitvsp = 0;
hitstate = UnknownEnum.Value_0;
stunfallspr = sprite_index;
walkspr = sprite_index;
spr_dead = sprite_index;
fallspr = sprite_index;
bumpspr = sprite_index;
parryspr = sprite_index;
defeatplayerspr = sprite_index;
lastplayerid = obj_player1.id;
attacking = false;
destroyed = false;
playerdestroyed = false;
colliding = true;

function SUPER_player_destroy(argument0)
{
    var lag;
    
    depth = argument0.depth;
    playerdestroyed = true;
    
    with (argument0)
    {
        camera_zoom(1, 0.1);
        scr_soundeffect(26);
        lag = room_speed * 3;
        other.hitLag = lag;
        other.hitX = room_width / 2;
        other.hitY = room_height / 2;
        other.x = other.hitX;
        other.y = other.hitY;
        other.state = UnknownEnum.Value_61;
        other.hitstate = UnknownEnum.Value_145;
        other.hitvsp = -4;
        other.hithsp = -other.image_xscale * 8;
        hitLag = lag;
        hitX = (room_width / 2) + (other.image_xscale * 16);
        hitY = (room_height / 2) - 5;
        x = hitX;
        y = hitY;
        xscale = -other.image_xscale;
        hitxscale = -other.image_xscale;
        sprite_index = spr_player_outofpizza1;
        hithsp = 15;
        hitstunned = 10000;
        hitvsp = -8;
        state = UnknownEnum.Value_137;
        instance_create(other.x, other.y, obj_parryeffect);
        
        with (obj_camera)
        {
            shake_mag = 3;
            shake_mag_acc = 3 / room_speed;
        }
    }
}

function SUPER_boss_destroy(argument0)
{
    var lag;
    
    destroyed = true;
    depth = argument0.depth;
    global.attackstyle = 0;
    global.savedattackstyle = 0;
    
    with (argument0)
    {
        camera_zoom(1, 0.1);
        
        if (state == UnknownEnum.Value_162 || state == UnknownEnum.Value_160 || state == UnknownEnum.Value_147 || state == UnknownEnum.Value_84)
        {
            sprite_index = spr_player_attackdash;
            image_index = 6;
            state = UnknownEnum.Value_42;
        }
        
        if (state != UnknownEnum.Value_61)
        {
            scr_soundeffect(26);
            tauntstoredmovespeed = movespeed;
            tauntstoredsprite = sprite_index;
            tauntstoredstate = state;
        }
        
        lag = room_speed * 3;
        other.image_xscale = -xscale;
        other.hitLag = lag;
        other.hitX = (room_width / 2) + (xscale * 16);
        other.hitY = (room_height / 2) - 5;
        other.x = other.hitX;
        other.y = other.hitY;
        other.hitvsp = -8;
        other.hithsp = -other.image_xscale * 15;
        other.state = UnknownEnum.Value_137;
        other.thrown = true;
        other.destroyable = true;
        other.colliding = true;
        other.grounded = false;
        hitLag = lag;
        hitX = room_width / 2;
        hitY = room_height / 2;
        x = hitX;
        y = hitY;
        state = UnknownEnum.Value_61;
        instance_create(other.x, other.y, obj_parryeffect);
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
    }
}

function SUPER_boss_hurt(argument0, argument1)
{
    var atstate, lag;
    
    if (important)
        hp -= argument0;
    
    if (argument1.state != UnknownEnum.Value_252)
    {
        with (obj_bosscontroller)
            super += 30;
    }
    
    with (argument1)
    {
        atstate = state;
        
        if (state == UnknownEnum.Value_42)
        {
            state = UnknownEnum.Value_6;
            sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5);
            image_index = 6;
        }
        
        if (state != UnknownEnum.Value_61)
        {
            scr_soundeffect(26);
            tauntstoredmovespeed = movespeed;
            tauntstoredsprite = sprite_index;
            tauntstoredstate = state;
        }
        
        state = UnknownEnum.Value_61;
        lag = 8;
        hitLag = lag;
        hitX = x;
        hitY = y;
        
        if (state == UnknownEnum.Value_61 || state == UnknownEnum.Value_137)
        {
            x = hitX;
            y = hitY;
        }
        
        if (other.state == UnknownEnum.Value_137 || other.state == UnknownEnum.Value_61)
        {
            other.x = other.hitX;
            other.y = other.hitY;
        }
        
        other.image_xscale = -xscale;
        other.hitLag = lag;
        other.hitX = other.x;
        other.hitY = other.y;
        other.jugglecount++;
        other.hitvsp = -9;
        other.movespeed = 7 + (other.jugglecount * 2);
        
        if (atstate == UnknownEnum.Value_147)
        {
            other.hitvsp = -14;
            other.movespeed = 0;
        }
        
        other.hithsp = -other.image_xscale * other.movespeed;
        other.state = UnknownEnum.Value_137;
        instance_create(other.x, other.y, obj_parryeffect);
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
    }
}

function SUPER_boss_hurt_noplayer(argument0)
{
    var lag;
    
    if (important)
        hp -= argument0;
    
    if (obj_player.state != UnknownEnum.Value_252)
    {
        with (obj_bosscontroller)
            super += 30;
    }
    
    lag = 8;
    
    if (state == UnknownEnum.Value_137 || state == UnknownEnum.Value_61)
    {
        x = hitX;
        y = hitY;
    }
    
    image_xscale = -other.image_xscale;
    hitLag = lag;
    hitX = x;
    hitY = y;
    hitvsp = -8;
    hithsp = other.image_xscale * 15;
    state = UnknownEnum.Value_137;
    instance_create(x, y, obj_parryeffect);
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
}

function SUPER_player_hurt(argument0, argument1)
{
    var lag;
    
    if (instance_exists(obj_bosscontroller))
        obj_bosscontroller.player_hp -= argument0;
    
    with (obj_bosscontroller)
        super += 80;
    
    with (argument1)
    {
        scr_soundeffect(26);
        lag = 8;
        
        if (state == UnknownEnum.Value_137 || state == UnknownEnum.Value_61)
        {
            x = hitX;
            y = hitY;
        }
        
        if (other.state == UnknownEnum.Value_61 || other.state == UnknownEnum.Value_137)
        {
            other.x = other.hitX;
            other.y = other.hitY;
        }
        
        other.hitLag = lag;
        other.hitX = other.x;
        other.hitY = other.y;
        other.state = UnknownEnum.Value_61;
        hitLag = lag;
        hitX = x;
        hitY = y;
        xscale = (x != other.x) ? sign(other.x - x) : -other.image_xscale;
        hitxscale = (x != other.x) ? sign(other.x - x) : -other.image_xscale;
        sprite_index = spr_hurt;
        hithsp = 15;
        
        if (hitstunned > 0)
        {
            hitstunned -= 50;
            
            if (hitstunned <= 0)
                hitstunned = 1;
        }
        else
        {
            hitstunned = 100;
        }
        
        hitvsp = -8;
        state = UnknownEnum.Value_137;
        instance_create(other.x, other.y, obj_parryeffect);
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_baddiegibs);
        instance_create(x, y, obj_baddiegibs);
        
        with (obj_camera)
        {
            shake_mag = 3;
            shake_mag_acc = 3 / room_speed;
        }
    }
}

function player_destroy(argument0)
{
    SUPER_player_destroy(argument0);
}

function boss_destroy(argument0)
{
    SUPER_boss_destroy(argument0);
}

function player_hurt(argument0, argument1)
{
    SUPER_player_hurt(argument0, argument1);
}

function boss_hurt(argument0, argument1)
{
    SUPER_boss_hurt(argument0, argument1);
}

function boss_hurt_noplayer(argument0)
{
    SUPER_boss_hurt_noplayer(argument0);
}

enum UnknownEnum
{
    Value_0,
    Value_6 = 6,
    Value_42 = 42,
    Value_61 = 61,
    Value_84 = 84,
    Value_137 = 137,
    Value_145 = 145,
    Value_147 = 147,
    Value_160 = 160,
    Value_162 = 162,
    Value_252 = 252
}
