hurtbox_spr = sprite_get("hurtbox");
crouchbox_spr = sprite_get("hurtbox_crouch");
air_hurtbox_spr = -1;
hitstun_hurtbox_spr = -1;

char_height = 64;
idle_anim_speed = .1;
crouch_anim_speed = .15;
walk_anim_speed = .15;
dash_anim_speed = .2;
pratfall_anim_speed = .25;

walk_speed = 3 + (2 * has_rune("A"));
walk_accel = 0.2;
walk_turn_time = 6;
initial_dash_time = 14;
initial_dash_speed = 5.8 + (2 * has_rune("A"));
dash_speed = 5.7 + (2 * has_rune("A"));
dash_turn_time = 18;
dash_turn_accel = 0.5;
dash_stop_time = 6;
dash_stop_percent = .35; //the value to multiply your hsp by when going into idle from dash or dashstop
ground_friction = .6;
moonwalk_accel = 1.2;

jump_start_time = 5;
jump_speed = 11;
short_hop_speed = 7.4;
djump_speed = 7.5;
leave_ground_max = 6; //the maximum hsp you can have when you go from grounded to aerial without jumping
max_jump_hsp = 6; //the maximum hsp you can have when jumping from the ground
air_max_speed = 4; //the maximum hsp you can accelerate to when in a normal aerial state
jump_change = 3; //maximum hsp when double jumping. If already going faster, it will not slow you down
air_accel = .3;
prat_fall_accel = .35; //multiplier of air_accel while in pratfall
air_friction = .06;
max_djumps = has_rune("B") ? 7 : 4;
double_jump_time = 32; //the number of frames to play the djump animation. Can't be less than 31.
walljump_hsp = 7;
walljump_vsp = 8;
walljump_time = 32;
max_fall = 10; //maximum fall speed without fastfalling
fast_fall = 16; //fast fall speed
gravity_speed = .55;
hitstun_grav = .5;
knockback_adj = 0.9; //the multiplier to KB dealt to you. 1 = default, >1 = lighter, <1 = heavier

land_time = 6; //normal landing frames
prat_land_time = 26;
wave_land_time = 8;
wave_land_adj = 1.3; //the multiplier to your initial hsp when wavelanding. Usually greater than 1
wave_friction = .1; //grounded deceleration when wavelanding

//crouch animation frames
crouch_startup_frames = 2;
crouch_active_frames = 1;
crouch_recovery_frames = 1;

//parry animation frames
dodge_startup_frames = 1;
dodge_active_frames = 1;
dodge_recovery_frames = 3;

//tech animation frames
tech_active_frames = 3;
tech_recovery_frames = 1;

//tech roll animation frames
techroll_startup_frames = 2
techroll_active_frames = 3;
techroll_recovery_frames = 2;
techroll_speed = 10;

//airdodge animation frames
air_dodge_startup_frames = 1;
air_dodge_active_frames = 4;
air_dodge_recovery_frames = 3;
air_dodge_speed = 7.5;

//roll animation frames
roll_forward_startup_frames = 2;
roll_forward_active_frames = 3;
roll_forward_recovery_frames = 2;
roll_back_startup_frames = 2;
roll_back_active_frames = 3;
roll_back_recovery_frames = 2;
roll_forward_max = 9; //roll speed
roll_backward_max = 9;

land_sound = sound_get("sfx_dedede_landing01");
landing_lag_sound = sound_get("sfx_dedede_landing01");
waveland_sound = sound_get("sfx_dedede_waveland");
jump_sound = sound_get("sfx_dedede_jump01");
djump_sound = sound_get("sfx_dedede_jump02");
air_dodge_sound = asset_get("sfx_quick_dodge");

//visual offsets for when you're in Ranno's bubble
bubble_x = 0;
bubble_y = 8;


//Compatibility
Hikaru_Title = "Prideful King";
arena_title = "His Royal Nemesis";
battle_text = "King Dedede stands proudly in your way!"
otto_bobblehead_sprite = sprite_get("ddd_bobble_head"); 
kf_custom_icon = sprite_get("ability_ddd");
kf_hud_name = "King Dedede";

//#region Local Variables
//MunoPhone indexes
initIndexes();

//Victory
set_victory_theme(sound_get("victory"))
set_victory_bg(sprite_get("victory_bg"))

//Grab
grabbed_player_obj = noone;    //the player object currently being grabbed.
grabbed_player_relative_x = 0; //the relative x and y position of the grabbed player, at the point they were grabbed.
grabbed_player_relative_y = 0;   //we store this coordinate to smoothly reposition the grabbed player later.

//Nspecial
nspecial_grab_time_min = 30; //The minimum amount of time to grab an opponent.
nspecial_grab_time_max = 60; //The maximum amount of time to grab an opponent.
nspecial_grab_percent_max = 100; //The upper threshold for percentage-based grabbing.
nspecial_jump_speed = 5; //The jump speed when grabbing someone

