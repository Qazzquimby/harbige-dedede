if (hitstop == 0) {
    state_timer ++;
    switch(state) {
        case -1: //spawning
            img_index += 0.25;
            if (state_timer == 24) {
                state = 0;
                state_timer = 0;
            }
        break;
        case 0: //Idle
            img_index = 0;
            
            alive_timer++
            visible = true;
            if (alive_timer >= alive_time -45) {
                visible = alive_timer % 16 <= 4 ? false : true
            }
            if (alive_timer >= alive_time) {
                state = 3;
                state_timer = 0;
            }
        break;
        case 1: //Bounced
            visible = true;
            img_index = round(ease_sineOut(0, 2, state_timer, bounce_lag));
            if (state_timer == bounce_lag) {
                hitpoints--;
                state = hitpoints <= 0 ? 3 : 0;
                state_timer = 0;
            }
        break;
        case 2: //Explode
            explode()
        break;
        case 3: //poof
            destroy_self();
        break;
    }
    current_sprite_set = hitpoints <= 1 ? 1 : 0;
    var num_frames = sprite_get_number(spr_index) / num_sprite_sets;
    var offset = num_frames * floor(current_sprite_set);
    img_index = (img_index % num_frames) + offset;
}

if (state >= 0 && state < 2) {
    if (place_meeting(round(x), round(y), asset_get("plasma_field_obj"))) {
        destroy_self();
    }
}

#define destroy_self()
var fx = spawn_hit_fx(round(x),round(y - 32), 144);
fx.pause = 8;
instance_destroy(id);
exit;

#define explode()
var hitb = create_hitbox(AT_DSPECIAL, 1, round(x),round(y - 32));
hitb.player = owned_player;
sound_play(sound_get("sfx_drumexpl"))
instance_destroy(id);
exit;
