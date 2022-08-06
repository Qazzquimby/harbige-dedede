if (get_training_cpu_action() == CPU_FIGHT) {
    var drum_near = noone;
    var drum_distance_x = 320;
    var drum_distance_y = 256;
    
    with (obj_article3) {
        if (player_id == other.id) {
            if (abs(other.x - x) <= drum_distance_x && abs(other.y - y) <= drum_distance_y) {
                drum_near = id;
            }
        }
    }
    
    //Attack decision
    if (state_cat != SC_HITSTUN && state_cat != SC_GROUND_COMMITTED && state_cat != SC_AIR_COMMITTED && !ai_recovering && ai_attack_timer % ai_attack_time == 0) {
        if (instance_exists(drum_near)) {
            //Dedede throws gordos more often if there's a drum nearby
            var gordo_random = random_func(0, 100, true) < ease_linear(30, 60, temp_level - 1, 8);
            
            if (gordo_random && array_length(gordo_objs) == 0) {
                spr_dir = sign(drum_near.x - x);
                if (spr_dir == 0)
                    spr_dir = 1;
                set_attack(AT_FSPECIAL);
            }
            //Dedede shouldn't use DSpecial if the drum is out.
            move_cooldown[AT_DSPECIAL] += 2;
        }
    }
    
    //While attacking
    if (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND) {
        switch (attack) {
            case AT_NSPECIAL_2: //Spit em out automatically
                attack_pressed = true;
            break;
            case AT_USPECIAL: //Move toward drum if USpecial is used
                if (instance_exists(drum_near)) {
                    left_down = drum_near.x < x;
                    right_down = drum_near.x > x;
                }
            break;
        }
    }
}