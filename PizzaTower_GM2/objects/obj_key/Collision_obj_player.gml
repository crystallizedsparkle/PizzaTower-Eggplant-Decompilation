if (room == rm_editor)
    exit;

if (global.key_inv)
    exit;

with (other)
{
    if (state != states.bombpep && state != states.gotoplayer && state != states.ghost && state != states.knightpep && state != states.cheeseball && state != states.boxxedpep && state != states.cheesepep && state != states.knightpepattack && state != states.knightpepslopes && state != states.hurt && state != states.knightpepbump)
    {
        instance_destroy(other);
        global.key_inv = true;
        key_particles = true;
        alarm[7] = 30;
        scr_soundeffect(19);
        state = states.keyget;
        image_index = 0;
        global.heattime = 60;
    }
}

enum UnknownEnum
{
    Value_16 = 16,
    Value_21 = 21,
    Value_24 = 24,
    Value_33 = 33,
    Value_38 = 38,
    Value_47 = 47,
    Value_48,
    Value_49,
    Value_51 = 51,
    Value_90 = 90,
    Value_107 = 107,
    Value_186 = 186
}
