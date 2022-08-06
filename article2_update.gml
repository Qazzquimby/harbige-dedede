enum EN_EVENT {
    INIT,
    UPDATE,
    ANIMATION,
    DEATH,
    GOT_HIT,
    GOT_PARRIED,
    ATTACK_UPDATE,
}

if (!_init) {
    custom_behavior(EN_EVENT.INIT)
    _init = true;
}
reset_variables()
ai_update();
state_machine();
//print(get_state_name(state));
physics_update();

if (x <= -64 || x > room_width + 64) {
	instance_destroy(id)
	exit;
}

if (y > room_height + 64) {
	instance_destroy(id)
	exit;
}

#define reset_variables()
if hitstop <= 0 {
    joy_pad_idle = true;
    super_armor = false;
    right_down = false;
    left_down = false;
    jump_down = false;
    left_hard_pressed = false;
    right_hard_pressed = false;
    down_hard_pressed = false;
}

#define ai_update()
unbashable = true;
if hitstop <= 0 {
    state_timer++;
    
    for (var i = 0; i < array_length(move_cooldown); i++) {
        if (move_cooldown[i] > 0)
            move_cooldown[i] --;
    }
}
if hitstun <= 0 {
	if (next_attack != -1) attack_start();
    if state != next_state {
        prev_state = state;
        state = next_state;
        if state != 5 && state != 6 && state != PS_DEAD {
            hurtbox_mask = hurtbox_spr;
            committed = 0;
            set_sprite_from_state(state);
        }
        state_timer = 0;
    }
}  else {
    //Contributed by Harbige
    right_down = false;
    left_down = false;
    jump_down = false;
    left_hard_pressed = false;
    right_hard_pressed = false;
    down_hard_pressed = false;
    
    hurtbox_spr = collision_box;
    if (state != PS_DEAD) {
        if !free state = PS_HITSTUN_LAND; 
        else state = PS_HITSTUN;
    }
}

if hitpoints_max > 0 {
    if (percent >= hitpoints_max && state != PS_DEAD) {
        prev_state = state;
        next_state = PS_DEAD;
        state = PS_DEAD;
        state_timer = 0;
    }
}
//Default AI Targeting

ai_target = player_id;
var enemy = noone;
var dist = 256;
for (var i = 0; i < instance_number(oPlayer); i++) {
    var nearest = instance_find(oPlayer, i);
    if (nearest.player != player_id.player && distance_to_object(nearest) < dist) {
        enemy = nearest;
    }
}

if (instance_exists(enemy)) {
    ai_target = enemy;
} 

//Gravity
if hitstun <= 0 
    grav = gravity_speed;
else
    grav = hitstun_grav;
    
if (state != PS_DEAD) {
    art_event = EN_EVENT.UPDATE;
    user_event(6); //Custom behavior
}
else {
    art_event = EN_EVENT.DEATH;
    user_event(6); //Custom behavior
}

if right_down || left_down to_dir = right_down-left_down;
if jump_down jump_held++;
else jump_held = 0;

if !committed {
    if jump_down && able_to_jump {
        if free {
            if jump_held == 1 && djumps > 0 && able_to_djump {
                next_state = PS_DOUBLE_JUMP;
                djumps--;
            }
        } else next_state = PS_JUMPSQUAT;
    }
}



#define physics_update() //Physics updates, every frame

if hitpause <=  0 {
	drum_detection()
    if free {
        vsp += grav;
        if (state != PS_ATTACK_AIR && state != PS_ATTACK_GROUND) {
            hsp *= 1-air_friction;
        }
        vsp = min(vsp, max_fall);
        if (state != PS_ATTACK_AIR && state != PS_ATTACK_GROUND) {
            if abs(hsp) < air_max_speed hsp += -air_accel*left_down+air_accel*right_down;
        }
    } else {
    	if (vsp > 0)
    		vsp = 0;
        if (state != PS_WALK && state != PS_DASH && state != PS_ATTACK_AIR && state != PS_ATTACK_GROUND) {
            hsp *= 1-ground_friction/5;
        }
    }
}
//Fix Clipping

