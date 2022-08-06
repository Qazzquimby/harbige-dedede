
//Parrying gordos
if (my_hitboxID.attack == AT_FSPECIAL) {
	if (("owner" in my_hitboxID) && id == my_hitboxID.owner.player_id) {
		if (hit_player_obj.player != my_hitboxID.owner.owned_player) {
			with (my_hitboxID.owner) {
                owned_player = other.hit_player_obj.player;
                hsp = -hsp;
                if (vsp > 0)
                    vsp = -bounce_speed;
                hit_already = true;
                state_timer = 0;
    		}
        }
    }
}

//The drums go away on parry.

with (obj_article3) {
    if (player_id == other.id) {
        state = 3;
        state_timer = 0;
    }
}
