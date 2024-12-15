if (!is_solid)
    shotgun = true;

if (shotgun)
{
    with (instance_place(x + spd, y, obj_shotgunblock))
        instance_destroy();
}

if (shotgun)
{
    with (instance_place(x, y - spdh, obj_shotgunblock))
        instance_destroy();
}

if (brick && instance_exists(brickid)) // modified this line for LTS compatiblity
{
    x = brickid.x;
    y = brickid.y;
}
else
{
    x += (image_xscale * spd);
    y += -spdh;
}

with (instance_place(x + (image_xscale * spd), y, obj_destructibles))
{
    if (object_index != obj_onewaybigblock)
        instance_destroy();
}

if (place_meeting(x + (image_xscale * spd), y, obj_solid) && !place_meeting(x + (image_xscale * spd), y, obj_electricwall) && !place_meeting(x + (image_xscale * spd), y, obj_shotgunblock) && !place_meeting(x + (image_xscale * spd), y, obj_destructibles))
    instance_destroy();

if (sprite_index == spr_mortprojectile)
{
    with (instance_place(x, y - spdh, obj_mortblock))
        instance_destroy();
}
