//Drum

sprite_index = asset_get("empty_sprite");
spr_index = sprite_get("drum_idle");
img_index = 0;
img_angle = 0;
depth = 2;

can_be_grounded = true;
ignores_walls = false;
uses_shader = true;

current_sprite_set = 0;
num_sprite_sets = 2;
img_index = 0;

//State
state = 0; //0 = Idle, 1 = Bounce, 2 = destroyed
state_timer = 0;
alive_timer = 0;

//Variables
bounce_speed = -10 //The speed for jumping.
bounce_speed_max = -15 //The speed for jumping.
hitpoints_max = 4; // Can be bounced on twice.
bounce_lag = 12; //The amount of frames the drum goes into lag after a bounce.
alive_time = 600; //The amount of frames the drum is active for.

hitpoints = hitpoints_max;
owned_player = player;