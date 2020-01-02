////////////////////////////////////////////////////////////////////////////////////////////////////////
// DHursty
//
// 80s Themes  
////////////////////////////////////////////////////////////////////////////////////////////////////////   

class UserConfig {
</ label="--------  Main theme layout  --------", help="Show or hide additional images", order=1 /> uct1="select below";
   </ label="Select listbox, wheel, vert_wheel", help="Select wheel type or listbox", options="listbox", order=4 /> enable_list_type="listbox";
   </ label="Select spinwheel art", help="The artwork to spin", options="marquee,wheel", order=5 /> orbit_art="wheel";
   </ label="Wheel transition time", help="Time in milliseconds for wheel spin.", order=6 /> transition_ms="25";  
</ label=" ", help=" ", options=" ", order=15 /> divider5="";
</ label="--------    Miscellaneous    --------", help="Miscellaneous options", order=16 /> uct6="select below";
   </ label="Enable monitor static effect", help="Show static effect when snap is null", options="Yes,No", order=18 /> enable_static="No"; 
   </ label="Random Wheel Sounds", help="Play random sounds when navigating games wheel", options="Yes,No", order=25 /> enable_random_sound="Yes";
}

local my_config = fe.get_config();
local flx = fe.layout.width;
local fly = fe.layout.height;
local flw = fe.layout.width;
local flh = fe.layout.height;
fe.layout.font="Lazer84.ttf";

// Load background image
local b_art = fe.add_image("Background.png", 0, 0, flw, flh );

// modules
fe.load_module("fade");
fe.load_module( "animate" );
fe.load_module("scrollingtext");
// Video Preview or static video if none available
// remember to make both sections the same dimensions and size
if ( my_config["enable_static"] == "Yes" )
{
//adjust the values below for the static preview video snap
   const SNAPBG_ALPHA = 200;
   local snapbg=null;
   snapbg = fe.add_image( "static.mp4", flx*0.09, fly*0.2, flw*0.3985, flh*0.5245 );
   snapbg.trigger = Transition.EndNavigation;
   snapbg.skew_y = 0;
   snapbg.skew_x = 0;
   snapbg.pinch_y = 0;
   snapbg.pinch_x = 0;
   snapbg.rotation = 0;
   snapbg.set_rgb( 155, 155, 155 );
   snapbg.alpha = SNAPBG_ALPHA;
}
 else
 {
 local temp = fe.add_text("", flx*0.09, fly*0.2, flw*0.3985, flh*0.5245 );
// temp.bg_alpha = SNAPBG_ALPHA;
 }

//create surface for snap
local surface_snap = fe.add_surface( 640, 480 );
local snap = FadeArt("snap", 0, 0, 640, 480, surface_snap);
snap.trigger = Transition.EndNavigation;
snap.preserve_aspect_ratio = false;

//now position and pinch surface of snap
//adjust the below values for the game video preview snap
surface_snap.set_pos(flx*0.09, fly*0.2, flw*0.3985, flh*0.5245);
surface_snap.skew_y = 0;
surface_snap.skew_x = 0;
surface_snap.pinch_y = 0;
surface_snap.pinch_x = 0;
surface_snap.rotation = 0;







// The following section sets up what type and wheel and displays the users choice

if ( my_config["enable_list_type"] == "listbox" )
{
local listbox = fe.add_listbox( flx*0.7, fly*0.087, flw*0.295, flh*0.61 );
listbox.rows = 21;
listbox.charsize = 23;
listbox.set_rgb( 0, 0, 153 );
listbox.bg_alpha = 0;
listbox.align = Align.Right;
listbox.selbg_alpha = 0;
listbox.sel_red = 0;
listbox.sel_green = 0;
listbox.sel_blue = 0;
//listbox.font = "Lazer84.ttf";
}

// Play random sound when transitioning to next / previous game on wheel
function sound_transitions(ttype, var, ttime) 
{
	if (my_config["enable_random_sound"] == "Yes")
	{
		local random_num = floor(((rand() % 1000 ) / 1000.0) * (124 - (1 - 1)) + 1);
		local sound_name = "sounds/GS"+random_num+".mp3";
		switch(ttype) 
		{
		case Transition.EndNavigation:		
			local Wheelclick = fe.add_sound(sound_name);
			Wheelclick.playing=true;
			break;
		}
		return false;
	}
}
fe.add_transition_callback("sound_transitions")

//Title text info
local textt = fe.add_text( "[Title]", flx*0.21, fly*0.819, flw*0.39, flh*0.04  );
textt.set_rgb( 0, 0, 0 );
//textt.style = Style.Bold;
textt.align = Align.Left;
textt.rotation = 0;
textt.word_wrap = true;

//Game count text info
local textgc = fe.add_text( "Game Count: [ListEntry]-[ListSize]", flx*0.21, fly*0.932, flw*0.4, flh*0.04  );
textgc.set_rgb( 0, 0, 0 );
//textgc.style = Style.Bold;
textgc.align = Align.Left;
textgc.rotation = 0;
textgc.word_wrap = true;