if invincible == 0 {
    mask_index = hurtbox_mask;
    hit_detection();
    mask_index = collision_box;
} else invincible--;

#define state_machine()
if state != next_state {
    prev_state = state;
    state = next_state;
    state = state;
    if state != 5 && state != 6 && state != PS_DEAD {
        hurtbox_mask = hurtbox_spr;
        committed = 0;
        set_sprite_from_state(state);
    }
    state_timer = 0;
}

switch state { //Gameplay Logic
    case PS_ATTACK_AIR:
    case PS_ATTACK_GROUND:
        committed = 1;
        attack_update();
        custom_behavior(EN_EVENT.ATTACK_UPDATE)
        break;
    case PS_JUMPSQUAT:
        committed = 1;
        if state_timer >= jump_start_time {
            vsp = -jump_speed;
            next_state = PS_FIRST_JUMP;
            sound_play(jump_sound);
        }
        break;
    case PS_IDLE_AIR:
        next_state = PS_FIRST_JUMP;
    break;
    case PS_FIRST_JUMP:
        if !free next_state = PS_LAND;
        break;
    case PS_WALK_TURN:
        if free next_state = PS_IDLE_AIR; 
        hsp = clamp(hsp -walk_accel*left_down + walk_accel*right_down, -walk_speed, walk_speed);
        if (state_timer == 0)
            spr_dir = -spr_dir;
        if state_timer > walk_turn_time {
            next_state = PS_WALK;
        }
        break;
    case PS_WALK:
        if free next_state = PS_IDLE_AIR; 
        if spr_dir != to_dir next_state = PS_WALK_TURN;
        hsp = clamp(hsp -walk_accel*left_down + walk_accel*right_down, -walk_speed, walk_speed);
        if (left_hard_pressed || right_hard_pressed) {
            if (left_down || right_down) && able_to_dash next_state = PS_DASH_START;
        }
        else if !(left_down || right_down) next_state = PS_IDLE;
        if down_down && able_to_crouch next_state = PS_CROUCH;
        break;
    case PS_DASH_TURN:
        if (state_timer == 0)
            spr_dir = -spr_dir;
        hsp = clamp(hsp + spr_dir*dash_turn_accel, -dash_speed, dash_speed);
        if state_timer > dash_turn_time {
            next_state = PS_DASH;
        }
        break;
    case PS_DASH_START:
        hsp = spr_dir*initial_dash_speed;
        if state_timer > initial_dash_time next_state = PS_DASH;
        if to_dir != spr_dir {
            state_timer = 0;
            spr_dir = -spr_dir;
        }
        if !(left_down || right_down) next_state = PS_IDLE;
        break;
    case PS_DASH:
        hsp = spr_dir*dash_speed;
        if spr_dir != to_dir next_state = PS_DASH_TURN;
        if !(left_down || right_down) next_state = PS_DASH_STOP;
        break;
    case PS_DASH_STOP:
        if state_timer > dash_stop_time {
            hsp *= dash_stop_percent;
            next_state = PS_IDLE;
        }
        break;
    case PS_LAND:
        committed = 1;
        if free next_state = PS_IDLE_AIR;
        if state_timer == 1 sound_play(land_sound);
        if state_timer > land_time next_state = PS_IDLE;
        break;
    case PS_WAVELAND:
        committed = 1;
        if state_timer == 1 sound_play(waveland_sound);
        if state_timer <= 2 hsp = walk_speed*wave_land_adj*(right_down-left_down);
        if state_timer > wave_land_time next_state = PS_IDLE;
        break;
    case PS_IDLE:
        if free next_state = PS_IDLE_AIR;
        if (left_hard_pressed || right_hard_pressed) {
            if (left_down || right_down) && able_to_dash next_state = PS_DASH_START;
        } else if (left_down || right_down) {
            next_state = PS_WALK;
            if spr_dir != to_dir next_state = PS_WALK_TURN;
        }
        if down_down && able_to_crouch next_state = PS_CROUCH;
        break;
    case PS_CROUCH:
        if !down_down {
            crouch_timer++;
            if crouch_timer > 3 next_state = PS_IDLE;
        } else crouch_timer = 0;
        break;
    case PS_LANDING_LAG:
        if free next_state = PS_IDLE_AIR;
        if state_timer > land_time next_state = PS_IDLE;
        break;
    case PS_HITSTUN:
    case PS_HITSTUN_LAND:
    case PS_TUMBLE:
        committed = true;
        if hitpause > 0 {
            state_timer = 0;
        } else {
            if (state_timer == 1 && knockback_adj != 0) {
                //ai_di();
                var new_dir = kb_dir;
                if !free && new_dir > 180 && new_dir < 360 vsp = orig_knock*dsin(new_dir);
                else if !free vsp = -abs(orig_knock*dsin(new_dir));
                else vsp = -orig_knock*dsin(new_dir);
                hsp = orig_knock*dcos(new_dir)*spr_dir;
                if hsp != 0 spr_dir = -sign(hsp);
                free = true;
	            old_hsp = hsp;
	            old_vsp = vsp;
            }
            if place_meeting(x + hsp, y, asset_get("par_block")) hsp = -old_hsp*.7;
            if (!free) {
                if (old_vsp > 3 && kb_dir > 180 && kb_dir < 360) {
                    vsp = -old_vsp * 0.5 - 4;
                    hitstun = hitstun_full;
                    bounced = true;
                }
                else if (vsp > -1) {
                    state = PS_HITSTUN_LAND;
        			state = state;
	                if (state_timer < 5) {
	                    hitstun += flinch_time;
	                }
	                vsp = 0;
                }
            }
            old_hsp = hsp;
            old_vsp = vsp;
            hitstun--;
            if hitstun <= 0 {
                hitstun = 0;
                bounced = false;
                next_state = PS_IDLE_AIR;
            }
        }
        set_sprite_from_state(state);
        break;
    case PS_DEAD:
        committed = true;
    break;
}
state_timer ++;
if hitstop <= 0 {
    if (state != PS_DEAD && state != PS_ATTACK_AIR && state != PS_ATTACK_GROUND) {
		set_sprite_from_state(state);
    }
	switch state { //Display Logic
        case PS_IDLE:
        case PS_IDLE_AIR:
            image_index += idle_anim_speed;
            break;
        case PS_SPAWN:
            image_index += idle_anim_speed;
            break;
        case PS_DASH:
            image_index += dash_anim_speed;
            break;
        case PS_WALK:
            image_index += walk_anim_speed;
            break;
        case PS_JUMPSQUAT:
            image_index = (state_timer/(2*jump_start_time))*image_number;
            break;
        case PS_FIRST_JUMP:
            image_index = ease_linear(0,image_number,floor(vsp+jump_speed), jump_speed*2);
            break;
        case PS_DOUBLE_JUMP:
            image_index = clamp(ease_linear(0,image_number, state_timer, double_jump_time), 0, image_number - 1);
            break;
        case PS_CROUCH:
            if crouch_timer == 0 image_index = clamp(state_timer/3,0,image_number-1);
            else image_index = clamp((3-crouch_timer)/3,0,image_number-1);
            break;
        case PS_WALK_TURN:
            image_index = clamp(ease_linear(0,image_number, state_timer, walk_turn_time), 0, image_number - 1);
            break;
        case PS_DASH_TURN:
            image_index = clamp(ease_linear(0,image_number, state_timer, dash_turn_time), 0, image_number - 1);
            break;
        case PS_DASH_START:
            image_index = clamp(ease_linear(0,image_number, state_timer, initial_dash_time), 0, image_number - 1);
            break;
        case PS_DASH_STOP:
            image_index = clamp(ease_linear(0,image_number, state_timer, dash_stop_time), 0, image_number - 1);
            break;
        case 5:
        case 6:
            image_index = clamp(follower_get_window_value(attack, window, AG_WINDOW_ANIM_FRAME_START)
            	+floor(ease_linear(0,follower_get_window_value(attack, window, AG_WINDOW_ANIM_FRAMES),window_timer,
            	floor(follower_get_window_value(attack, window, AG_WINDOW_LENGTH)*(1+.5*follower_get_window_value(attack, window, AG_WINDOW_HAS_WHIFFLAG)*(!has_hit_player)) + 1))), 0, image_number - 1);
            break;
        case PS_HITSTUN:
            image_index +=  (orig_knock / 60);
            break;
    }
}
custom_behavior(EN_EVENT.ANIMATION)