sucked_player_obj = noone;    //the player object currently being grabbed.
nspecial_projeffect = hit_fx_create(sprite_get("nspecial_wind"), 16);

//USpecial
uspecial_max_fall = 18;
def_max_fall = max_fall;
uspecial_fx1 = hit_fx_create(sprite_get("uspecial2_fx"), 16);
uspecial_fx2 = hit_fx_create(sprite_get("uspecial2_fx2"), 28);
uspecial_soft_armor = 10;

//Gordo stuffs
gordo_max = 1; //Amount of gordos on screen at a time.
gordo_angle_min = 15; //Minimum gordo aiming angle.
gordo_angle_def = 45; //Default gordo aiming angle.
gordo_angle_max = 85; //Maximum gordo aiming angle.
gordo_spawn_type = 0; //0 = gordos; 1 = dee; 2 = doo
gordo_throw_speed = 10;

gordo_spawn_pool = [ //The spawn pool with cnances (changes with runes)
    {type : 0, chance : 100},
    {type : 1, chance : 0},
    {type : 2, chance : 0}
    ];
gordo_objs = array_create(0);
gordo_held = noone;

if (has_rune("L")) {
    gordo_max = 2;
    gordo_spawn_pool = [ //The spawn pool with cnances (changes with runes)
        {type : 0, chance : 4},
        {type : 1, chance : 35},
        {type : 2, chance : 10}
        ];
}

var follower_amount = 2
for (var i = 0; i < follower_amount; i++) {
    for (var j = 0; j <= 49; j++) {
        follower_attack_spr[i, j] = sprite_get("dee_idle");
        follower_attack_air_spr[i, j] = 0;
        follower_attack_hurtbox_spr[i, j] = asset_get("ex_guy_hurt_box");
        follower_attack_air_hurtbox_spr[i, j] = 0;
        follower_attack_off_ledge[i, j] = 0;
        follower_attack_category[i, j] = 0;
        follower_attack_custom_gravity[i, j] = 0;
        follower_window_hitbox_min[i, j] = 0;
        follower_window_hitbox_max[i, j] = 0;
        follower_window_min[i, j] = 0;
        follower_window_max[i, j] = 0;
    }
}

//The drum
drum_cooldown_max = 300; //The cooldown for the drum.
drum_max = has_rune("N") ? 2 : 1; //The amount of drums on stage at the same time (Use for runes only!)
drum_cooldown = 0;
fx_drum_bounce = hit_fx_create(sprite_get("drum_bouncefx"), 16);

//Form switching (courtesy of Equi)
masked = false;
mask_on = false;
spr_hud_mask = sprite_get("hud_mask")

current_sprite_set = 0;
num_sprite_sets = 2;

checked_sprite_names = [
    "idle", 
    "crouch", 
    "walk", 
    "walkturn", 
    "dash", 
    "dashstart", 
    "dashstop", 
    "dashturn", 
    
    "hurt",
    "hurtground",
    "bighurt",
    "uphurt",
    "downhurt",
    "bouncehurt",
    "spinhurt",
    
    "jumpstart", 
    "jump", 
    "doublejump", 
    "walljump", 
    "pratfall", 
    "land", 
    "landinglag", 
    
    "parry", 
    "roll_forward", 
    "roll_backward", 
    "airdodge", 
    "waveland", 
    "tech", 
    
    "jab", 
    "dattack", 
    "ftilt", 
    "dtilt", 
    "utilt", 
    "nair", 
    "fair", 
    "bair", 
    "uair", 
    "dair", 
    "fstrong", 
    "ustrong", 
    "dstrong", 
    "nspecial", 
    "nspecial2", 
    "nspecial3", 
    "fspecial", 
    "fspecial_air",
    "uspecial", 
    "uspecial2", 
    "uspecial_air",
    "dspecial", 
    "dspecial2",
    "taunt",
    "taunt2",
    "intro"
    ];
    
    
//#endregion

//Below code from MunoPhone API.
#define initIndexes()

// Custom indexes

AT_PHONE = 40;

i = 80;

// NOTE: All overrides for the frame data guide should be strings. Any non-applicable (N/A) values should be entered as "-"

// General Attack Indexes
AG_MUNO_ATTACK_EXCLUDE = i; i++;		// Set to 1 to exclude this move from the list of moves
AG_MUNO_ATTACK_REFRESH = i; i++;		// Set to 1 to refresh this move's data every frame while the frame data guide is open
AG_MUNO_ATTACK_NAME = i; i++;			// Enter a string to override move name
AG_MUNO_ATTACK_FAF = i; i++;			// Enter a string to override FAF
AG_MUNO_ATTACK_ENDLAG = i; i++;			// Enter a string to override endlag
AG_MUNO_ATTACK_LANDING_LAG = i; i++;	// Enter a string to override landing lag
AG_MUNO_ATTACK_MISC = i; i++;			// Enter a string to OVERRIDE the move's "Notes" section, which automatically includes the Cooldown System and Misc. Window Traits found below
AG_MUNO_ATTACK_MISC_ADD = i; i++;		// Enter a string to ADD TO the move's "Notes" section (preceded by the auto-generated one, then a line break)

