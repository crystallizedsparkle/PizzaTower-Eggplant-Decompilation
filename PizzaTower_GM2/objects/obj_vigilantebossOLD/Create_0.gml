event_inherited();
state = UnknownEnum.Value_145;
ds_map_set(player_hurtstates, UnknownEnum.Value_42, 30);
ds_map_set(player_hurtstates, UnknownEnum.Value_41, 50);
ds_map_set(player_hurtstates, UnknownEnum.Value_104, 20);
ds_map_set(player_hurtstates, UnknownEnum.Value_121, 30);
ds_map_set(boss_hurtstates, UnknownEnum.Value_80, 30);
ds_map_set(boss_hurtstates, UnknownEnum.Value_102, 30);
ds_map_set(boss_hurtstates, UnknownEnum.Value_82, 30);
ds_map_set(boss_hurtstates, UnknownEnum.Value_42, 30);
ds_map_set(boss_hurtstates, UnknownEnum.Value_80, 60);
ds_map_set(boss_hurtstates, UnknownEnum.Value_166, 20);
ds_map_set(boss_hurtstates, UnknownEnum.Value_108, 60);
phase = 1;
max_phase = 6;
max_hp = 500 * max_phase;
hp = max_hp;
stunfallspr = 2323;
walkspr = 2308;
idlespr = 2297;
spr_dead = 2324;
tauntspr = 2369;
fallspr = 2310;
bumpspr = 2316;
parryspr = 2387;
defeatplayerspr = 2387;
movespeed = 0;
move = 0;
normal_spd = 6;
changeside_spd = 10;
dynamite_buffer = 0;
dynamite_max = 20;
dynamite_count = 1;
millionpunch_buffer = 0;
millionpunch_max = 180;
normalattack_cooldown = 0;
normalattack_max[3] = 180;
normalattack_max[4] = 120;
normalattack_max[5] = 60;
cancel_buffer = 0;
cancel_max = ds_map_create();
cancel_maxdefault = 60;
ds_map_set(cancel_max, UnknownEnum.Value_166, millionpunch_max / 2);
ds_map_set(cancel_max, UnknownEnum.Value_164, 10);
ds_map_set(cancel_max, UnknownEnum.Value_1, 30);
ds_map_set(cancel_max, UnknownEnum.Value_103, 120);
combo_count = 0;
duelintro_buffer = 0;
duelintro_max = 240;
duelhp_threshold = 300;
duelseconds_threshold = 25;
duel_buffer = 0;
duel_max = 120;
duel_random = 80;
duelinst = -4;
revolver_count = 0;
revolver_jump = -1;
revolver_jumpcount = 0;
dynamite_shot = false;
superkickattackpursuit = false;
superkickattack_jump = false;
changeside_skid = false;
honor = true;
nexthonor = true;
chooseparry_max[0] = 480;
chooseparry_max[1] = 420;
chooseparry_max[2] = 360;
chooseparry_max[3] = 300;
chooseparry_max[4] = 300;
chooseparry_max[5] = 300;
chooseparry_random = 4;
chooseparry_buffer = chooseparry_max[phase - 1];
taunt_buffer = 0;
taunt_max = 25;
attack_max[0] = 120;
attack_max[1] = 80;
attack_max[2] = 70;
attack_max[3] = 70;
attack_max[4] = 80;
attack_max[5] = 80;
attack_cooldown = attack_max[0];
dashcloudid = -4;
targetstunned = 0;
targetstunnedminus[0] = 30;
targetstunnedminus[1] = 30;
targetstunnedminus[2] = 30;
targetstunnedminus[3] = 30;
targetstunnedminus[4] = 30;
targetstunnedminus[5] = 30;

function boss_destroy(argument0)
{
    SUPER_boss_destroy(argument0);
    targetstunned = 1000;
    stunned = 1000;
    global.vigilantecutscene2 = true;
    quick_ini_write_real(get_savefile_ini(), "cutscene", "vigilante2", true);
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
        
        if (state != UnknownEnum.Value_82 || vsp < 0)
        {
            SUPER_player_hurt(argument0, argument1);
            
            with (argument1)
            {
                inv_frames = true;
                alarm[1] = 15;
            }
            
            if (hitstate == UnknownEnum.Value_160)
            {
                hithsp = 0;
                hitvsp = 0;
            }
        }
    }
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_41 = 41,
    Value_42,
    Value_80 = 80,
    Value_82 = 82,
    Value_84 = 84,
    Value_102 = 102,
    Value_103,
    Value_104,
    Value_108 = 108,
    Value_121 = 121,
    Value_145 = 145,
    Value_160 = 160,
    Value_164 = 164,
    Value_166 = 166
}