#define custom_behavior(_eventID)
art_event = _eventID
user_event(6); //Custom behavior

#define set_sprite_from_state(_state)
var _sprite = "";
switch (_state) {
    case PS_IDLE:
    case PS_SPAWN:
        _sprite = "idle";
        break;
    case PS_WALK:
        _sprite = "walk";
        break;
    case PS_WALK_TURN:
        _sprite = "walkturn";
        break;
    case PS_FIRST_JUMP:
    case PS_IDLE_AIR:
        _sprite = "jump";
        break;
    case PS_JUMPSQUAT:
        _sprite = "jumpstart";
        break;
    case PS_DOUBLE_JUMP:
        _sprite = "doublejump";
        break;
    case PS_AIR_DODGE:
        _sprite = "airdodoge";
        break;
    case PS_DASH:
        _sprite = "dash";
        break;
    case PS_DASH_START:
        _sprite = "dashstart";
        break;
    case PS_DASH_STOP:
        _sprite = "dashstop";
        break;
    case PS_DASH_TURN:
        _sprite = "dashturn";
        break;
    case PS_LAND:
        _sprite = "land";
        break;
    case PS_LANDING_LAG:
        _sprite = "landinglag";
        break;
    case PS_WAVELAND:
        _sprite = "waveland";
        break;
    case PS_PRATFALL:
        _sprite = "pratfall";
        break;
    case PS_CROUCH:
        _sprite = "crouch";
        break;
    case PS_PARRY:
        _sprite = "parry";
        break;
    case PS_HITSTUN:
    case PS_HITSTUN_LAND:
    case PS_TUMBLE:
        if (!free) {
            if (orig_knock >= 10)
                _sprite = "bighurt";
            else
                _sprite = "hurtground";
        }
        else {
            if (kb_dir < 70 && kb_dir > 110) {
                _sprite = "uphurt";
            }
            else if (kb_dir < 290 && kb_dir > 250) {
                _sprite = "uphurt";
            }
            else {
                if (state_timer <= 10) {
                    if (orig_knock >= 10)
                        _sprite = "bighurt";
                    else
                        _sprite = "hurt";
                }
                else
                {
                    _sprite = "spinhurt";
                }
            }
        }
        break;
    default:
        _sprite = "idle";
        break;
}
sprite_index = enemy_sprite_get(spr_name, _sprite);

