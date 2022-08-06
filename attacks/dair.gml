set_attack_value(AT_DAIR, AG_CATEGORY, 1);
set_attack_value(AT_DAIR, AG_SPRITE, sprite_get("dair"));
set_attack_value(AT_DAIR, AG_HURTBOX_SPRITE, sprite_get("dair_hurt"));
set_attack_value(AT_DAIR, AG_HAS_LANDING_LAG, 1);
set_attack_value(AT_DAIR, AG_LANDING_LAG, 9);

set_attack_value(AT_DAIR, AG_NUM_WINDOWS, 3);
set_window_value(AT_DAIR, 1, AG_WINDOW_LENGTH, 14);
set_window_value(AT_DAIR, 1, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_DAIR, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DAIR, 1, AG_WINDOW_SFX, sound_get("sfx_hammerswing_l"));
set_window_value(AT_DAIR, 1, AG_WINDOW_SFX_FRAME, 10);

set_window_value(AT_DAIR, 2, AG_WINDOW_LENGTH, 3);
set_window_value(AT_DAIR, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DAIR, 2, AG_WINDOW_ANIM_FRAME_START, 4);

set_window_value(AT_DAIR, 3, AG_WINDOW_LENGTH, 20);
set_window_value(AT_DAIR, 3, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_DAIR, 3, AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(AT_DAIR, 3, AG_WINDOW_HAS_WHIFFLAG, 1);


set_num_hitboxes(AT_DAIR, 2);
set_hitbox_value(AT_DAIR, 1, HG_MUNO_HITBOX_NAME, "Sour");
set_hitbox_value(AT_DAIR, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DAIR, 1, HG_WINDOW, 2);
set_hitbox_value(AT_DAIR, 1, HG_LIFETIME, 3);
set_hitbox_value(AT_DAIR, 1, HG_HITBOX_X, -5);
set_hitbox_value(AT_DAIR, 1, HG_HITBOX_Y, 20);
set_hitbox_value(AT_DAIR, 1, HG_WIDTH, 64);
set_hitbox_value(AT_DAIR, 1, HG_HEIGHT, 64);
set_hitbox_value(AT_DAIR, 1, HG_PRIORITY, 3);
set_hitbox_value(AT_DAIR, 1, HG_DAMAGE, 8);
set_hitbox_value(AT_DAIR, 1, HG_ANGLE, 50);
set_hitbox_value(AT_DAIR, 1, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_DAIR, 1, HG_KNOCKBACK_SCALING, 0.6);
set_hitbox_value(AT_DAIR, 1, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_DAIR, 1, HG_HITPAUSE_SCALING, 0.7);
set_hitbox_value(AT_DAIR, 1, HG_VISUAL_EFFECT, 304);
set_hitbox_value(AT_DAIR, 1, HG_HIT_SFX, sound_get("sfx_hammerhit_m"));
set_hitbox_value(AT_DAIR, 1, HG_ANGLE_FLIPPER, 6);

set_hitbox_value(AT_DAIR, 2, HG_MUNO_HITBOX_NAME, "Spike");
set_hitbox_value(AT_DAIR, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DAIR, 2, HG_WINDOW, 2);
set_hitbox_value(AT_DAIR, 2, HG_LIFETIME, 3);
set_hitbox_value(AT_DAIR, 2, HG_HITBOX_X, -5);
set_hitbox_value(AT_DAIR, 2, HG_HITBOX_Y, 27);
set_hitbox_value(AT_DAIR, 2, HG_WIDTH, 35);
set_hitbox_value(AT_DAIR, 2, HG_HEIGHT, 35);
set_hitbox_value(AT_DAIR, 2, HG_PRIORITY, 4);
set_hitbox_value(AT_DAIR, 2, HG_DAMAGE, 12);
set_hitbox_value(AT_DAIR, 2, HG_ANGLE, 270);
set_hitbox_value(AT_DAIR, 2, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_DAIR, 2, HG_KNOCKBACK_SCALING, 0.8);
set_hitbox_value(AT_DAIR, 2, HG_BASE_HITPAUSE, 12);
set_hitbox_value(AT_DAIR, 2, HG_HITPAUSE_SCALING, 1.0);
set_hitbox_value(AT_DAIR, 2, HG_VISUAL_EFFECT, 305);
set_hitbox_value(AT_DAIR, 2, HG_HIT_SFX, sound_get("sfx_hammerhit_l"));

/* set_hitbox_value(AT_DAIR, 3, HG_MUNO_HITBOX_NAME, "Late");
set_hitbox_value(AT_DAIR, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DAIR, 3, HG_WINDOW, 3);
set_hitbox_value(AT_DAIR, 3, HG_LIFETIME, 3);
set_hitbox_value(AT_DAIR, 3, HG_HITBOX_X, -5);
set_hitbox_value(AT_DAIR, 3, HG_HITBOX_Y, 26);
set_hitbox_value(AT_DAIR, 3, HG_WIDTH, 72);
set_hitbox_value(AT_DAIR, 3, HG_HEIGHT, 72);
set_hitbox_value(AT_DAIR, 3, HG_PRIORITY, 4);
set_hitbox_value(AT_DAIR, 3, HG_DAMAGE, 6);
set_hitbox_value(AT_DAIR, 3, HG_ANGLE, 65);
set_hitbox_value(AT_DAIR, 3, HG_BASE_KNOCKBACK, 5);
set_hitbox_value(AT_DAIR, 3, HG_KNOCKBACK_SCALING, 0.6);
set_hitbox_value(AT_DAIR, 3, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_DAIR, 3, HG_HITPAUSE_SCALING, 0.7);
set_hitbox_value(AT_DAIR, 3, HG_VISUAL_EFFECT, 305);
set_hitbox_value(AT_DAIR, 3, HG_HIT_SFX,  sound_get("sfx_hammerhit_s"));

