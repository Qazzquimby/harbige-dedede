//B - Reversals
if (attack == AT_NSPECIAL || attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL){
    trigger_b_reverse();
}


switch (attack){
		case AT_FTILT:
			if(was_parried && window == 3){
				window = 4;
				attack_end();
			}
			if(window = 1){
				if(window_timer = get_window_value(AT_FTILT, window, AG_WINDOW_LENGTH)){
					sound_play(sound_get("sfx_hammerswing_m"));
				}
				ftilt_loop_timer = 0;
			}
			if(window == 2 && !hitpause){
	            var hbox = create_hitbox(attack, ftilt_loop_timer > 0 ? 2 : 1, round(x), round(y));
			}
			if(window == 3){
				if(window_timer%3== 0 and !hitpause){
					sound_play(sound_get("sfx_hammerswing_s"));
				}
				if(window_timer == get_window_value(AT_FTILT, window, AG_WINDOW_LENGTH)){
					ftilt_loop_timer++;
					window_timer = 0;
				}
				
				if (window_timer % 4 == 0 && !hitpause) {
				    var hbox = create_hitbox(attack, ftilt_loop_timer > 0 ? 2 : 1, round(x), round(y));
				}
				
				if!(attack_down || right_stick_down ||  left_stick_down) && (ftilt_loop_timer > 0 || window_timer > 11){
					destroy_hitboxes();
					sound_play(sound_get("sfx_hammerswing_l"));
					window_timer = -1;
					window++;
				}
			}
		break;
		case AT_DTILT:
			if(window = 1){
				if (window_timer == 1 && !hitpause) {
					spawn_base_dust(round(x + 8 * spr_dir), round(y), "dash_start")
				}
				if(window_timer = get_window_value(AT_DTILT, window, AG_WINDOW_LENGTH) && !hitpause){
					sound_play(asset_get("sfx_spin"), false, 0, 1, 0.8);
				}
				ftilt_loop_timer = 0;
			}
		break;
		case AT_DATTACK:
			if (attack == AT_DATTACK && window == 2 && window_timer == 2 && !hitpause)
			{
				shake_camera(8, 3);
			}
			if (window <= 2) {
				if (has_rune("D")) super_armor = true;
			}
			else {
				if (has_rune("D")) super_armor = false;
			}
			if (has_hit) {
				if (window == 4 && window_timer >= get_window_value(AT_DATTACK, 4, AG_WINDOW_LENGTH) - 5) {
					can_attack = true; 
				}
			}
		break;
		
		case AT_DSTRONG:
			if (has_rune("G")) {
				super_armor = window <= 2;
			}
			
			if (has_rune("I")) {
				if (window == 2 && window_timer = get_window_value(attack, window, AG_WINDOW_LENGTH) && !hitpause) {
					var star = create_hitbox(AT_EXTRA_1, 1, round(x + 32 * spr_dir), round(y-16))
					star.spr_dir = 1;
					star.hsp = lengthdir_x(8, 15) * spr_dir;
					star.vsp = lengthdir_y(8, 15);
				}
				if (window == 4 && window_timer = get_window_value(attack, window, AG_WINDOW_LENGTH) && !hitpause) {
					var star = create_hitbox(AT_EXTRA_1, 1, round(x - 48 * spr_dir), round(y-16))
					star.spr_dir = -1;
					star.hsp = lengthdir_x(-8, 15) * spr_dir;
					star.vsp = lengthdir_y(8, 15);
				}
			}
			
			if (has_rune("K")) {
				if(window >= 2 && window <= 4) {
					hsp += 1 * (right_down - left_down);
					hsp = clamp(hsp, -12, 12);
				}
			}
		break;
		case AT_USTRONG:
			
			
			if (has_rune("G")) {
				super_armor = window <= 2;
			}
			if (has_rune("F")) {
				if (window == get_attack_value(attack, AG_STRONG_CHARGE_WINDOW)) {
					if (window_timer >= get_window_value(attack, window, AG_WINDOW_LENGTH) - 1) {
						if (strong_charge == 1) {
							sound_play(asset_get("sfx_ell_fist_explode"));
							shake_camera(2, 8);
						}
						if (strong_charge % 6 == 1) {
							create_hitbox(AT_USTRONG, 4, round(x), round(y));
							var hfx = spawn_hit_fx(round(x - 30 * spr_dir), round(y - 80), 3);
							hfx.depth = depth - 1
						}
					}
				}
			}
			if(window == 2 && window_timer = 8 && !hitpause){
				sound_play(sound_get("sfx_dedede_ustrong"))
			}
			
			if (has_rune("I")) {
				if (window == 2 && window_timer = get_window_value(attack, window, AG_WINDOW_LENGTH) && !hitpause) {
					var star = create_hitbox(AT_EXTRA_1, 1, round(x + 32 * spr_dir), round(y-16))
					star.spr_dir = 1;
					star.hsp = lengthdir_x(8, 15) * spr_dir;
					star.vsp = lengthdir_y(8, 15);
				}
				if (window == 3 && window_timer = get_window_value(attack, window, AG_WINDOW_LENGTH) && !hitpause) {
					var star = create_hitbox(AT_EXTRA_1, 1, round(x - 48 * spr_dir), round(y-16))
					star.spr_dir = -1;
					star.hsp = lengthdir_x(-8, 15) * spr_dir;
					star.vsp = lengthdir_y(8, 15);
				}
			}
		break;
		
		case AT_FSTRONG:
			if (window == 2 &&window_timer == get_window_value(attack, window, AG_WINDOW_LENGTH) && !hitpause)
			{
				shake_camera(8, 3);
			}
			if (window == 1) {
				grabbed_player_obj = noone; 
			}
			if (has_rune("G")) {
				super_armor = window <= 2;
			}
			if (window == 3 && window_timer == 2 && !hitpause) {
				spawn_base_dust(round(x + 88 * spr_dir), round(y), "jump")
			}
			//first, drop the grabbed player if this is the last window of the attack, or if they somehow escaped hitstun.
	    	if (window >= 4) { grabbed_player_obj = noone; }
	    	else if (window == 3 && window_timer > 2) { grabbed_player_obj = noone; }
	    	else if (instance_exists(grabbed_player_obj) && grabbed_player_obj.state != PS_HITSTUN && grabbed_player_obj.state != PS_HITSTUN_LAND) {
	    		grabbed_player_obj = noone; 
	    	}
	    	else if (instance_exists(grabbed_player_obj)) {
	    		if (window_timer <= 1) {
	    			grabbed_player_relative_x = grabbed_player_obj.x - x;
	    			grabbed_player_relative_y = grabbed_player_obj.y - y;
	    		}
	    		//keep the grabbed player in hitstop until the grab is complete.
	    		grabbed_player_obj.hitstop = 2;
	    		grabbed_player_obj.hitpause = true;
	    		
	    		//if this is the first frame of a window, store the grabbed player's relative position.
	    		var pull_to_x = 0
	    		var pull_to_y = 0;
	    		var window_length = 2;
	    		var grab_ease = true;
	    		 
	    		//on the first window, pull the opponent into the grab.
	    		if (window == 3) { 
	    		    if (window_timer >= 0 && window_timer <= window_length) {
	        			pull_to_x = 37 * spr_dir;
	        			pull_to_y = -32;
	    		    }
	    		}
	    		
	    		if (grab_ease) {
	    			grabbed_player_obj.x = x + ease_linear( grabbed_player_relative_x, pull_to_x * (spr_dir * image_xscale), window_timer, window_length);
	    			grabbed_player_obj.y = y + ease_linear( grabbed_player_relative_y, pull_to_y* image_yscale, window_timer, window_length);
	    		}
	    		else {
	    			grabbed_player_obj.x = x + pull_to_x * (spr_dir * image_xscale);
	    			grabbed_player_obj.y = y + pull_to_y * image_yscale;
	    		}
	    	}	
	    	if (has_rune("I")) {
				if (window == 3 && window_timer = get_window_value(attack, window, AG_WINDOW_LENGTH) && !hitpause) {
					var star = create_hitbox(AT_EXTRA_1, 1, round(x + 64 * spr_dir), round(y-16))
					star.spr_dir = 1;
					star.hsp = lengthdir_x(8, 15) * spr_dir;
					star.vsp = lengthdir_y(8, 15);
				}
	    	}
		break;
		case AT_UAIR:
			if(window == 2){
				if(window_timer % 4 == 0 and !hitpause){
					sound_play(sound_get("sfx_hammerswing_s"));
					attack_end();
				}
				if(window_timer == get_window_value(attack, window, AG_WINDOW_LENGTH)) {
					sound_play(sound_get("sfx_hammerswing_l"));
				}
			}
		break;
		
		case AT_NSPECIAL:
			if (window == 1) {
				grabbed_player_obj = noone; 
			}
		    can_fast_fall = false;
		    can_move = false;
		    if (state_timer == 6 && free) {
		    	if (b_reversed)
		    		hsp += 5 * spr_dir
		    }
		    
			if (window == 1) {
				nspecial_loops = 0;
				nspecial_sound_id = noone;
				nspecial_damage = 0;
			}
			if (window == 1 && window_timer == get_window_value(attack, window, AG_WINDOW_LENGTH) && !hitpause) {
				nspecial_sound_id = sound_play(sound_get("sfx_dedede_suck"));
			}
			if (window == 2 || window == 3) {
				if (get_gameplay_time() % 12 == 0 && !free) {
					var dust = spawn_base_dust(round(x - 16 * spr_dir), round(y), "dash_start")
					dust.spr_dir = spr_dir;
				}
		        if (get_gameplay_time() % 5 == 0) {
		            var rand_dir = -30 + random_func(1, 60, true);
		            spawn_hit_fx(floor(x) + 32 * spr_dir + round(lengthdir_x(128, rand_dir) * spr_dir), (floor(y) - 32) + round(lengthdir_y(128, rand_dir)), nspecial_projeffect);
		        }
			}
			if (window == 3) {
				if (!special_down && nspecial_loops > 1 && !hitpause) {
					window ++;
					window_timer = 0;
					sound_stop(nspecial_sound_id);
					nspecial_sound_id = sound_play(sound_get("sfx_dedede_suckend"));
					destroy_hitboxes();
				}
				if (window_timer == 9) {
					sound_stop(nspecial_sound_id);
					nspecial_sound_id = sound_play(sound_get("sfx_dedede_suckhold"));
					nspecial_loops++;
				}
			}
			
			if (window != 5) { grabbed_player_obj = noone; }
	    	else if (instance_exists(grabbed_player_obj) && (grabbed_player_obj.object_index == oPlayer && (grabbed_player_obj.state != PS_HITSTUN && grabbed_player_obj.state != PS_HITSTUN_LAND))) {
	    		grabbed_player_obj = noone; 
	    	}
	    	else if (instance_exists(grabbed_player_obj)) {
	    		if (window_timer <= 1) {
	    			grabbed_player_relative_x = floor(grabbed_player_obj.x - x);
	    			grabbed_player_relative_y = floor(grabbed_player_obj.y - y);
	    		}
	    		//keep the grabbed player in hitstop until the grab is complete.
	    		if (grabbed_player_obj.object_index == pHitBox) {
	    			grabbed_player_obj.hitbox_timer--;
	    		}
	    		else {
		    		grabbed_player_obj.hitstop = 2;
		    		grabbed_player_obj.hitpause = true;
	    		}
	    		
	    		//if this is the first frame of a window, store the grabbed player's relative position.
	    		var pull_to_x = 0
	    		var pull_to_y = 0;
	    		var window_length = 10;
	    		var grab_ease = true;
	    		 
	    		//on the first window, pull the opponent into the grab.
	    		if (window == 5) { 
	    		    if (window_timer >= 0 && window_timer <= window_length) {
	        			pull_to_x = 0 * spr_dir;
	        			pull_to_y = -8;
	    		    }
	    		}
	    		if (grab_ease) {
	    			grabbed_player_obj.x = x + ease_linear( grabbed_player_relative_x, pull_to_x * (spr_dir * image_xscale), window_timer, window_length);
	    			grabbed_player_obj.y = y + ease_linear( grabbed_player_relative_y, pull_to_y* image_yscale, window_timer, window_length);
	    		}
	    		else {
	    			grabbed_player_obj.x = x + pull_to_x * (spr_dir * image_xscale);
	    			grabbed_player_obj.y = y + pull_to_y * image_yscale;
	    		}
	    		
	    		if (window_timer = 9) {
	    			attack_end();
	    			sound_play(sound_get("sfx_dedede_inhale_s"));
	    			if (grabbed_player_obj.object_index == pHitBox) {
	    				instance_destroy(grabbed_player_obj);
	        			set_attack(AT_FTHROW);
	        			hurtboxID.sprite_index = get_attack_value(AT_FTHROW, AG_HURTBOX_SPRITE);
				        if (((left_down && spr_dir == 1) || (right_down && spr_dir == -1))) {
		        			spr_dir = -spr_dir;
			        	}
	    			}
			        else {
	        			set_attack(AT_NSPECIAL_2);
	        			hurtboxID.sprite_index = get_attack_value(AT_NSPECIAL_2, AG_HURTBOX_SPRITE);
		    			sucked_player_obj = grabbed_player_obj;
		    			grabbed_player_obj = noone;
			        }
	    		}
	    		
	    	}
			
			if (window == 2 || window == 3) {
				//Projectile sucking
				var proj_hit = select_projectile(x + (32 * spr_dir), y-32, 54, 32);
				
				if (instance_exists(proj_hit)) {
					destroy_hitboxes();
					grabbed_player_obj = proj_hit;
					window = 5
					window_timer = 0;
					proj_hit.mask_index = asset_get("empty_sprite")
        			nspecial_damage = proj_hit.damage;
				}
				else {
					var art_hit = select_article(x + (56 * spr_dir), y-32, 112, 32, obj_article1);
					if (instance_exists(art_hit)) {
						destroy_hitboxes();
						window = 5
						window_timer = 0;
						grabbed_player_obj = art_hit;
					}
					else {
						art_hit = select_article(x + (56 * spr_dir), y-32, 112, 32, obj_article2);
						if (instance_exists(art_hit)) {
							destroy_hitboxes();
							window = 5
							window_timer = 0;
							grabbed_player_obj = art_hit;
						}
					}
				}
			}
		break;
		case AT_NSPECIAL_2:
			if (window == 1 && window_timer == 1) {
				grab_timer = 0;
			}	
			
			var grab_damage = 0;
			if (window == 6 && instance_exists(sucked_player_obj)) { 
	    		sucked_player_obj.visible = true;
	    		sucked_player_obj = noone; 
			}
	    	else if (instance_exists(sucked_player_obj) && ((sucked_player_obj.object_index == oPlayer) && (sucked_player_obj.state != PS_HITSTUN && sucked_player_obj.state != PS_HITSTUN_LAND))) {
	    		sucked_player_obj.visible = true;
	    		sucked_player_obj = noone; 
	    	}
			else if (instance_exists(sucked_player_obj)) {
	    		sucked_player_obj.hitstop = 2;
	    		sucked_player_obj.hitpause = true;
	    		sucked_player_obj.x = x + 24 * spr_dir;
	    		sucked_player_obj.y = y - 48;
	    		sucked_player_obj.visible = false;
	    		sucked_player_obj.invincible = true;
	    		sucked_player_obj.invince_time = 2;
	        	with (sucked_player_obj) {
	        		if (object_index == obj_article1 || object_index == obj_article2) {
	        			grab_damage = 50;
	        			state = -1;
	        		}
	        		else grab_damage = object_index == obj_stage_article ? percent : get_player_damage(player);
	        	}	
			}
			grab_timer++;
			if (grab_timer > min(nspecial_grab_time_min + 0.55 * grab_damage, nspecial_grab_time_max)) {
        		window = 6;
        		window_timer = 0;
        		grab_timer = 0;
        		hsp = -8 * spr_dir
        		
		        sucked_player_obj.x = x + spr_dir * 48
		        sucked_player_obj.y = y - 32;
        		
				if (sucked_player_obj.object_index == oPlayer) {
			        sucked_player_obj.hitstun = 30;
			        sucked_player_obj.hitstun_full = 30;
			        sucked_player_obj.hitpause = true;
			        sucked_player_obj.state = PS_HITSTUN;
			        sucked_player_obj.hsp = 8 * spr_dir;
			        sucked_player_obj.vsp = -2;
			        sucked_player_obj.old_hsp = 8 * spr_dir;
			        sucked_player_obj.old_vsp = -2;
		    		sucked_player_obj.visible = true;
				}
				else if (sucked_player_obj.object_index == obj_article1) {
					with (sucked_player_obj) {
						hit_already = true;
						owned_player = other.player;
						state = 0;
						state_timer = 0;
						kb_dir = 55;
						orig_knock = 4;
						
						if !free && kb_dir > 180 && kb_dir < 360 vsp = orig_knock*dsin(kb_dir);
						else if !free vsp = -abs(orig_knock*dsin(kb_dir));
						else vsp = -orig_knock*dsin(kb_dir);
						hsp = orig_knock*dcos(kb_dir)*other.spr_dir;
						if hsp != 0 spr_dir = -sign(hsp);
					}
				}
				else if (sucked_player_obj.object_index == obj_article2) {
					with (sucked_player_obj) {
						hitstun = 60;
						hitstun_full = 60;
						next_state = PS_HITSTUN;
						kb_dir = 45;
						orig_knock = 12;
						state_timer = 0;
						hitpause = 0;
						if !free && kb_dir > 180 && kb_dir < 360 vsp = orig_knock*dsin(kb_dir);
						else if !free vsp = -abs(orig_knock*dsin(kb_dir));
						else vsp = -orig_knock*dsin(kb_dir);
						hsp = orig_knock*dcos(kb_dir)*other.spr_dir;
	    				visible = true;
					}
		    		sucked_player_obj = noone; 
				}
				sucked_player_obj = noone;
        	}
        	
        	if (window >= 1 && window <= 5) {
	    		if (is_special_pressed(DIR_ANY) || is_attack_pressed(DIR_ANY) || is_strong_pressed(DIR_ANY)) {
	    			attack_end();
        			set_attack(AT_FTHROW);
        			hurtboxID.sprite_index = get_attack_value(AT_FTHROW, AG_HURTBOX_SPRITE);
			        if (((left_down && spr_dir == 1) || (right_down && spr_dir == -1))) {
	        			spr_dir = -spr_dir;
			        }
	    		}
        	}
        	
        	if ((window == 2 || window == 4 || window == 5) && !hitpause) {
        		can_move = false;
        		
        		if (jump_pressed || (up_pressed && can_tap_jump())) {
        			window = 3;
        			window_timer = 0;
        			vsp = -nspecial_jump_speed;
        			free = true;
        			y -= 2;
					spawn_base_dust(round(x), round(y), "jump")
        			sound_play(sound_get("sfx_dedede_jump01"))
        		}
        		if (free) {
        			window = 3;
        			window_timer = 0;
        		}
        		
		        if (window != 5 && ((left_down && spr_dir == 1) || (right_down && spr_dir == -1))) {
		        	window = 5;
		        	window_timer = 0;
        			spr_dir = -spr_dir;
		        }
        	}
        	
        	if (window == 3 && !hitpause) {
        		can_move = true;
        		can_fast_fall = false;
        		grav = 0.4;
        		
        		if (!free) {
        			window = 4;
        			window_timer = 0;
        			sound_play(sound_get("sfx_dedede_landing01"))
					spawn_base_dust(round(x), round(y), "land")
        		}
        	}
		break;
		
		case AT_FTHROW:
			if (instance_exists(sucked_player_obj)) {
				if (sucked_player_obj.object_index == oPlayer || sucked_player_obj.object_index == obj_article1 || sucked_player_obj.object_index == obj_article2) {
		    		sucked_player_obj.hitstop = 2;
		    		sucked_player_obj.hitpause = true;
			    	if (instance_exists(sucked_player_obj) && ((sucked_player_obj.object_index == oPlayer) &&  sucked_player_obj.state != PS_HITSTUN && sucked_player_obj.state != PS_HITSTUN_LAND)) {
			    		sucked_player_obj.visible = true;
			    		sucked_player_obj = noone; 
			    	}
				}
	    		sucked_player_obj.x = x + spr_dir * 32;
	    		sucked_player_obj.y = y - 32;
	    		sucked_player_obj.visible = false;
			}
			var grab_damage = 0;
			
        	with (sucked_player_obj) {
        		if (object_index == obj_article1 || object_index == obj_article2) {
        			grab_damage = 50;
        			state = -1;
        		}
        		else grab_damage = object_index == obj_stage_article ? percent : get_player_damage(player);
        	}	
			if (window == 2 && window_timer == 1 && !hitpause) { 
				if ( instance_exists(sucked_player_obj)) {
					if (sucked_player_obj.object_index == oPlayer) {
						var hbox = create_hitbox(AT_FTHROW, 1, round(x + 32 * spr_dir), round(y - 32));
						hbox.sucked_player_obj = sucked_player_obj;
						hbox.hsp = min(ease_linear(6, 12, grab_damage, 100), 22) * (has_rune("H") ? 2 : 1) * spr_dir;
			    		sucked_player_obj = noone; 
					}
					else if (sucked_player_obj.object_index == obj_article1) {
						with (sucked_player_obj) {
							hit_already = true;
							owned_player = other.player;
							state = 0;
							state_timer = 0;
							kb_dir = 45;
							orig_knock = 12;
							
							if !free && kb_dir > 180 && kb_dir < 360 vsp = orig_knock*dsin(kb_dir);
							else if !free vsp = -abs(orig_knock*dsin(kb_dir));
							else vsp = -orig_knock*dsin(kb_dir);
							hsp = orig_knock*dcos(kb_dir)*other.spr_dir;
							if hsp != 0 spr_dir = -sign(hsp);
						}
			    		sucked_player_obj = noone; 
					}
					else if (sucked_player_obj.object_index == obj_article2) {
						with (sucked_player_obj) {
							hitstun = 60;
							hitstun_full = 60;
							hitpause = 0;
							next_state = PS_HITSTUN;
							kb_dir = 45;
							orig_knock = 12;
							state_timer = 0;
							if !free && kb_dir > 180 && kb_dir < 360 vsp = orig_knock*dsin(kb_dir);
							else if !free vsp = -abs(orig_knock*dsin(kb_dir));
							else vsp = -orig_knock*dsin(kb_dir);
							hsp = orig_knock*dcos(kb_dir)*other.spr_dir;
	    					visible = true;
						}
			    		sucked_player_obj = noone; 
					}
				}
				else if (nspecial_damage > 0) {
					var hbox = create_hitbox(AT_FTHROW, 3, round(x + 32 * spr_dir), round(y - 32));
					hbox.damage = ceil(nspecial_damage * 1.5);
				}
			}
		break;
		
		case AT_FSPECIAL:
			var window_length = get_window_value(attack, 1, AG_WINDOW_LENGTH);
			var window_frames = get_window_value(attack, 1, AG_WINDOW_ANIM_FRAMES);
			var window_mul = ceil(window_length / window_frames);
		    if (state_timer == 6 && free) {
		    	if (b_reversed)
		    		hsp += 5 * spr_dir
		    }
			if ((window == 1 || window == 4) && window_timer == 1 && free) {
				vsp += 1;
			}
			if (window == 1 && window_timer == 1) {
				for (var i = 0; i < array_length(gordo_objs); i++) {
					if (!instance_exists(gordo_objs[i])) {
						gordo_objs = array_cut(gordo_objs, i);
					}
				}
				if (array_length(gordo_objs) >= gordo_max) {
					window = 4;
					window_timer = 0
				}
			}
			if (window == 1 && window_timer == 4) {
				if (array_length(gordo_objs) < gordo_max) {
					var gordo_choice = select_gordo();
					switch(gordo_choice.type) {
						case 0:
							gordo_held = instance_create(round(x), round(y), "obj_article1");
							gordo_held.x = round(x + 42 * spr_dir);
							gordo_held.y = round(y - 34);
							gordo_held.state = -1;
							gordo_held.spr_dir = spr_dir;
						break;
						case 1:
						case 2:
							gordo_held = instance_create(round(x), round(y), "obj_article2");
							gordo_held.x = round(x + 42 * spr_dir);
							gordo_held.y = round(y - 34);
							gordo_held.state = PS_SPAWN;
							gordo_held.spr_dir = spr_dir;
							gordo_held.enem_id = gordo_choice.type-1;
						break;
					}
					array_push(gordo_objs, gordo_held.id);
				}
			}
			if (instance_exists(gordo_held)) {
				
				if (window_timer > window_mul) {
					with (gordo_held) {
						if (object_index == obj_article1) {
				            img_index += 0.01;
				            if (img_index >= 2)
				                img_index -= 2;
			            	current_sprite_set += 0.25;
						}
					}
				}
				if (window == 1 && window_timer > window_mul) {
					gordo_held.x = ease_linear(floor(x + 42 * spr_dir), floor(x + 56 * spr_dir), window_timer - window_mul, window_length - window_mul);
					gordo_held.y = ease_backOut(floor(y - 34), floor(y - 38), window_timer - window_mul, window_length - window_mul, 64);
				}
				if (window == 2 && window_timer == 1) {
					var fx = spawn_hit_fx(floor(x+56*spr_dir),floor(y-38),304);
					fx.pause = 8;
					sound_play(sound_get("sfx_hammerhit_m"));
		            var ang = gordo_angle_def;
		            if (up_down) ang = gordo_angle_max;
		            if (down_down) ang = gordo_angle_min;
		            
					gordo_held.hsp = lengthdir_x(gordo_throw_speed, ang) * spr_dir;
					gordo_held.vsp = lengthdir_y(gordo_throw_speed, ang);
					
					if (gordo_held.object_index == obj_article2) {
						gordo_held.hitstun = 60;
						gordo_held.hitstun_full = 60;
						gordo_held.state_timer = 2;
						gordo_held.hitstop = 0;
						gordo_held.next_state = PS_HITSTUN;
						gordo_held.kb_dir = ang;
						gordo_held.orig_knock = gordo_throw_speed;
						gordo_held.state_timer = 0;
						gordo_held.spr_dir = spr_dir;
					}
					else {
						gordo_held.state = 0;
						gordo_held.state_timer = 0;
					}
					gordo_held = noone;
				}
			}
			if (free) {
				grav = window < 3 ? 0.3 : 0.5;
				vsp = min(vsp, 3.6);
			}
    		can_fast_fall = false;
		break;
		
		case AT_USPECIAL:
		case AT_USPECIAL_2:
			var uspecial_move_speed = (attack == AT_USPECIAL_2 ? 4.6 : 3.5);
			var uspecial_hitbox = has_rune("I") ? AT_EXTRA_1 : AT_USPECIAL;
			var uspecial_hbox_num = has_rune("I") ? 1 : 5;
			if (window == 1 && !hitpause) {
				uspecial_hsp = 0;
				vsp = min(vsp, 4);
				
				if (attack == AT_USPECIAL_2) {
					grav = 0
				}
				if(window_timer == get_window_value(attack, window, AG_WINDOW_LENGTH)) {
					spawn_base_dust(round(x), round(y), "doublejump")
					if (attack == AT_USPECIAL_2) {
		            	sound_play(asset_get("sfx_spin_longer"))
					}
				}
			}
			if (window == 2 && window_timer == 1 && !hitpause) {
				soft_armor = attack == AT_USPECIAL_2 ? 0 : uspecial_soft_armor;
				super_armor = attack == AT_USPECIAL_2;
				uspecial_hsp += uspecial_move_speed * (right_down - left_down)
			}
			if (window == 3 && !hitpause) {
				can_move = false;
				
				grav = 0.5;
				if (window_timer == 12) {
					soft_armor = 0;
					super_armor = false;
				}
			}
			if (window == 4 && !hitpause) {
				soft_armor = attack == AT_USPECIAL_2 ? uspecial_soft_armor + 2 : uspecial_soft_armor;
				max_fall = uspecial_max_fall;
			
				if (attack == AT_USPECIAL_2) {
					if (get_gameplay_time() % 8 == 0) {
						spawn_hit_fx(round(x), round(y), uspecial_fx1);
					}
				}
				can_move = false;
				can_wall_jump = true;
				
				//Landing
				if (!free) {
					soft_armor = 0;
					window ++;
					window_timer = 0;
					sound_play(sound_get("sfx_dedede_uspecial_land"))
					sound_play(sound_get("sfx_dedede_uspecial_land2"))
					destroy_hitboxes();
					var dust = spawn_base_dust(round(x + 32), round(y), "dash_start")
					dust.spr_dir = -1;
					var dust = spawn_base_dust(round(x - 32), round(y), "dash_start")
					dust.spr_dir = 1;
					
					
					if (attack == AT_USPECIAL_2) {
						shake_camera(8, 8)
						sound_play(asset_get("sfx_ori_energyhit_heavy"));
						
						spawn_hit_fx(round(x), round(y), uspecial_fx2);
						var star = create_hitbox(uspecial_hitbox, uspecial_hbox_num, round(x + 16), round(y-16))
						star.spr_dir = 1;
						star.hsp = 12;
						var star = create_hitbox(uspecial_hitbox, uspecial_hbox_num, round(x - 16), round(y-16))
						star.spr_dir = -1;
						star.hsp = -12;
						var star = create_hitbox(uspecial_hitbox, uspecial_hbox_num, round(x + 16), round(y-16))
						star.spr_dir = 1;
						star.hsp = lengthdir_x(12, 165);
						star.vsp = lengthdir_y(12, 165);
						var star = create_hitbox(uspecial_hitbox, uspecial_hbox_num, round(x - 16), round(y-16))
						star.spr_dir = -1;
						star.hsp = lengthdir_x(12, 15);
						star.vsp = lengthdir_y(12, 15);
					}
					else {
						var star = create_hitbox(uspecial_hitbox, uspecial_hbox_num, round(x + 16), round(y-16))
						star.spr_dir = 1;
						star.hsp = 8;
						var star = create_hitbox(uspecial_hitbox, uspecial_hbox_num, round(x - 16), round(y-16))
						star.spr_dir = -1;
						star.hsp = -8;
					}
				}
			}
			if (free && window > 2 && !hitpause) {
				uspecial_hsp += 0.15 * (right_down - left_down)
				uspecial_hsp = clamp(uspecial_hsp, -uspecial_move_speed, uspecial_move_speed)
				
				hsp = uspecial_hsp;
				
				if (shield_pressed || up_pressed) {
		            window = 10;
		            window_timer = 0;
		            vsp = 0;
		            clear_button_buffer(PC_SHIELD_PRESSED)
		            attack_end();
					destroy_hitboxes();
					sound_play(sound_get("sfx_dedede_uspecial_cancel"));
					set_attack(AT_USPECIAL_GROUND);
					hurtboxID.sprite_index = get_attack_value(AT_USPECIAL_GROUND, AG_HURTBOX_SPRITE);
		        }
			}
    		can_fast_fall = false;
		break;
		case AT_USPECIAL_GROUND:
			can_wall_jump = true;
			super_armor = false;
			soft_armor = 0;
		break;
		case AT_DSPECIAL:
		    can_fast_fall = false;
		    if (window == 1 && window_timer == get_window_value(attack, window, AG_WINDOW_LENGTH)) {
				var fx = spawn_hit_fx(round(x),round(y),144);
				var can_throw_drum = drum_cooldown == 0;
				if (can_throw_drum) {
					var drums_num = 0;
					with (obj_article3) {
					    if (player_id == other.id) {
					        drums_num++;
					        if (drums_num >= other.drum_max) {
						    	state = 3;
						    	state_timer = 0;
					        }
					    }
					}
			
					vsp = -5;
					var drum = instance_create(round(x), round(y), "obj_article3");
					drum.state = -1;
					if (left_down) drum.img_angle = 45;
					if (right_down) drum.img_angle = -45;
					sound_play(asset_get("sfx_springgo"));
    				drum_cooldown = drum_cooldown_max;
				}
		    }
		break;
		
		case AT_TAUNT:
			if(window = 2 && (window_timer == 1 || window_timer == 21)) {
				sound_play(sound_get("sfx_dedede_nair_hit"))
			}
			if (window == 1 && window_timer == 1 && !hitpause) {
				if (shield_down) {
					set_attack(AT_TAUNT_2);
				}
			}
		break;
		
		case AT_TAUNT_2:
			if (window == 1) {
				if (masked)
					window = 4;
			}
			if(window = 2 && window_timer == 1) {
			    masked = true;
			}
			if(window = 4 && window_timer == 1) {
			    masked = false;
			}
		break;
    
}