if (sprite_index == asset_get("net_disc_spr")) { //The origin of the X Sprite 
    switch (_state) {
        case PS_HITSTUN:
        case PS_HITSTUN_LAND:
        case PS_TUMBLE:
            sprite_index = enemy_sprite_get(spr_name, "hurt");
        break;
        default:
            sprite_index = enemy_sprite_get(spr_name, "idle");
        break;
    }
}
if (sprite_index == asset_get("net_disc_spr")) { //The origin of the X Sprite 
    sprite_index = enemy_sprite_get(spr_name, "idle");
}


#define enemy_sprite_get(_name,_sprite) //Get the sprite of this article
return sprite_get(string(_name)+"_"+string(_sprite));

#define follower_get_attack_value(_attack, _window_value)
with (player_id) {
    return get_attack_value(_attack, _window_value)
}

#define follower_get_window_value(_attack, _window, _window_value)
with (player_id) {
    return get_window_value(_attack, _window, _window_value)
}

#define follower_get_hitbox_value(_attack, _window, _window_value)
with (player_id) {
    return get_hitbox_value(_attack, _window, _window_value)
}
#define attack_update()
if (hitpause <= 0) {
    //Speeds
    switch follower_get_window_value(attack, window, AG_WINDOW_HSPEED_TYPE) {
        case 2:
            if window_timer == 1 hsp = follower_get_window_value(attack, window, AG_WINDOW_HSPEED)*spr_dir;
            break;
        case 1:
            hsp = follower_get_window_value(attack, window, AG_WINDOW_HSPEED)*spr_dir;
            break;
        default:
            if window_timer == 1 hsp += follower_get_window_value(attack, window, AG_WINDOW_HSPEED)*spr_dir;
            break;
    }


    switch follower_get_window_value(attack, window, AG_WINDOW_VSPEED_TYPE) {
        case 2:
            if window_timer == 1 vsp = follower_get_window_value(attack, window, AG_WINDOW_VSPEED);
            break;
        case 1:
            vsp = follower_get_window_value(attack, window, AG_WINDOW_VSPEED);
            break;
        default:
            if window_timer == 1 vsp += follower_get_window_value(attack, window, AG_WINDOW_VSPEED);
            break;
    }
    
    //Sounds
    if follower_get_window_value(attack, window, AG_WINDOW_HAS_SFX) == 1 && follower_get_window_value(attack, window, AG_WINDOW_SFX_FRAME) == window_timer && follower_get_window_value(attack, window, AG_WINDOW_SFX) != 0 
        sound_play(follower_get_window_value(attack, window, AG_WINDOW_SFX));
        
    //Friction
    var g_frict = ground_friction;
    var a_frict = air_friction;
    if (follower_get_window_value(attack, window, AG_WINDOW_HAS_CUSTOM_FRICTION) == 1) {
        g_frict = follower_get_window_value(attack, window, AG_WINDOW_CUSTOM_GROUND_FRICTION);
        a_frict = follower_get_window_value(attack, window, AG_WINDOW_CUSTOM_AIR_FRICTION);
    }
    if (free) {
        hsp *= 1-a_frict;
    }
    else {
        hsp *= 1-g_frict/5;
    }
    
    //Gravity
    if (player_id.follower_attack_custom_gravity[enem_id, attack])
    	grav = follower_get_window_value(attack, window, AG_WINDOW_CUSTOM_GRAVITY);
    
    
    if (!free && player_id.follower_attack_category[enem_id, attack] == 1) next_state = PS_IDLE_AIR;
    if (free && player_id.follower_attack_category[enem_id, attack] == 0) next_state = PS_LAND;
    
    if (player_id.follower_attack_air_spr[enem_id, attack] != 0) {
        if (free) {
            sprite_index = player_id.follower_attack_air_spr[enem_id, attack];
        }
        else
            sprite_index = player_id.follower_attack_spr[enem_id, attack];
            
    }
    else
        sprite_index = player_id.follower_attack_spr[enem_id, attack];
        
    if (player_id.follower_attack_air_hurtbox_spr[enem_id, attack] != 0) {
        if (free) {
            hurtbox_mask = player_id.follower_attack_air_hurtbox_spr[enem_id, attack];
        }
        else
            hurtbox_mask = player_id.follower_attack_hurtbox_spr[enem_id, attack];
            
    }
    else
    	hurtbox_mask = player_id.follower_attack_hurtbox_spr[enem_id, attack];
    
    //Off ledge handling
    if (player_id.follower_attack_off_ledge[enem_id, attack] == 0 && !free && hsp != 0) {
        var off_r = !position_meet(bbox_right + 2, bbox_bottom + 4)
        var off_l = !position_meet(bbox_left - 2, bbox_bottom + 4)
        
        if ((off_r && hsp > 0) || (off_l && hsp < 0)) {
            x -= hsp;
        }
    }
    
    for (var j = player_id.follower_window_hitbox_min[enem_id, attack]; j <= player_id.follower_window_hitbox_max[enem_id, attack]; j += 1) 
    	if window == follower_get_hitbox_value(attack, j, HG_WINDOW) && window_timer == follower_get_hitbox_value(attack, j, HG_WINDOW_CREATION_FRAME) + 1 {
	        var hitb = create_article_hitbox(attack,j,round(x)+ follower_get_hitbox_value(attack, j, HG_HITBOX_X)*spr_dir,round(y)+ follower_get_hitbox_value(attack, j, HG_HITBOX_Y));
	        hitb.type =  follower_get_hitbox_value(attack, j, HG_HITBOX_TYPE) == 0 ? 1 : follower_get_hitbox_value(attack, j, HG_HITBOX_TYPE);
	    }
    
    //Statuses
    if (follower_get_window_value(attack, window, AG_WINDOW_INVINCIBILITY) == 1) {
        invincible = 2;
        invince_type = 0;
    }
    if (follower_get_window_value(attack, window, AG_WINDOW_INVINCIBILITY) == 2) {
        invincible = 2;
        invince_type = 2;
    }
    custom_behavior(EN_EVENT.ATTACK_UPDATE)
    
    window_timer++;
    
    if window_timer >= follower_get_window_value(attack, window, AG_WINDOW_LENGTH)*(1+.5*follower_get_window_value(attack, window, AG_WINDOW_HAS_WHIFFLAG)*(!has_hit_player)) {
        if follower_get_window_value(attack, window, AG_WINDOW_TYPE) != 9 
        	&& follower_get_window_value(attack, window, AG_WINDOW_TYPE) != 8 
        	&& follower_get_window_value(attack, window, AG_WINDOW_TYPE) != 10 {
            window++;
        }
        if (follower_get_window_value(attack, window, AG_WINDOW_GOTO) > 0) {
        	window = follower_get_window_value(attack, window, AG_WINDOW_GOTO);
        }
        if window > player_id.follower_window_max[enem_id, attack]{
            is_attacking = false;
            next_state = PS_IDLE;
            hurtbox_mask = hurtbox_spr;
            set_sprite_from_state(next_state);
            window = 1;
            window_timer = 0;
            was_parried = false;
            has_hit = false;
            has_hit_player = false;
            invince_type = 0;
        }
        else {
            window_timer = 0;
        }
    }
    
    if (follower_get_window_value(attack, window, AG_WINDOW_TYPE) == 8 && !free) {
        window++;
        window_timer = 0;
    }
    if (follower_get_window_value(attack, window, AG_WINDOW_TYPE) == 10 && free) {
        window++;
        window_timer = 0;
    }
    
}
#define attack_start() //Start attacking 
if (move_cooldown[next_attack] <= 0)
{
    has_hit = false;
    has_hit_player = false;
    was_parried = false;
    last_attack = attack;
    attack = next_attack;
    window_timer = 0;
    window = player_id.follower_window_min[enem_id, attack];
    sprite_index = player_id.follower_attack_spr[enem_id, attack];
    image_index = 0;
    hurtbox_mask = player_id.follower_attack_hurtbox_spr[enem_id, attack];
    if free next_state = PS_ATTACK_AIR;
    else next_state = PS_ATTACK_GROUND;
}
next_attack = -1;
#define on_hit(hbox)
// This is the code the article should run on hit.
// Edit this to have the desired functions when your article is hit by a hitbox.
// hbox refers to the pHitBox object that hit the article.
// hit_player_obj (usually) refers to the player that hit the article.
// hit_player_num refers to the player's number that hit the article.
 
