// prevents draw_hud from running a frame too early and spitting an error
if "phone" not in self exit;
x0 = temp_x;
y0 = temp_y-10;
x1 = temp_x+200;
y1 = temp_y;

color[0]=c_red;
color[1]=c_orange;
color[2]=c_yellow;
color[3]=c_lime;
color[4]=c_aqua;

barpercent=gauge_val*25;
if(barpercent>100){
	barpercent=100;
}else if(barpercent<0){
	barpercent=0;
}
var dist=x1-x0;
var amt = 100/array_length(color);
var bz=array_length(color)-1;
for(i=1;i<array_length(color);i++){
	if (barpercent<i*amt){
		bz=i-1;
		break;
	}
}
draw_sprite_stretched_ext(sprite_get("mana_gauge"),image_index,x0,y0,dist,y1-y0,c_black,1);
draw_sprite_stretched_ext(sprite_get("mana_gauge"),image_index,x0,y0,dist*(barpercent/100),y1-y0,color[bz],1);
draw_sprite_stretched_ext(sprite_get("mana_gauge_frame"),image_index,x0-3,y0,dist+4,y1-y0,get_player_hud_color(player),1);

// MunoPhone Touch code - don't touch
// should be at BOTTOM of file, but above any #define lines
muno_event_type = 5; // WARN: Possible Desync. Object var set in draw script. Consider using `var` or creating constants in `init.gml`.
user_event(14);