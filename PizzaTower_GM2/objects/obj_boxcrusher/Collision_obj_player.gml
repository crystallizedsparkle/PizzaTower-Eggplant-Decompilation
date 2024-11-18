if (other.state == UnknownEnum.Value_186)
    exit;

if (sprite_index == spr_boxcrusher_fall)
{
    other.image_index = 0;
    other.state = UnknownEnum.Value_106;
    other.x = x;
    other.y = y;
}
else if (sprite_index == spr_boxcrusher_land)
{
    if (other.state != UnknownEnum.Value_33)
        tv_push_prompt_once(tv_create_prompt("This is the boxxed transformation text", UnknownEnum.Value_2, 2832, 3), "boxxedpep");
    
    other.boxxed = true;
    other.movespeed = 0;
    other.state = UnknownEnum.Value_33;
    
    if (other.sprite_index != other.spr_boxxedpepintro)
        other.sprite_index = other.spr_boxxedpepintro;
    
    other.image_index = 0;
    other.hsp = 0;
    other.vsp = 0;
    other.x = x;
    other.y = y - 20;
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_33 = 33,
    Value_106 = 106,
    Value_186 = 186
}
