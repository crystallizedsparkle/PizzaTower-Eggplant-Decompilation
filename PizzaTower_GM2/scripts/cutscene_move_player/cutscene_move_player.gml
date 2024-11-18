function cutscene_move_player(argument0, argument1, argument2, argument3)
{
    var player, x_to, max_hsp, threshold, finish;
    
    player = argument0;
    x_to = argument1;
    max_hsp = argument2;
    threshold = argument3;
    finish = false;
    
    with (player)
    {
        sprite_index = spr_move;
        image_speed = 0.6;
        
        if (x < (x_to - threshold))
        {
            xscale = 1;
            
            if (hsp < max_hsp)
                hsp += 0.5;
            else
                hsp = max_hsp;
        }
        else if (x > (x_to + threshold))
        {
            xscale = -1;
            
            if (hsp > -max_hsp)
                hsp -= 0.5;
            else
                hsp = -max_hsp;
        }
        else
        {
            hsp = 0;
            finish = true;
        }
        
        if (place_meeting(x + hsp, y, obj_solid))
            finish = true;
    }
    
    if (finish)
        cutscene_end_action();
    
    with (player)
    {
        if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && steppy == false && character != "V")
        {
            instance_create(x, y + 43, obj_cloudeffect);
            steppy = true;
        }
        
        if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
            steppy = false;
    }
}
