// init is a script that creates variables when the player is created on the stage.
/*
 * Base Cast Frame Data:
 * docs.google.com/spreadsheets/d/19UtK7xG2c-ehxdlhCFKMpM4_IHSG-EXFgXLJaunE79I
 */

// STAT NAME		ZETTER VALUE   BASECAST RANGE   NOTES

// Physical size
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



// Character-specific assets init

//Sprites

spr_example = sprite_get("example"); // sprites/example_stripX.png
spr_nspecial_proj = sprite_get("water_proj");
spr_ustrong_art   = sprite_get("ustrong_art");
sprite_error      = sprite_get("sprite_error");
spr_flame_orb     = sprite_get("flame_orb");
spr_platform      = sprite_get("plat");
spr_taunt_fireball = sprite_get("fire_proj");




taunt_fire = false;

// SFX
sfx_jem_wolf_blade_strike = sound_get("sfx_blade_strike");
sfx_jem_wolf_charge = sound_get("sfx_charge");
sfx_jem_wolf_dair = sound_get("sfx_dair");
sfx_jem_wolf_firebreath = sound_get("sfx_firebreath");
sfx_jem_wolf_jab = sound_get("sfx_jab");
sfx_jem_wolf_jump_sound = sound_get("sfx_jump_sound");
sfx_jem_wolf_kart = sound_get("sfx_kart");
sfx_jem_wolf_laser = sound_get("sfx_laser");
sfx_jem_wolf_magic_sound = sound_get("sfx_magic_sound");
sfx_jem_wolf_move = sound_get("sfx_move");
sfx_jem_wolf_parry = sound_get("sfx_parry");
sfx_jem_wolf_parry2 = sound_get("sfx_parry2");
sfx_jem_wolf_spell_cast = sound_get("sfx_spell_cast");
sfx_jem_wolf_spell_cast2 = sound_get("sfx_spell_cast2");
sfx_jem_wolf_stone_fist = sound_get("sfx_stone_fist");
sfx_jem_wolf_talk_pain = sound_get("sfx_talk_pain");
sfx_jem_wolf_talk_pain2 = sound_get("sfx_talk_pain2");
sfx_jem_wolf_taunt_parts = sound_get("sfx_taunt_parts");
sfx_jem_wolf_victory_jem = sound_get("victory_jem");
// VFX
vfx_example = hit_fx_create(spr_example, 54);

// Variables
rainbow_color = c_white; // (used for one of Sandbert w/ a Phone's cheat codes)



// Animation Info

// Misc. animation speeds
idle_anim_speed     = 0.1;
crouch_anim_speed   = 0.1;
walk_anim_speed     = 0.125;
dash_anim_speed     = 0.2;
pratfall_anim_speed = 0.25;

// Jumps
double_jump_time    = 32;		// 24   -  40
walljump_time       = 32;		// 18   -  32
wall_frames         = 2;		// may or may not actually work... dan pls

// Parry
dodge_startup_frames    = 1;
dodge_active_frames     = 1;
dodge_recovery_frames   = 4;

// Tech
tech_active_frames      = 3;
tech_recovery_frames    = 1;

// Tech roll
techroll_startup_frames     = 1;
techroll_active_frames      = 4;
techroll_recovery_frames    = 2;

// Airdodge
air_dodge_startup_frames    = 1;
air_dodge_active_frames     = 4;
air_dodge_recovery_frames   = 2;

// Roll
roll_forward_startup_frames     = 1;
roll_forward_active_frames      = 4;
roll_forward_recovery_frames    = 2;
roll_back_startup_frames        = 1;
roll_back_active_frames         = 4;
roll_back_recovery_frames       = 2;

// Crouch
crouch_startup_frames   = 2;
crouch_active_frames    = 8;
crouch_recovery_frames  = 2;

/*

Muno's Words of Wisdom: Due to a Certified Dan Moment, you must duplicate the
last frame of your crouch animation. So like, if your animation has 10 frames
total, add an 11th that's the copy of the 10th. You do NOT include this 11th
frame in the crouch_recovery_frames or etc; configure these values AS IF there
were only 10 frames.

The reason for this is that otherwise, the crouch just glitches out at the end
of the standing-up animation. Dan Moment

*/



// Hurtbox sprites
hurtbox_spr         = asset_get("ex_guy_hurt_box");
crouchbox_spr       = asset_get("ex_guy_crouch_box");
air_hurtbox_spr     = -1; // -1 = use hurtbox_spr
hitstun_hurtbox_spr = -1; // -1 = use hurtbox_spr

// Victory
set_victory_bg(sprite_get("victory_background")); // victory_background.png
set_victory_theme(sfx_jem_wolf_victory_jem); // victory_theme.ogg

// Movement SFX
land_sound          = asset_get("sfx_land_med");
landing_lag_sound   = asset_get("sfx_land_med2");
waveland_sound      = asset_get("sfx_waveland_abs"); // recommended to try out all 14 base cast wavedash sfx (see sfx page in roa manual)
jump_sound          = sfx_jem_wolf_jump_sound;
djump_sound         = sfx_jem_wolf_jump_sound;
air_dodge_sound     = asset_get("sfx_quick_dodge");

