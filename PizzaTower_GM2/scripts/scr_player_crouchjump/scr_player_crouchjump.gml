function scr_player_crouchjump()
{
    move = key_left + key_right;
    mask_index = spr_crouchmask;
    hsp = move * movespeed;
    movespeed = 4;
    
    if (!key_jump2 && !jumpstop && jumpAnim)
    {
        vsp /= 2;
        jumpstop = true;
    }
    
    if (scr_solid(x, y - 1) && !jumpstop && jumpAnim)
    {
        vsp = grav;
        jumpstop = true;
    }
    
    if (grounded)
    {
        state = states.crouch;
        jumpAnim = true;
        crouchAnim = true;
        image_index = 0;
        jumpstop = false;
        scr_soundeffect(sfx_step);
    }
    
    if (jumpAnim == true)
    {
        if (!shotgunAnim)
            sprite_index = spr_crouchjump;
        else
            sprite_index = spr_crouchjump;
        
        if (floor(image_index) == (image_number - 1))
            jumpAnim = false;
    }
    
    if (!jumpAnim)
    {
        if (!shotgunAnim)
            sprite_index = spr_crouchfall;
        else
            sprite_index = spr_crouchfall;
    }
    
    if (move != 0)
        xscale = move;
    
    image_speed = 0.35;
}

