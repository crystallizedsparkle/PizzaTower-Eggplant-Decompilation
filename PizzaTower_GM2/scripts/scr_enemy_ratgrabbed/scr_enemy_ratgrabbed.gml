function scr_enemy_ratgrabbed()
{
    var p;
    
    p = object_index == obj_junk || object_get_parent(object_index) == 382;
    
    if ((!p && state == UnknownEnum.Value_205) || (p && ratgrabbed))
    {
        visible = false;
        x = ratplayerid.x;
        y = ratplayerid.y;
        
        if (!p)
            sprite_index = stunfallspr;
        
        if (!p && state != UnknownEnum.Value_138)
            state = UnknownEnum.Value_205;
        
        if (p && !ratgrabbed)
            ratgrabbed = true;
        
        if (ratplayerid.state == UnknownEnum.Value_194 && ratplayerid.image_index >= 5)
        {
            hsp = ratplayerid.xscale * 22;
            vsp = -2;
            image_xscale = -ratplayerid.xscale;
            y = ratplayerid.y - 5;
            thrown = true;
            visible = true;
            
            if (!p)
            {
                grounded = false;
                hp = -1;
                alarm[1] = 5;
                state = UnknownEnum.Value_138;
                stunned = 200;
                hithsp = hsp;
                hitvsp = vsp;
                linethrown = true;
            }
            else
            {
                grounded = false;
                ratgrabbed = false;
            }
        }
    }
}

enum UnknownEnum
{
    Value_138 = 138,
    Value_194 = 194,
    Value_205 = 205
}
