var i, b, a;

for (i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    b = ds_list_find_value(global.afterimage_list, i);
    
    with (b)
    {
        if (visible)
        {
            a = other.alpha[identifier];
            
            if (identifier == afterimages.firemouth)
            {
                a = alpha;
                shader_set(shd_firemouth_afterimage);
            }
            else if (identifier == afterimages.blue)
            {
                a = alpha;
                shader_set(shd_blue_afterimage);
            }
            else if (identifier == afterimages.blur)
            {
                a = alpha;
                
                if (instance_exists(playerid))
                {
                    if (playerid != noone && playerid.object_index != obj_pepgoblin)
                    {
                        shader_set(global.Pal_Shader);
                        pal_swap_set(playerid.spr_palette, playerid.paletteselect, false);
                    }
                }
            }
            
            draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, image_blend, a);
            
            if (identifier == states.boots || identifier == states.grabbed || (identifier == states.tumble && playerid != noone))
                shader_reset();
        }
    }
}

