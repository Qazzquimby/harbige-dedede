for (var i = 0; i < array_length(checked_sprite_names); i++){
	if sprite_index == sprite_get(checked_sprite_names[i]){
		process_form_sprite(checked_sprite_names[i]);
		exit;
	}
}

#define process_form_sprite(sprite)

var num_frames = image_number / num_sprite_sets;
var offset = num_frames * current_sprite_set;

var img_looped = image_index % num_frames + offset;
var img_set_duration = image_index / num_sprite_sets + offset;
var img_set_number = image_index + offset;
var img_one_frame = current_sprite_set;

switch(sprite){
	
	// looping anims
	case "idle":
	case "walk":
	case "dash":
	case "spinhurt":
		image_index = img_looped;
		break;
	
	// anims w/ a set duration
	case "walkturn":
	case "dashstart":
	case "dashstop":
	case "dashturn":
	case "waveland":
	case "jumpstart":
	case "jump":
	case "doublejump":
	case "land":
	case "landinglag":
		image_index = img_set_duration;
		break;
	
	// anims w/ set numbers of frames per window
	case "crouch":
	case "parry":
	case "roll_forward":
	case "roll_backward":
	case "tech":
	case "airdodge":
	case "jab":
	case "ftilt":
	case "utilt":
	case "dtilt":
	case "dattack":
	case "nair":
	case "fair":
	case "bair":
	case "uair":
	case "dair":
	case "fstrong":
	case "ustrong":
	case "dstrong":
	case "nspecial":
	case "nspecial2":
	case "nspecial3":
	case "fspecial":
	case "fspecial_air":
	case "uspecial":
	case "uspecial2":
	case "uspecial_air":
	case "dspecial":
	case "dspecial2":
	case "taunt":
		image_index = img_set_number;
		break;
	
	// 1 frame animations
	case "hurt":
	case "hurtground":
	case "bighurt":
	case "uphurt":
	case "downhurt":
	case "bouncehurt":
	case "pratfall":
		image_index = img_one_frame;
		break;
	
	// walljump
	case "walljump":
		image_index = img_set_duration;
		break;
	
	
}