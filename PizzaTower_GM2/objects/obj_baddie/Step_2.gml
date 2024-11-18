if (state == UnknownEnum.Value_4)
    scr_enemy_grabbed();
else if (state == UnknownEnum.Value_43)
    scr_enemy_lungeattack();
else if (state == UnknownEnum.Value_266)
    scr_enemy_secret();

scr_squash();

if (state != UnknownEnum.Value_138 && state != UnknownEnum.Value_137)
    linethrown = false;

if (state == UnknownEnum.Value_138 && !thrown)
    linethrown = false;

if (object_index != obj_pizzaball && (place_meeting(x + 1, y, obj_spike) || place_meeting(x - 1, y, obj_spike) || place_meeting(x, y + 1, obj_spike) || place_meeting(x, y - 1, obj_spike)))
    instance_destroy();

if (state != UnknownEnum.Value_4 && state != UnknownEnum.Value_154 && object_index != obj_pepbat && object_index != obj_ghoul && object_index != obj_fakesanta && use_collision)
    scr_collide();

if (invtime > 0)
    invtime--;

if (sprite_index == walkspr && hsp != 0 && floor(image_index) == (image_number - 1) && object_index != obj_ghoul)
    create_particle(x - (image_xscale * 20), y + 43, UnknownEnum.Value_1, 0);

if (state == UnknownEnum.Value_134)
    image_speed = 0.35 + (global.baddiespeed * 0.05);
else if (state != UnknownEnum.Value_128)
    image_speed = 0.35;

if (dodgebuffer > 0)
    dodgebuffer--;

with (instance_nearest(x, y, obj_player))
{
    if (state == UnknownEnum.Value_84)
    {
        other.stunned = 0;
        
        if (other.state != UnknownEnum.Value_129 && !other.provoked && other.bombreset > 0)
        {
            other.bombreset = 0;
            other.provoked = true;
        }
        
        other.scaredbuffer = 0;
    }
    else if (other.state != UnknownEnum.Value_129)
    {
        other.provoked = false;
    }
}

if (y > (room_height + 100))
    instance_destroy();

if (thrown && (x > (room_width + 100) || x < -100 || y < -100))
    instance_destroy();

enum UnknownEnum
{
    Value_1 = 1,
    Value_4 = 4,
    Value_43 = 43,
    Value_84 = 84,
    Value_128 = 128,
    Value_129,
    Value_134 = 134,
    Value_137 = 137,
    Value_138,
    Value_154 = 154,
    Value_266 = 266
}