// Adding Notes to a move is good for if a move requires a long explanation of the data, or if a move overall has certain behavior that should be listed such as a manually coded cancel window

// General Window Indexes
AG_MUNO_WINDOW_EXCLUDE = i; i++;		// 0: include window in timeline (default)    1: exclude window from timeline    2: exclude window from timeline, only for the on-hit time    3: exclude window from timeline, only for the on-whiff time
AG_MUNO_WINDOW_ROLE = i; i++;			// 0: none (acts identically to AG_MUNO_WINDOW_EXCLUDE = 1)   1: startup   2: active (or BETWEEN active frames, eg between multihits)   3: endlag
AG_MUNO_ATTACK_USES_ROLES = i; i++;		// Must be set to 1 for AG_MUNO_WINDOW_ROLE to take effect

// If your move's windows are structured non-linearly, you can use AG_MUNO_WINDOW_ROLE to force the frame data system to parse the window order correctly.

// Cooldown System (do this instead of manually setting in attack_update, and cooldown/invul/armor will automatically appear in the frame data guide)
AG_MUNO_ATTACK_COOLDOWN = i; i++;		// Set this to a number, and the move's move_cooldown[] will be set to it automatically. Set it to any negative number and it will refresh when landing, getting hit, or walljumping. (gets converted to positive when applied)
AG_MUNO_ATTACK_CD_SPECIAL = i; i++;		// Set various cooldown effects on a per-attack basis.
AG_MUNO_WINDOW_CD_SPECIAL = i; i++;		// Set various cooldown effects on a per-window basis.
AG_MUNO_WINDOW_INVUL = i; i++;			// -1: invulnerable    -2: super armor    above 0: that amount of soft armor

/*
 * AG_MUNO_ATTACK_CD_SPECIAL values:
 * - 1: the cooldown will use the phone_arrow_cooldown variable instead of move_cooldown[attack], causing it to display on the overhead player indicator; multiple attacks can share this cooldown.
 * - 2: the cooldown will use the phone_invis_cooldown variable instead of move_cooldown[attack], which doesn't display anywhere (unless you code your own HUD element) but does allow you to share the cooldown between moves.
 * 
 * AG_MUNO_WINDOW_CD_SPECIAL values:
 * - 1: a window will be exempted from causing cooldown. It is HIGHLY RECOMMENDED to do this for any startup windows, so that the cooldown doesn't apply if you're hit out of the move before being able to use it.
 * - 2: a window will reset the cooldown to 0.
 * - 3: a window will set cooldown only if the has_hit	      variable is false, and set it to 0 if has_hit        is true.
 * - 4: a window will set cooldown only if the has_hit_player variable is false, and set it to 0 if has_hit_player is true.
 */

i = 80;

HG_MUNO_HITBOX_EXCLUDE = i; i++;		// Set to 1 to exclude this hitbox from the frame data guide
HG_MUNO_HITBOX_NAME = i; i++;			// Enter a string to override hitbox name

HG_MUNO_HITBOX_ACTIVE = i; i++;			// Enter a string to override active frames
HG_MUNO_HITBOX_DAMAGE = i; i++;			// Enter a string to override damage
HG_MUNO_HITBOX_BKB = i; i++;			// Enter a string to override base knockback
HG_MUNO_HITBOX_KBG = i; i++;			// Enter a string to override knockback growth
HG_MUNO_HITBOX_ANGLE = i; i++;			// Enter a string to override angle
HG_MUNO_HITBOX_PRIORITY = i; i++;		// Enter a string to override priority
HG_MUNO_HITBOX_GROUP = i; i++;			// Enter a string to override group
HG_MUNO_HITBOX_BHP = i; i++;			// Enter a string to override base hitpause
HG_MUNO_HITBOX_HPG = i; i++;			// Enter a string to override hitpause scaling
HG_MUNO_HITBOX_MISC = i; i++;			// Enter a string to override the auto-generated misc notes (which include misc properties like angle flipper or elemental effect)
HG_MUNO_HITBOX_MISC_ADD = i; i++;		// Enter a string to ADD TO the auto-generated misc notes, not override (line break will be auto-inserted)

// Misc. Hitbox Traits
HG_MUNO_OBJECT_LAUNCH_ANGLE = i; i++;	// Override the on-hit launch direction of compatible Workshop objects, typically ones without gravity. For example, Otto uses this for the ball rehit angles. Feel free to code this into your attacks, AND to support it for your own hittable articles.

/* Set the obj launch angle to:
 * - -1 to send horizontally away (simulates flipper 3, angle 0)
 * - -2 to send radially away (simulates flipper 8)
 */

/*