if (obj_player1.spotlight == true)
    playerid = 324;
else
    playerid = 323;

visible = playerid.visible;

if (set == false)
{
    switch (toppinwarrior)
    {
        case 1:
            depth = 10;
            spr_idle = 2189;
            spr_pose = 2190;
            spr_run = 2191;
            spr_attack = 2193;
            spr_hurt = 2194;
            global.toppinwarriorid1 = id;
            set = true;
            break;
        
        case 2:
            depth = 11;
            spr_idle = 2196;
            spr_pose = 2197;
            spr_run = 2198;
            spr_attack = 2199;
            spr_hurt = 2200;
            global.toppinwarriorid2 = id;
            set = true;
            break;
        
        case 3:
            depth = 12;
            spr_idle = 2203;
            spr_pose = 2204;
            spr_run = 2205;
            spr_attack = 2206;
            spr_hurt = 2207;
            global.toppinwarriorid3 = id;
            set = true;
            break;
        
        case 4:
            depth = 13;
            spr_idle = 2208;
            spr_pose = 2209;
            spr_run = 2210;
            spr_attack = 2212;
            spr_hurt = 2213;
            global.toppinwarriorid4 = id;
            set = true;
            break;
        
        case 5:
            depth = 14;
            spr_idle = 2214;
            spr_pose = 2215;
            spr_run = 2217;
            spr_attack = 2218;
            spr_hurt = 2219;
            global.toppinwarriorid5 = id;
            set = true;
            break;
    }
}
