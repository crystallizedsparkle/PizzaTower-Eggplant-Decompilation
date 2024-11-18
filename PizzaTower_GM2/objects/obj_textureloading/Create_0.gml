var group_arr, i, _tex_array;

tex_list = -4;
draw_flush();
group_arr = ["playergroup", "backgroundgroup", "hudgroup", "smallgroup", "baddiegroup", "levelstructuregroup"];
tex_list = ds_list_create();
tex_pos = 0;

for (i = 0; i < array_length(group_arr); i++)
{
    _tex_array = texturegroup_get_textures(group_arr[i]);
    ds_list_add(tex_list, _tex_array);
}

tex_max = ds_list_size(tex_list);
alarm[0] = 70;
