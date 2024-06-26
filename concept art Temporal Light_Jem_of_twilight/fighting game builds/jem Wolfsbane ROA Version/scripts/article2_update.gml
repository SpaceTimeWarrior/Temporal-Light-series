image_index += article_anim_speed;
print_debug(string(hsp)+":"+string(vsp))
if(track_type==1){
if (free) vsp = min(vsp + article_gravity, article_max_fall_speed);
if (hsp != 0) hsp = sign(hsp) * max(0, abs(hsp) /*- article_friction*/);
}else if (track_type == 2){
	if(!instance_exists(track_id)){
		track_type = 1;	
		t_angle = random_func(0,360,false)
		if(t_angle==90||t_angle==270){
			hsp=2*dsin(t_angle);
		}else{
			hsp=2*dcos(t_angle);
		}
		vsp=2*dsin(t_angle)	
	}else{
		if(x<track_id.x){
			hsp=2;
			spr_dir=1;
		}else{
			hsp=-2;
			spr_dir=-1;
		}
		if(y<track_id.y){
			vsp=2
		}else{
			vsp=-2
		}
	}
}
var coli = collision_line(x-sprite_xoffset/2,y-sprite_yoffset/2, x+sprite_xoffset/2, y+sprite_yoffset/2, oPlayer, true, true)
if(coli==noone){
	coli = collision_line(x+sprite_xoffset/2,y-sprite_yoffset/2, x-sprite_xoffset/2, y+sprite_yoffset/2, oPlayer, true, true)
}
if(coli==noone){
	coli = collision_line(x+sprite_xoffset/2,y-sprite_yoffset/2, x-sprite_xoffset/2, y-sprite_yoffset/2, oPlayer, true, true)
}
if(coli==noone){
	coli = collision_line(x+sprite_xoffset/2,y+sprite_yoffset/2, x-sprite_xoffset/2, y+sprite_yoffset/2, oPlayer, true, true)
}
if(coli==noone){
	coli = collision_line(x+sprite_xoffset/2,y+sprite_yoffset/2, x+sprite_xoffset/2, y-sprite_yoffset/2, oPlayer, true, true)
}
if(coli==noone){
	coli = collision_line(x-sprite_xoffset/2,y+sprite_yoffset/2, x-sprite_xoffset/2, y-sprite_yoffset/2, oPlayer, true, true)
}
print_debug(string(coli));
if(coli!=noone){
	if(coli!=player_id){
		take_damage(coli.player,player_id.player,damm);
		spawn_hit_fx( x, y, HFX_ZET_FIRE_BIG);
		should_die = true;
	}
}
anim_counter--;
if(anim_counter<=0){
	spawn_hit_fx( x, y, HFX_ZET_FIRE_BIG);
	instance_destroy();
	return;
}
if should_die {
    instance_destroy();
    return;
}