set_attack_value(AT_TAUNT, AG_MUNO_ATTACK_NAME, "taunt");
set_attack_value(AT_TAUNT, AG_SPRITE, sprite_get("taunt"));
set_attack_value(AT_TAUNT, AG_NUM_WINDOWS, 3);
set_attack_value(AT_TAUNT, AG_HAS_LANDING_LAG, 3);
set_attack_value(AT_TAUNT, AG_OFF_LEDGE, 1);
set_attack_value(AT_TAUNT, AG_HURTBOX_SPRITE, asset_get("ex_guy_hurt_box"));

taunt_fire=true;

set_window_value(AT_TAUNT, 1, AG_WINDOW_LENGTH, 21);
set_window_value(AT_TAUNT, 1, AG_WINDOW_ANIM_FRAMES, 7);
set_window_value(AT_TAUNT, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_TAUNT, 1, AG_WINDOW_SFX, sfx_jem_wolf_taunt_parts);
set_window_value(AT_TAUNT, 1, AG_WINDOW_SFX_FRAME, 19);

set_window_value(AT_TAUNT, 2, AG_WINDOW_LENGTH, 10);
set_window_value(AT_TAUNT, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_TAUNT, 2, AG_WINDOW_ANIM_FRAME_START, 7);

set_window_value(AT_TAUNT, 3, AG_WINDOW_LENGTH, 21);
set_window_value(AT_TAUNT, 3, AG_WINDOW_ANIM_FRAMES, 7);
set_window_value(AT_TAUNT, 3, AG_WINDOW_ANIM_FRAME_START, 8);
set_window_value(AT_TAUNT, 3, AG_WINDOW_ANIM_FRAME_START, 8);
set_window_value(AT_TAUNT, 3, AG_WINDOW_SFX, sfx_jem_wolf_taunt_parts);

if(window==3){
	if(taunt_down){
		window = 1;
	}
	taunt_fire = true;
}
set_attack_value(AT_TAUNT, AG_MUNO_ATTACK_MISC_ADD,"If a direction is held at the end of the taunt a fireball is generated and flung in that direction in increments of 45 degrees. the speed is 8 and the contact damage is 15%. the fireball has 0kb and is blocked by walls,ground,and platforms.the lifespan of the fireball is 300 frames");