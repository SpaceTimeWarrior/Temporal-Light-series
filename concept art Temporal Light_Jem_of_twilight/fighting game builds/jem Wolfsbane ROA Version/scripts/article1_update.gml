if(sp_track_id!=player_id){

}
if(instance_exists(sp_track_id)){
	x=sp_track_id.x;
	y=sp_track_id.y;
}
anim_counter--;
if(anim_counter<=0){
	instance_destroy();
	return;
}
if should_die {
    instance_destroy();
    return;
}
image_index += article_anim_speed;