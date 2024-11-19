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
p = declare_particle(particles.cloudeffect, spr_cloudeffect, 0.5, 99);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particles.crazyrunothereffect, spr_crazyrunothereffect, 0.5, -99);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particles.highjumpcloud1, spr_highjumpcloud1, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particles.highjumpcloud2, spr_highjumpcloud2, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particles.jumpdust, spr_jumpdust, 0.35, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particles.balloonpop, spr_balloonpop, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particles.shotgunimpact, spr_shotgunimpact, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particles.impact, spr_impact, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particles.genericpoofeffect, spr_genericpoofeffect, 1, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particles.antigrav_bubblepop, spr_antigrav_bubblepop, 0.35, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particles.keyparticles, spr_keyparticles, 0.35, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particles.teleporteffect, spr_teleporteffect, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particles.landcloud, spr_landcloud, 0.5, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particles.ratmountballooncloud, spr_ratmountballooncloud, 0.7, 0);
part_type_speed(p, 0, 0, 0, 0);
p = declare_particle(particles.groundpoundeffect, spr_groundpoundeffect, 0.35, 0);
part_type_speed(p, 0, 0, 0, 0);

enum particles
{
	first = 0,
    cloudeffect = 1,
    crazyrunothereffect = 2,
    highjumpcloud1 = 3,
    highjumpcloud2 = 4,
    jumpdust = 5,
    balloonpop = 6,
    shotgunimpact = 7,
    impact = 8,
    genericpoofeffect = 9,
    keyparticles = 10,
    teleporteffect = 11,
    landcloud = 12,
    ratmountballooncloud = 13,
    groundpoundeffect = 14,
    antigrav_bubblepop = 15,
	last = 16
}

enum debris
{
	default_type,
	fade_effect
}
