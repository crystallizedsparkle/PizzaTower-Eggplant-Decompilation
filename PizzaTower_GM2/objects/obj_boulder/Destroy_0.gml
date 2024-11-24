if (escape || (escape && global.panic))
{
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = spr_meatball_dead;
}
