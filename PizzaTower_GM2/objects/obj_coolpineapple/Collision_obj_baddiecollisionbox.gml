var my_id, other_baddie, can_parry;

if (state != states.parry && state != states.backbreaker)
    exit;

my_id = id;
other_baddie = other.id;
can_parry = false;

with (other_baddie)
{
    if (instance_exists(baddieID) && baddieID.thrown == true && baddieID != other.id)
        can_parry = true;
}

if (can_parry && state != states.parry && other.baddieID != id)
{
    sprite_index = parryspr;
    movespeed = 8;
    state = states.parry;
    image_index = 0;
}

enum UnknownEnum
{
    Value_84 = 84,
    Value_147 = 147
}
