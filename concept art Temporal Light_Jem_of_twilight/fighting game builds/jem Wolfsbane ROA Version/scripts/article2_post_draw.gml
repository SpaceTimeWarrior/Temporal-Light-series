var coli = collision_line(x-sprite_xoffset/2,y-sprite_yoffset/2, x+sprite_xoffset/2, y-sprite_yoffset/2, oPlayer, true, true)
try{
if(coli !=noone){
	if(coli!=player_id){
		print_debug(string(coli)+":"+string(platform_timer));
		if(platform_timer%30==0){
			spawn_hit_fx( coli.x, coli.y, HFX_ZET_FIRE_BIG);
		}
	}
}
}catch(e){

}