// phone - frontend

if object_index == asset_get("cs_playerbg_obj"){
	CORE_css_draw();
	exit;
}

CORE_general();
CORE_tips();
CORE_patches();
CORE_cheats();
CORE_frame_data();
CORE_muno_compatibility();


/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ CSS Draw																	║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

Set parameters that are used by the CSS drawing code.

*/

#define CORE_css_draw

// The number of alt costumes your char has, up to 32.
num_alts = 18;

// Whether or not to display a name for each alt.
use_alt_names = true;

// Which color slot in your char's colors.gml to use for certain UI elements.
// Type "noone" to make it always white.
// (you can also change it to different values depending on the alt, by using
// get_player_color(player))
alt_ui_recolor = noone;

// The list of names for the alts, if enabled.

alt_names = [
	"Jem Wolfsbane",
	"Pearlite Wolfsbane",
	"Crystal Lightbringer",
	"Kay neigh",
	"Jem Wolfsbane-yellow",
	"Jem Wolfsbane-GB",
	"Jem Wolfsbane-3D",
	"RoA Colors",
	"Jem Wolfsbane-blue",
	"Jem Wolfsbane-red",
	"Jem Wolfsbane-black",
	"Jem Wolfsbane-white",
	"Jem Wolfsbane-pink",
	"Jem Wolfsbane-abyss",
	"Extra references",
	"fallen down",
	"megalomaniac",
	"easiest enemy",
	"not in smash"
	];



/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ General Settings															║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

Set miscellaneous values to customize how your character interacts with the
MunoPhone Touch.

*/

#define CORE_general

// Character's name, used in a couple of places in the phone.
// (if you delete this line, it'd just use the config.ini name)
muno_char_name = "Jem";

// Whether or not the phone sprite should recolor w/ your alt costume.
// (set to "true" if you make a custom phone sprite in your char's colors)
phone.uses_shader = false;

// If you use a custom phone sprite that's taller than the default, enter how
// much taller it is here. (measured in ingame pixels; so if editing the default
// phone sprite, multiply it by two)
phone.extra_top_size = 0;

// Set to true and the "Fast Graphics" feature will be enabled; see _readme.gml.
phone.supports_fast_graphics = false;

// Set to true and the copyrighted sfx will be replaced with RoA menu sounds.
// They'll still be present in the files.
phone.copyright_safe_mode = false;

// Set to true and the phone will NOT activate Fast Fraphics when FPS gets low.
phone.dont_fast = false;

// Set to true and this will DISABLE a lot of the phone's side features, mostly
// the coding shortcuts.
// See _docs.gml for a full list of what it disables.
// If you don't intend to use any of those bonus features in your character,
// you should set this to true since it saves a bit of performance.
// (it's false by default since Phone Sandbert uses some of those features)
phone.lightweight = false;

// If you've created custom AG_ or HG_ indexes for your character already,
// use these to change where the phone starts assigning custom AG_s and HG_s.
// If you have no idea what that means, leave these alone!
// There's probably an upper bound here, but it's at least 200, so...
phone.starting_ag_index = 80;
phone.starting_hg_index = 80;

// The above, but for the AT_PHONE index.
// Maximum value is 50, minimum value (to avoid overlap w/ normal ones) is 39.
phone.phone_attack_index = 40;



/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ Tips																		║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

Add Tips to your character, giving info on how to play or trivia. You can add
both text and images. It's recommended to keep these short-and-sweet, as in the
examples.

Use the initTip() function to start a new Tip:

	initTip(name);

Then, use the following functions to add content or paragraphs:

	initWords(text)
	
	initWords_ext(text, alignment, color, indent, ignore_height)
	
	initImage(sprite, frame)
	
	initImage_ext(sprite, frame, alignment, xscale, yscale, uses_shader, color,
		alpha, ignore_height, crop_left, crop_right, crop_up, crop_down)

Glossary:
	
	"_ext" at the end of a function name means an extended version of the
		function it's named after - giving you more formatting options.
	
	"alignment" can be the GML constants fa_left, fa_center, or fa_right.
	
	"color" can be any GML color, e.g. c_red, #00ff00, or make_color_hsv(...).
		Set this to a string (e.g. "h"), and it will be colored to the main
		color of whichever phone app the text is being displayed in.
	
	"indent" basically allows you to put any amount of "tabs" to the left of a
		paragraph.
	
	"sprite" can be any sprite index, e.g. sprite_get(...) or asset_get(...).
	
	"ignore_height" prevents this element from pushing the one below it
		downward. Set this to true to achieve effects such as two elements
		being side-by-side.
	
	"frame" can be 0 or any positive number for a static image, or a negative
		number for an animated image. The size of the negative number determines
		the framerate; -1 is the fastest, -2 is half as fast, -3 a third, etc.
	
	"uses_shader" determines whether or not the image should recolor with the
		character's alt costumes.
	
	"crop_left", "crop_right", etc allow you to crop an image by determining how
		far from the image's offset it should be drawn. Set all four to "noone"
		and it will use the entire image (including empty space).

NOTE: It's recommended to separate each paragraph into its own initWords() line,
so that things like page breaks can work properly.

*/

#define CORE_tips

