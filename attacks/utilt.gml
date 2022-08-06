set_attack_value(AT_UTILT, AG_SPRITE, sprite_get("utilt"));
set_attack_value(AT_UTILT, AG_HURTBOX_SPRITE, sprite_get("utilt_hurt"));

set_attack_value(AT_UTILT, AG_NUM_WINDOWS, 3);
set_window_value(AT_UTILT, 1, AG_WINDOW_LENGTH, 6);
set_window_value(AT_UTILT, 1, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_UTILT, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_UTILT, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));
set_window_value(AT_UTILT, 1, AG_WINDOW_SFX_FRAME, 5);

set_window_value(AT_UTILT, 2, AG_WINDOW_LENGTH, 3);
set_window_value(AT_UTILT, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_UTILT, 2, AG_WINDOW_ANIM_FRAME_START, 2);

set_window_value(AT_UTILT, 3, AG_WINDOW_LENGTH, 15);
set_window_value(AT_UTILT, 3, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_UTILT, 3, AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(AT_UTILT, 3, AG_WINDOW_HAS_WHIFFLAG, 1);


set_num_hitboxes(AT_UTILT, 2);
set_hitbox_value(AT_UTILT, 1, HG_MUNO_HITBOX_NAME, "Hitbox 1");
set_hitbox_value(AT_UTILT, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_UTILT, 1, HG_WINDOW, 2);
set_hitbox_value(AT_UTILT, 1, HG_LIFETIME, 3);
set_hitbox_value(AT_UTILT, 1, HG_HITBOX_X, 10);
set_hitbox_value(AT_UTILT, 1, HG_HITBOX_Y, -68);
set_hitbox_value(AT_UTILT, 1, HG_WIDTH, 68);
set_hitbox_value(AT_UTILT, 1, HG_HEIGHT, 72);
set_hitbox_value(AT_UTILT, 1, HG_PRIORITY, 1);
set_hitbox_value(AT_UTILT, 1, HG_DAMAGE, 8);
set_hitbox_value(AT_UTILT, 1, HG_ANGLE, 90);
set_hitbox_value(AT_UTILT, 1, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_UTILT, 1, HG_KNOCKBACK_SCALING, 0.5);
set_hitbox_value(AT_UTILT, 1, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_UTILT, 1, HG_HITPAUSE_SCALING, 0.6);
set_hitbox_value(AT_UTILT, 1, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_UTILT, 1, HG_HIT_SFX, asset_get("sfx_blow_medium3"));
set_hitbox_value(AT_UTILT, 1, HG_ANGLE_FLIPPER, 7);

set_hitbox_value(AT_UTILT, 2, HG_MUNO_HITBOX_NAME, "Hitbox 2");
set_hitbox_value(AT_UTILT, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_UTILT, 2, HG_WINDOW, 2);
set_hitbox_value(AT_UTILT, 2, HG_LIFETIME, 3);
set_hitbox_value(AT_UTILT, 2, HG_HITBOX_X, 8);
set_hitbox_value(AT_UTILT, 2, HG_HITBOX_Y, -54);
set_hitbox_value(AT_UTILT, 2, HG_WIDTH, 112);
set_hitbox_value(AT_UTILT, 2, HG_HEIGHT, 60);
set_hitbox_value(AT_UTILT, 2, HG_PRIORITY, 1);
set_hitbox_value(AT_UTILT, 2, HG_DAMAGE, 8);
set_hitbox_value(AT_UTILT, 2, HG_ANGLE, 80);
set_hitbox_value(AT_UTILT, 2, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_UTILT, 2, HG_KNOCKBACK_SCALING, 0.5);
set_hitbox_value(AT_UTILT, 2, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_UTILT, 2, HG_HITPAUSE_SCALING, 0.6);
set_hitbox_value(AT_UTILT, 2, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_UTILT, 2, HG_HIT_SFX, asset_get("sfx_blow_medium3"));
set_hitbox_value(AT_UTILT, 2, HG_ANGLE_FLIPPER, 7);

// set_hitbox_value(AT_UTILT, 3, HG_HITBOX_TYPE, 1);
// set_hitbox_value(AT_UTILT, 3, HG_WINDOW, 2);
// set_hitbox_value(AT_UTILT, 3, HG_LIFETIME, 3);
// set_hitbox_value(AT_UTILT, 3, HG_HITBOX_X, 48);
// set_hitbox_value(AT_UTILT, 3, HG_HITBOX_Y, -52);
// set_hitbox_value(AT_UTILT, 3, HG_WIDTH, 34);
// set_hitbox_value(AT_UTILT, 3, HG_HEIGHT, 41);
// set_hitbox_value(AT_UTILT, 3, HG_PRIORITY, 1);
// set_hitbox_value(AT_UTILT, 3, HG_DAMAGE, 6);
// set_hitbox_value(AT_UTILT, 3, HG_ANGLE, 115);
// set_hitbox_value(AT_UTILT, 3, HG_BASE_KNOCKBACK, 5);
// set_hitbox_value(AT_UTILT, 3, HG_KNOCKBACK_SCALING, 0.8);
// set_hitbox_value(AT_UTILT, 3, HG_BASE_HITPAUSE, 6);
// set_hitbox_value(AT_UTILT, 3, HG_HITPAUSE_SCALING, 0.7);
// set_hitbox_value(AT_UTILT, 3, HG_VISUAL_EFFECT, 304);
// set_hitbox_value(AT_UTILT, 3, HG_HIT_SFX, asset_get("sfx_blow_medium2"));
// set_hitbox_value(AT_UTILT, 1, HG_ANGLE_FLIPPER, 0);