if (get_window_value(attack, window, AG_MUNO_ATTACK_COOLDOWN) > 0)
	move_cooldown[attack] = get_window_value(attack, window, AG_MUNO_ATTACK_COOLDOWN);

#define array_cut(_array, _index)
var _array_cut = array_create(array_length_1d(_array)-1);
var j = 0;
for (var i = 0; i < array_length_1d(_array); i++) {
	if i != _index {
		_array_cut[@j] = _array[i];
		j++;
	}
}
return _array_cut;

#define select_gordo() 
var sum = 0;
for(var i=0; i<array_length(gordo_spawn_pool); i++)
{
  sum += gordo_spawn_pool[i].chance;
}

var rand = random_func(2, sum, true);
var k = 0;
for(var i=gordo_spawn_pool[0].chance; i<rand; i+=gordo_spawn_pool[k].chance)
{
	k++;
}

return gordo_spawn_pool[k];

#define select_article(_x, _y, _width, _height, _article)
var x1 = _x - _width / 2;
var y1 = _y - _height / 2;
var x2 = _x + _width / 2;
var y2 = _y + _height / 2;

var final_hitbox = noone;

var hitbox_list = collision_ellipse_list(x1,y1,x2,y2,_article,1,1);
if (hitbox_list == noone) return noone;
var team_attack = get_match_setting(SET_TEAMATTACK);
for (var i = 0; i < ds_list_size(hitbox_list); i++) {
	var hbox = hitbox_list[| i];
	
	with (hbox) {
		if (player_id.url == other.url) {
		  	final_hitbox = id;
		  	break;
		}
	}
}
ds_list_destroy(hitbox_list);
return final_hitbox;
#define select_projectile(_x, _y, _width, _height)
var x1 = _x - _width / 2;
var y1 = _y - _height / 2;
var x2 = _x + _width / 2;
var y2 = _y + _height / 2;