initTip("MAGIC BOOST SYSTEM");
initWords("this shows how much magic jem currently has.");
initWords("Jem uses magic energy to empower attacks. A full gauge means all attack damage you deal is multiplied by 4 whereas an empty gauge means no damage will be done for the attacks.");
initImage_ext(sprite_get("mana_gauge"), -4, fa_center, 1, 1, true, c_white,1, false,noone, noone, noone, noone);
initWords("The image above shows the mana gauge this will change colors as the gauge is filled the more red the gauge is the more empty it is whereas the more blue it is the more full it is.");
initWords("You might be asking how I gain this energy. This is simple hitting other players with non-special attacks.");
initWords("You lose energy when you are parried, if you take damage or if you used a non-neutral special attack below is a special case with special attacks.");
initWords("Dspecial:Temporal light-you take less burn damage on the first iteration if your multiplier is at least 3x. but afterword like most special attacks it puts it down to 0.05x but unlike the specials it is on first damage iteration rather than when it hits a player.");

initTip("TAUNT: Firey taunt");
initWords("taunt the enemy while creating a fireball. if a direction is held at the end of the taunt Jem will fling the fireball at high velocity in that direction. the fireball does 15% on impact but is blocked by walls and ground/platforms.")

initTip("JAB: FireSword Jab");
initWords("Jem does two slices up and down as well as a fire at the tip");
initImage_ext(sprite_get("jab"), -4, fa_center, 1, 1, true, c_white,1, false,noone, noone, noone, noone);

initTip("BAIR: heat cycle");
initWords("Jem creates a circle of fireballs that grow and combine into a large one than go back to a circle of fireballs.");
initImage_ext(sprite_get("bair"), -4, fa_center, 1, 1, true, c_white,1, false,noone, noone, noone, noone);

initTip("DAIR: heat crash");
initWords("Jem transforms into a flaming spiral and summons fireballs as she falls. these fireballs do 15 damage and home in toward the closest player. note they are blocked by walls, ground and platforms.");
initImage_ext(sprite_get("dair"), -4, fa_center, 1, 1, true, c_white,1, false,noone, noone, noone, noone);

