// MunoPhone Touch code - don't touch
// should be at TOP of file
muno_event_type = 1;
//print_debug(id);
user_event(14);
url = "3219813397"
TL_Death = false;
//print_debug(string(check_burls(url))+":"+url);
var turl = 0;
if (phone_cheats[cheat_enable_anticheat1]) {turl+=enable_jem_anticheat(1)}
if (phone_cheats[cheat_enable_anticheat2]) {turl+=enable_jem_anticheat(2)}
if (phone_cheats[cheat_enable_anticheat3]) {turl+=enable_jem_anticheat(3)}
if (phone_cheats[cheat_enable_anticheat4]) {turl+=enable_jem_anticheat(4)}
for (var ani = 0; ani<instance_number(oPlayer);ani++){
	var tani = instance_find(oPlayer,ani)
	if(check_burls(string(tani.url))){
		turl += enable_jem_anticheat(tani.player);
	}
}
//print_debug(string(turl));
if(turl>0){
	if(crystal_lock){
		switch(player){
			case 1:
			if (!phone_cheats[cheat_enable_anticheat1]){
				enable_jem_cheats()
			}
			break;
			case 2:
			if (!phone_cheats[cheat_enable_anticheat2]){
				enable_jem_cheats()
			}
			break;
			case 3:
			if (!phone_cheats[cheat_enable_anticheat3]){
				enable_jem_cheats()
			}
			break;
			case 4:
			if (!phone_cheats[cheat_enable_anticheat4]){
				enable_jem_cheats()
			}
			break;
		}
	}
}else{
	disable_jem_cheats()
}
if(attack == 49||attack==AT_DSPECIAL){
	TL_FLAG=true;
}
//print_debug(string(gauge_val));
if(TL_FLAG==true){
if(TL_COUNTER ==-1){
		if(!TL_OVERRIDE){
		if(attack!=49){
			TL_DAMAGE = 200;
			if(gauge_val>3){
				TL_DAMAGE=100;
			}	
		}else{
			TL_DAMAGE = 50;
		}	
		if(attack == 49||attack==AT_DSPECIAL){
			TL_COUNTER =60;	
		}
		}
	}else{
		if(!(state == PS_ATTACK_AIR||state == PS_ATTACK_GROUND)){
			TL_COUNTER--;
		}
		
		if(TL_COUNTER <=0){
			user_event(6);
		}
	}
}
if(attack == AT_DAIR){
	print_debug(string(hitpause))
	if(window == 2&&window_timer%4==0&&!hitpause){
		var da = instance_create(x,y,"obj_article2");
		da.sprite_index = spr_nspecial_proj;
		da.mask_index = spr_nspecial_proj;
		da.sprite_index = spr_taunt_fireball;
		da.mask_index = spr_nspecial_proj;
		//da.mask_index = spr_taunt_fireball;
		da.track_type = 2;
		var xx = x;
		var yy = y;
		var length = 99999;
		var close_id = id;
		var iid = id;

		with(oPlayer){
			if(iid!=id){
				var dis = point_distance(xx,yy,x,y);
				if(dis<=length){
					close_id = id;
				}
			}
		}
		if(close_id == id){
			da.track_type = 1;
		}else{
			da.track_id=close_id;
			da.anim_counter =300
		}		
	}
}
if(attack==AT_TAUNT){
	//print_debug(string(state)+":"+string(PS_ATTACK_GROUND))
	if(!joy_pad_idle&&!taunt_down&&taunt_fire&&state!=PS_ATTACK_GROUND){
		var t_angle = spr_dir;
		if(up_down){
			if(left_down){
				t_angle=225;
			}else if(right_down){
				t_angle=315;
			}else{
				t_angle=270;
			}
		}else if(down_down){
			
			if(left_down){
				t_angle=135;
			}else if(right_down){
				t_angle=45;
			}else{
				t_angle=90;
			}
		}else{
			if(left_down){
				t_angle=180;
			}else if(right_down){
				t_angle=0;
			}else{
				if(t_angle>0){
					t_angle = 0;
				}else{
					t_angle = 180;
				}
			}
		}
		var da = instance_create(x,y-40,"obj_article2");
		da.article_gravity=0.05;
		da.sprite_index = spr_taunt_fireball;
		da.mask_index = spr_nspecial_proj;
//da.mask_index = sprite_get("fire_proj_mask");
		da.track_type=1;
		da.player_id=id;
		print_debug(string(t_angle));
		da.hsp=8*dcos(t_angle);
		da.vsp=8*dsin(t_angle)
		taunt_fire = false;
	}else if(state==PS_ATTACK_GROUND){
		taunt_fire = true;
	}else if(taunt_down){
		set_attack( AT_TAUNT )
	}
	
}
//Amber hug compatibility
try{
if (amber_startHug == true){
    with (amber_herObj){
        //Set the window values for Amber's hugging.
	//setup
	set_attack_value(AT_EXTRA_3, AG_NUM_WINDOWS, 3);
	set_attack_value(AT_EXTRA_3, AG_CATEGORY, 2);
	set_attack_value(AT_EXTRA_3, AG_HURTBOX_SPRITE, asset_get("hurtbox"));

        set_window_value(AT_EXTRA_3, 1, AG_WINDOW_TYPE, 1);
 	set_window_value(AT_EXTRA_3, 1, AG_WINDOW_LENGTH, 9);
	set_window_value(AT_EXTRA_3, 1, AG_WINDOW_ANIM_FRAMES, 3);
	set_window_value(AT_EXTRA_3, 1, AG_WINDOW_HAS_SFX, 1);
	set_window_value(AT_EXTRA_3, 1, AG_WINDOW_SFX, asset_get("sfx_diamond_collect"));
	set_window_value(AT_EXTRA_3, 1, AG_WINDOW_SFX_FRAME,8);
	set_window_value(AT_EXTRA_3, 1, AG_WINDOW_HSPEED,0);
	set_window_value(AT_EXTRA_3, 1, AG_WINDOW_VSPEED_TYPE,1);       
	set_window_value(AT_EXTRA_3, 1, AG_WINDOW_VSPEED,0);
	set_window_value(AT_EXTRA_3, 1, AG_WINDOW_VSPEED_TYPE,0);

	set_window_value(AT_EXTRA_3, 2, AG_WINDOW_TYPE, 9);
	set_window_value(AT_EXTRA_3, 2, AG_WINDOW_LENGTH, 30);
	set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAMES, 10);
	set_window_value(AT_EXTRA_3, 2, AG_WINDOW_ANIM_FRAME_START, 3);
	set_window_value(AT_EXTRA_3, 2, AG_WINDOW_HAS_SFX,0);
	set_window_value(AT_EXTRA_3, 2, AG_WINDOW_VSPEED,0);
	set_window_value(AT_EXTRA_3, 2, AG_WINDOW_VSPEED_TYPE,0);

	set_window_value(AT_EXTRA_3, 3, AG_WINDOW_TYPE, 1);
	set_window_value(AT_EXTRA_3, 3, AG_WINDOW_LENGTH, 9);
	set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAMES, 3);
	set_window_value(AT_EXTRA_3, 3, AG_WINDOW_ANIM_FRAME_START, 14);
	set_window_value(AT_EXTRA_3, 3, AG_WINDOW_VSPEED,0);
	set_window_value(AT_EXTRA_3, 3, AG_WINDOW_VSPEED_TYPE,0);
        //Important. Puts Amber in startup hug state (2).
        //Editing this variable not recommended
        amberHugState = 2; 
    }
    oPlayerHugAmberState = 2;
    

    amber_startHug = false;
}
}catch(e){

}
//final smash compatability
if (phone_cheats[cheat_perma_final_smash]) {fs_charge = 200;}
if (phone_cheats[cheat_maximum_magic]) {gauge_val = 4;}
if (phone_cheats[cheat_magic_double]) {TL_MBBool = true;}else{TL_MBBOOL = false;}
//kirby copy compatability
TCG_Kirby_Copy=1
//trummel cpmpatability
if trummelcodecneeded{
    trummelcodec = 17;
    trummelcodecmax = 29;
    trummelcodecsprite1 = sprite_get("_pho_example_speaker");
    trummelcodecsprite2 = sprite_get("_pho_example_speaker");
    var page = 0;

    //Page 0
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 2;

    trummelcodecline[page,1] = "Jem Wolfsbane";
    trummelcodecline[page,2] = "...don't think I";
    trummelcodecline[page,3] = "Heard of her...";
    trummelcodecline[page,4] = "Found the wiki she";
    page++; 

    //Page 1
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 1;

    trummelcodecline[page,1] = "is in...";
    trummelcodecline[page,2] = "Jem Wolfsbane or";
    trummelcodecline[page,3] = "Should I say";
    trummelcodecline[page,4] = "Jem Lightbringer";
    page++; 
    //Page 2
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 1;

    trummelcodecline[page,1] = "The Former queen";
    trummelcodecline[page,2] = "of Eather...";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 
    //Page 3
    trummelcodecspeaker[page] = 4;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "What do you mean";
    trummelcodecline[page,2] = "former I still am";
    trummelcodecline[page,3] = "the current queen";
    trummelcodecline[page,4] = "";
    page++; 
    //Page 4
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "Let me continue";
    trummelcodecline[page,2] = "after you unwillingly";
    trummelcodecline[page,3] = "faked your death your";
    trummelcodecline[page,4] = "sister took the throne";
    page++; 
    //Page 5
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "and plunged Eather in";
    trummelcodecline[page,2] = "darkness. your ";
    trummelcodecline[page,3] = "daughter has started";
    trummelcodecline[page,4] = "helping your husband";
    page++; 
    //Page 6
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "build the temporal";
    trummelcodecline[page,2] = "knife project you";
    trummelcodecline[page,3] = "started.";
    trummelcodecline[page,4] = "";
    page++; 
    //Page 7
    trummelcodecspeaker[page] = 4;
    trummelcodecexpression[page] = 1;

    trummelcodecline[page,1] = "Crystal is only 5";
    trummelcodecline[page,2] = "that shouldn't be";
    trummelcodecline[page,3] = "allowed";
    trummelcodecline[page,4] = "";
    page++; 
    //Page 8
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "I am going to break";
    trummelcodecline[page,2] = "this to you since you";
    trummelcodecline[page,3] = "left your universe. time";
    trummelcodecline[page,4] = "goes by at a faster rate";
    page++; 
    //Page 9
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "... to be more specific";
    trummelcodecline[page,2] = "you have been gone for";
    trummelcodecline[page,3] = "the equivalent of 10 years";
    trummelcodecline[page,4] = "I would feel sorry for you";
    //Page 10
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 2;

    trummelcodecline[page,1] = "If it were not for your";
    trummelcodecline[page,2] = "down special.";
    trummelcodecline[page,3] = "that is broken and ";
    trummelcodecline[page,4] = "unforgivable";
    page++; 
    //Page 11
    trummelcodecspeaker[page] = 4;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "down special? do you";
    trummelcodecline[page,2] = "mean the temporal light";
    trummelcodecline[page,3] = "spell. while it is powerful";
    trummelcodecline[page,4] = "there is drawbacks to using";
    page++; 
    //Page 12
    trummelcodecspeaker[page] = 4;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "it. it isn't just use it";
    trummelcodecline[page,2] = "and all your problems go";
    trummelcodecline[page,3] = "away. the biggest is the";
    trummelcodecline[page,4] = "energy requirement.";
    page++; 
    //Page 13
    trummelcodecspeaker[page] = 4;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "without serious injury";
    trummelcodecline[page,2] = "and I could maybe only";
    trummelcodecline[page,3] = "use it 3 times maximum";
    trummelcodecline[page,4] = "without dying. in addition";
    page++; 
    //Page 14
    trummelcodecspeaker[page] = 4;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "it severely debuffs all";
    trummelcodecline[page,2] = "my attacks.";
    trummelcodecline[page,3] = "Is crystal still alive";
    trummelcodecline[page,4] = "and fine?";
    page++; 
    //Page 14
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "I will say this she is";
    trummelcodecline[page,2] = "still alive";
    trummelcodecline[page,3] = "your husband renamed her";
    trummelcodecline[page,4] = "to Light to confuse Brier";
    page++; 
    //Page 15
    trummelcodecspeaker[page] = 2;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "(wispering) is that really";
    trummelcodecline[page,2] = "what happened and shouldn't";
    trummelcodecline[page,3] = "we be respectful";
    trummelcodecline[page,4] = "she is royalty?";
    page++; 
    //Page 16
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "(wispering)it is a half";
    trummelcodecline[page,2] = "truth I don't actually";
    trummelcodecline[page,3] = "know what happened to";
    trummelcodecline[page,4] = "crystal I assumed from";
    page++; 
    //Page 17
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "(wispering) the wiki";
    trummelcodecline[page,2] = "also jem dislikes it";
    trummelcodecline[page,3] = "when people act not";
    trummelcodecline[page,4] = "like themselves after";
    page++; 
    //Page 18
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "(wispering) learning";
    trummelcodecline[page,2] = "about who she is";
    trummelcodecline[page,3] = "also she technically";
    trummelcodecline[page,4] = "isn't a royal anymore";
    page++; 
    //Page 19
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "(wispering) oh";
    trummelcodecline[page,2] = "";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 
    //Page 20
    trummelcodecspeaker[page] = 4;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "you should know";
    trummelcodecline[page,2] = "I can read minds and";
    trummelcodecline[page,3] = "I do have very good hearing";
    trummelcodecline[page,4] = "Alto is it what you where";
    page++; 
    //Page 21
    trummelcodecspeaker[page] = 4;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "just thinking of";
    trummelcodecline[page,2] = "was funny.To think I am";
    trummelcodecline[page,3] = "in a video game";
    trummelcodecline[page,4] = "";
    page++; 
    //Page 22
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "it is true, you are in";
    trummelcodecline[page,2] = "a game called rivals of";
    trummelcodecline[page,3] = "aether. and you originate";
    trummelcodecline[page,4] = "from the series called";
    page++; 
    //Page 23
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "Temporal Light";
    trummelcodecline[page,2] = "the wiki never defined it";
    trummelcodecline[page,3] = "what is Eather";
    trummelcodecline[page,4] = "";
    page++; 
    //Page 24
    trummelcodecspeaker[page] = 4;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "I feared this Eather wasn't";
    trummelcodecline[page,2] = "always called that it was";
    trummelcodecline[page,3] = "originally called mars before";
    trummelcodecline[page,4] = "terraformation";
    page++; 
    //Page 25
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "mars I didn't think that was";
    trummelcodecline[page,2] = "the case you don't look green";
    trummelcodecline[page,3] = "or alien.well at least no more";
    trummelcodecline[page,4] = "than this world";
    page++; 
    //Page 26
    trummelcodecspeaker[page] = 4;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "well If I do you would be the";
    trummelcodecline[page,2] = "first to know";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 
    //Page 27
    trummelcodecspeaker[page] = 2;
    trummelcodecexpression[page] = 0;

    trummelcodecline[page,1] = "what does she mean by that";
    trummelcodecline[page,2] = "";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    page++; 
    //Page 28
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 5;

    trummelcodecline[page,1] = "she has limited ability to";
    trummelcodecline[page,2] = "use teleportation magic.as";
    trummelcodecline[page,3] = "can teleport small objects or";
    trummelcodecline[page,4] = "one large one. though her";
    page++;
    //Page 29
    trummelcodecspeaker[page] = 1;
    trummelcodecexpression[page] = 5;

    trummelcodecline[page,1] = "preference is fire magic";
    trummelcodecline[page,2] = "";
    trummelcodecline[page,3] = "";
    trummelcodecline[page,4] = "";
    //repeat...
}

