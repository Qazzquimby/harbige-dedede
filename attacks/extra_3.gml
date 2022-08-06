follower_attack_spr[0, AT_EXTRA_3] = sprite_get("dee_attack");
follower_attack_hurtbox_spr[0, AT_EXTRA_3] = sprite_get("dee_attack_hurt");
follower_attack_category[0, AT_EXTRA_3] = 2;

set_attack_value(AT_EXTRA_3, AG_MUNO_ATTACK_EXCLUDE, 1);

follower_window_min[0, AT_EXTRA_3] = 1;
follower_window_max[0, AT_EXTRA_3] = 5;

set_window_value(AT_EXTRA_3, 1, AG_WINDOW_LENGTH, 8);
set_window_value(AT_EXTRA_3, 1, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_EXTRA_3, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_EXTRA_3, 1, AG_WINDOW_SFX, asset_get("sfx_jumpground"));
set_window_value(AT_EXTRA_3, 1, AG_WINDOW_SFX_FRAME, 7);

set_window_value(AT_EXTRA_3, 2, AG_WINDOW_LENGTH, 8);
set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(AT_EXTRA_3, 2, AG_WINDOW_HSPEED, 4);
set_window_value(AT_EXTRA_3, 2, AG_WINDOW_VSPEED, -6);
set_window_value(AT_EXTRA_3, 2, AG_WINDOW_HSPEED_TYPE, 2);
set_window_value(AT_EXTRA_3, 2, AG_WINDOW_VSPEED_TYPE, 2);

set_window_value(AT_EXTRA_3, 3, AG_WINDOW_TYPE, 8);
set_window_value(AT_EXTRA_3, 3, AG_WINDOW_LENGTH, 5);
set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAME_START, 3);

