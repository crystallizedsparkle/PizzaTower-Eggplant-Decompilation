var p, t;

if (!ds_exists(tex_list, ds_type_list))
    exit;

p = tex_max - ds_list_size(tex_list);
t = (p / tex_max) * 100;
draw_healthbar(0, 524, 960, 540, t, c_black, c_white, c_white, 0, false, false);