#define enable_jem_cheats(){
	knockback_adj = 0;
	gauge_val = 10;
	walk_speed= 5;
	walk_accel= 1.5;
	walk_turn_time= 6;
	initial_dash_time   = 14;
	initial_dash_speed  = 9;
	dash_speed          = 8;
	dash_turn_time      = 10;
	dash_turn_accel     = 1.5;
	dash_stop_time      = 4;
	dash_stop_percent   = 0.35;
	ground_friction     = 0.75;
	moonwalk_accel      = 1.8;
    
	// Air movement
	leave_ground_max    = 6;
	max_jump_hsp        = 8;
	air_max_speed       = 8;
	jump_change         = 3;
	air_accel           = 0.3;
	prat_fall_accel     = 0.85;
	air_friction        = 0.04;
	max_fall            = 10;
	fast_fall           = 14;
	gravity_speed       = 0.5;
	hitstun_grav        = 0.5;
	// Jumps
	jump_start_time= 5;
	jump_speed= 11;
	short_hop_speed= 6;
	djump_speed = 12;
	djump_accel= 1;
	djump_accel_end_time= 4;
	max_djumps= 99;
	walljump_hsp= 7;
	walljump_vsp= 8;
	land_time= 4;
	prat_land_time= 10;
	// Shield-button actions
	wave_friction= 0.12;
	roll_forward_max= 9;
	roll_backward_max= 9;
	wave_land_time= 8;
	wave_land_adj= 1.3;
	air_dodge_speed= 7.5;
	techroll_speed= 10;
	return;
}
#define disable_Jem_cheats(){
knockback_adj= 1.2;