var hitbox_list = collision_ellipse_list(x1,y1,x2,y2,pHitBox,1,1);
if (hitbox_list == noone) return noone;
var final_hitbox = noone;

var team_attack = get_match_setting(SET_TEAMATTACK);
for (var i = 0; i < ds_list_size(hitbox_list); i++) {
	var hbox = hitbox_list[| i];
	
	with (hbox) {
		if ( (type == 2) && (player != other.player || can_hit_self)
		  && (other.can_be_hit[player] == 0) && (can_hit[other.player])
		  && (groundedness == 0 || (other.free ? 2 : 1) == groundedness)
		  && (get_player_team(other.player) != get_player_team(player) || team_attack)
		  && hit_priority != 0 && hit_priority <= 10
		  && !plasma_safe) {
		  	final_hitbox = id;
		  	break;
		  }
	}
}
ds_list_destroy(hitbox_list);
return final_hitbox;




#define collision_ellipse_list(x1,y1,x2,y2,obj,prec,notme)
var dsid,i;
dsid = ds_list_create();
with (obj) {
    if (!notme || id != other.id) {
        i = collision_ellipse(floor(x1),floor(y1),floor(x2),floor(y2),id,prec,false);
        if (i != noone) ds_list_add(dsid,i);
    }
}
if (ds_list_size(dsid) == 0) {
    ds_list_destroy(dsid);
    dsid = noone;
}
return dsid;


