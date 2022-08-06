//Sprite Animation
if (hitstop == 0) {
    state_timer ++;
    switch(state) {
        case -1:
            if (instance_exists(hitbox)) instance_destroy(hitbox);
        break;
        case 0:
            img_index = state_timer * 0.1;
            img_index %= 8;
            visible = true;
            
            if (state_timer > 4) {
                hit_detection();
                drum_detection();
            }
            if (!instance_exists(hitbox))
            {
                if (state_timer >= 0 && state_timer < 60) {
                    hitbox = create_article_hitbox(AT_FSPECIAL, 3, floor(x), floor(y));
                    //hitbox.can_hit = can_hit;
                    hitbox.player = owned_player;
                }
                if (state_timer >= 60) {
                    hitbox = create_article_hitbox(AT_FSPECIAL, 4, floor(x), floor(y));
                    //hitbox.can_hit = can_hit;
                    hitbox.player = owned_player;
                }
            }
            else {
                hitbox.x = floor(x);
                hitbox.y = floor(y);
                hitbox.hsp = hsp;
                hitbox.vsp = vsp;
                // with (hitbox) {
                //     var hitp = instance_place(floor(x), floor(y), pHurtBox)
                //     if (instance_exists(hitp)) {
                //         if (was_parried) {
                //             with (other) {
                //                 owned_player = hitp.player;
                //                 hsp = -hsp
                //                 if (vsp > 0)
                //                     vsp = -bounce_speed;
                //                 hit_already = true;
                //                 state_timer = 0;
                //             }
                //         }
                //     }
                // }
                // if (hit_already || state_timer >= 3) {
                //     with (hitbox) {
                //         var hitp = instance_place(floor(x), floor(y), pHurtBox)
                //         if (instance_exists(hitp)) {
                //             with (other) {
                //                 if (hitp.player != owned_player) {
                //                     hsp = -hsp / 2
                //                     if (vsp > 0)
                //                         vsp = hit_already ? -bounce_speed : -bounce_current;
                //                     hitstop = hitp.playerID.hitstop;
                //                 }
                //             }
                            
                //         }
                //     }
                // }
                //can_hit = hitbox.can_hit;
            }
            if (free)
                vsp += grav;
                
            vsp = min(vsp, max_fall_speed);
            if (hsp != 0)
                spr_dir = sign(hsp);
                
            if (state_timer > hit_time_max) {
                destroy_self();
                exit;
            }
            
            if (!hit_already) {
                current_sprite_set += 0.05;
                current_sprite_set %= 2;
                if (!free) {
                    vsp = -bounce_speed;
                    sound_play(asset_get("sfx_gus_land"));
                }
                if (place_meeting(x + hsp, y, asset_get("par_block"))) {
                    if (y < room_height - 64) {
                        x += hsp;
                        y += vsp;
                        hsp = 0;
                        vsp = 0;
                        state = 1;
                        state_timer = 0;
                        if (instance_exists(hitbox)) instance_destroy(hitbox);
                        sound_play(asset_get("sfx_shovel_brandish"), 0, 0, 1, 0.9);
                        var fx = spawn_hit_fx(round(x),round(y),302   );
                        fx.pause = 8;
                    }
                    else {
                        hsp = -hsp
                        sound_play(asset_get("sfx_gus_land"));
                    }
                }
            }
            else {
                current_sprite_set = 2;
                if (!free) {
                    sound_play(asset_get("sfx_gus_land"));
                    vsp = -bounce_speed;
                }
                if (place_meeting(x + hsp, y, asset_get("par_block"))) {
                    hsp = -hsp
                    sound_play(asset_get("sfx_gus_land"));
                }
            }
            if (x < 0 || x > room_width) {
                destroy_self();
                exit;
            }
            if (y > room_height) {
                destroy_self();
                exit;
            }
            
            if place_meeting(x, y, asset_get("plasma_field_obj")) {
                destroy_self();
                exit;
            }
                
        break;
        case 1:
            current_sprite_set += 0.05;
            current_sprite_set %= 2;
            vsp = 0;
            hsp = 0;
            if (!collision_rectangle(floor(bbox_left - 2), floor(bbox_top - 2), floor(bbox_right + 2), floor(bbox_bottom + 2), asset_get("par_block"), 0, 0)) { 
                hit_already = true;
                state = 0;
                state_timer = 0;
            }
            
            if (!instance_exists(hitbox))
            {
                hitbox = create_article_hitbox(AT_FSPECIAL, 5, floor(x), floor(y));
            }
            else {
                hitbox.x = floor(x);
                hitbox.y = floor(y);
                hitbox.hsp = hsp;
                hitbox.vsp = vsp;
            }
            if (state_timer > stick_time_max - 60) {
                visible = get_gameplay_time() % 8 > 4;
            }
            hit_detection();
            if (state_timer > stick_time_max) {
                destroy_self();
                exit;
            }
        break;
    }
    
    var num_frames = sprite_get_number(sprite_index) / num_sprite_sets;
    var offset = num_frames * floor(current_sprite_set);
    image_index = (img_index % num_frames) + offset;
}
else {
    if (instance_exists(hitbox)) {
        hitbox.x = floor(x);
        hitbox.y = floor(y);
        hitbox.hsp = hsp;
        hitbox.vsp = vsp;
    }
}
if (getting_bashed) {
    owned_player = bashed_id.player;
    hit_already = true;
    state = 0;
    state_timer = 0;
    if (instance_exists(hitbox)) instance_destroy(hitbox);
}