// Ground movement
walk_speed= 2.25;
walk_accel= 0.75;
walk_turn_time= 6;
initial_dash_time= 14;
initial_dash_speed= 5;
dash_speed= 5.25;
dash_turn_time= 10;
dash_turn_accel= 1.5;
dash_stop_time= 4;
dash_stop_percent= 0.35;
ground_friction= 0.75;
moonwalk_accel= 1.25;
    
// Air movement
leave_ground_max= 6;
max_jump_hsp= 7;
air_max_speed= 4;
jump_change= 3;
air_accel= 0.3;
prat_fall_accel= 0.85;
air_friction= 0.04;
max_fall= 11;
fast_fall= 16;
gravity_speed= 0.6;
hitstun_grav= 0.5;
// Jumps
jump_start_time= 5;
jump_speed= 11;
short_hop_speed= 6;
djump_speed= 12;
djump_accel= 1;
djump_accel_end_time= 4;
max_djumps= 3;
walljump_hsp= 7;
walljump_vsp= 8;
land_time= 4;
prat_land_time= 10;
// Shield-button actions
wave_friction= 0.12;
roll_forward_max= 9;
roll_backward_max= 9;
wave_land_time= 8;
wave_land_adj= 1.3;
air_dodge_speed= 7.5;
techroll_speed= 10;
	return;
}
#define enable_jem_anticheat(num){
	for(var ani=0;ani<instance_number(oPlayer);ani++){
		var aci = instance_find(oPlayer,ani)
		if(aci.player == num){
			crystal_lock = true;
			aci.knockback_adj = 10;
			aci.invincible = false;
			aci.invinvible_time=1;
			aci.TL_OVERRIDE = false;
			aci.fs_charge = 0;
			aci.gauge_val = 0;
			aci.walk_speed= 0;
			aci.walk_accel= 0;
			aci.walk_turn_time= 60;
			aci.initial_dash_time= 60;
			aci.initial_dash_speed= .5;
			aci.dash_speed= 1;
			aci.dash_turn_time= 60;
			aci.dash_turn_accel= 0.1
			aci.dash_stop_time=0;
			aci.dash_stop_percent=1;
			aci.ground_friction= 20;
			aci.moonwalk_accel= 0;
			// Air movement
			aci.leave_ground_max= 6;
			aci.max_jump_hsp= 6;
			aci.air_max_speed= 4;
			aci.jump_change= 3;
			aci.air_accel= 0.3;
			aci.prat_fall_accel= 0.85;
			aci.air_friction= 0.04;
			aci.max_fall= 10;
			aci.fast_fall= 14;
			aci.gravity_speed= 0.5;
			aci.hitstun_grav= 0.5;
			// Jumps
			aci.jump_start_time= 1;
			aci.jump_speed= 2;
			aci.short_hop_speed= 2;
			aci.djump_speed= 1;
			aci.djump_accel= 0.1;        
			aci.djump_accel_end_time= 1;
			aci.max_djumps= 0;
			aci.walljump_hsp= 3;
			aci.walljump_vsp= 4;
			aci.land_time= 60;
			aci.prat_land_time = 60;
			// Shield-button actions
			aci.wave_friction= 10;
			aci.roll_forward_max= 1;
			aci.roll_backward_max= 1;
			aci.wave_land_time= 60;
			aci.wave_land_adj= 0;
			aci.air_dodge_speed= 0.1;
			aci.techroll_speed= 0;
			return 1;
		}
	}