//Default hit stuff
sound_play(hbox.sound_effect);
var fx = spawn_hit_fx(floor(x+hbox.hit_effect_x),floor(y+hbox.hit_effect_y),floor(hbox.hit_effect == 0 ? 301 : hbox.hit_effect));
fx.pause = 8;
 
hit_player_obj = hbox.player_id;
hit_player_num = hbox.player;
owned_player = hit_player_num;
 
//Default Hitpause Calculation
//You probably want this stuff because it makes the hit feel good.
if hbox.type == 1 {
    var desired_hitstop = clamp(hbox.hitpause + hbox.damage * hbox.hitpause_growth * 0.05, 0, 20);
    with hit_player_obj {
        if !hitpause {
            old_vsp = vsp;
            old_hsp = hsp;
        }
        hitpause = true;
        has_hit = true;
        if hitstop < desired_hitstop {
            hitstop = desired_hitstop;
            hitstop_full = desired_hitstop;
        }
    }
}
// This puts the ARTICLE in hitpause.
// If your article does not already account for being in hitpause, either make it stop what it's doing in hitpause
// or comment out the line below.
hitstop = floor(desired_hitstop); 
 
 
//Hit Lockout
if article_should_lockout hit_lockout = hbox.no_other_hit;
 
//Default Hitstun Calculation
hitstun = (hbox.kb_value * 4 * ((kb_adj - 1) * 0.6 + 1) + hbox.damage * 0.12 * hbox.kb_scale * 4 * 0.65 * kb_adj) + 12;
hitstun_full = hitstun;
            
