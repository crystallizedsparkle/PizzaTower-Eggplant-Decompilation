var i, lay_id, map_id, ts, t, _w32, yy, xx, _x, _y, data, _id, xi, yi, j;

alpha = 1;
depth = -8;
tiles[0] = array_create(0);
tiles[1] = array_create(0);
tiles[2] = array_create(0);

for (i = 0; i < 3; i++)
{
    lay_id = layer_get_id(concat("Tiles_Secret", i + 1));
    tilemap_sprite[i] = -4;
    
    if (lay_id != -1)
    {
        map_id = layer_tilemap_get_id(lay_id);
        ts = tilemap_get_tileset(map_id);
        t = -4;
        
        switch (ts)
        {
            case 74:
                t = 1851;
                break;
            
            case 75:
                t = 1853;
                break;
            
            case 90:
                t = 1958;
                break;
            
            case 91:
                t = 1959;
                break;
            
            case 94:
                t = 1965;
                break;
            
            case 79:
                t = 1886;
                break;
            
            case 49:
                t = 1744;
                break;
            
            case 51:
                t = 1737;
                break;
            
            case 50:
                t = 1743;
                break;
            
            case 76:
                t = 1873;
                break;
            
            case 77:
                t = 1874;
                break;
            
            case 78:
                t = 1875;
                break;
            
            case 65:
                t = 1902;
                break;
            
            case 64:
                t = 1797;
                break;
            
            case 86:
                t = 1942;
                break;
            
            case 95:
                t = 1971;
                break;
            
            case 96:
                t = 1972;
                break;
            
            case 97:
                t = 1978;
                break;
            
            case 123:
                t = 1835;
                break;
            
            case 23:
                t = 2506;
                break;
            
            case 83:
                t = 1928;
                break;
            
            case 85:
                t = 1937;
                break;
            
            case 84:
                t = 1936;
                break;
            
            case 47:
                t = 1718;
                break;
            
            case 25:
                t = 2040;
                break;
            
            case 125:
                t = 2639;
                break;
            
            case 99:
                t = 2006;
                break;
            
            case 100:
                t = 2013;
                break;
            
            case 101:
                t = 2011;
                break;
            
            case 12:
                t = 985;
                break;
            
            case 55:
                t = 1760;
                break;
            
            case 71:
                t = 1840;
                break;
            
            case 72:
                t = 1841;
                break;
            
            case 73:
                t = 1842;
                break;
            
            case 102:
                t = 2020;
                break;
            
            case 103:
                t = 2021;
                break;
            
            case 104:
                t = 2022;
                break;
            
            case 70:
                t = 1870;
                break;
            
            case 13:
                t = 172;
                break;
            
            case 115:
                t = 1394;
                break;
            
            case 109:
                t = 862;
                break;
            
            case 87:
                t = 1955;
                break;
            
            case 88:
                t = 1956;
                break;
            
            case 89:
                t = 1957;
                break;
            
            case 31:
                t = 2731;
                break;
            
            case 17:
                t = 1803;
                break;
            
            case 129:
                t = 2418;
                break;
            
            case 6:
                t = 1102;
                break;
            
            case 29:
                t = 1820;
                break;
            
            case 7:
                t = 1201;
                break;
            
            case 132:
                t = 1973;
                break;
            
            case 16:
                t = 116;
                break;
            
            case 122:
                t = 2836;
                break;
            
            case 133:
                t = 1357;
                break;
            
            case 4:
                t = 2095;
                break;
        }
        
        tilemap_sprite[i] = t;
        _w32 = sprite_get_width(t) / 32;
        
        for (yy = 0; yy < image_yscale; yy++)
        {
            for (xx = 0; xx < image_xscale; xx++)
            {
                _x = x + (xx * 32);
                _y = y + (yy * 32);
                data = tilemap_get_at_pixel(map_id, _x, _y);
                _id = tile_get_index(data);
                xi = 0;
                yi = 0;
                
                for (j = 0; j < _id; j++)
                {
                    xi++;
                    
                    if (xi >= _w32)
                    {
                        xi = 0;
                        yi++;
                    }
                }
                
                array_push(tiles[i], [_x, _y, xi * 32, yi * 32]);
                data = tile_set_empty(data);
                tilemap_set_at_pixel(map_id, data, _x, _y);
            }
        }
    }
}

trace(tilemap_sprite);

if (array_length(tiles[0]) <= 0 && array_length(tiles[1]) <= 0 && array_length(tiles[2]) <= 0)
    instance_destroy();
