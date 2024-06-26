// hit_player is a script that runs code when you hit an enemy player.
var dama = 5;
//take_damage(player,-1,5);
switch(attack){
	case AT_BAIR:
	dama=15;
	break;
	case AT_DAIR:
	dama=15;
	break;
	case AT_DATTACK:
	dama=6;
	break;
	case 49:
	dama=500;
	break;
	case AT_DSPECIAL:
	dama=350;
	break;
	case AT_DSTRONG:
	dama=14;
	break;
	case AT_DTILT:
	dama=14;
	break;
	case AT_FAIR:
	dama=10;
	break;
	case AT_FSPECIAL:
	dama=6;
		take_damage(player,hit_player_obj.player,-1*ceil(dama*(gauge_val+(TL_MBBOOL*gauge_val))));
	if (is_laststock()) {
		take_damage(player,hit_player_obj.player,-1*ceil(dama*(gauge_val+(TL_MBBOOL*gauge_val))));
	}
	var plz = instance_create(hit_player_obj.x,hit_player_obj.y,"obj_article_platform");
	break;
	case AT_FSTRONG:
	dama=10;
	break;
	case AT_FTILT:
	dama=9;
	break;
	case AT_JAB:
	dama=5;
	break;
	case AT_NAIR:
	dama=10;
	break;
	case AT_NSPECIAL:
	dama=10;
	break;
	case AT_TAUNT:
	dama=0;
	break;
	case AT_UAIR:
	dama=3;
	break;
	case AT_USPECIAL:
	if(window<5){
	dama=4;
	}else{
	dama=8;
	}
	break;
	case AT_USTRONG:
	dama=10;
	instance_create(hit_player_obj.x+random_func(0,251,true)-125,hit_player_obj.y+random_func(1,251,true)-125,"obj_article2");
	break;
	case AT_UTILT:
	dama=10;
	break;
	default:
	dama=5;
	break;
}
take_damage(hit_player_obj.player, player, ceil((dama*(gauge_val+(TL_MBBOOL*gauge_val)))-dama) );
if(attack==AT_USPECIAL||attack==AT_FSPECIAL){
	gauge_val=0.05;
}else if(attack == AT_NSPECIAL){
	
}else{
	gauge_val+=.1;
	if(gauge_val>4){
		gauge_val=4;
	}
}