//Default Knockback Calculation
 
// if other.force_flinch && !other.free orig_knock = 0; //uncomment this line for grounded articles.
if hbox.force_flinch orig_knock = 0.3; //comment out this line for grounded articles.
else orig_knock = hbox.kb_value + percent * hbox.kb_scale * 0.12 * kb_adj;
kb_dir = get_hitbox_angle(hbox);
if (kb_dir == 361) {
    if (free)
        kb_dir = 45;
    else
        kb_dir = 40;
}
percent += ceil(hbox.damage);

//Changed this to account for bouncing
if !free && kb_dir > 180 && kb_dir < 360 vsp = orig_knock*dsin(kb_dir);
else if !free vsp = -abs(orig_knock*dsin(kb_dir));
else vsp = -orig_knock*dsin(kb_dir);
hsp = orig_knock*dcos(kb_dir);
if hsp != 0 spr_dir = -sign(hsp);

if (place_meeting(x + hsp, y, asset_get("par_block"))) hsp = -hsp;
next_state = PS_HITSTUN;
 
#define filters(hbox)
//These are the filters that check whether a hitbox should be able to hit the article.
//Feel free to tweak this as necessary.
with hbox {
    var player_equal = player == other.player_id.player;
    var team_equal = get_player_team(player) == get_player_team(other.player_id.player);
    return ("follower_owner" not in self || follower_owner.player_id != other.player_id) //check if the hitbox was created by this article
        && hit_priority != 0 && hit_priority <= 10
        && (groundedness == 0 || groundedness == 1+other.free)
        //&& (!player_equal) //uncomment to prevent the article from being hit by its follower_owner.
        //&& ( (get_match_setting(SET_TEAMS) && (get_match_setting(SET_TEAMATTACK) || !team_equal) ) || player_equal) //uncomment to prevent the article from being hit by its follower_owner's team.
}
 
