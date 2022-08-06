set_attack_value(AT_USPECIAL_GROUND, AG_MUNO_ATTACK_NAME, "USpecial Cancel");
set_attack_value(AT_USPECIAL_GROUND, AG_CATEGORY, 2);
set_attack_value(AT_USPECIAL_GROUND, AG_SPRITE, sprite_get("uspecial_air"));
set_attack_value(AT_USPECIAL_GROUND, AG_HURTBOX_SPRITE, sprite_get("uspecial_air_hurt"));

set_attack_value(AT_USPECIAL_GROUND, AG_NUM_WINDOWS, 1);
set_window_value(AT_USPECIAL_GROUND, 1, AG_WINDOW_TYPE, 7);
set_window_value(AT_USPECIAL_GROUND, 1, AG_WINDOW_LENGTH, 16);
set_window_value(AT_USPECIAL_GROUND, 1, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_USPECIAL_GROUND, 1, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_USPECIAL_GROUND, 1, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.2);
set_window_value(AT_USPECIAL_GROUND, 1, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.2);
set_window_value(AT_USPECIAL_GROUND, 1, AG_WINDOW_VSPEED_TYPE, 2);