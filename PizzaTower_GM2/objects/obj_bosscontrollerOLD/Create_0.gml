depth = obj_drawcontroller.depth + 2;

function get_player_hp()
{
}

player_hpmultiplier = 300;
player_hpbase = player_hpmultiplier * 5;
player_hpmax = player_hpbase;
player_hp = player_hpmax;
level_array[0] = "entrance";
level_array[1] = "medieval";
level_array[2] = "ruin";
level_array[3] = "dungeon";
toppin_count[0] = array_create(5, false);
toppin_count[1] = array_create(5, false);
toppin_count[2] = array_create(5, false);
toppin_count[3] = array_create(5, false);
toppin_count[4] = array_create(5, false);
maxminutes = 0;
maxseconds = 45;
round_count = 1;
round_max = 6;
timer_max = room_speed * 3;
timer_buffer = timer_max;
round_timermax = 2700;
round_timer = round_timermax;
minutes = maxminutes;
seconds = maxseconds;
use_countdown = true;
bossID = -4;
state = states.arena_intro;
fade = 1;
fakedeath = false;
extrarounds = false;
extrarounds_count = 3;
startroundfunc = -4;
endroundfunc = -4;
supermax = 1000;
super = 0;
intro_buffer = 300;
playerx = -415;
bossx = room_width;
vsy = -400;
flamey = 0;
flash = false;
flashed = false;
vstitle = 1400;
playerspr = 1405;
playersprshadow = 1404;
bossspr = 1403;
bosssprshadow = 1402;
round_ystart = 641;
round_y = round_ystart;
round_xstart = 480;
round_x = round_xstart;
bosstimer_x = 257;
bosstimer_y = 36;
bell_sprite = 2081;
bell_index = 0;
bell_buffer = 0;
bar_surface = -4;
barfill_x = 0;
bg_super_y = 0;
super_portrait_xstart = 201;
super_portrait_y = 300;
super_portrait_x_off = -190;
super_portrait_x = super_portrait_x_off;
super_portrait_state = 0;
super_portrait_index = 0;
portrait1_sprite = 1351;
portrait1_index = 0;
portrait2_sprite = 1249;
portrait2_index = 0;
portrait1_idle = 1351;
portrait1_hurt = 1332;
portrait2_idle = 1249;
portrait2_hurt = 1246;

enum UnknownEnum
{
    Value_144 = 144
}
