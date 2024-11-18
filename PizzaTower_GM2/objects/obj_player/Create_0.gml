var _os_r, resolutionX, resolutionY;

if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

global.throwarc = 1;
global.hidetiles = false;
global.leveltosave = -4;
global.leveltorestart = -4;
jetpackdash = false;
flamecloud_buffer = 0;
rankpos_x = x;
rankpos_y = y;
transformationlives = 0;
punch_afterimage = 0;
superchargecombo_buffer = -1;
superattackstate = UnknownEnum.Value_0;
afterimagedebris_buffer = 0;
scale_xs = 1;
scale_ys = 1;
verticalbuffer = 0;
verticalstate = UnknownEnum.Value_0;
webID = -4;
float = false;
boxxedpepjump = 10;
boxxedpepjumpmax = 10;
icemovespeed = 0;
prevmove = 0;
prevhsp = 0;
prevstate = UnknownEnum.Value_0;
prevxscale = 1;
prevsprite = sprite_index;
move = 0;
prevmovespeed = 0;
previcemovespeed = 0;
icedir = 1;
icemomentum = false;
savedicedir = 1;
ispeppino = true;
isgustavo = false;
jumped = true;
grav = 0.5;
hsp = 0;
vsp = 0;
vsp_carry = 0;
hsp_carry = 0;
rocketvsp = 0;
sticking = false;
platformid = -4;
xscale = 1;
yscale = 1;
facehurt = false;
steppy = false;
depth = -7;
movespeed = 19;
jumpstop = false;
ramp = false;
ramp_points = 0;
bombup_dir = 1;
knightmomentum = 0;
grabbingenemy = false;
blur_effect = 0;
firemouth_dir = 1;
firemouth_max = 10;
firemouth_buffer = firemouth_max;
firemouth_afterimage = 0;
cow_buffer = 0;
balloonbuffer = 0;
shoot_buffer = 0;
shoot_max = 20;
dynamite_inst = -4;
golfid = -4;
bombgrabID = -4;
barrelslope = false;
barrel_maxmovespeed = 16;
barrel_maxfootspeed = 10;
barrel_rollspeed_threshold = 10;
barrel_accel = 1;
barrel_deccel = 1;
barrel_slopeaccel = 0.25;
barrel_slopedeccel = 0.5;
barrelroll_slopeaccel = 0.5;
barrelroll_slopedeccel = 0.35;
hurt_buffer = -1;
hurt_max = 120;
invhurt_buffer = 0;
invhurt_max = 30;
ratmount_movespeed = 8;
ratmount_fallingspeed = 0;
ratgrabbedID = -4;
ratpowerup = -4;
ratshootbuffer = 0;
rateaten = false;
gustavodash = 0;
brick = false;
ratmountpunchtimer = 25;
gustavokicktimer = 5;
cheesepep_buffer = 0;
cheesepep_max = 10;
pepperman_accel = 0.25;
pepperman_deccel = 0.5;
pepperman_accel_air = 0.15;
pepperman_deccel_air = 0.25;
pepperman_maxhsp_normal = 6;
pepperman_jumpspeed = 11;
pepperman_grabID = -4;
shoulderbash_mspeed_start = 12;
shoulderbash_mspeed_loop = 10;
shoulderbash_jumpspeed = 11;
visible = true;
state = UnknownEnum.Value_18;
jumpAnim = true;
landAnim = false;
machslideAnim = false;
moveAnim = true;
stopAnim = true;
crouchslideAnim = true;
crouchAnim = true;
machhitAnim = false;
stompAnim = false;
inv_frames = false;
hurted = false;
autodash = false;
mach2 = 0;
stop_buffer = 8;
slope_buffer = 8;
stop_max = 16;
parry = false;
parry_inst = -4;
taunt_to_parry_max = 10;
parry_count = 0;
parry_max = 8;
is_firing = false;
input_buffer_jump = 8;
input_buffer_secondjump = 8;
input_buffer_highjump = 8;
input_buffer_walljump = 0;
input_buffer_slap = 8;
input_attack_buffer = 0;
input_finisher_buffer = 0;
input_up_buffer = 0;
input_down_buffer = 0;
hit_connected = false;
player_x = x;
player_y = y;
targetRoom = 0;
targetDoor = "A";
flash = false;
key_particles = false;
barrel = false;
bounce = false;
a = 0;
idle = 0;
attacking = false;
slamming = false;
superslam = 0;
grounded = true;
grinding = false;
machpunchAnim = false;
punch = false;
machfreefall = 0;
shoot = false;
instakillmove = false;
stunmove = false;
windingAnim = 0;
facestompAnim = false;
ladderbuffer = 0;
toomuchalarm1 = 0;
toomuchalarm2 = 0;
idleanim = 0;
momemtum = false;
cutscene = false;
grabbing = false;
dir = xscale;
shotgunAnim = false;
goingdownslope = false;
goingupslope = false;
fallinganimation = 0;
bombpeptimer = 100;
suplexmove = false;
suplexhavetomash = 0;
anger = 0;
angry = false;
baddiegrabbedID = 0;
spr_palette = 535;
character = "P";
scr_characterspr();
paletteselect = 1;
colorchange = false;
treasure_x = 0;
treasure_y = 0;
treasure_room = 0;
wallspeed = 0;
tauntstoredstate = UnknownEnum.Value_0;
tauntstoredmovespeed = 6;
tauntstoredsprite = 715;
taunttimer = 20;
tauntstoredvsp = 0;
tauntstoredisgustavo = false;
tube_id = -1;
backtohubstartx = x;
backtohubstarty = y;
backtohubroom = 0;
slapcharge = 0;
slaphand = 1;
slapbuffer = 8;
slapflash = 0;
freefallsmash = 0;
costumercutscenetimer = 0;
heavy = false;
lastroom_x = 0;
lastroom_y = 0;
lastroom = 0;
lastTargetoor = "A";
hallway = false;
savedhallway = false;
hallwaydirection = 0;
savedhallwaydirection = 0;
vhallwaydirection = 0;
savedvhallwaydirection = 0;
verticalhallway = false;
savedverticalhallway = false;
vertical_x = x;
verticalhall_vsp = 0;
box = false;
roomstartx = 0;
roomstarty = 0;
swingdingbuffer = 0;
swingdingdash = 0;
lastmove = 0;
backupweapon = false;
stickpressed = false;
spotlight = true;
macheffect = false;
chargeeffectid = 523;
dashcloudid = 523;
crazyruneffectid = 523;
fightball = false;
superslameffectid = 523;
speedlineseffectid = 523;
angryeffectid = 523;
thrown = false;
mach1snd = -1;
mach2snd = -1;
mach3snd = -1;
knightslide = -1;
bombpep1snd = -1;
mach4snd = -1;
tumble2snd = -1;
tumble1snd = -1;
tumble3snd = -1;
rocketsnd = -1;
superjumpholdsnd = -1;
superjumpprepsnd = -1;
suplexdashsnd = -1;
pogospeed = 2;
pogocharge = 100;
pogochargeactive = false;
wallclingcooldown = 10;
bombcharge = 0;
flashflicker = false;
flashflickertime = 0;
kickbomb = false;
doublejump = false;
pogospeedprev = false;
fightballadvantage = false;
coopdelay = 0;
supercharged = false;
superchargedeffectid = 523;
used_supercharge = false;
pizzashield = false;
pizzashieldid = 523;
pizzapepper = 0;
transformation[0] = UnknownEnum.Value_51;
transformation[1] = UnknownEnum.Value_47;
transformation[2] = UnknownEnum.Value_38;
transformation[3] = UnknownEnum.Value_33;
transformation[4] = UnknownEnum.Value_21;
transformation[5] = UnknownEnum.Value_24;
transformation[6] = UnknownEnum.Value_25;
transformation[7] = UnknownEnum.Value_30;
transformation[8] = UnknownEnum.Value_29;
transformation[9] = UnknownEnum.Value_10;
transformation[10] = UnknownEnum.Value_9;
transformation[11] = UnknownEnum.Value_59;
transformation[12] = UnknownEnum.Value_31;
transformation[13] = UnknownEnum.Value_89;
transformation[14] = UnknownEnum.Value_112;
transformation[15] = UnknownEnum.Value_16;
transformation[16] = UnknownEnum.Value_17;
transformation[17] = UnknownEnum.Value_11;
transformation[18] = UnknownEnum.Value_150;
transformation[19] = UnknownEnum.Value_146;
transformation[20] = UnknownEnum.Value_184;
transformation[21] = UnknownEnum.Value_186;
transformation[22] = UnknownEnum.Value_52;
transformation[23] = UnknownEnum.Value_53;
transformation[24] = UnknownEnum.Value_54;
transformation[25] = UnknownEnum.Value_116;
transformation[26] = UnknownEnum.Value_114;
transformation[27] = UnknownEnum.Value_113;
transformation[28] = UnknownEnum.Value_22;
transformation[29] = UnknownEnum.Value_32;
transformation[30] = UnknownEnum.Value_49;
transformation[31] = UnknownEnum.Value_48;
transformation[32] = UnknownEnum.Value_13;
transformation[33] = UnknownEnum.Value_14;
transformation[34] = UnknownEnum.Value_12;
transformation[35] = UnknownEnum.Value_35;
transformation[36] = UnknownEnum.Value_34;
transformation[37] = UnknownEnum.Value_185;
c = 0;
stallblock = 0;
breakdance = 50;
skateboarding = false;
hitX = x;
hitY = y;
hithsp = 0;
hitvsp = 0;
hitstunned = 0;
hitxscale = 1;
stunned = 0;
hitLag = 25;
supercharge = 0;
mort = false;
sjumpvsp = -12;
freefallvsp = 15;
hitlist = ds_list_create();
animlist = ds_list_create();
lungeattackID = -4;
lunge_hits = 0;
lunge_hit_buffer = 0;
lunge_buffer = 0;
finisher = false;
finisher_buffer = 0;
finisher_hits = 0;
uplaunch = false;
downlaunch = false;
dash_doubletap = 0;
finishingblow = false;
launch = false;
launched = true;
launch_buffer = 0;
jetpackfuel = 0;
jetpackmax = 200;
walljumpbuffer = 0;
farmerpos = 0;
clowntimer = 0;
knightmiddairstop = 0;
knightmove = -1;

