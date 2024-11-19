var _baddieID, lag, baddie_id, debriscount;

_baddieID = other.baddieID;

if (!instance_exists(_baddieID))
    exit;

if (_baddieID.state != states.grabbed && !_baddieID.invincible && _baddieID.hittable && _baddieID.state != states.ghostpossess)
{
    with (playerid)
    {
        if ((floor(image_index) < 4 || (global.attackstyle == 3 && image_index < 6)) && (state == states.lungeattack || state == states.handstandjump) && state != states.chainsaw && _baddieID.state != states.hit)
        {
            lag = 5;
            baddie_id = _baddieID.id;
            movespeed = 6;
            
            if (ds_list_find_index(hitlist, baddie_id) == -1)
            {
                ds_list_add(hitlist, baddie_id);
                
                with (_baddieID)
                {
                    hp -= 0.5;
                    instance_create(x, y, obj_bangeffect);
                    state = states.hit;
                    image_xscale = -other.xscale;
                    hit_connected = true;
                    hithsp = ((other.x + ((other.movespeed + 0.5) * 60 * other.xscale)) - x) / 60;
                    hitvsp = (other.y - 180 - y) / 60;
                    trace([hithsp, hitvsp]);
                    hitLag = lag;
                    hitX = x;
                    hitY = y;
                    invtime = lag + 5;
                    flash = true;
                    
                    if (!important)
                    {
                        global.combotime = 60;
                        global.heattime = 60;
                    }
                }
                
                hit_connected = true;
                lunge_hits++;
                finisher_hits++;
                lunge_hit_buffer = 100;
                
                if (state == states.handstandjump)
                {
                    state = states.lungeattack;
                    randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 557, 556, 555, spr_punch]);
                    image_index = 0;
                }
                
                tauntstoredstate = state;
                tauntstoredsprite = sprite_index;
                tauntstoredmovespeed = movespeed;
                tauntstoredvsp = 0;
                state = states.chainsaw;
                hitLag = lag;
                hitX = x;
                
                if (hit_connected)
                    hitvsp = 0;
                else
                    hitvsp = vsp;
                
                hitY = y;
                scr_soundeffect(26);
                debriscount = floor(lunge_hits / 5);
                
                repeat (2 + debriscount)
                {
                    with (create_debris(x, y, 1141))
                        vsp = irandom_range(-6, -11);
                }
                
                instance_create(other.x, other.y, obj_parryeffect);
            }
        }
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_17 = 17,
    Value_42 = 42,
    Value_43,
    Value_61 = 61,
    Value_137 = 137
}
