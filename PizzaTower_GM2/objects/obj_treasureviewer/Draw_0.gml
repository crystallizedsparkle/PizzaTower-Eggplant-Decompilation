var n, x1, y1, yy, y2, xx, b, x2, tx, ty, dir, lx, ly;

if (visible)
{
    n = 0;
    x1 = 160;
    y1 = 96;
    
    for (yy = 0; yy < 2; yy++)
    {
        y2 = yy * 64;
        
        for (xx = 0; xx < floor(array_length(treasure_arr) / 2); xx++)
        {
            b = treasure_arr[n];
            x2 = xx * 64;
            draw_sprite(spr_treasurespace, 0, x1 + x2, y1 + y2);
            
            if (treasure_pos == n)
            {
                switch (treasure_state)
                {
                    case 0:
                        treasure_posX = obj_player1.x - 18;
                        treasure_posY = obj_player1.y - 35;
                        break;
                    
                    case 1:
                        tx = x1 + x2;
                        ty = y1 + y2;
                        dir = point_direction(treasure_posX, treasure_posY, tx, ty);
                        lx = lengthdir_x(16, dir);
                        ly = lengthdir_y(16, dir);
                        treasure_posX = Approach(treasure_posX, tx, abs(lx));
                        treasure_posY = Approach(treasure_posY, ty, abs(ly));
                        break;
                }
            }
            else if (b[0])
            {
                draw_sprite(b[1], 0, x1 + x2, y1 + y2);
            }
            
            n++;
        }
    }
    
    draw_sprite(treasure_arr[treasure_pos][1], 0, treasure_posX, treasure_posY);
}
