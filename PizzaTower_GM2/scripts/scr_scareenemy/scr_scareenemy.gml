function scr_scareenemy()
{
    var player;
    
    player = instance_nearest(x, y, obj_player);
    
    if (state != states.grabbed && state != states.stun && state != states.hit && state != UnknownEnum.Value_266)
    {
        if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)) && ((player.xscale > 0 && x >= player.x) || (player.xscale < 0 && x <= player.x)))
        {
            if (sprite_index != scaredspr && state != states.stun && state != states.staggered && (player.state == states.chainsawbump || player.state == states.mach3 || player.state == states.rideweenie || player.state == states.rocket || player.state == states.tacklecharge || player.state == states.knightpepslopes || (player.state == states.grab && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding)))
            {
                state = states.idle;
                sprite_index = scaredspr;
                
                if (x != player.x)
                    image_xscale = -sign(x - player.x);
                
                scaredbuffer = 100;
                
                if (grounded)
                    vsp = -3;
            }
        }
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_20 = 20,
    Value_31 = 31,
    Value_38 = 38,
    Value_41 = 41,
    Value_79 = 79,
    Value_121 = 121,
    Value_126 = 126,
    Value_137 = 137,
    Value_138,
    Value_155 = 155,
    Value_184 = 184,
    Value_266 = 266
}
