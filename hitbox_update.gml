

//Attacking hitboxes take priority over Gordos
if (attack == AT_FSPECIAL && hbox_num > 2)
{
    var hbox = instance_place(floor(x), floor(y), pHitBox);
    if (instance_exists(hbox)) {
        var valid_player = 0;
        var hurtb = instance_place(floor(hbox.x), floor(hbox.y), pHurtBox);
        
        if (instance_exists(hurtb) && hurtb > 0 && hbox.type != 2 && hurtb.player == hbox.player) {
            valid_player = hurtb.player
        }
        
        if (valid_player != 0)
            can_hit[valid_player] = false;
    }
}

//Star spitting
if (attack == AT_FTHROW && hbox_num == 1)
{
    var blastzone_padding_x = 32
    if ("sucked_player_obj" in self) {
		sucked_player_obj.hitstop = 2;
		sucked_player_obj.hitpause = true;
		sucked_player_obj.visible = false;
		sucked_player_obj.x = x;
		sucked_player_obj.y = y + 12;
		sucked_player_obj.invincible = true;
		sucked_player_obj.invince_time = 2;
		can_hit[sucked_player_obj.player] = false;
		
		
		if (collision_rectangle(x - 16, y - 16, x + 16, y + 16, asset_get("par_block"), 1, 1)) {
		    sucked_player_obj.invincible = false;
		    destroyed = true;
		}
		
		if (x < blastzone_padding_x || x > room_width - blastzone_padding_x) {
		    sucked_player_obj.invincible = false;
		    destroyed = true;
		}
		
		if (destroyed || hitbox_timer >= length) {
		    sucked_player_obj.visible = true;
		    with (player_id) {
		        var hbox = create_hitbox(AT_FTHROW, 2, floor(other.sucked_player_obj.x), floor(other.sucked_player_obj.y - 32));
		    }
		    sucked_player_obj.invincible = false;
		}
    }
    else {
		if (collision_rectangle(x - 16, y - 16, x + 16, y + 16, asset_get("par_block"), 1, 1)) {
		    //sucked_player_obj.invincible = false;
		    destroyed = true;
		}
		
		if (x < blastzone_padding_x || x > room_width - blastzone_padding_x) {
		    //sucked_player_obj.invincible = false;
		    destroyed = true;
		}
    }
}

if (attack == AT_USPECIAL && hbox_num == 5)
{
	vsp *= air_friction
}
if (attack == AT_EXTRA_1 && hbox_num == 1)
{
	vsp *= air_friction
}