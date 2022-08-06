if (instance_exists(sucked_player_obj)) {
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
}

with (obj_article3) {
    if (player_id == other.id) {
        state = 3;
        state_timer = 0;
    }
}
drum_cooldown = 0;