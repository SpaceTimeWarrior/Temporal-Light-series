
sprite_index = sprite_get("ustrong_art");
mask_index = sprite_get("ustrong_art");

article_anim_speed = .5;
anim_counter = 60;
damm = 15;
uses_shader = true;
should_die = false;
ignores_walls = false;
can_be_grounded = true;
article_friction = 0.1;
article_gravity = 0.5;
article_max_fall_speed = 12;
track_type = 1;
track_id = player_id;
print_debug("init_art"+string(id))
t_angle = random_func(0,360,false)
if(t_angle==90||t_angle==270){
	hsp=2*dsin(t_angle);
}else{
	hsp=2*dcos(t_angle);
}
vsp=2*dsin(t_angle)
