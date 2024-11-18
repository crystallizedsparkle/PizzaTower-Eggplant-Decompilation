var i, b, a;

for (i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    b = ds_list_find_value(global.afterimage_list, i);
    
    with (b)
    {
        if (visible)
        {
            a = other.alpha[identifier];
            
            if (identifier == UnknownEnum.Value_3)
            {
                a = alpha;
                shader_set(shd_firemouth_afterimage);
            }
            else if (identifier == UnknownEnum.Value_4)
            {
                a = alpha;
                shader_set(shd_blue_afterimage);
            }
            else if (identifier == UnknownEnum.Value_5)
            {
                a = alpha;
                
                if (instance_exists(playerid))
                {
                    if (playerid != -4 && playerid.object_index != obj_pepgoblin)
                    {
                        shader_set(global.Pal_Shader);
                        pal_swap_set(playerid.spr_palette, playerid.paletteselect, false);
                    }
                }
            }
            
            draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, image_blend, a);
            
            if (identifier == UnknownEnum.Value_3 || identifier == UnknownEnum.Value_4 || (identifier == UnknownEnum.Value_5 && playerid != -4))
                shader_reset();
        }
    }
}

enum UnknownEnum
{
    Value_3 = 3,
    Value_4,
    Value_5
}
