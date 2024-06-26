// death is a script that is called when your character reaches a blastzone and is knocked out.
if(!TL_Death){
	gauge_val = 1;
}else{
	print_debug("tt")
	gauge_val = .05;
	take_damage(player,-1,10);
}