if (state == 0 || state == 1) {
    if (place_meeting(round(x), round(y), asset_get("plasma_field_obj"))) {
        destroy_self();
    }
}

#define destroy_self()
var fx = spawn_hit_fx(round(x),round(y),144  );
fx.pause = 8;
if (instance_exists(hitbox)) instance_destroy(hitbox);
instance_destroy(id);
exit;

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
 
percent += hbox.damage * 2;
hit_time_max += hbox.kb_value * 4;

//Default Hitpause Calculation
//You probably want this stuff because it makes the hit feel good.
if hbox.type == 1 {
    var desired_hitstop = clamp(hbox.hitpause + percent * hbox.hitpause_growth * 0.05, 0, 20);
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
hitstun = (hbox.kb_value * 4 * ((kb_adj - 1) * 0.6 + 1) + percent * 0.12 * hbox.kb_scale * 4 * 0.65 * kb_adj) + 12;
hitstun_full = hitstun;
            
//Default Knockback Calculation
// if other.force_flinch && !other.free orig_knock = 0; //uncomment this line for grounded articles.
if hbox.force_flinch orig_knock = 0.3; //comment out this line for grounded articles.
else orig_knock = hbox.kb_value + percent * hbox.kb_scale * 0.12 * kb_adj;
kb_dir = get_hitbox_angle(hbox);

//Changed this to account for bouncing
if !free && kb_dir > 180 && kb_dir < 360 vsp = orig_knock*dsin(kb_dir);
else if !free vsp = -abs(orig_knock*dsin(kb_dir));
else vsp = -orig_knock*dsin(kb_dir);
hsp = orig_knock*dcos(kb_dir);
if hsp != 0 spr_dir = -sign(hsp);

if (place_meeting(x + hsp, y, asset_get("par_block"))) hsp = -hsp;

if (!hit_already) {
    hit_already = true;
    if (state == 1) {
        state = 0;
        state_timer = 0;
    }
}
 
#define filters(hbox)
//These are the filters that check whether a hitbox should be able to hit the article.
//Feel free to tweak this as necessary.
with hbox {
    var player_equal = player == other.player_id.player;
    var team_equal = get_player_team(player) == get_player_team(other.player_id.player);
    var url_equal = player_id.url == other.player_id.url && get_char_info(player_id.player, INFO_STR_NAME) == get_char_info(other.player, INFO_STR_NAME)
    return ("owner" not in self || owner != other) //check if the hitbox was created by this article
        && hit_priority != 0 && hit_priority <= 10
        && hitstun_factor >= 0
        && (groundedness == 0 || groundedness == 1+other.free)
        && (!url_equal || (attack != AT_NSPECIAL && attack != AT_DSPECIAL))
        //&& (!player_equal) //uncomment to prevent the article from being hit by its owner.
        //&& ( (get_match_setting(SET_TEAMS) && (get_match_setting(SET_TEAMATTACK) || !team_equal) ) || player_equal) //uncomment to prevent the article from being hit by its owner's team.
}
 
#define create_article_hitbox(attack, hbox_num, _x, _y)
//Use this function to easily create hitboxes that ignore the article's hit detection.
var hbox = create_hitbox(attack, hbox_num, floor(_x), floor(_y))
hbox.owner = self;
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
 
if final_hbox != noone {
    on_hit(final_hbox);
    variable_instance_set(final_hbox, hit_variable, true);
    if final_hbox.hbox_group != -1 hbox_group[@ final_hbox.orig_player-1][@ final_hbox.attack][@ final_hbox.hbox_group] = 1;
}
 
//clear hitbox list
//ds_list_clear(hitbox_list)
ds_list_destroy(hitbox_list);

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