function scr_player_playersuperattack()
{
    var dir, spd;
    
    image_speed = 0.5;
    
    switch (superattackstate)
    {
        case states.transitioncutscene:
            sprite_index = spr_rageidle;
            
            with (bossID)
            {
                hsp = 0;
                vsp = 0;
                x = hitX;
                y = hitY;
            }
            
            hsp = 0;
            vsp = 0;
            x = hitX;
            y = hitY;
            
            if (hitLag > 0)
                hitLag--;
            else
                superattackstate = states.jump;
            
            break;
        
        case states.jump:
            sprite_index = spr_grab;
            dir = point_direction(x, y, bossID.x, bossID.y);
            spd = 20;
            hsp = 0;
            vsp = 0;
            hsp = lengthdir_x(spd, dir);
            vsp = lengthdir_y(spd, dir);
            
            if (place_meeting(x, y, bossID))
            {
                superattackstate = states.punch;
                randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 557, 556, 555, spr_punch]);
                punchcount = 10;
                image_index = 0;
            }
            
            break;
        
        case states.punch:
            vsp = 0;
            hsp = xscale * 2;
            
            with (bossID)
            {
                x = other.x;
                y = other.y;
                hsp = other.hsp;
                image_xscale = -other.xscale;
            }
            
            if (floor(image_index) == (image_number - 1))
            {
                if (punchcount > 0)
                {
                    punchcount--;
                    randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, 557, 556, 555, spr_punch]);
                    image_index = 0;
                    scr_soundeffect(26);
                    
                    with (bossID)
                    {
                        boss_hurt_noplayer(25);
                        state = UnknownEnum.Value_252;
                    }
                }
                else
                {
                    with (bossID)
                    {
                        boss_hurt_noplayer(30);
                        state = states.hit;
                        hitX = x;
                        hitY = y;
                        hitvsp = -11;
                        stunned = 10;
                        image_xscale = -other.xscale;
                        hithsp = -image_xscale * 12;
                        movespeed = abs(hsp);
                        hitLag = 10;
                    }
                    
                    scr_soundeffect(26);
                    superattackstate = states.grab;
                    sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5);
                    image_index = 0;
                    finishingblow = false;
                }
            }
            
            break;
        
        case states.grab:
            if (image_index < 7)
            {
                hsp = 0;
                vsp = 0;
            }
            else if (!finishingblow)
            {
                finishingblow = true;
                vsp = -4;
                hsp = -xscale * 4;
            }
            
            if (floor(image_index) == (image_number - 1))
                state = states.normal;
            
            break;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_8 = 8,
    Value_79 = 79,
    Value_80,
    Value_92 = 92,
    Value_137 = 137,
    Value_252 = 252
}
