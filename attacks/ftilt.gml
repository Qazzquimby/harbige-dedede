set_attack_value(AT_FTILT, AG_SPRITE, sprite_get("ftilt"));
set_attack_value(AT_FTILT, AG_HURTBOX_SPRITE, sprite_get("ftilt_hurt"));
set_attack_value(AT_FTILT, AG_MUNO_ATTACK_MISC, "Can be held.");

set_attack_value(AT_FTILT, AG_NUM_WINDOWS, 5);
set_window_value(AT_FTILT, 1, AG_WINDOW_LENGTH, 7);
set_window_value(AT_FTILT, 1, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_FTILT, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FTILT, 1, AG_WINDOW_SFX, asset_get("sfx_spin"));
set_window_value(AT_FTILT, 1, AG_WINDOW_SFX_FRAME, 4);

set_window_value(AT_FTILT, 2, AG_WINDOW_LENGTH, 2);
set_window_value(AT_FTILT, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_FTILT, 2, AG_WINDOW_ANIM_FRAME_START, 3);

set_window_value(AT_FTILT, 3, AG_WINDOW_TYPE, 9);
set_window_value(AT_FTILT, 3, AG_WINDOW_LENGTH, 16);
set_window_value(AT_FTILT, 3, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_FTILT, 3, AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(AT_FTILT, 3, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FTILT, 3, AG_WINDOW_SFX, sound_get("sfx_hammerswing_s"));
set_window_value(AT_FTILT, 3, AG_WINDOW_SFX_FRAME, 4);

set_window_value(AT_FTILT, 4, AG_WINDOW_LENGTH, 6);
set_window_value(AT_FTILT, 4, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_FTILT, 4, AG_WINDOW_ANIM_FRAME_START, 8);

set_window_value(AT_FTILT, 5, AG_WINDOW_LENGTH, 18);
set_window_value(AT_FTILT, 5, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_FTILT, 5, AG_WINDOW_ANIM_FRAME_START, 9);
set_window_value(AT_FTILT, 5, AG_WINDOW_HAS_WHIFFLAG, 1);


set_num_hitboxes(AT_FTILT, 3);

//Multihit (Clean)
set_hitbox_value(AT_FTILT, 1, HG_MUNO_HITBOX_NAME,  "Multihit");
set_hitbox_value(AT_FTILT, 1, HG_MUNO_HITBOX_MISC_ADD,  "After a loop it does not destroy projectiles.");
set_hitbox_value(AT_FTILT, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FTILT, 1, HG_LIFETIME, 2);
set_hitbox_value(AT_FTILT, 1, HG_HITBOX_X, 88);
set_hitbox_value(AT_FTILT, 1, HG_HITBOX_Y, -22);
set_hitbox_value(AT_FTILT, 1, HG_WIDTH, 60);
set_hitbox_value(AT_FTILT, 1, HG_HEIGHT, 44);
set_hitbox_value(AT_FTILT, 1, HG_SHAPE, 2);
set_hitbox_value(AT_FTILT, 1, HG_PRIORITY, 1);
set_hitbox_value(AT_FTILT, 1, HG_DAMAGE, 1);
set_hitbox_value(AT_FTILT, 1, HG_ANGLE, 50);
set_hitbox_value(AT_FTILT, 1, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_FTILT, 1, HG_BASE_HITPAUSE, 2);
set_hitbox_value(AT_FTILT, 1, HG_FORCE_FLINCH, 1);
set_hitbox_value(AT_FTILT, 1, HG_SDI_MULTIPLIER, 1.1);
set_hitbox_value(AT_FTILT, 1, HG_ANGLE_FLIPPER, 9);
set_hitbox_value(AT_FTILT, 1, HG_HIT_SFX, sound_get("sfx_hammerhit_s"));
set_hitbox_value(AT_FTILT, 1, HG_HITBOX_GROUP, -1);

//Multihit (Late)
set_hitbox_value(AT_FTILT, 2, HG_MUNO_HITBOX_EXCLUDE, 1);
set_hitbox_value(AT_FTILT, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FTILT, 2, HG_LIFETIME, 2);
set_hitbox_value(AT_FTILT, 2, HG_HITBOX_X, 88);
set_hitbox_value(AT_FTILT, 2, HG_HITBOX_Y, -22);
set_hitbox_value(AT_FTILT, 2, HG_WIDTH, 88);
set_hitbox_value(AT_FTILT, 2, HG_HEIGHT, 44);
set_hitbox_value(AT_FTILT, 2, HG_SHAPE, 2);
set_hitbox_value(AT_FTILT, 2, HG_PRIORITY, 1);
set_hitbox_value(AT_FTILT, 2, HG_DAMAGE, 1);
set_hitbox_value(AT_FTILT, 2, HG_ANGLE, 50);
set_hitbox_value(AT_FTILT, 2, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_FTILT, 2, HG_BASE_HITPAUSE, 3);
set_hitbox_value(AT_FTILT, 2, HG_FORCE_FLINCH, 1);
set_hitbox_value(AT_FTILT, 2, HG_SDI_MULTIPLIER, 1.5);
set_hitbox_value(AT_FTILT, 2, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_FTILT, 2, HG_HIT_SFX, sound_get("sfx_hammerhit_s"));
set_hitbox_value(AT_FTILT, 2, HG_HITBOX_GROUP, -1);

//Final Hit
set_hitbox_value(AT_FTILT, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FTILT, 3, HG_WINDOW, 4);
set_hitbox_value(AT_FTILT, 3, HG_LIFETIME, 3);
set_hitbox_value(AT_FTILT, 3, HG_HITBOX_X, 83);
set_hitbox_value(AT_FTILT, 3, HG_HITBOX_Y, -24);
set_hitbox_value(AT_FTILT, 3, HG_WIDTH, 99);
set_hitbox_value(AT_FTILT, 3, HG_HEIGHT, 48);
set_hitbox_value(AT_FTILT, 3, HG_SHAPE, 2);
set_hitbox_value(AT_FTILT, 3, HG_PRIORITY, 1);
set_hitbox_value(AT_FTILT, 3, HG_DAMAGE, 4);
set_hitbox_value(AT_FTILT, 3, HG_ANGLE, 50);
set_hitbox_value(AT_FTILT, 3, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_FTILT, 3, HG_KNOCKBACK_SCALING, 0.5);
set_hitbox_value(AT_FTILT, 3, HG_BASE_HITPAUSE, 8);
set_hitbox_value(AT_FTILT, 3, HG_HITPAUSE_SCALING, 0.5);
set_hitbox_value(AT_FTILT, 3, HG_HIT_SFX, sound_get("sfx_hammerhit_m"));
set_hitbox_value(AT_FTILT, 3, HG_HITBOX_GROUP, -1);