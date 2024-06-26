if(get_player_damage(player)>=300){
	neutral_attacks[0] = AT_DSPECIAL;
	neutral_attacks[1] = AT_DSPECIAL;
	neutral_attacks[2] = AT_DSPECIAL;	
}else{
	neutral_attacks[0] = AT_JAB;
	neutral_attacks[1] = AT_NAIR;
	neutral_attacks[2] = AT_DSPECIAL;
}
if(fs_charge>=200){
	neutral_attacks[3] = 49;
}else{
	neutral_attacks[3] = AT_JAB;
}