#define create_article_hitbox(attack, hbox_num, _x, _y)
//Use this function to easily create hitboxes that ignore the article's hit detection.
var hbox = create_hitbox(attack, hbox_num, floor(_x), floor(_y))
hbox.follower_owner = id;
return hbox;
 
#define hit_detection
//Code by Supersonic#9999
//DO NOT modify this function unless you know what you're doing. This does the actual detection, while
//the other functions determine how and what the hit detection interacts with.
//hbox group management
with (oPlayer)
    if state == clamp(state, 5, 6) && window == 1 && window_timer == 1 {
        other.hbox_group[@ player-1][@ attack] = array_create(10,0);
    }
 
//hit lockout stuff
if hit_lockout > 0 {
    hit_lockout--;
    return;
}
//hit lockout stuff
if invincible > 0 {
	invincible--;
    return;
}
//get colliding hitboxes
var hitbox_list = ds_list_create();
 
var num = instance_place_list(floor(x), floor(y), pHitBox, hitbox_list, false);
var final_hbox = noone;
var hit_variable = `hit_article_${id}`;
if num == 0 {
    ds_list_destroy(hitbox_list);
    return;
}
if num == 1 {
    //no priority checks if only one hitbox is found
    var hbox = hitbox_list[|0]
    var group = hbox.hbox_group
    if hit_variable not in hbox 
        if (group == -1 || ( group != -1 && hbox_group[@ hbox.orig_player-1][@ hbox.attack][@ group] == 0)) {
            if filters(hbox) {
                final_hbox = hbox;
            } else {
                //hitbox doesn't meet collision criteria. since this usually doesn't change, omit it.
                variable_instance_set(hbox, hit_variable, true);
            }
        } else {
            //fake hit if group has already hit; optimization thing
            variable_instance_set(hbox, hit_variable, true);
        }
} else {
    var highest_priority = 0;
    var highest_priority_owner = -1;
    var highest_priority_hbox = noone;
    for (var i = 0; i < ds_list_size(hitbox_list); i++) {
        var hbox = hitbox_list[|i]
        var group = hbox.hbox_group
        if hit_variable not in hbox 
            //group check
            if (group == -1 || ( group != -1 && hbox_group[@ hbox.orig_player-1][@ hbox.attack][@ group] == 0)) {
                if filters(hbox) {
                    if hbox.hit_priority > highest_priority {
                        highest_priority = hbox.hit_priority;
                        highest_priority_owner = hbox.player;
                        highest_priority_hbox = hbox;
                    }
                } else {
                    //hitbox doesn't meet collision criteria. since this usually doesn't change, omit it.
                    variable_instance_set(hbox, hit_variable, true);
                }
            } else {
                //fake hit if group has already hit; optimization thing
                variable_instance_set(hbox, hit_variable, true);
            }
    }
    if highest_priority != 0 {
        final_hbox = highest_priority_hbox;
    }
}
 
