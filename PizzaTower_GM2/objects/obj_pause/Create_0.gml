var i;

pause = false;
i = false;
color = make_color_rgb(121, 103, 151);
selected = 0;
stickpressed = false;
image_speed = 0;
depth = -998;
pause_menu = ["RESUME", "OPTIONS", "RESTART LEVEL", "EXIT LEVEL"];
cursor_index = 0;
cursor_sprite_number = sprite_get_number(spr_cursor);
cursor_sprite_height = sprite_get_height(spr_cursor);
peppino_sprite = 715;
peppino_sprite_number = sprite_get_number(peppino_sprite);
peppino_index = 0;
toppin_sprite[0] = 1228;
toppin_sprite[1] = 1218;
toppin_sprite[2] = 1223;
toppin_sprite[3] = 1237;
toppin_sprite[4] = 1232;

for (i = 0; i < array_length(toppin_sprite); i++)
{
    toppin_number[i] = sprite_get_number(toppin_sprite[i]);
    toppin_index[i] = 0;
    toppin_has[i] = false;
}