//Filter text info
local textf = fe.add_text( "Filter: [ListFilterName]", flx*0.47, fly*0.75, flw*0.2, flh*0.027  );
textf.set_rgb( 0, 0, 0 );
//textgc.style = Style.Bold;
textf.align = Align.Left;
textf.rotation = 0;
textf.word_wrap = true;

//Year text info
local texty = fe.add_text("Year: [Year]", flx*0.21, fly*0.876, flw*0.2, flh*0.04 );
texty.set_rgb( 0, 0, 0 );
//texty.style = Style.Bold;
texty.align = Align.Left;

//Players text info
local textpl = fe.add_text("Players: [Players]", flx*1.475, fly*0.74, flw*0.175, flh*0.025 );
textpl.set_rgb( 0, 0, 0 );
//textpl.style = Style.Bold;
textpl.align = Align.Left;

//Played Count text info
local textplc = fe.add_text("Played Count: [PlayedCount]", flx*1.575, fly*0.74, flw*0.175, flh*0.025 );
textplc.set_rgb( 0, 0, 0 );
//textplc.style = Style.Bold;
textplc.align = Align.Left;

//Manufacturer text info
local textm = fe.add_text("Manufacturer: [Manufacturer]", flx*1.35, fly*0.77, flw*0.35, flh*0.025 );
textm.set_rgb( 0, 0, 0 );
//textm.style = Style.Bold;
textm.align = Align.Left;

//Emulator text info
local textemu = fe.add_text( "[Emulator]", flx*0.018, fly*0.03, flw*0.6, flh*0.08  );
textemu.set_rgb( 0, 0, 0 );
//textemu.style = Style.Bold;
textemu.align = Align.Left;
textemu.rotation = 0;
textemu.word_wrap = true;

// Static media style
{
local boxartstatic = fe.add_artwork("boxart", flx*0.66, fly*0.74, flw*0.19, flh*0.2 );
boxartstatic.preserve_aspect_ratio = true;
}

{
local cartartstatic = fe.add_artwork("cartart", flx*0.8, fly*0.77, flw*0.15, flh*0.15 );
cartartstatic.preserve_aspect_ratio = true;
}

//category icons 

local glogo1 = fe.add_image("glogos/unknown1.png", flx*0.03, fly*0.83, flw*0.11, flh*0.17);
glogo1.trigger = Transition.EndNavigation;

class GenreImage1
{
    mode = 1;       //0 = first match, 1 = last match, 2 = random
    supported = {
        //filename : [ match1, match2 ]
        "action": [ "action","gun", "climbing" ],
        "adventure": [ "adventure" ],
        "arcade": [ "arcade" ],
        "casino": [ "casino" ],
        "computer": [ "computer" ],
        "console": [ "console" ],
        "collection": [ "collection" ],
        "fighter": [ "fighting", "fighter", "beat-'em-up" ],
        "handheld": [ "handheld" ],
		"jukebox": [ "jukebox" ],
        "platformer": [ "platformer", "platform" ],
        "mahjong": [ "mahjong" ],
        "maze": [ "maze" ],
        "paddle": [ "breakout", "paddle" ],
        "puzzle": [ "puzzle" ],
	    "pinball": [ "pinball" ],
	    "quiz": [ "quiz" ],
	    "racing": [ "racing", "driving","motorcycle" ],
        "rpg": [ "rpg", "role playing", "role-playing" ],
	    "rhythm": [ "rhythm" ],
        "shooter": [ "shooter", "shmup", "shoot-'em-up" ],
	    "simulation": [ "simulation" ],
        "sports": [ "sports", "boxing", "golf", "baseball", "football", "soccer", "tennis", "hockey" ],
        "strategy": [ "strategy"],
        "utility": [ "utility" ]
    }

    ref = null;
    constructor( image )
    {
        ref = image;
        fe.add_transition_callback( this, "transition" );
    }
    
    function transition( ttype, var, ttime )
    {
        if ( ttype == Transition.ToNewSelection || ttype == Transition.ToNewList )
        {
            local cat = " " + fe.game_info(Info.Category, var).tolower();
            local matches = [];
            foreach( key, val in supported )
            {
                foreach( nickname in val )
                {
                    if ( cat.find(nickname, 0) ) matches.push(key);
                }
            }
            if ( matches.len() > 0 )
            {
                switch( mode )
                {
                    case 0:
                        ref.file_name = "glogos/" + matches[0] + "1.png";
                        break;
                    case 1:
                        ref.file_name = "glogos/" + matches[matches.len() - 1] + "1.png";
                        break;
                    case 2:
                        local random_num = floor(((rand() % 1000 ) / 1000.0) * ((matches.len() - 1) - (0 - 1)) + 0);
                        ref.file_name = "glogos/" + matches[random_num] + "1.png";
                        break;
                }
            } else
            {
                ref.file_name = "glogos/unknown1.png";
            }
        }
    }
}
GenreImage1(glogo1);



