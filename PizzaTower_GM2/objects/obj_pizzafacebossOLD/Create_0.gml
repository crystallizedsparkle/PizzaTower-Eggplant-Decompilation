event_inherited();
ds_map_set(player_hurtstates, states.handstandjump, 30);
ds_map_set(player_hurtstates, states.chainsawbump, 50);
ds_map_set(player_hurtstates, states.mach2, 20);
ds_map_set(player_hurtstates, states.mach3, 30);
ds_map_set(player_hurtstates, states.knightpep, 60);
ds_map_set(boss_hurtstates, UnknownEnum.Value_244, 60);
ds_map_set(boss_hurtstates, UnknownEnum.Value_245, 50);
ds_map_set(boss_hurtstates, UnknownEnum.Value_246, 50);
ds_map_set(boss_hurtstates, UnknownEnum.Value_248, 50);
ds_map_set(boss_hurtstates, UnknownEnum.Value_249, 50);
hitlist = ds_list_create();
image_speed = 0.35;
max_hp = 3600;
hp = max_hp;
shot = false;
phase = 0;
has_attacked = false;
floatdir = 1;
attackbuffermax = 180;
attackbuffer = attackbuffermax;
phase1attacks = [states.pizzaface_moustache, states.pizzaface_eyes, states.pizzaface_mouth, states.pizzaface_nose];
lostattacks = array_length(phase1attacks);
parrycount = 0;
transitionstate = 0;
bombtimer = 0;
hasbomb = false;
bombgrabID = -4;
knightbuffer = 0;
spawnpool = [465, 431];
hitplayer = false;

function player_hurt(argument0, argument1)
{
    var _prevstate;
    
    _prevstate = state;
    
    if (phase < 2)
    {
        SUPER_player_hurt(argument0, argument1);
    }
    else if ((argument1.state != states.backbreaker || argument1.parry_inst == -4) && argument1.state != states.parry && ds_list_find_index(hitlist, argument1) == -1)
    {
        ds_list_add(hitlist, argument1);
        SUPER_player_hurt(argument0, argument1);
        state = _prevstate;
        hitplayer = true;
    }
}

function boss_hurt(argument0, argument1)
{
    var _removehp;
    
    if (phase == 0)
    {
        SUPER_boss_hurt(argument0, argument1);
    }
    else
    {
        _removehp = true;
        
        with (argument1)
        {
            if (state != states.lungeattack && state != states.knightpep)
            {
                scr_pummel();
            }
            else if (state == states.knightpep && vsp > 0 && y < (other.y - 30))
            {
                sprite_index = spr_knightpep_doublejump;
                image_index = 0;
                vsp = -11;
                movespeed = 6;
            }
            else if (state != states.lungeattack && state != states.parry)
            {
                _removehp = false;
            }
            
            if (state == states.lungeattack)
                movespeed = 4;
        }
        
        if (_removehp)
        {
            hp -= argument0;
            scr_soundeffect(26);
        }
    }
}

function boss_hurt_noplayer(argument0)
{
    if (inv_timer <= 0)
    {
        hp -= argument0;
        inv_timer = 10;
    }
}

enum UnknownEnum
{
    Value_41 = 41,
    Value_42,
    Value_43,
    Value_47 = 47,
    Value_84 = 84,
    Value_104 = 104,
    Value_121 = 121,
    Value_147 = 147,
    Value_226 = 226,
    Value_227,
    Value_228,
    Value_229,
    Value_244 = 244,
    Value_245,
    Value_246,
    Value_248 = 248,
    Value_249
}
