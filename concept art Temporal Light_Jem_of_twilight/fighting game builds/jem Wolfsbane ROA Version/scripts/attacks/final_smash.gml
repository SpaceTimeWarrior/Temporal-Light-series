//set_attack_value(49 ,AG_MUNO_ATTACK_NAME, "Final Smash");
set_attack_value(49, AG_CATEGORY, 2);
set_attack_value(49, AG_SPRITE, sprite_get("dspecial"));
set_attack_value(49, AG_NUM_WINDOWS, 4);
set_attack_value(49, AG_HAS_LANDING_LAG, 4);
set_attack_value(49, AG_OFF_LEDGE, 1);
set_attack_value(49, AG_AIR_SPRITE, sprite_get("dspecial"));
set_attack_value(49, AG_HURTBOX_SPRITE, sprite_get("dspecial_hurt"));

set_window_value(49, 1, AG_WINDOW_LENGTH, 3);
set_window_value(49, 1, AG_WINDOW_ANIM_FRAMES, 8);
set_window_value(49, 1, AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(49, 1, AG_WINDOW_VSPEED_TYPE, 1);
set_window_value(49, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(49, 1, AG_WINDOW_SFX, asset_get("sfx_zetter_shine"));

set_window_value(49, 2, AG_WINDOW_LENGTH, 16);
set_window_value(49, 2, AG_WINDOW_ANIM_FRAMES, 8);
set_window_value(49, 2, AG_WINDOW_ANIM_FRAME_START, 8);
set_window_value(49, 2, AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(49, 2, AG_WINDOW_VSPEED_TYPE, 1);
set_window_value(49, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(49, 2, AG_WINDOW_SFX, asset_get("sfx_zetter_shine"));

set_window_value(49, 3, AG_WINDOW_LENGTH, 16);
set_window_value(49, 3, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(49, 3, AG_WINDOW_ANIM_FRAME_START, 16);
set_window_value(49, 3, AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(49, 3, AG_WINDOW_VSPEED_TYPE, 1);
set_window_value(49, 3, AG_WINDOW_HAS_SFX, 1);
set_window_value(49, 3, AG_WINDOW_SFX, asset_get("sfx_zetter_shine"));

set_window_value(49, 4, AG_WINDOW_LENGTH, 16);
set_window_value(49, 4, AG_WINDOW_ANIM_FRAMES, 8);
set_window_value(49, 4, AG_WINDOW_ANIM_FRAME_START, 17);
set_window_value(49, 4, AG_WINDOW_HSPEED_TYPE, 1);
set_window_value(49, 4, AG_WINDOW_VSPEED_TYPE, 1);
set_window_value(49, 4, AG_WINDOW_HAS_SFX, 1);
set_window_value(49, 4, AG_WINDOW_SFX, asset_get("sfx_zetter_shine"));
set_num_hitboxes(49, 1);

set_hitbox_value(49, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(49, 1, HG_WINDOW, 1);
set_hitbox_value(49, 1, HG_WINDOW_CREATION_FRAME, 1);
set_hitbox_value(49, 1, HG_LIFETIME, 51);
set_hitbox_value(49, 1, HG_HITBOX_Y, -30);
set_hitbox_value(49, 1, HG_WIDTH, 500);
set_hitbox_value(49, 1, HG_HEIGHT, 500);
set_hitbox_value(49, 1, HG_PRIORITY, 1);
set_hitbox_value(49, 1, HG_DAMAGE, 500);
set_hitbox_value(49, 1, HG_SHAPE, 0);
set_hitbox_value(49, 1, HG_BASE_KNOCKBACK, 100);
set_hitbox_value(49, 1, HG_KNOCKBACK_SCALING, .1);
set_hitbox_value(49, 1, HG_BASE_HITPAUSE, 3);
set_hitbox_value(49, 1, HG_VISUAL_EFFECT, 20);
set_hitbox_value(49, 1, HG_HIT_SFX, asset_get("sfx_absa_singlezap1"));
set_hitbox_value(49, 1, HG_ANGLE_FLIPPER, 6);
set_hitbox_value(49, 1, HG_TECHABLE, 1);

set_attack_value(49, AG_MUNO_ATTACK_MISC_ADD, "this is the final smash version of DSpecial the recoil damge is 100 rather than 200");