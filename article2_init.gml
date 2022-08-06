//Dees and doos (used for Final Smash and Runes)
idle_anim_speed = .15;
crouch_anim_speed = .1;
walk_anim_speed = .25;
dash_anim_speed = .2;

state = PS_SPAWN;
state_timer = 0;
enem_id = 0;
spr_name = "dee"

art_event = 0;

hurtbox_spr = asset_get("ex_guy_hurt_box");
hurtbox_mask = asset_get("ex_guy_hurt_box");
can_be_grounded = true;
ignores_walls = false;
uses_shader = true;

collision_box = asset_get("ex_guy_collision_mask");

//Stats
able_to_crouch = false;
able_to_shield = false;
able_to_jump = true;
able_to_djump = false;
able_to_dash = false;
//Movement Variables
walk_speed = 6;
walk_accel = 1.5;
walk_turn_time = 6;
initial_dash_time = 10;
initial_dash_speed = 6.5;
dash_speed = 6;
dash_turn_time = 10;
dash_turn_accel = 2;
dash_stop_time = 4;
dash_stop_percent = .35; //the value to multiply your hsp by when going into idle from dash or dashstop
ground_friction = .5;
moonwalk_accel = 1.4;

jump_start_time = 5;
jump_speed = 12;
short_hop_speed = 8;
djump_speed = 10;
leave_ground_max = 6; //the maximum hsp you can have when you go from grounded to aerial without jumping
max_jump_hsp = 6; //the maximum hsp you can have when jumping from the ground
air_max_speed = 6; //the maximum hsp you can accelerate to when in a normal aerial state
jump_change = 3; //maximum hsp when double jumping. If already going faster, it will not slow you down
air_accel = .3;
prat_fall_accel = 1; //multiplier of air_accel while in pratfall
air_friction = .03;
max_djumps = 1;
double_jump_time = 32; //the number of frames to play the djump animation. Can't be less than 31.

max_fall = 9; //maximum fall speed without fastfalling
fast_fall = 11; //fast fall speed
gravity_speed = .5;
hitstun_grav = .5;
knockback_adj = 1.6; //the multiplier to KB dealt to you. 1 = default, >1 = lighter, <1 = heavier

land_time = 4; //normal landing frames

committed = 0;
next_state = PS_SPAWN;

_init = false
invincible = false;
ai_target = noone;
land_sound = asset_get("sfx_land_heavy");
landing_lag_sound = asset_get("sfx_land_heavy");
waveland_sound = asset_get("sfx_waveland_syl");
jump_sound = asset_get("sfx_jumpground");
djump_sound = asset_get("sfx_jumpair");
air_dodge_sound = asset_get("sfx_quick_dodge");
death_sound = asset_get("sfx_death2");

to_dir = 1;
djumps = 0;

//Attack variables
attack = -1;
last_attack = -1;
next_attack = -1;
window = 1;
window_timer = 0;
move_cooldown = array_create(50);
has_hit = false;
has_hit_player = false;
was_parried = false;
invincible = 0;
invince_type = 0;

//Input Variables
joy_dir = 0;
joy_pad_idle = 0;
down_down = 0;
up_down = 0;
left_down = 0;
right_down = 0;
jump_down = 0;
attack_down = 0;
shield_down = 0;
taunt_down = 0;
up_strong_down = 0;
down_strong_down = 0;
left_strong_down = 0;
right_strong_down = 0;
strong_down = 0;
left_hard_pressed = 0;
right_hard_pressed = 0;
down_hard_pressed = 0;
attack_pressed = 0;

//Article Hitting
//make hbox_group array (the old version was really bad because the array actually affected all players no matter what lol)
hbox_group = array_create(4,0);
var i1 = 0;
var i2 = 0;
repeat(4) {
    hbox_group[@i1] = array_create(50,0);
    repeat(50) {
        hbox_group[@i1][@i2] = array_create(10,0);
        i2++;
    }
    i2 = 0;
    i1++;
}
 
hitstun = 0;
hitstun_full = 0;
 
kb_adj = 1;
kb_dir = 0;
orig_knock = 0;
flinch_time = 0;
 
hit_lockout = 0;
can_hit = array_create(5, true);
percent = 0;
hitpoints_max = 0;
 
article_should_lockout = true; //set to false if you don't want hit lockout.
 