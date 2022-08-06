if (masked) {
    if my_hitboxID.sound_effect == sound_get("sfx_hammerhit_s") {
        sound_play(asset_get("sfx_absa_singlezap1"));
    }
    if my_hitboxID.sound_effect == sound_get("sfx_hammerhit_m") {
        sound_play(asset_get("sfx_absa_harderhit"));
    }
    if my_hitboxID.sound_effect == sound_get("sfx_hammerhit_l") {
        sound_play(asset_get("sfx_absa_kickhit"));
    }
}
else {
    if my_hitboxID.sound_effect == sound_get("sfx_hammerhit_m") {
        sound_play(sound_get("sfx_kirby_hurt"));
    }
    if my_hitboxID.sound_effect == sound_get("sfx_hammerhit_l") {
        sound_play(sound_get("sfx_kirby_hurt"));
    }
}

//NAIR layer
if (my_hitboxID.attack == AT_NAIR && my_hitboxID.hbox_num == 1) {
	sound_play(sound_get("sfx_dedede_nair_hit"));
}

if (my_hitboxID.attack == AT_USTRONG)
{
	if (my_hitboxID.hbox_num = 1)
	{
	spawn_hit_fx(hit_player_obj.x, hit_player_obj.y, 304 );
	sound_play(asset_get("sfx_blow_heavy2"));
	sound_play(asset_get("sfx_burnconsume"));
	}
	if (my_hitboxID.hbox_num = 2)
	{
	spawn_hit_fx(hit_player_obj.x, hit_player_obj.y, 304 );
	sound_play(asset_get("sfx_blow_heavy1"));
	sound_play(asset_get("sfx_burnconsume"));
	}
	if (my_hitboxID.hbox_num = 3)
	{
	sound_play(asset_get("sfx_blow_heavy1"));
	
	}
}	


if (my_hitboxID.attack == AT_DAIR)
{
	if (my_hitboxID.hbox_num = 2)
	{
		sound_play(asset_get("sfx_blow_heavy1"));
	}
}
    
if (my_hitboxID.attack == AT_FSTRONG && my_hitboxID.hbox_num == 2) {
	
	//Before grabbing the opponent, first make sure that:
	//-The player is in an attack animation
	//-The opponent is in hitstun
	//-The player did not get parried, and
	//-The opponent is not a Forsburn clone.

	if ((state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR)
	  && (hit_player_obj.state == PS_HITSTUN || hit_player_obj.state == PS_HITSTUN_LAND)
    	  && was_parried == false
	  && hit_player_obj.clone == false && !hit_player_obj.super_armor && hit_player_obj.soft_armor = 0 && !hit_player_obj.invincible) {
		
		//if this attack hasn't grabbed a player yet, grab the player we just hit.
		if (!instance_exists(grabbed_player_obj)) { grabbed_player_obj = hit_player_obj; }
		
		//if this attack has already grabbed a different opponent, prioritize grabbing the closest opponent.
		else {
			var old_grab_distance = point_distance(x, y, grabbed_player_obj.x, grabbed_player_obj.y);
			var new_grab_distance = point_distance(x, y,     hit_player_obj.x,     hit_player_obj.y);
			if (new_grab_distance < old_grab_distance) { grabbed_player_obj = hit_player_obj; }
		}
	}
}

//Suck
if (my_hitboxID.attack == AT_NSPECIAL && (my_hitboxID.hbox_num == 1 || my_hitboxID.hbox_num == 2)) {
	
	//Before grabbing the opponent, first make sure that:
	//-The player is in an attack animation
	//-The opponent is in hitstun
	//-The player did not get parried, and
	//-The opponent is not a Forsburn clone.
	if ((state == PS_ATTACK_GROUND || state == PS_ATTACK_AIR)
	  && (hit_player_obj.state == PS_HITSTUN || hit_player_obj.state == PS_HITSTUN_LAND)
    	  && was_parried == false
	  && hit_player_obj.clone == false && !hit_player_obj.super_armor && hit_player_obj.soft_armor = 0 && !hit_player_obj.invincible) {
		
		//transition to the 'throw' part of the attack.
		destroy_hitboxes();
		
		window = 5;
		window_timer = 0;
		
		//if this attack hasn't grabbed a player yet, grab the player we just hit.
		if (!instance_exists(grabbed_player_obj)) { grabbed_player_obj = hit_player_obj; }
		
		//if this attack has already grabbed a different opponent, prioritize grabbing the closest opponent.
		else {
			var old_grab_distance = point_distance(x, y, grabbed_player_obj.x, grabbed_player_obj.y);
			var new_grab_distance = point_distance(x, y,     hit_player_obj.x,     hit_player_obj.y);
			if (new_grab_distance < old_grab_distance) { grabbed_player_obj = hit_player_obj; }
		}
	}
}

//Hitting gordos
if (my_hitboxID.attack == AT_FSPECIAL && my_hitboxID.hbox_num > 1) {
	if (("owner" in my_hitboxID) && id == my_hitboxID.owner.player_id) {
	    if (my_hitboxID.owner.state == 0) {
    		if (hit_player_obj.player != my_hitboxID.owner.owned_player) {
    			with (my_hitboxID.owner) {
    				hsp = hsp * (other.hit_player_obj.x < x ? -1 : 1)
    		        if (vsp > 0)
    		            vsp = -bounce_speed;
    		        hitstop = other.hit_player_obj.hitstop;
    			}
    	    }
	    }
	}
}