initTip("DATTACK: stone punch dash");
initWords("While sliding Jem uses earth magic to create a fist out of the ground.");
initImage_ext(sprite_get("dattack"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);

initTip("DSPECIAL/FINAL SMASH: Temporal Light");
initWords("create an orb of light that anyone caught inside other than the player is launched at 350% the player(activator) also takes damage at 200% and if the activator where to surpass 500% it is an automatic loss of a stock but is counted after the attack is finished) if the player where to use the final smash however, the damage to the activator is 50%. The damage radius is very large. this attack is to only be used as a last resort. in addition, must do a different attack or will continually take damage as the light is torturing Jem.");
initImage_ext(sprite_get("dspecial"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);

initTip("DSTRONG: Fire Ring Compression");
initWords("Variation of FTILT where instead a ring is kicked up. if anyone gets close it grabs them compresses then flings them in the direction Jem is facing");
initImage_ext(sprite_get("dstrong"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);

initTip("DTILT: fireball whirl");
initWords("Jem does a spinning kick in which it grows a fireball that engulfs her(she is immune to this)");
initImage_ext(sprite_get("dtilt"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);

initTip("FAIR: firesword flury");
initWords("Jem summersaults in the air swinging her sword as she rotates.");
initImage_ext(sprite_get("fair"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);

initTip("FSPECIAL:vampiric flame");
initWords("Jem slides into an enemy on contact. It creates a volcanic platform that damages those who make contact every 1/4 second. the platform lasts between 2 and 4 seconds. in addition, Jem heals by any damage delt to the enemies. The caster is immune from damage. (Jem)");
initImage_ext(sprite_get("fspecial"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);
initImage_ext(sprite_get("plat"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);

initTip("FSTRONG: kick and burn");
initWords("During the charge, Jem slides slightly. All the while kicking the target and even if the kick misses, she breaths fire creating a large blade of fire");
initImage_ext(sprite_get("fstrong"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);

initTip("FTILT: burning shockwave kick");
initWords("kick up some walls of fire. nuff said");
initImage_ext(sprite_get("ftilt"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);

initTip("NAIR: fire vortex")
initWords("Jem spins in the air creating a fire vortex underneath her. as well as creating electrical whirls above the fiery vortex. This also slows the Jem’s decent.");
initImage_ext(sprite_get("nair"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);

initTip("NSPECIAL: Fire water ball");
initWords("Jem casts out a ball of flaming water. The consistency of the ball is near gel like which means it can bounce. It is recommended to use this in the air or on top of a platform over ground in which there is maximum effect.");
initImage_ext(sprite_get("nspecial"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);
initImage_ext(sprite_get("water_proj"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);

initTip("UAIR: fire wind updraft");
initWords("Jem turns into a small ember and uses twilight magic mixed with some wind (although she isn't good at it) to create an artificial updraft. This creates a huge burst of speed that if made contact can also send others flying. this attack when finished automatically cancels itself puts her into pratfall.");
initImage_ext(sprite_get("uair"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);

initTip("USPECIAL:smeaky fire");
initWords("Swap places with the farthest player to Jem. then have two fists of fire rise from the ground. If Jem is in the air, it heightens the jump. This was learned from studying the criminal underworld of Luna.");
initImage_ext(sprite_get("uspecial"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);

initTip("USTRONG: Firey eruption");
initWords("Extension of utilt where after launching the top off create a spike of fire. Any that collides with this creates another eruption somewhere near them. collisions with subsequent collisions do not create more eruptions. these secondary eruptions last at most 1 second.");
initImage_ext(sprite_get("ustrong"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);
initImage_ext(sprite_get("ustrong_art"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);

initTip("UTILT:fire jackhammer uppercut");
initWords("Create an orb of fire and launch the top hemisphere up at a high velocity.");
initImage_ext(sprite_get("utilt"), -4, fa_center, 1, 1, true, c_white, 1, false, noone, noone, noone, noone);




initTip("Jem's Lore");
initWords_ext("Background", fa_center, c_gray, 0, 0);
initWords("Jem is the eldest daughter of the royal family in Eather (a terraformed mars). her mother was a brown fox kitsune (pearlite wolfsbane) and her father was a midnight shadowcat(garnet wolfsbane). She has one sister that annoys her to no end. (and is a toxic megalomaniac) in terms of magic she is very proficient in fire and earth magic, she is one of a few that is able to use electrical magic fairly reliably. both of pearlite's children have the ability to use mental magic proficiently but Jem is the one whom has negative feelings about using it. in terms of physical strength, she is as strong as an Olympic human male weightlifter; partially gained from building the intrepid flyer mostly by herself (she had help with the frame but not the primary engine). occasionally cay neigh a kitsune babysat Jem and brier when they were young while their parents were out. Ember burnfeather is the school librarian at the magic school Jem attends and is a very close friend to her. (in some cases, treats her like her own child)");
initWords_ext("base info",fa_center,c_gray,0,0);
initWords("Real name: Jem fracture wolfsbane Lightbringer");
initWords("age: 25");
initWords("Birthday: September 20th");
initWords("parents: Garnet Wolfsbane, Pearlite Wolfsbane");
initWords("allies: Ember Burnfeather, Cay nigh,Dark Lightsbane");
initWords("sibling: Brier Wolfsbane");
initWords("Favorite food: Pizza, with a cheese sauce, black olives, and mushrooms, and bacon");
initWords("likes: old starships, electronics, projectile magic (though she will not admit it), video games.");
initWords("dislikes: theft, mind control, (she is uneasy with AI, but it is for the first reason and it ofthen makes mistakes otherwise she thinks it is a good thing), her sister.");
initWords_ext("Chapter 1+2", fa_center, c_gray, 0, 0);
initWords("Time it takes place: mid-june,6497AD");
initWords("the chapter starts as Jem is getting close to the age of succession (20years old) and she is called into the throne room. her parents (mostly garnet) put a ultimatum that she has to wed someone of royal blood by the end of the year or she is cut off. Jem although irritated by other events that happened and this initially shrugs it off and continues on her normal schedule. the only thing her parents left for her to use, is the family sword (she still has and uses in her jab attack) and a shabby house still that is still in the royal courtyard. she then walks to school where she relearns how to use fireballs. when she leaves, she is knocked unconscious and kidnapped.");

initWords("she awakens in the royal lunar dungeon and soon after freeing herself from the cell she is in, frees prince flare Lightbringer (his real name is Cumulo) and as they are escaping, she is attacked by bright signet. (flare's right-hand man). after the fight Jem spares bright under the condition that he only does kidnapping if her or flare commands it (this was done for flare's benefit and flare was rightfully angry with him after as that could have started a war. but the biggest part he was angry was he was kept out of the loop). flare drops Jem off at Eather, and after her ship was returned, she started to do some research on him. ember noticed the research and got concerned and after learning of what happened she told Jem's parents");

initWords("garnet was livid that Jem fell in love with a criminal, but pearlite remained cautious but was overridden by garnet a few times she tried to diffuse the situation which majorly confused Jem and obviously garnet mostly ignored it. garnet ignored this to an extent had made another ultimatum that both Jem and flare had to prove their love is genuine to his satisfaction or will put an execution order on both. Jem then called flare over. and garnet started a few tests. after a test pearlite realized that these tests are dumb and is mostly testing Jem rather than flare. bright put the whole world under siege and threatened to fire Hyperion cannons at the planet if Jem and flare are not released unharmed. soon after flare proposed, and Jem accepted. both garnet (under mind control of pearlite) and pearlite gave their blessing.");

initWords("chapter 2 mostly takes place on earth and other than Jem being attacked by corrupt solar council member not much to write about happened"); 

initWords_ext("Chapter 3", fa_center, c_gray, 0, 0);

initWords("chapter 3 takes place a few years later she had a daughter named crystal in which crystal had an extreme amount of magic power. Jem being the cautious one decided to find out how much magic power in a safe manner. flare took that as a way of saying to cut off crystal's magic power. So, he taught crystal how to use magic despite Jem just telling him to wait. after some time passes flare loses track of crystal. Jem decides to look for her and finds her in the basement of the intrepid flyer's hanger. crystal wanted to show Jem the magic she was taught. Despite Jem's protest to not do the spell, crystal did it anyways and severely hurt Jem. (thankfully she survived and made a quick recovery) after a few months pass Jem awakens from being knocked unconscious and called for a family meeting to update her on what has happened since. while she was unconscious, she had a vision telling her to build a starship capable of exceeding the speed of light. the after finding the book that had a curse (she used it as a blessing) that can reduce the amount of magic power crystal had (this was nearing low to mid nuclear weapon level). while flare did have reservations on using the spell he helped Jem cast it. after this she starts the temporal knife project and tells Billy (character from another game and classmate to Jem) to rebuild the hanger.");

initWords_ext("Chapter 4+5 ", fa_center, c_gray, 0, 0);

initWords("not much is allowed to be known from this point forward other than Jem inadvertently faked her death. her sister taking full control of Eather, flare escaped to luna the only place that brier could never touch. he swapped crystal's first name and middle name which was light as an added means of protecting her from brier. meanwhile Jem awoke in an unknown universe with knowledge of magic to allow her to travel the multiverse.");

initWords_ext("Chapter??? (this is from this game)", fa_center, c_gray, 0, 0);

initWords("Jem awakens on the shores of the fire empire. unsure of how she got here she investigates the nearby area.");

/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ Patches																	║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

Keep a record of your character's update history, and at the end, also give
credits to the developer(s) of the character or any assets used.

Use the initPatch() function to start a new Patch:

	initPatch(version_number, date)

If the "date" field is set to an empty string, then the Patch will act more like
a Tip - mainly useful for making an "About [character]" page.

Use the same functions as in the Tips app to populate the Patch with text and
images.

Here are two more content functions, which are designed for use in Patches but
also work in Tips:

	initHeader(text)
	initSection(text)

These are basically shortcuts for two different types of formatted text.
initHeader() is a text heading that is colored either blue or green, depending
on whether it's a Tip or a Patch. initSection() is an indented block of text.

These are handy for dividing a Tip/Patch into sections, such as different moves
in a Patch.

*/

#define CORE_patches


// Recommended template for non-Sandbert characters (delete the other patches):
initPatch("1.10","9 may,2024");
initSection("cosmetic:added a frame to the mana gauge that changes color based on the gui color");
initSection("balancing:reset mana gauge on death. if killed by her DSPECIAL via self damage or if her user_event6 was called it is reset to 0.05x otherwise it is reset to 1x");
initSection("balancing:parrying and got parried where filpped in mana gauge behavior. this update reversed it and got it corrected.");
initSection("balancing:corrected the damage multiplier code to keep ot consistant with the attack values")
initPatch("1.9","9 may,2024");
initSection("Fixed grammer in the Tips section of the munophone. as well as minor changes");
initSection("added giffs to the main page showing the attacks as they are")
initPatch("1.8","6 may,2024");
initSection("added crystal anticheat")
initPatch("1.7","4 may,2024");
initHeader("reballanced the character")
initSection("changed movement speed and acceleration")
initSection("decreased the damage and knockback Dspecial deals (self damage is still the same and the final smash version is unchanged)");
initSection("decreased the damage Dair deals")
initSection("fixed a bug that in which hitpause was not taken into account in the down air attack where instead of doing 2 fireballs it did 10.");
initSection("");
initSection("");
initHeader("ideas that was thaught about but decided against it");
initSection("doing 5% self damage for everytime she hits a enemy. (shockingly this is can be more deadly to jem than the person she is hitting especially if the magic gauge is low. this is a overcorrection [jab damage delt 10*.05<1 thus it is rounded to 1% the difference is added/subtracted in the hit_player.gml and Dspecial pre nerf 500*.05=25% but the self damage is considerably higher at 205+200DPS%])");
initSection("");
initSection("reducing Dspecial to below 100. (this was rejected as that is the whole point of the attack. this is designed as a high risk, high reward attack... if you look at the lore it is supposed to kill those she attacked. since jem doesn't have enough magic to cast it without the spell taking random organs this is shown by the self damage.[this would make the maximum damage done with a max magic gauge = 400% self damage is 100+200DPS% the only drawback is that would take a long time to get this high of a gauge. the reason why is if the gauge is 3/4 full there is a 100% is reduced from the self damage])");
initSection("");
initSection("changing Dspecial to something else(The issue is I can't think of a suitable replacement. if you have any ideas please don't hesitate to put it in the Suggestions/compatability request descussion.[even if I don't use it for jem I may use it for other characters from the same series]. what is in the articles is 1:entirely visual elements. 2: projectile articles 3:unused. ground: only munophone uses this.(but is independent) so unused. platform: used in the Fspecial attack)")
initPatch("1.6","4 may,2024");
initSection("fixed the Down air attack to do create homing fireballs");
initSection("added if a direction is held at the end of her taunt it would generate a fireball in the direction(in increments of 45 degrees) this is also at high speed");
initSection("both attacks that use fireballs damage at 15% and are blocked by platforms/ground")
initPatch("1.5","2 may,2024");
initSection("fixed compatability sprites")
initPatch("1.4","1 may,2024");
initSection("changed the preview of the character to be more accurate to the original game's color schemes for the starship Jem is in. This is her personal ship the intrepid flyer");
initSection("(the old one is still in the character folderbut with the _old added to the name)");
initPatch("1.3","30 april,2024");
initSection("made Jem's DSpecial more modifiable via other mods")
initPatch("1.2","29 april,2024");
initHeader("sprite changes");
initSection("changed most of the dodge states to have more frames and less rugged pixels");
initSection("changed the taunt (the old file was renamed to taunt_old if anyone still wants it)");
initSection("cleaned up the win portrait");
initSection("changed the colors.gml to have similar colors grouped to fit better");
initPatch("1.1","28 april,2024");
initSection("Fixed bug in user event 15 in which the munophone connects to");
initPatch("1.0","28 april,2024");
initHeader("FULL RELEASE");
initSection("did minor balancing to all attacks");
initHeader("added compatability");
initSection("feri compatability-costume");
initSection("another kirby compatability");
initSection("abyss hime compatability-death sprite added");
initSection("dracula boss intro compatability-lore added");
initSection("miiverse compatability added");
initSection("rat compatability added");
initSection("soulbound conflict compatability");
initSection("the chosen one compatability");
initSection("so-sorry compatability");

initPatch("0.7","27 april,2024");
initHeader("added compatability");
initSection("added Hikaru compatablity:the title changes depending on the number of attacks jem has taken... if under 500 hits it uses mod 5 0=Lunar Princess, Hikaru,1=Multiverse Defender Hikaru,2=Twilight Flame, Hikaru , 3=wolfcat kitsune, Hikaru 4=Etherian Queen, Hikaru, default= ERROR, Hikaru ,if 500+ bloodthirsty, Hikaru");
initSection("added walle compatability:taunt song is jem's battle theme Twilight Flame");
initHeader("added attack");
initSection("added UStrong: Firey eruption(extension of utilt where after launching the top off create a spike of fire. any that colide with this creates another eruption somewhere near them. collisions with subsequent colisions do not create more eruptions. these secondary eruptions last at most 1 second)");
initPatch("0.6","27 april,2024");
initHeader("munophone modifications");
initSection("changed the phone sprite");
initSection("decreased the size of the app icon");
initSection("changed the sound effects to my game's sound effects");
initHeader("added attacks");
initSection("added FSpecial(slide into a enemy on contact it creates a volcanic platform that damages those who make contact every 1/4 second. the platform lasts between 2 and 4 seconds. in addition jem heals by any damage dealt to the enenies)")
initPatch("0.5","24 april, 2024");
initHeader("added attacks");
initSection("added Dstrong(variation of FTILT where instead a ring is kicked up. if anyone gets close it grabs them compresses then flings them in the direction jem is facing)");
initSection("added Ftilt discriptor");
initSection("changed order of attacks in munophone to not be in a random order");
initHeader("Compatability additions");
initSection("added pokemon colleseum compatability->added front/back sprites. changed the name to her pen name 'JEM TWILIGHT'");
initSection("added kirby compatability->fire hat");
initSection("added otto compatability->bobblehead and body");
initPatch("0.4","23 april, 2024");
initHeader("added attacks");
initSection("added Uspecial(swap places with the farthest player from you then do a uppercut in the air)");
initSection("added Utilt(create a orb of fire then launch the top hemisphere up at extreme speed)");
initHeader("added MANA Gauge");
initHeader("added air dodges");
initPatch("0.3","16 april, 2024");
initHeader("compatability update");
initSection("updated munophone to munophone touch");
initSection("added amber character compatability");
initSection("added final smash buddy compatability");
initHeader("attack update");
initSection("down special and final smash(from the buddy)");
initSection("d special-Temporal Light(create a orb of light that anyone caught inside other than the player is launched at 500%. the player(activator) also takes damage at 200% and if the activator where to surpass 500% it is a automatic loss of a stock but is counted after the attack is finished).full details is in the tips section");
initSection("n special-fire water ball(create a flaming ball of water and fling at a enemy)");
initPatch("0.2", "4 april, 2024");
initHeader("finish main arials");
initSection("added nair, uair(and thair details to the tips), spinhurt, changed the win screen portrait");
initPatch("0.1", "12 april, 2024");
initHeader("START CHARACTER");
initSection("initial development of the character. using sandbert as a starting point But I am not planning on keeping it this way.");


/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ Cheats																	║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

Create options for players to change how the character plays, either as silly
fun bonuses or useful training utilities (e.g. filling a meter instantly).

Use the initCheat() function to create a Cheat:

	CHEAT_[NAME_HERE] = initCheat(name, [options], [option_names], description)

Glossary:
	
	"CHEAT_[NAME_HERE]" is a variable that stores the ID of the Cheat. In the
		example below, CHEAT_FLY is equal to 0. This is necessary for
		referencing your cheat later in your character's code.
	
	"[options]" is an array of the possible values that the Cheat can have. A
		simple example is [0, 1] for on and off, but it could also be something
		like [0, 1, 5, 9] or ["Cherry", "Strawberry", ""].
	
	"[option_names]" is an array of the displayed names for the options given in
		"[options]". It should be the same length as "[options]", and each entry
		should be a string.
	
To access a Cheat's current value inside your character's code, grab the entry
in the "phone_cheats" array at the index of the "CHEAT_" variable. For example:

	// update.gml
	
	if phone_cheats[CHEAT_FLY] == 1{
		vsp = -2;
	}

The "phone_cheats" array entry holds whatever value you defined in "[options]",
for the Cheat's current setting. (e.g. "phone_cheats" could contain a string,
not just a number)

You can also run code only at the moment that the Cheat was clicked on, by
using the "phone_cheats_updated" array (each entry is just true or false):
	
	// update.gml
	
	if phone_cheats_updated[CHEAT_FLY]{
		phone_cheats_updated[CHEAT_FLY] = 0; // you have to reset it yourself
		if phone_cheats[CHEAT_FLY]{
			print("Flight started");
		}
		else{
			print("Flight ended");
		}
	}

Pro tip: having a Cheat with only a single option is useful if you just need a
"click button to do X" thing for your character, e.g. "click to reset meter to
zero".

*/

#define CORE_cheats

//CHEAT_FLY		= initCheat("Fly", [0, 1], ["Off", "On"], "Take flight. So balanced
//
//(hold shield to not fly)");
cheat_perma_final_smash = initCheat("Infinate Final Smash", [0, 1], ["Off", "On"], "Final Smash is always charged.");
cheat_maximum_magic = initCheat("infinate magic", [0, 1], ["Off", "On"], "Magic boost gauge is always filled");
cheat_magic_double = initCheat("double magic", [0, 1], ["Off", "On"], "doubles the magic damage from the Magic boost");
cheat_enable_anticheat1 = initCheat("anticheat slot 1",[0,1],["Off","On"],"activates the anticheat on slot 1");
cheat_enable_anticheat2 = initCheat("anticheat slot 2",[0,1],["Off","On"],"activates the anticheat on slot 2");
cheat_enable_anticheat3 = initCheat("anticheat slot 3",[0,1],["Off","On"],"activates the anticheat on slot 3");
cheat_enable_anticheat4 = initCheat("anticheat slot 4",[0,1],["Off","On"],"activates the anticheat on slot 4");
cheat_view_encrypted_url = initCheat("view encrypted url data",[0,1],["Off","On"],"prints the encrypted url to console")


/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ Frame Data																║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

Customise the Frame Data guide.

*/

#define CORE_frame_data

// Reorder this list to change the order that moves appear in the guide!
phone.move_ordering = [
	AT_JAB,
	AT_FTILT,
	AT_DTILT,
	AT_UTILT,
	AT_DATTACK,
	AT_FSTRONG,
	AT_USTRONG,
	AT_DSTRONG,
	AT_FSTRONG_2,
	AT_USTRONG_2,
	AT_DSTRONG_2,
	AT_NAIR,
	AT_FAIR,
	AT_BAIR,
	AT_UAIR,
	AT_DAIR,
	AT_NSPECIAL,
	AT_NSPECIAL_AIR,
	AT_NSPECIAL_2,
	AT_FSPECIAL,
	AT_FSPECIAL_AIR,
	AT_FSPECIAL_2,
	AT_USPECIAL,
	AT_USPECIAL_GROUND,
	AT_USPECIAL_2,
	AT_DSPECIAL,
	AT_DSPECIAL_AIR,
	AT_DSPECIAL_2,
	AT_NTHROW,
	AT_FTHROW,
	AT_UTHROW,
	AT_DTHROW,
	AT_EXTRA_1,
	AT_EXTRA_2,
	AT_EXTRA_3,
	AT_TAUNT,
	AT_TAUNT_2,
	AT_PHONE,
	2,
	3,
	39,
	42,
	43,
	44,
	45,
	46,
	47,
	48,
	49,
	50
];

// Whether or not to include the "Stats" page.
phone.include_stats = true;

// Notes for the "Stats" page - put "-" for no notes.
phone.stats_notes = "-";

// Whether or not to include a custom data page, which can hold any values you
// want - useful for data that's specific to your character's mechanics.
phone.include_custom = false;

// The name of the custom page.
phone.custom_name = "Example Custom Data"

// The content of the custom page.
initCFDHeader("Article lifetime");
initCFDBody("100 frames");
initCFDHeader("Second value");
initCFDBody("459");
initCFDBody("epic");



/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ Muno Character Compatibility												║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

Add bonus features and interactions with Muno's characters, like a codec for
Trummel & Alto.

If you don't feel like adding one of them, you can just comment out the lines
of code.

*/

#define CORE_muno_compatibility

/*
Trummel codec:

initCodec(gimmick)
initCodecPage(speaker, expression, gimmick, text)

The variable trummel_id is initially set to noone (-4). When Trummel opens this
char's codec, trummel_id is set to Trummel's object ID.

Codec speaker handles:
SPK_TRUM: Trum
SPK_ALTO: Alto
SPK_OTTO: Otto
SPK_CODA: Coda
SPK_ECHO: Tempo
SPK_MINE: Steve (i dont normally use this one... like, what is he supposed to say?? the funny oof noise? you can if you want)
SPK_SEGA: Sonic (see above)

Codec speaker expressions:
https://pastebin.com/qTLnsNFY

Codec gimmicks:
there aren't any

Page gimmicks:
GIM_CHOMP			make the enemy ftilt
GIM_CLONE 			display 2 speakers
GIM_LAUGH_TRACK		play the funny haha sound
GIM_SKIP 			advance the page immediately when the text finishes
GIM_DIE				die
GIM_SHUT_UP			no chatter sfx
GIM_HOWL			make the enemy dspecial
GIM_SHADER			use your char's shaders (palette swaps) for the speaker portrait
GIM_TEXTBOX			text color				is set to the value of the	spr_custom_trummel_textbox	variable in the player object
GIM_COLOR			textbox sprite index	is set to the value of the	spr_custom_trummel_color	variable in the player object

To use multiple gimmicks on a single page, MULTIPLY them together.
*/
try{
// Custom speaker setup - use 1, 2, 3, 4, ... for the index.
SPK_JEM = initSpeaker(1, "JEM", sprite_get("_pho_example_speaker"));
SPK_JEM2 = initSpeaker(2, "DARK JEM", sprite_get("_pho_example_speaker"));
spr_custom_trummel_color=c_purple;
    initCodecPage(SPK_ALTO,2,0,"Jem Wolfsbane...don't think I heard of her...Found the wiki she is in...");
    initCodecPage(SPK_ALTO,2,GIM_SKIP,"Jem Wolfsbane or Should I say Jem Lightbringer the former queen of Eather.");
    initCodecPage(SPK_JEM,0,GIM_COLOR,"What do you mean former I still am the current queen");
    initCodecPage(SPK_ALTO,0,0,"Let me continue, after you unwillingly faked your death your sister forcibly took the throne");
    initCodecPage(SPK_ALTO,0,0,"and plunged Eather in darkness.your daughter is helping your husband build the temporal knife project you started.");
    initCodecPage(SPK_JEM,0,GIM_COLOR,"Crystal is only 5 that shouldn't be allowed");
    initCodecPage(SPK_ALTO,0,0,"I am going to break this to you since you left your universe. time goes by at a faster rate");
    initCodecPage(SPK_ALTO,0,0,"... to be more specific you have been gone for the equivalent of 10 years");
    initCodecPage(SPK_ALTO,10,0,"I would feel sorry for you If it were not for your down special.that is broken and unforgivable");
    initCodecPage(SPK_JEM,0,GIM_COLOR,"down special? do you mean the temporal light spell. while it is powerful there is drawbacks to using");
    initCodecPage(SPK_JEM,0,GIM_COLOR,"it. it isn't just use it and all your problems go away. the biggest is the energy requirement,without");
    initCodecPage(SPK_JEM,0,GIM_COLOR,"serious injury and I could maybe only use it 3 times maximum without dying. in addition it severely");
    initCodecPage(SPK_JEM,0,GIM_COLOR,"debuffs all my attacks.Is crystal still alive and fine?");
    initCodecPage(SPK_ALTO,8,0,"I will say this she is still alive your husband renamed her to Light to confuse Brier");
    initCodecPage(SPK_TRUM,7,0,"(wispering) is that really what happened and shouldn't we be respectful she is royalty?");
    initCodecPage(SPK_ALTO,9,0,"(wispering)it is a half truth I don't actually know what happened to crystal I assumed from the wiki");
    initCodecPage(SPK_ALTO,9,0,"(wispering)also jem dislikes it when people act not like themselves after learning about who she is.");
    initCodecPage(SPK_ALTO,9,0,"also she technically isn't a royal anymore");
    initCodecPage(SPK_TRUM,0,0,"(wispering) oh");
    initCodecPage(SPK_JEM,0,GIM_COLOR,"you should know I can read minds and I do have very good hearing Alto is it what you where");
    initCodecPage(SPK_JEM,0,GIM_COLOR * GIM_LAUGH_TRACK,"just thinking of was funny.To think I am in a video game");
    initCodecPage(SPK_ALTO,0,0,"it is true, you are in a game called Rivals of Aether. and you originate from the series called");
    initCodecPage(SPK_ALTO,2,0,"Temporal Light the wiki never defined it what is Eather");
    initCodecPage(SPK_JEM,0,GIM_COLOR,"I feared this Eather wasn't always called that it was originally called mars before terraformation");
    initCodecPage(SPK_ALTO,5,GIM_LAUGH_TRACK,"mars I didn't think that was the case you don't look green or alien.well at least no more than this world");
    initCodecPage(SPK_JEM,0,GIM_COLOR,"well If I do you would be the first to know");
    initCodecPage(SPK_TRUM,7,0,"what does she mean by that");
    initCodecPage(SPK_ALTO,0,0,"she has limited ability to use teleportation magic.she can can teleport small objects or one large one. though her");
    initCodecPage(SPK_ALTO,0,0,"preference is fire magic");
    initCodecPage(SPK_JEM,0,GIM_COLOR,"(internal thoughts) maybe I should bring Flare and my child...nevermind that could be problematic");
}catch(e){
	print_debug(string(e));
}

// Otto bobblehead.
otto_bobblehead_sprite = sprite_get("_pho_example_bobble_head");

// Otto bobblehead body. (optional, don't really need this)
otto_bobblebody_sprite = sprite_get("_pho_example_bobble_body");

// Steve death message.
steve_death_message = "You may not rest now there are monsters nearby...oh wait nevermind";

// Link spear. (determines which spear your char will drop the first time)
link_spear_drop = 5;//flamespear

/*
Spear IDs:

1: Traveler's Spear
2: Knight's Halberd
3: Wooden Mop
4: Spiked Boko Spear
5: Flamespear
6: Frostspear
7: Thunderspear
8: Guardian Spear
*/

// Palutena's Guidance (for RuberCuber's Pit character)
// Works kind of similarly to Trummel codecs.
// initCodecPagePit(speaker, expression, voice, text);
// List of expressions and voice clips: https://pastebin.com/wsz22ZwJ

initCodecPit();
//initCodecPagePit(SPK_PIT,	3,	0,	"Hey, it's Sandbert!");
//initCodecPagePit(SPK_PIT,	1,	6,	"...Isn't he a bit above my power level?");
//initCodecPagePit(SPK_PALU,	0,	3,	"Actually, this version of Sandbert has received a lot of nerfs to his damage and frame data.");
//initCodecPagePit(SPK_PALU,	0,	2,	"He can't even cancel his USpecial or end it early anymore!");
//initCodecPagePit(SPK_VIR,	5,	1,	"But yes, Pit, he IS still above your power level.");
//initCodecPagePit(SPK_PIT,	6,	0,	"Pssh, sounds like a pushover to me.");
//initCodecPagePit(SPK_PALU,	0,	4,	"Don't be so sure - despite the nerfs, his power and attack speed are still a force to be reckoned with.");
//initCodecPagePit(SPK_PALU,	0,	2,	"Also, he has the same MunoPhone as you do - so he'll be well-versed in his frame data and combos.");
//initCodecPagePit(SPK_VIR,	6,	4,	"Maybe you should turn on some Cheats for this fight, Pit?");
//initCodecPagePit(SPK_PALU,	0,	2,	"No, I'm sure he'll be fine.");
//initCodecPagePit(SPK_PALU,	2,	5,	"...As long as he avoids the Kamehameha.");
//initCodecPagePit(SPK_PIT,	4,	1,	"The WHAT?!?");



/*
╔═══════════════════════════════════════════════════════════════════════════╗
║																			║
║ Behind-The-Scenes															║
║																			║
╚═══════════════════════════════════════════════════════════════════════════╝

This is the end of the stuff you need to worry about!

Below this point are just all of the functions used to make the above sections
work.

It's not recommended to edit anything below here unless you know what you're
doing and have a good reason to.

*/

#define initTip(tip_name)

array_push(phone.tips, {
	name: tip_name,
	objs: [],
	page_starts: [0]
});

phone.currently_edited_obj = phone.tips[array_length(phone.tips) - 1];

initWords_ext("- " + tip_name + " -", fa_center, phone.apps[phone.APP_TIPS].color, 0, 0);

#define initPatch(patch_version, patch_date)

array_push(phone.patches, {
	name: (patch_date == "" ? "" : "v") + patch_version,
	objs: [],
	page_starts: [0]
});

phone.currently_edited_obj = phone.patches[array_length(phone.patches) - 1];

if patch_date == ""{
	initWords_ext("- " + patch_version + " -", fa_center, phone.apps[phone.APP_PATCHES].color, 0, 0);
}
else{
	initWords_ext("- v" + patch_version + ": " + patch_date + " -", fa_center, phone.apps[phone.APP_PATCHES].color, 0, 0);
}

#define initHeader(obj_text)

initWords_ext(obj_text, fa_left, "h", 0, 0);

#define initSection(obj_text)

initWords_ext(obj_text, fa_left, c_white, 1, 0);

#define initWords(obj_text)

array_push(phone.currently_edited_obj.objs, {
	type: 0,
	text: obj_text,
	align: fa_left,
	color: c_white,
	indent: 0,
	side_by_side: false
});

#define initWords_ext(obj_text, obj_align, obj_color, obj_indent, obj_ignore_height)

array_push(phone.currently_edited_obj.objs, {
	type: 0,
	text: obj_text,
	align: obj_align,
	color: obj_color,
	indent: obj_indent,
	side_by_side: obj_ignore_height
});

#define initImage(obj_sprite, obj_frame)

array_push(phone.currently_edited_obj.objs, {
	type: 1,
	sprite: obj_sprite,
	frame: obj_frame,
	align: fa_center,
	xscale: 1,
	yscale: 1,
	uses_shader: 1,
	color: c_white,
	alpha: 1,
	margin_l: noone,
	margin_r: noone,
	margin_u: noone,
	margin_d: noone,
	needs_auto_margins: true,
	side_by_side: false
});

#define initImage_ext(obj_sprite, obj_frame, obj_align, obj_xscale, obj_yscale, obj_uses_shader, obj_color, obj_alpha, obj_ignore_height, obj_l, obj_r, obj_u, obj_d)

array_push(phone.currently_edited_obj.objs, {
	type: 1,
	sprite: obj_sprite,
	frame: obj_frame,
	align: obj_align,
	xscale: obj_xscale,
	yscale: obj_yscale,
	uses_shader: obj_uses_shader,
	color: obj_color,
	alpha: obj_alpha,
	margin_l: obj_l,
	margin_r: obj_r,
	margin_u: obj_u,
	margin_d: obj_d,
	needs_auto_margins: (obj_l == noone && obj_r == noone && obj_u == noone && obj_d == noone),
	side_by_side: obj_ignore_height
});

#define initCheat(ch_name, ch_opt, ch_opt_name, ch_desc)

array_push(phone.cheats, {
	name: ch_name,
	options: ch_opt,
	option_names: ch_opt_name,
	description: ch_desc,
	on: 0
});

array_push(phone_cheats, ch_opt[0]);
array_push(phone_cheats_updated, 0);
return array_length(phone.cheats) - 1;

#define initCFDHeader(text)

array_push(phone.custom_fd_content, {
	type: 0, // header
	content: text
});

#define initCFDBody(text)

array_push(phone.custom_fd_content, {
	type: 1, // body
	content: text
});

#define initCodec(cd_gimmick)

if "trummel_codecs" not in self trummel_codecs = [];

var new_cdc = {
	gimmick: cd_gimmick,
	pages: []
};

array_push(trummel_codecs, new_cdc);

#define initCodecPage(cd_speaker, cd_expression, cd_gimmick, cd_text)
if "trummel_codecs" not in self initCodec(0);
var new_page = {
	speaker: cd_speaker,
	expression: cd_expression,
	gimmick: cd_gimmick,
	text: cd_text
};

array_push(trummel_codecs[array_length(trummel_codecs) - 1].pages, new_page);

#define initSpeaker(idx, speak_name, speak_sprite)

if "trummel_speakers" not in self trummel_speakers = [];

trummel_speakers[idx] = {
	name: speak_name,		// Name displayed while talking
	sprite: speak_sprite	// Sprite of face
};

return idx * -1;

#define initCodecPit()

with oPlayer if "ruber_pit" in self {
	load_codecs = true;
}

pit_codecs = [];

var new_cdc = {
	pages: []
};

array_push(pit_codecs, new_cdc);

#define initCodecPagePit(cd_speaker, cd_expression, cd_sfx, cd_text)
var new_page = {
	speaker: cd_speaker,
	expression: cd_expression,
	sfx: cd_sfx,
	text: cd_text
};
array_push(pit_codecs[array_length(pit_codecs) - 1].pages, new_page);

