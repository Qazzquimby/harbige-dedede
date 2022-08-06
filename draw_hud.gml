//Mask HUD stuff (it kind of works, just there's no screen shake.)
// if (masked) {
//     shader_start();
//     var inner_hud_x = temp_x + 28;
//     var inner_hud_y = temp_y + 8;
    
//     var hurt_frame = get_player_stocks(player) == 0 || state == PS_DEAD || (state == PS_RESPAWN && state_timer < 30) || (tempPow >= 10 && state_cat == SC_HITSTUN && state != PS_HITSTUN_LAND) || state == PS_WRAPPED || state == PS_FROZEN;
    
//     draw_sprite(spr_hud_mask, hurt_frame ? 1 : 0, temp_x + 28, temp_y + 8);
//     shader_end();
// }

//Drum
draw_sprite_ext(sprite_get("drum_hud"), 0, temp_x + 184, temp_y - 20, 1, 1, 0, drum_cooldown > 0 ? c_gray : c_white, 1);