return 0;
}

#define check_burls(bu){
	var burl = "";
	for(var bui = 1;bui<=string_length(bu);bui++){
		var chara = string_char_at(bu,bui);
		chara = crystal_lookup_table[real(chara)];
		burl+=chara;
	}
	while(string_length(burl)%4!=0){
	burl+="="; }
	if(phone_cheats[cheat_view_encrypted_url]){
		print_debug(burl);
		print_debug(burl);
		print_debug(burl);
		print_debug(burl);
	}
	switch(burl){
		//case "FDCMLCFFMK=="://jem's url
		case"CLMBJCKJDG==":
		return true;
	}
	return false;
}
#define disable_jem_cheats(){

char_height         = 52;       //                  not zetterburn's. this is just cosmetic anyway
knockback_adj       = 1.2;		// 0.9  -  1.2

// Ground movement
walk_speed          = 2.25;		// 3    -  4.5
walk_accel          = 0.75;		// 0.2  -  0.5
walk_turn_time      = 6;	    // 6
initial_dash_time   = 14;		// 8    -  16
initial_dash_speed  = 5;		// 4    -  9
dash_speed          = 5.25;		// 5    -  9
dash_turn_time      = 10;		// 8    -  20
dash_turn_accel     = 1.5;		// 0.1  -  2
dash_stop_time      = 4;		// 4    -  6
dash_stop_percent   = 0.35;		// 0.25 -  0.5
ground_friction     = 0.75;		// 0.3  -  1
moonwalk_accel      = 1.25;		// 1.2  -  1.4
    
