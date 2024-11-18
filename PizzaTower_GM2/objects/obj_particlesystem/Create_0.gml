var p;

if (instance_number(obj_particlesystem) > 1)
{
    instance_destroy();
    exit;
}

depth = -99;
global.particle_system = part_system_create();
global.part_map = ds_map_create();
global.part_depth = ds_map_create();
global.part_emitter = part_emitter_create(global.particle_system);
global.debris_list = ds_list_create();
global.collect_list = ds_list_create();
p = declare_particle(UnknownEnum.Value_1, 1188, 0.5, 99);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_2, 1199, 0.5, -99);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_3, 1167, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_4, 1165, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_5, 1186, 0.35, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_6, 1158, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_7, 1206, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_8, 1160, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_9, 1213, 1, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_15, 2440, 0.35, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_10, 1161, 0.35, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_11, 1665, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_12, 1192, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_13, 1624, 0.7, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(UnknownEnum.Value_14, 664, 0.35, 0);
part_type_speed(p, 0, 0, 0, 0);

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15
}
