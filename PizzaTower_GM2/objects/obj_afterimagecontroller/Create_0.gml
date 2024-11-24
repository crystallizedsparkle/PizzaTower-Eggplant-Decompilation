depth = 1;
global.afterimage_list = ds_list_create();
alpha = array_create(afterimages.last, 1);
alpha[afterimages.heatattack] = 0.5;
shd_alpha = shader_get_uniform(shd_firemouth_afterimage, "newAlpha");