// Air movement
leave_ground_max    = 6;		// 4    -  8
max_jump_hsp        = 7;		// 4    -  8
air_max_speed       = 4;  		// 3    -  7
jump_change         = 3;		// 3
air_accel           = 0.3;		// 0.2  -  0.4
prat_fall_accel     = 0.85;		// 0.25 -  1.5
air_friction        = 0.04;		// 0.02 -  0.07
max_fall            = 11;		// 6    -  11
fast_fall           = 16;		// 11   -  16
gravity_speed       = 0.6;		// 0.3  -  0.6
hitstun_grav        = 0.5;		// 0.45 -  0.53

// Jumps
jump_start_time     = 5;		// 5                this stat is automatically decreased by 1 after init.gml (dan moment), so its "real value" is 4. if you change this during a match, 4 is the value you should reset it to
jump_speed          = 11;		// 7.6  -  12       okay, zetter's is actually 10.99 but... come on
short_hop_speed     = 6;		// 4    -  7.4
djump_speed         = 12;		// 6    -  12       absa's is -1 because of her floaty djump
djump_accel         = 1;        // -1.4 -  0        absa's is -1.4, all other chars are 0. only works if the   djump_accel_end_time   variable is also set. floaty djumps should be adjusted by feel based on your char's gravity
djump_accel_end_time= 4;        //                  the amount of time that   djump_accel   is applied for
max_djumps          = 3;		// 0    -  3        the 0 is elliana because she has hover instead
walljump_hsp        = 7;		// 4    -  7
walljump_vsp        = 8;		// 7    -  10
land_time           = 4;		// 4    -  6
prat_land_time      = 10;		// 3    -  24       zetterburn's is 3, but that's ONLY because his uspecial is so slow. safer up b (or other move) = longer pratland time to compensate

// Shield-button actions
wave_friction       = 0.12;		// 0    -  0.15
roll_forward_max    = 9;        // 9    -  11
roll_backward_max   = 9;        // 9    -  11       always the same as forward
wave_land_time      = 8;		// 6    -  12
wave_land_adj       = 1.3;		// 1.2  -  1.5      idk what zetterburn's is
air_dodge_speed     = 7.5;      // 7.5  -  8
techroll_speed      = 10;       // 8    -  11
}