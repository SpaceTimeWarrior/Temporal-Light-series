var clock = false;
TL_Death = true;
if(crystal_lock){
	switch(player){
		case 1:
		if (phone_cheats[cheat_enable_anticheat1]){
			clock = true
		}
		break;
		case 2:
		if (phone_cheats[cheat_enable_anticheat2]){
			clock = true;
		}
		break;
		case 3:
		if (phone_cheats[cheat_enable_anticheat3]){
			clock=true;
		}
		break;
		case 4:
		if (phone_cheats[cheat_enable_anticheat4]){
			clock=true;
		}
		break;
	}
}
if(!crystal_lock){
	take_damage(player,player,TL_DAMAGE);
	gauge_val=0.05;
	if(get_player_damage( player )>=TL_LIMIT){
		attack=AT_JAB;
		create_deathbox(x,y,100,100,player,true,2,1,2);
	}
	TL_COUNTER=-1;
	TL_FLAG=false;
}else{
	if(clock){
		take_damage(player,player,TL_DAMAGE);
		gauge_val=0.05;
		TL_LIMIT=5;
		if(get_player_damage( player )>=TL_LIMIT){
			attack=AT_JAB;
			create_deathbox(x,y,100,100,player,true,2,1,2);
		}
		TL_COUNTER=-1;
		TL_FLAG=false;
	}
}