if final_hbox != noone && final_hbox.type != invince_type {
    on_hit(final_hbox);
    variable_instance_set(final_hbox, hit_variable, true);
    if final_hbox.hbox_group != -1 hbox_group[@ final_hbox.orig_player-1][@ final_hbox.attack][@ final_hbox.hbox_group] = 1;
}
 
//clear hitbox list
//ds_list_clear(hitbox_list)
ds_list_destroy(hitbox_list);

#define place_meet(__x,__y) //get place_meeting for the usual suspects
/*return (collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,asset_get("solid_32_obj"),true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_solid,true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,asset_get("jumpthrough_32_obj"),true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_platform,true,true));*/
return (place_meet_solid(__x,__y) || 
        place_meet_plat(__x,__y));

#define position_meet(__x,__y) //get place_meeting for the usual suspects
/*return (collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,asset_get("solid_32_obj"),true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_solid,true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,asset_get("jumpthrough_32_obj"),true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_platform,true,true));;*/

return (position_meeting(__x,__y,asset_get("par_block")) || 
        position_meeting(__x,__y,asset_get("par_jumpthrough")));    
#define place_meet_solid(__x,__y) //get place_meeting for the usual suspects
/*return (collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,asset_get("solid_32_obj"),true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_solid,true,true));*/
return (place_meeting(__x,__y,asset_get("par_block"))); 
#define place_meet_plat(__x,__y) //get place_meeting for the usual suspects
/*return (collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,asset_get("jumpthrough_32_obj"),true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_platform,true,true));*/
return (place_meeting(__x,__y,asset_get("par_jumpthrough")))


#define drum_detection()
//Drum Bouncing
//(I put it here so it can detect multiple instances of the object.)

with (obj_article3) {
    if (player_id.url == other.player_id.url && get_char_info(player_id.player, INFO_STR_NAME) == get_char_info(other.player, INFO_STR_NAME)) {
        var player_near = collision_line(x - lengthdir_x(40, img_angle), y - 48 - lengthdir_y(40, img_angle), 
            x + lengthdir_x(40, img_angle), y - 48 - lengthdir_y(40, img_angle), other, 0, 1);
        if (instance_exists(player_near)) {
            if (other.vsp > 0 && other.state == 0 && other.free) {
                state = 2;
                state_timer = 0;
                other.hit_already = true;
                other.state = 0;
                other.state_timer = 0;
                if (img_angle != 0)
                    other.hsp = lengthdir_x(bounce_speed, img_angle - 90);
                other.vsp = lengthdir_y(bounce_speed, img_angle - 90);
            }
        }
    }
}