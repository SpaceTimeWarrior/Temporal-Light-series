// got_parried is a script that is called when you get parried.
gauge_val-=.05
if(gauge_val<0){
	gauge_val=0;
}