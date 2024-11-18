event_inherited();
boss_array[0] = -4;
boss_array[1] = [52, 1];
boss_array[2] = [832, 1];
boss_array[3] = [191, 1];
boss_array[4] = [52, 6];
boss_array[5] = [832, 6];
boss_array[6] = [191, 6];
state = UnknownEnum.Value_145;
attack_pool = [UnknownEnum.Value_174, UnknownEnum.Value_175, UnknownEnum.Value_176, UnknownEnum.Value_92, UnknownEnum.Value_177, UnknownEnum.Value_179, UnknownEnum.Value_180];
ds_map_set(player_hurtstates, UnknownEnum.Value_42, 30);
ds_map_set(player_hurtstates, UnknownEnum.Value_41, 50);
ds_map_set(player_hurtstates, UnknownEnum.Value_104, 20);
ds_map_set(player_hurtstates, UnknownEnum.Value_121, 30);
ds_map_set(boss_hurtstates, UnknownEnum.Value_80, 30);
ds_map_set(boss_hurtstates, UnknownEnum.Value_174, 30);
phase = 1;
max_phase = 7;
max_hp = 500 * max_phase;
hp = max_hp;
stunfallspr = 1093;
walkspr = 1703;
idlespr = 1703;
spr_dead = 1093;
fallspr = 2470;
bumpspr = 1093;
defeatplayerspr = 1703;
movespeed = 0;
move = 0;
normal_spd = 6;
helicopterspeed = 6;
panicjumpspeed = 12;
shield_buffer = 0;
shield_max = 180;
cardboard_buffer = 0;
cardboard_max = 180;
do_mockery_max = 300;
do_mockery_buffer = do_mockery_max;
mockery_buffer = 0;
mockery_max = 360;
helicopterstate = 0;
helicoptery = y;
warped = false;
attack_max[0] = 40;
attack_max[1] = 40;
attack_max[2] = 40;
attack_max[3] = 40;
attack_max[4] = 40;
attack_max[5] = 40;
attack_max[6] = 40;
attack_cooldown = attack_max[0];
dashcloudid = -4;
targetstunned = 0;
targetstunnedminus[0] = 30;
targetstunnedminus[1] = 30;
targetstunnedminus[2] = 30;
targetstunnedminus[3] = 30;
targetstunnedminus[4] = 30;
targetstunnedminus[5] = 30;
targetstunnedminus[6] = 30;

function boss_destroy(argument0)
{
    SUPER_boss_destroy(argument0);
    targetstunned = 1000;
    stunned = 1000;
    global.mrstickcutscene3 = true;
    quick_ini_write_real(get_savefile_ini(), "cutscene", "mrstick3", true);
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
    if (!argument1.inv_frames && (argument1.state != UnknownEnum.Value_84 || argument1.parry_inst == -4))
    {
        hitstate = state;
        hithsp = hsp;
        hitvsp = vsp;
        SUPER_player_hurt(argument0, argument1);
        
        with (argument1)
        {
            inv_frames = true;
            alarm[1] = 15;
        }
    }
}

enum UnknownEnum
{
    Value_41 = 41,
    Value_42,
    Value_80 = 80,
    Value_84 = 84,
    Value_92 = 92,
    Value_104 = 104,
    Value_121 = 121,
    Value_145 = 145,
    Value_174 = 174,
    Value_175,
    Value_176,
    Value_177,
    Value_179 = 179,
    Value_180
}
