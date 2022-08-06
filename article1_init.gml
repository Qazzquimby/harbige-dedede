//Gordo

//Sprite
sprite_index = sprite_get("gordo");
mask_index = sprite_get("gordo_mask");
current_sprite_set = 0;
num_sprite_sets = 3;
img_index = 0;

can_be_grounded = true;
ignores_walls = false;
uses_shader = false;
unbashable = false;
//State
state = 0; //0 = Initial bounce; 1 = Stuck; 2 = Reflected
state_timer = 0;

//Variables
bounce_multiplier = 0.9; //Multiply bonces by this amount.
//bounce_min = 1; //The minimum vspeed before it sticks.
bounce_speed = 9.5;
//bounce_current = bounce_speed * 2;
bounce_times = 0;
stick_time_max = 300; //The maximum sticking time before it disappears.
hit_time_max = 120; //The maximum hit time before it disappears.
max_fall_speed = 10; //The maximum fall speed

owned_player = player;
hit_already = false;
grav = 0.5;

hitbox = noone;

plat_x = 0;
plat_y = 0;
plat_xprev = 0;
plat_yprev = 0;

var block_below = collision_point(x, y + 2, asset_get("par_block"), 1, 1);
var plat_below = collision_point(x, y + 2, asset_get("par_jumpthrough"), 1, 1);

if (instance_exists(block_below)) {
    plat_x = get_instance_x(block_below) - plat_xprev;
    plat_y = get_instance_y(block_below) - plat_yprev;
}
if (instance_exists(plat_below)) {
    plat_x = get_instance_x(plat_below) - plat_xprev;
    plat_y = get_instance_y(plat_below) - plat_yprev;
}
x += plat_x;
y += plat_y;

if (instance_exists(block_below)) {
    plat_xprev = get_instance_x(block_below);
    plat_yprev = get_instance_y(block_below);
}
if (instance_exists(plat_below)) {
    plat_xprev = get_instance_x(plat_below);
    plat_yprev = get_instance_y(plat_below);
}

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
percent = 0;

hit_lockout = 0;
can_hit = array_create(5, true);
 
article_should_lockout = true; //set to false if you don't want hit lockout.
 