set_window_value(AT_EXTRA_3, 4, AG_WINDOW_LENGTH, 4);
set_window_value(AT_EXTRA_3, 4, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_EXTRA_3, 4, AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(AT_EXTRA_3, 4, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_EXTRA_3, 4, AG_WINDOW_SFX, sound_get("sfx_squeak"));
set_window_value(AT_EXTRA_3, 4, AG_WINDOW_SFX_FRAME, 1);

set_window_value(AT_EXTRA_3, 5, AG_WINDOW_LENGTH, 20);
set_window_value(AT_EXTRA_3, 5, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_EXTRA_3, 5, AG_WINDOW_ANIM_FRAME_START, 6);


follower_window_hitbox_min[0, AT_EXTRA_3] = 1;
follower_window_hitbox_max[0, AT_EXTRA_3] = 2;

set_hitbox_value(AT_EXTRA_3, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_EXTRA_3, 1, HG_WINDOW, 4);
set_hitbox_value(AT_EXTRA_3, 1, HG_LIFETIME, 4);
set_hitbox_value(AT_EXTRA_3, 1, HG_HITBOX_X, -2);
set_hitbox_value(AT_EXTRA_3, 1, HG_HITBOX_Y, -14);
set_hitbox_value(AT_EXTRA_3, 1, HG_WIDTH, 65);
set_hitbox_value(AT_EXTRA_3, 1, HG_HEIGHT, 26);
set_hitbox_value(AT_EXTRA_3, 1, HG_SHAPE, 2);
set_hitbox_value(AT_EXTRA_3, 1, HG_PRIORITY, 1);
set_hitbox_value(AT_EXTRA_3, 1, HG_DAMAGE, 6);
set_hitbox_value(AT_EXTRA_3, 1, HG_ANGLE, 361);
set_hitbox_value(AT_EXTRA_3, 1, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_EXTRA_3, 1, HG_KNOCKBACK_SCALING, 0.6);
set_hitbox_value(AT_EXTRA_3, 1, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_EXTRA_3, 1, HG_HITPAUSE_SCALING, 0.6);
set_hitbox_value(AT_EXTRA_3, 1, HG_HIT_SFX, asset_get("sfx_blow_medium1"));
set_hitbox_value(AT_EXTRA_3, 1, HG_ANGLE_FLIPPER, 3);
set_hitbox_value(AT_EXTRA_3, 1, HG_HITBOX_GROUP, -1);

set_hitbox_value(AT_EXTRA_3, 2, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_EXTRA_3, 2, HG_LIFETIME, 60);
set_hitbox_value(AT_EXTRA_3, 2, HG_WIDTH, 56);
set_hitbox_value(AT_EXTRA_3, 2, HG_HEIGHT, 56);
set_hitbox_value(AT_EXTRA_3, 2, HG_DAMAGE, 4);
set_hitbox_value(AT_EXTRA_3, 2, HG_ANGLE, 60);
set_hitbox_value(AT_EXTRA_3, 2, HG_ANGLE_FLIPPER, 1);
set_hitbox_value(AT_EXTRA_3, 2, HG_PRIORITY, 1);
set_hitbox_value(AT_EXTRA_3, 2, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_EXTRA_3, 2, HG_KNOCKBACK_SCALING, 0.6);
set_hitbox_value(AT_EXTRA_3, 2, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_EXTRA_3, 2, HG_HITSTUN_MULTIPLIER, 0.6);
set_hitbox_value(AT_EXTRA_3, 2, HG_PROJECTILE_SPRITE, asset_get("empty_sprite"));
set_hitbox_value(AT_EXTRA_3, 2, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_EXTRA_3, 2, HG_PROJECTILE_WALL_BEHAVIOR, 1);
set_hitbox_value(AT_EXTRA_3, 2, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
set_hitbox_value(AT_EXTRA_3, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_EXTRA_3, 2, HG_PROJECTILE_IS_TRANSCENDENT, 1);
set_hitbox_value(AT_EXTRA_3, 2, HG_PROJECTILE_UNBASHABLE, 1);
set_hitbox_value(AT_EXTRA_3, 2, HG_HIT_SFX, asset_get("sfx_blow_medium3"));
set_hitbox_value(AT_EXTRA_3, 2, HG_VISUAL_EFFECT, 301);
set_hitbox_value(AT_EXTRA_3, 2, HG_THROWS_ROCK, 2);
set_hitbox_value(AT_EXTRA_3, 2, HG_IGNORES_PROJECTILES, 1);

follower_attack_spr[1, AT_EXTRA_3] = sprite_get("doo_attack");
follower_attack_hurtbox_spr[1, AT_EXTRA_3] = sprite_get("doo_attack_hurt");
follower_attack_category[1, AT_EXTRA_3] = 2;

follower_window_min[1, AT_EXTRA_3] = 6;
follower_window_max[1, AT_EXTRA_3] = 8;

set_window_value(AT_EXTRA_3, 6, AG_WINDOW_LENGTH, 12);
set_window_value(AT_EXTRA_3, 6, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_EXTRA_3, 6, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_EXTRA_3, 6, AG_WINDOW_SFX, sound_get("sfx_beam"));
set_window_value(AT_EXTRA_3, 6, AG_WINDOW_SFX_FRAME, 11);

set_window_value(AT_EXTRA_3, 7, AG_WINDOW_LENGTH, 45);
set_window_value(AT_EXTRA_3, 7, AG_WINDOW_ANIM_FRAMES, 7);
set_window_value(AT_EXTRA_3, 7, AG_WINDOW_ANIM_FRAME_START, 2);

set_window_value(AT_EXTRA_3, 8, AG_WINDOW_TYPE, 16);
set_window_value(AT_EXTRA_3, 8, AG_WINDOW_LENGTH, 5);
set_window_value(AT_EXTRA_3, 8, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_EXTRA_3, 8, AG_WINDOW_ANIM_FRAME_START, 8);

follower_window_hitbox_min[1, AT_EXTRA_3] = 3;
follower_window_hitbox_max[1, AT_EXTRA_3] = 3;

set_hitbox_value(AT_EXTRA_3, 3, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_EXTRA_3, 3, HG_LIFETIME, 16);
set_hitbox_value(AT_EXTRA_3, 3, HG_WIDTH, 18);
set_hitbox_value(AT_EXTRA_3, 3, HG_HEIGHT, 18);
set_hitbox_value(AT_EXTRA_3, 3, HG_PRIORITY, 2);
set_hitbox_value(AT_EXTRA_3, 3, HG_DAMAGE, 3);
set_hitbox_value(AT_EXTRA_3, 3, HG_ANGLE, 65);
set_hitbox_value(AT_EXTRA_3, 3, HG_PROJECTILE_SPRITE, sprite_get("doo_beam"));
set_hitbox_value(AT_EXTRA_3, 3, HG_PROJECTILE_ANIM_SPEED, 0.25);
set_hitbox_value(AT_EXTRA_3, 3, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_EXTRA_3, 3, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
set_hitbox_value(AT_EXTRA_3, 3, HG_PROJECTILE_WALL_BEHAVIOR, 1);
set_hitbox_value(AT_EXTRA_3, 3, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_EXTRA_3, 3, HG_PROJECTILE_IS_TRANSCENDENT, 1);
set_hitbox_value(AT_EXTRA_3, 3, HG_HIT_SFX, asset_get("sfx_zap"));
set_hitbox_value(AT_EXTRA_3, 3, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_EXTRA_3, 3, HG_KNOCKBACK_SCALING, .5);
set_hitbox_value(AT_EXTRA_3, 3, HG_BASE_HITPAUSE, 4);
set_hitbox_value(AT_EXTRA_3, 3, HG_HITPAUSE_SCALING, .4);
set_hitbox_value(AT_EXTRA_3, 3, HG_HITSTUN_MULTIPLIER, .75);
set_hitbox_value(AT_EXTRA_3, 3, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_EXTRA_3, 3, HG_HIT_LOCKOUT, 3);