#define spawn_base_dust
/// spawn_base_dust(x, y, name, dir = 0)
///spawn_base_dust(x, y, name, ?dir)
//This function spawns base cast dusts. Names can be found below.
var dlen; //dust_length value
var dfx; //dust_fx value
var dfg; //fg_sprite value
var dfa = 0; //draw_angle value
var dust_color = 0;
var x = argument[0], y = argument[1], name = argument[2];
var dir = argument_count > 3 ? argument[3] : 0;

switch (name) {
    default: 
    case "dash_start":dlen = 21; dfx = 3; dfg = 2626; break;
    case "dash": dlen = 16; dfx = 4; dfg = 2656; break;
    case "jump": dlen = 12; dfx = 11; dfg = 2646; break;
    case "doublejump": 
    case "djump": dlen = 21; dfx = 2; dfg = 2624; break;
    case "walk": dlen = 12; dfx = 5; dfg = 2628; break;
    case "land": dlen = 24; dfx = 0; dfg = 2620; break;
    case "walljump": dlen = 24; dfx = 0; dfg = 2629; dfa = dir != 0 ? -90*dir : -90*spr_dir; break;
    case "n_wavedash": dlen = 24; dfx = 0; dfg = 2620; dust_color = 1; break;
    case "wavedash": dlen = 16; dfx = 4; dfg = 2656; dust_color = 1; break;
}
var newdust = spawn_dust_fx(x,y,asset_get("empty_sprite"),dlen);
newdust.dust_fx = dfx; //set the fx id
if dfg != -1 newdust.fg_sprite = dfg; //set the foreground sprite
newdust.dust_color = dust_color; //set the dust color
if dir != 0 newdust.spr_dir = dir; //set the spr_dir
newdust.draw_angle = dfa;
return newdust;