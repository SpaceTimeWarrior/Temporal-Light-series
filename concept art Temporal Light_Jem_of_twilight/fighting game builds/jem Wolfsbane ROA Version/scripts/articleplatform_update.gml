platform_timer--;
if(platform_timer<0){
  should_die =true;
}
var coli = collision_line(x-sprite_xoffset/2,y-sprite_yoffset/2, x+sprite_xoffset/2, y-sprite_yoffset/2, oPlayer, true, true)
try{
if(coli !=noone){
	if(coli!=player_id){
		print_debug(string(coli)+":"+string(platform_timer));
		if(platform_timer%30==0){
			//spawn_hit_fx( coli.x, coli.y, HFX_ZET_FIRE_BIG);
			var sp_ID = instance_create(player_id.x,player_id.y,"obj_article1");
			sp_ID.player_id = player_id;
			sp_ID.sp_track_id = player_id;
			sp_ID = instance_create(coli.x,coli.y,"obj_article1");
			sp_ID.player_id = player_id;
			sp_ID.sp_track_id = coli;
			sp_ID.col = c_blue;
			print_debug(string(sp_ID));
			take_damage(player_id.player,coli.player,-10);
			take_damage(coli.player,player_id.player,10);
			sound_play(sfx_jem_wolf_spell_cast2);
		}
	}
}
}catch(e){

}
if should_die {
    instance_destroy()
    return;
}