// Visual offsets for when you're in Ranno's bubble
bubble_x = 0;
bubble_y = 8;

//Temporal Light Self damage variable set at attack start
TL_DAMAGE = 200;
TL_FLAG=false;
TL_COUNTER = -1;
TL_LIMIT = 500;
TL_OVERRIDE = false;
dair_counter =array_create(0,0);
TL_MBBool = false;
TL_Death = false;
pain_damage=false;
crystal_lookup_table = array_create(10,"");
crystal_lookup_table[0]="B"
crystal_lookup_table[9]="M"
crystal_lookup_table[2]="D"
crystal_lookup_table[3]="F"
crystal_lookup_table[6]="J"
crystal_lookup_table[1]="C"
crystal_lookup_table[8]="L"
crystal_lookup_table[4]="G"
crystal_lookup_table[5]="H"
crystal_lookup_table[7]="K"
print_debug(string(crystal_lookup_table))
urls=string(url);
crystal_lock = false;
//magic system energy
gauge_val = 1;//max 4 used as a boost for attacks
TL_burning=false;
TL_GAUGE_OVERRIDE = false
//compatability
//Amber interaction
amber_herObj = noone;
amber_thisHugSprite = sprite_get("jem_hug");
amber_herHugSprite = sprite_get("amber_hug");
amber_startHug = false;
amber_thisSpriteInFront = false;
amber_autoTurnToHer = true;

amber_hugStartPos[0] = 42;
amber_hugStartPos[1] = 0;

amber_hugExitPos[0] = 42;
amber_hugExitPos[1] = 0;
amber_useSprDirOffset = true; 
amber_hugExitTimer = 30; 
amber_hugExitWindow = 3;
plushForAmber = sprite_get("plush");
//final smash compatability
fs_char_chosen_final_smash = "custom";
fs_char_portrait_y = 96;
fs_char_chosen_trigger = 'DSPECIAL'
fs_charge = 0;
//AT_JEM_WOLF_FINAL_SMASH = 49;
//kirby copy compatability
TCG_Kirby_Copy=1
kirbyability=1
//pkmn stadium compatability
pkmn_stadium_front_img = sprite_get("pkmn_stadium_front");
pkmn_stadium_back_img = sprite_get("pkmn_stadium_back");
pkmn_stadium_name_override = "JEMTWLGHT"
//otto compatability
otto_bobblehead_sprite = sprite_get("_pho_example_bobble_head");
otto_bobblehead_body_sprite = sprite_get("_pho_example_bobble_body");
//trummel compatability
trummelcodecneeded = false;
trummelcodec_id = noone;
//
title_counter=0;
tt_cntr=0;
Hikaru_Title = "";
Hikaru_Title2 = Hikaru_Title;
if(tt_cntr<500){
switch(title_counter){
	case 0:
	Hikaru_Title = "Lunar Princess";
	Hikaru_Title2 = Hikaru_Title;
	break;
	case 1:
	Hikaru_Title = "Multiverse Defender"
	Hikaru_Title2 = Hikaru_Title;
	break;
	case 2:
	Hikaru_Title = "Twilight Flame"
	Hikaru_Title2 = Hikaru_Title;
	break;
	case 3:
	Hikaru_Title = "wolfcat kitsune"
	Hikaru_Title2 = Hikaru_Title;
	break;
	case 4:
	Hikaru_Title = "Etherian Queen"
	Hikaru_Title2 = Hikaru_Title;
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
}
//Walle compatability
walle_taunt_sound = sound_get("Twilight_flame");
walle_taunt_type = 1;
//feri costume
feri_costume = sprite_get("feri_costume_jem");
//abyss hime compatability
abyssHime_deathspr = sprite_get("death");
//dracula compatability
dracula_portrait = sprite_get("_pho_example_speaker_dracula");
dracula_portrait2 = dracula_portrait; 
dracula_portrait3 = dracula_portrait; 
var page = 0;

//Page 0
dracula_speaker[page] = 0;
dracula_text[page] = "Who doth enter my domain...I can see you so stop your hiding. I can tell you are a strong mage to conceil your identity.What is thine reason for your trespass";
page++;

//Page 1
dracula_speaker[page] = 1;
dracula_text[page] = "I am Jem Wolfsbane and I am lost";
page++;

dracula_speaker[page] = 0;
dracula_text[page] = "Yet somehow thou entered my domain...wait is that a deathripper pin how did you get one speak!";
page++;

dracula_speaker[page] = 1;
dracula_text[page] = "I got it from my friend pyre deathripper.";
page++;

dracula_speaker[page] = 0;
dracula_text[page] = "You should know the deathripper tribe has long since tried to end my existance. since you are a friend to them. [glass]I will make you a example, have at thee[shake]";
page++;
//miiverse compatability
miiverse_post = sprite_get("mv");
//soulbound conflict compatability
battle_text  = "* Jem the multiverse defender draws near";
arena_title = "* Jem Wolfsbane the multiverse defender";
// TCO Support
tcoart = sprite_get("TCO");
//so sorry compatability
sorry_art = sprite_get("sorry");

url = "3219813397"
// MunoPhone Touch code - don't touch
// should be at BOTTOM of file, but above any #define lines

muno_event_type = 0;
user_event(14);

