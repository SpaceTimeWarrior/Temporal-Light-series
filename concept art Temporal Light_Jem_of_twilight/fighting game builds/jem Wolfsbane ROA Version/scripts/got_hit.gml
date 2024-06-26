// got_hit is a script that is called when you get hit.
gauge_val-=.1;
if(gauge_val<0){
	gauge_val=.05;
	take_damage(player, -1, 50);
}
title_counter++;
tt_cntr++;
title_counter%=5;
if(pain_damage){
	pain_damage=false;
	sound_play( sfx_jem_wolf_talk_pain );
	
}else{
	pain_damage=true;
	sound_play( sfx_jem_wolf_talk_pain2 );	
}
if(tt_cntr<500){
switch(title_counter){
	case 0:
	Hikaru_Title = "Lunar Princess";
	Hikaru_Title2 = Hikaru_Title;
	kirbyability = 1;
	break;
	case 1:
	Hikaru_Title = "Multiverse Defender"
	Hikaru_Title2 = Hikaru_Title;
	kirbyability = 1;
	break;
	case 2:
	Hikaru_Title = "Twilight Flame"
	Hikaru_Title2 = Hikaru_Title;
	kirbyability = 11;
	break;
	case 3:
	Hikaru_Title = "wolfcat kitsune"
	Hikaru_Title2 = Hikaru_Title;
	kirbyability = 1;
	break;
	case 4:
	Hikaru_Title = "Etherian Queen"
	Hikaru_Title2 = Hikaru_Title;
	kirbyability = 7;
	break;
	default:
	Hikaru_Title = "ERROR"
	Hikaru_Title2 = Hikaru_Title;
	break;
}
}else{
	tt_cntr = 500;
	hikaru_title = "bloodthirsty"
	Hikaru_Title2 = Hikaru_Title;
	kirbyability = 3;
}