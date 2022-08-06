var alt_cur = get_player_color(player) //sprite_get_xoffset(sprite_get("alts"));
switch (alt_cur) {
    case 0:
        set_character_color_slot(3, 253, 187, 47 );
    break;
    case 8:
        for(i = 0; i <= 7; i++){
            set_character_color_shading(i, 0);
        }
		outline_color = [41, 57, 65];
    break;
    case 28:
        outline_color = [23, 64, 170];
	break;
    case 30:
        for(i = 0; i <= 7; i++){
            set_character_color_shading(i, 0);
        }
    break;
    case 31:
        for(i = 0; i <= 7; i++){
            set_character_color_shading(i, 0);
        }
    break;
}
   