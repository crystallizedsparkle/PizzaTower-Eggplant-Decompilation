event_inherited();
state = UnknownEnum.Value_145;
ds_map_set(player_hurtstates, UnknownEnum.Value_42, 30);
ds_map_set(player_hurtstates, UnknownEnum.Value_41, 50);
ds_map_set(player_hurtstates, UnknownEnum.Value_104, 20);
ds_map_set(player_hurtstates, UnknownEnum.Value_121, 30);
ds_map_set(player_hurtstates, UnknownEnum.Value_108, 20);
ds_map_set(player_hurtstates, UnknownEnum.Value_80, 20);
ds_map_set(player_hurtstates, UnknownEnum.Value_5, 20);
ds_map_set(player_hurtstates, UnknownEnum.Value_97, 20);
ds_map_set(boss_hurtstates, UnknownEnum.Value_83, 60);
ds_map_set(boss_hurtstates, UnknownEnum.Value_153, 60);
ds_map_set(boss_hurtstates, UnknownEnum.Value_157, 90);
ds_map_set(boss_hurtstates, UnknownEnum.Value_76, 200);
ds_map_set(boss_hurtstates, UnknownEnum.Value_80, 30);
ds_map_set(boss_hurtstates, UnknownEnum.Value_108, 70);
stunfallspr = 2220;
walkspr = 2823;
idlespr = 2592;
spr_dead = 2328;
tauntspr = 1295;
fallspr = 1449;
defeatplayerspr = 609;
normal_spd = 6;
shoulder_spd = 12;
attack_max[0] = 120;
attack_max[1] = 80;
attack_max[2] = 0;
attack_max[3] = 0;
attack_max[4] = 0;
attack_max[5] = 0;
attack_cooldown = attack_max[0];
targetstunned = 0;
targetstunnedminus[0] = 40;
targetstunnedminus[1] = 40;
targetstunnedminus[2] = 40;
targetstunnedminus[3] = 40;
targetstunnedminus[4] = 40;
targetstunnedminus[5] = 40;
targetxscale = 1;
phase = 1;
max_phase = 6;
max_hp = 500 * max_phase;
hp = max_hp;
xscale = 1;
jumping_pepper = false;
shoulderbash_fakeout = false;
groundpound_fakeout = false;
groundpound_readjust = 3;
groundpound_readjust_max = 16;
groundpound_readjust_buffer = groundpound_readjust_max;
readjusting = false;
superjumping_pepper = false;
shoulderturns = 3;
target_x = 0;
shoulderpound_fakeout = false;
shoulderpound_buffer = 0;
shoulderpound_max = 60;
chooseparry_max[0] = 600;
chooseparry_max[1] = 480;
chooseparry_max[2] = 300;
chooseparry_max[3] = 300;
chooseparry_max[4] = 300;
chooseparry_max[5] = 300;
chooseparry_random = 4;
chooseparry_buffer = chooseparry_max[phase - 1];
taunt_buffer = 0;
taunt_max = 25;
fistmatch_buffer = 0;
fistmatch_max = 360;
fist_buffer = 0;
fist_max = 20;
fist_dmg = 10;
fist_dmg_player = 20;
superattack_hpthreshold = 500;
superattack_buffer = 0;
superattack_max = 360;

function player_destroy(argument0)
{
    SUPER_player_destroy(argument0);
}

function boss_destroy(argument0)
{
    hitstate = UnknownEnum.Value_0;
    SUPER_boss_destroy(argument0);
    
    with (obj_peppermanbrick)
        instance_destroy();
    
    global.peppermancutscene2 = true;
    quick_ini_write_real(get_savefile_ini(), "cutscene", "pepperman2", true);
    targetstunned = 1000;
    stunned = 1000;
}

function boss_hurt(argument0, argument1)
{
    if (targetstunned > 0)
    {
        targetstunned -= targetstunnedminus[phase - 1];
        attack_cooldown = 0;
        
        if (targetstunned < 0)
            targetstunned = 1;
    }
    else
    {
        targetstunned = 150;
    }
    
    SUPER_boss_hurt(argument0, argument1);
    targetxscale = -argument1.xscale;
}

function boss_hurt_noplayer(argument0)
{
    if (targetstunned > 0)
    {
        targetstunned -= targetstunnedminus[phase - 1];
        attack_cooldown = 0;
        
        if (targetstunned < 0)
            targetstunned = 1;
    }
    else
    {
        targetstunned = 150;
    }
    
    SUPER_boss_hurt_noplayer(argument0);
}

function player_hurt(argument0, argument1)
{
    var _prevstate;
    
    if (argument1.state != UnknownEnum.Value_84 || argument1.parry_inst == -4)
    {
        _prevstate = state;
        SUPER_player_hurt(argument0, argument1);
        
        if (_prevstate == UnknownEnum.Value_153 || _prevstate == UnknownEnum.Value_157 || _prevstate == UnknownEnum.Value_83 || _prevstate == UnknownEnum.Value_76)
        {
            with (obj_camera)
            {
                shake_mag = 3;
                shake_mag_acc = 3 / room_speed;
            }
            
            hitstate = UnknownEnum.Value_138;
            stunned = 70;
            hitvsp = -4;
            hithsp = -image_xscale * 8;
        }
        else if (_prevstate == UnknownEnum.Value_84)
        {
            with (obj_camera)
            {
                shake_mag = 3;
                shake_mag_acc = 3 / room_speed;
            }
            
            sprite_index = spr_pepperman_throw;
            image_index = 0;
            hitstate = UnknownEnum.Value_147;
            hitvsp = 0;
            hithsp = 0;
            movespeed = 8;
        }
        else
        {
            hithsp = 0;
            hitvsp = -4;
            hitstate = UnknownEnum.Value_0;
        }
    }
    else if (state == UnknownEnum.Value_76)
    {
        with (argument1)
        {
            if (state == UnknownEnum.Value_137 || state == UnknownEnum.Value_61)
            {
                x = hitX;
                y = hitY;
            }
            
            if (other.state == UnknownEnum.Value_137 || other.state == UnknownEnum.Value_61)
            {
                other.x = hitX;
                other.y = hitY;
            }
            
            sprite_index = spr_idle;
            state = UnknownEnum.Value_162;
            hitX = x;
            hitY = y;
            hsp = 0;
            vsp = 0;
            movespeed = 0;
            other.sprite_index = other.idlespr;
            other.state = UnknownEnum.Value_162;
            other.image_xscale = -xscale;
            other.hitX = x + (xscale * 16);
            other.hitY = y;
            other.hsp = 0;
            other.vsp = 0;
            other.fistmatch_buffer = other.fistmatch_max;
            camera_zoom(0.6, 0.1);
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_5 = 5,
    Value_41 = 41,
    Value_42,
    Value_61 = 61,
    Value_76 = 76,
    Value_80 = 80,
    Value_83 = 83,
    Value_84,
    Value_97 = 97,
    Value_104 = 104,
    Value_108 = 108,
    Value_121 = 121,
    Value_137 = 137,
    Value_138,
    Value_145 = 145,
    Value_147 = 147,
    Value_153 = 153,
    Value_157 = 157,
    Value_162 = 162
}
