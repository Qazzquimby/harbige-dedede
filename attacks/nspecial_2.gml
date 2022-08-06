set_attack_value(AT_NSPECIAL_2, AG_CATEGORY, 2);
set_attack_value(AT_NSPECIAL_2, AG_SPRITE, sprite_get("nspecial2"));
set_attack_value(AT_NSPECIAL_2, AG_HURTBOX_SPRITE, sprite_get("nspecial2_hurt"));
set_attack_value(AT_NSPECIAL_2, AG_MUNO_ATTACK_NAME, "NSpecial Grab");
set_attack_value(AT_NSPECIAL_2, AG_MUNO_ATTACK_MISC_ADD, "Frame data starts after forcefully dropping. Time based on opponent damage.");

set_attack_value(AT_NSPECIAL_2, AG_NUM_WINDOWS, 6);
//Eat start
set_window_value(AT_NSPECIAL_2, 1, AG_WINDOW_LENGTH, 14);
set_window_value(AT_NSPECIAL_2, 1, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_NSPECIAL_2, 1, AG_WINDOW_INVINCIBILITY, 1);
set_window_value(AT_NSPECIAL_2, 1, AG_MUNO_WINDOW_EXCLUDE, 1);

//Idle
set_window_value(AT_NSPECIAL_2, 2, AG_WINDOW_TYPE, 9);
set_window_value(AT_NSPECIAL_2, 2, AG_WINDOW_LENGTH, 180);
set_window_value(AT_NSPECIAL_2, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_NSPECIAL_2, 2, AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(AT_NSPECIAL_2, 2, AG_MUNO_WINDOW_EXCLUDE, 1);

//Jumping
set_window_value(AT_NSPECIAL_2, 3, AG_WINDOW_TYPE, 9);
set_window_value(AT_NSPECIAL_2, 3, AG_WINDOW_LENGTH, 180);
set_window_value(AT_NSPECIAL_2, 3, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_NSPECIAL_2, 3, AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(AT_NSPECIAL_2, 3, AG_MUNO_WINDOW_EXCLUDE, 1);

//Landing
set_window_value(AT_NSPECIAL_2, 4, AG_WINDOW_LENGTH, 12);
set_window_value(AT_NSPECIAL_2, 4, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_NSPECIAL_2, 4, AG_WINDOW_ANIM_FRAME_START, 0);
set_window_value(AT_NSPECIAL_2, 4, AG_WINDOW_GOTO, 2);
set_window_value(AT_NSPECIAL_2, 4, AG_MUNO_WINDOW_EXCLUDE, 1);

//Turning
set_window_value(AT_NSPECIAL_2, 5, AG_WINDOW_LENGTH, 6);
set_window_value(AT_NSPECIAL_2, 5, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_NSPECIAL_2, 5, AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(AT_NSPECIAL_2, 5, AG_WINDOW_GOTO, 2);
set_window_value(AT_NSPECIAL_2, 5, AG_MUNO_WINDOW_EXCLUDE, 1);

//Forcefully spitting out
set_window_value(AT_NSPECIAL_2, 6, AG_WINDOW_LENGTH, 30);
set_window_value(AT_NSPECIAL_2, 6, AG_WINDOW_ANIM_FRAMES, 6);
set_window_value(AT_NSPECIAL_2, 6, AG_WINDOW_ANIM_FRAME_START, 6);
set_window_value(AT_NSPECIAL_2, 6, AG_WINDOW_HSPEED, -8);
set_window_value(AT_NSPECIAL_2, 6, AG_WINDOW_HSPEED_TYPE, 2);
set_window_value(AT_NSPECIAL_2, 6, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_NSPECIAL_2, 6, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.6);
set_window_value(AT_NSPECIAL_2, 6, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.6);