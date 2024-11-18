var i, b, l, p, m, t;

for (i = 0; i < ds_list_size(global.afterimage_list); i++)
{
    b = ds_list_find_value(global.afterimage_list, i);
    
    with (b)
    {
        for (l = 0; l < array_length(alarm); l++)
        {
            if (alarm[l] >= 0)
                alarm[l]--;
        }
        
        switch (identifier)
        {
            case UnknownEnum.Value_1:
                if (!(playerid.state == UnknownEnum.Value_92 && playerid.sprite_index == spr_playerN_noisebombspinjump) && playerid.pizzapepper == 0 && playerid.state != UnknownEnum.Value_191 && playerid.sprite_index != spr_player_barrelroll && playerid.state != UnknownEnum.Value_55 && playerid.state != UnknownEnum.Value_147 && playerid.state != UnknownEnum.Value_41 && playerid.state != UnknownEnum.Value_80 && playerid.state != UnknownEnum.Value_41 && playerid.state != UnknownEnum.Value_31 && playerid.state != UnknownEnum.Value_102 && playerid.state != UnknownEnum.Value_4 && playerid.pogochargeactive == false && playerid.state != UnknownEnum.Value_20 && playerid.state != UnknownEnum.Value_121 && playerid.state != UnknownEnum.Value_37 && playerid.state != UnknownEnum.Value_19 && playerid.state != UnknownEnum.Value_128 && playerid.state != UnknownEnum.Value_104 && playerid.state != UnknownEnum.Value_42 && playerid.state != UnknownEnum.Value_105 && playerid.state != UnknownEnum.Value_75 && playerid.state != UnknownEnum.Value_63 && playerid.state != UnknownEnum.Value_73 && playerid.state != UnknownEnum.Value_76 && playerid.state != UnknownEnum.Value_65 && playerid.state != UnknownEnum.Value_61 && playerid.state != UnknownEnum.Value_97 && playerid.state != UnknownEnum.Value_33)
                    alarm[0] = 0;
                
                if (playerid.state == UnknownEnum.Value_104 || playerid.state == UnknownEnum.Value_103 || playerid.state == UnknownEnum.Value_121)
                {
                    p = 4;
                    m = playerid.movespeed - p;
                    t = 12 - p;
                    alpha = m / t;
                    alpha = clamp(alpha, 0, 1);
                }
                
                visible = playerid.visible;
                
                with (playerid)
                {
                    if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
                        other.visible = false;
                }
                
                break;
            
            case UnknownEnum.Value_2:
                x += hsp;
                y += vsp;
                break;
            
            case UnknownEnum.Value_3:
            case UnknownEnum.Value_4:
                alpha -= 0.05;
                
                if (alpha <= 0 && alarm[0] != 0)
                    alarm[0] = 0;
                
                break;
                break;
            
            case UnknownEnum.Value_5:
                alpha -= 0.15;
                
                if (alpha <= 0 && alarm[0] != 0)
                    alarm[0] = 0;
                
                if (playerid != -4 && instance_exists(playerid))
                    visible = playerid.visible;
                
                break;
        }
        
        if (alarm[1] == 0)
        {
            other.alpha[identifier] = 0;
            alarm[2] = 3;
        }
        
        if (alarm[2] == 0)
        {
            other.alpha[identifier] = 1;
            
            if (identifier == UnknownEnum.Value_1)
                other.alpha[identifier] = alpha;
            
            alarm[2] = 3;
        }
        
        if (alarm[0] == 0)
        {
            b = undefined;
            ds_list_delete(global.afterimage_list, i);
            i--;
        }
        else
        {
        }
    }
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_19 = 19,
    Value_20,
    Value_31 = 31,
    Value_33 = 33,
    Value_37 = 37,
    Value_41 = 41,
    Value_42,
    Value_55 = 55,
    Value_61 = 61,
    Value_63 = 63,
    Value_65 = 65,
    Value_73 = 73,
    Value_75 = 75,
    Value_76,
    Value_80 = 80,
    Value_92 = 92,
    Value_97 = 97,
    Value_102 = 102,
    Value_103,
    Value_104,
    Value_105,
    Value_121 = 121,
    Value_128 = 128,
    Value_147 = 147,
    Value_191 = 191
}
