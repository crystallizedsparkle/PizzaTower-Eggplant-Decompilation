if (other.active && sprite_index != spr_entrancepillarsecret && !global.panic)
{
    alarm[0] = 25;
    touched = true;
    sprite_index = spr_entrancepillarsecret;
}
