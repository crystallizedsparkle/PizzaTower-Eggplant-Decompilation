var val;

if (room == rm_editor)
    exit;

if (audio_is_playing(sfx_collecttopping))
    audio_stop_sound(sfx_collecttopping);

scr_soundeffect(17);

if (obj_player1.character == "V")
    global.playerhealth = clamp(global.playerhealth + 1, 0, 100);

global.heattime += 10;
global.heattime = clamp(global.heattime, 0, 60);
global.combotime += 10;
global.combotime = clamp(global.combotime, 0, 60);

with (obj_camera)
    healthshaketime = 30;

val = heat_calculate(10);
global.collect += val;
create_collect(x, y, sprite_index);

with (instance_create(x + 16, y, obj_smallnumber))
    number = string(val);

instance_destroy();
