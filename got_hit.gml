if (instance_exists(gordo_held)) {
    instance_destroy(gordo_held);   
}

if (instance_exists(sucked_player_obj)) { 
    if (sucked_player_obj.object_index == obj_article1) {
    	with (sucked_player_obj) {
    		hit_already = true;
    		owned_player = other.player;
    		state = 0;
    		state_timer = 0;
    		kb_dir = 55;
    		orig_knock = -4;
    		
    		if !free && kb_dir > 180 && kb_dir < 360 vsp = orig_knock*dsin(kb_dir);
    		else if !free vsp = -abs(orig_knock*dsin(kb_dir));
    		else vsp = -orig_knock*dsin(kb_dir);
    		hsp = orig_knock*dcos(kb_dir)*other.spr_dir;
    		if hsp != 0 spr_dir = -sign(hsp);
    	}
    }
	sucked_player_obj.visible = true;
	sucked_player_obj = noone; 
}