if (!variable_global_exists("saveroom"))
{
    global.combodropped = false;
    global.saveroom = ds_list_create();
    global.escaperoom = ds_list_create();
    global.lap = false;
    global.laps = 0;
    global.playerhealth = 100;
    global.instancelist = ds_list_create();
    global.followerlist = ds_list_create();
    global.maxrailspeed = 2;
    global.railspeed = global.maxrailspeed;
    global.levelreset = false;
    global.temperature = 0;
    global.temperature_spd = 0.01;
    global.temp_thresholdnumber = 5;
    global.use_temperature = false;
    global.timedgatetimer = false;
    global.timedgatetime = 0;
    global.key_inv = false;
    global.shroomfollow = false;
    global.cheesefollow = false;
    global.tomatofollow = false;
    global.sausagefollow = false;
    global.pineapplefollow = false;
    global.pepanimatronic = false;
    global.keyget = false;
    global.collect = 0;
    global.collectN = 0;
    global.treasure = false;
    global.combo = 0;
    global.previouscombo = 0;
    global.combotime = 0;
    global.comboscore = 0;
    global.savedcomboscore = 0;
    global.savedcombo = 0;
    global.heattime = 0;
    global.pizzacoin = 0;
    global.toppintotal = 1;
    global.hit = 0;
    global.baddieroom = ds_list_create();
    global.hp = 2;
    global.gotshotgun = false;
    global.showgnomelist = true;
    global.panic = false;
    global.snickchallenge = false;
    global.golfhit = 0;
    ini_open("saveData.ini");
    global.option_fullscreen = ini_read_real("Option", "fullscreen", 1);
    global.option_resolution = ini_read_real("Option", "resolution", 1);
    global.option_master_volume = ini_read_real("Option", "master_volume", 1);
    global.option_music_volume = ini_read_real("Option", "music_volume", 1);
    global.option_sfx_volume = ini_read_real("Option", "sfx_volume", 1);
    global.option_vibration = ini_read_real("Option", "vibration", 1);
    ini_close();
    
    if (global.option_fullscreen == 0)
        window_set_fullscreen(false);
    
    if (global.option_fullscreen == 1)
        window_set_fullscreen(true);
    
    _os_r = global.option_resolution;
    
    if (_os_r == 0)
    {
        resolutionX = 480;
        resolutionY = 270;
    }
    else if (_os_r == 1)
    {
        resolutionX = 960;
        resolutionY = 540;
    }
    else
    {
        resolutionX = 1920;
        resolutionY = 1080;
    }
    
    window_set_size(resolutionX, resolutionY);
    set_master_gain(global.option_master_volume);
    global.style = -1;
    global.secretfound = 0;
    global.shotgunammo = 0;
    global.monsterspeed = 0;
    global.monsterlives = 3;
    global.giantkey = false;
    global.coop = false;
    global.baddiespeed = 1;
    global.baddiepowerup = false;
    global.baddierage = false;
    global.style = 0;
    global.stylethreshold = 0;
    global.pizzadelivery = false;
    global.failcutscene = false;
    global.pizzasdelivered = 0;
    global.spaceblockswitch = true;
    global.gerome = false;
    global.bullet = 0;
    global.fuel = 3;
    global.bigfont = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", true, 0);
    global.collectfont = font_add_sprite_ext(spr_font_collect, "0123456789", true, 0);
    global.combofont = font_add_sprite_ext(spr_font_combo, "0123456789/:", true, 0);
    global.combofont2 = font_add_sprite_ext(spr_tv_combobubbletext, "0123456789", true, 0);
    global.smallfont = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.:?1234567890", true, 0);
    global.wartimerfont1 = font_add_sprite_ext(spr_wartimer_font1, "1234567890", true, 0);
    global.wartimerfont2 = font_add_sprite_ext(spr_wartimer_font2, "1234567890", true, 0);
    global.ammorefill = 0;
    global.ammoalt = 1;
    global.mort = false;
    global.stylelock = false;
    global.attackstyle = 0;
    global.pummeltest = true;
    global.horse = false;
    global.checkpoint_room = -4;
    global.checkpoint_door = "A";
    global.kungfu = false;
    global.graffiticount = 0;
    global.graffitimax = 20;
    global.noisejetpack = false;
    global.hasfarmer = array_create(3, false);
    global.savedattackstyle = -4;
}

angle = 0;
mach4mode = false;
railmomentum = false;
railmovespeed = 0;
raildir = 1;
boxxed = false;
boxxeddash = false;
cheesepeptimer = -1;
cheeseballbounce = 0;
slopejump = false;
slopejumpx = 0;
hooked = false;
swingdingendcooldown = 0;
crouchslipbuffer = 0;
breakdance_speed = 0.25;
notecreate = 50;
jetpackbounce = false;

enum UnknownEnum
{
    Value_0,
    Value_9 = 9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_16 = 16,
    Value_17,
    Value_18,
    Value_21 = 21,
    Value_22,
    Value_24 = 24,
    Value_25,
    Value_29 = 29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_38 = 38,
    Value_47 = 47,
    Value_48,
    Value_49,
    Value_51 = 51,
    Value_52,
    Value_53,
    Value_54,
    Value_59 = 59,
    Value_89 = 89,
    Value_112 = 112,
    Value_113,
    Value_114,
    Value_116 = 116,
    Value_146 = 146,
    Value_150 = 150,
    Value_184 = 184,
    Value_185,
    Value_186
}
