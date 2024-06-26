// pre_draw is a script that draws things behind other players.
if(TL_OVERRIDE){
	other_player_id.TL_OVERRIDE = true;
	other_player_id.TL_DAMAGE = TL_DAMAGE;
	other_player_id.TL_COUNTER = TL_COUNTER;
	other_player_id.TL_LIMIT = TL_LIMIT;
}
if(TL_GAUGE_OVERRIDE){
	other_player_id.gauge_val = gauge_val;
}