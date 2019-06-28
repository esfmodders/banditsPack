/* AMX_LightningAdmin
     a requested admin announcing plugin
     
   By: CubicVirtuoso
   August 2005
     
   Requested by: warlock
   
   Warlock wanted a plugin that would load a custom admin list full of steamids and annouce when that player
   joined the server. Also he wanted it so that when they joined the server (or spawned in a round of CS) they
   would get struck by lightning much like the effect in my own plugin PopeLightning. So I decided to help him
   out since I already had half of it written.
   
   Create a txt file in your configs folder called adminslist.txt
   Each line in adminslist.txt should be a SteamID
   useing ";" comments out lines so they are ignored by the plugin
   
   Enjoy!
*/
   

#include <amxmodx> // Amx mod include definitions
#include <fun> // Fun Module
#include <amxmisc> // Useful functions
#include <engine> // Engine Plugin

new PLUGIN[]="LightningAdmin"
new AUTHOR[]="CubicVirtuoso"
new VERSION[]="1.00"

new adminid[256]
new adminlist[20][256]
new nextline = 0
new txtLen = 0
new adminamount = 0
new SpriteLightning, SpriteSmoke
new sparks[20][7]

public plugin_precache()
{
	precache_sound("ambience/sparks.wav") // Sparks sound for lightning
	precache_sound("ambience/port_suckin1.wav") // Thunder
	SpriteSmoke = precache_model("sprites/steam1.spr") // Smoke sprite
	SpriteLightning = precache_model("sprites/lgtning.spr") // Lightning sprite
	precache_model("sprites/xspark2.spr") // Spark sprite
}

public plugin_init()
{
	register_plugin(PLUGIN,VERSION,AUTHOR) // Register Function
	register_clcmd("say 1", "strikelightning2");
	register_clcmd("say 2", "strikelightning");
	
	/* Reads the file then puts it into an array of adminids */
	/* ID's MUST BE STEAM IDS!*/
	while(read_file("addons/amxmodx/configs/adminslist.txt",nextline++,adminid,255,txtLen))
	{
		if((adminid[0] == ';') || !txtLen) 
			continue
		
		for(new k=0; k<txtLen; k++)
		{
			adminlist[adminamount][k] = adminid[k]
		}
		adminamount++
	}
	
	for (new count=0;count<adminamount;count++)
	{
		server_print("Loaded: Custom Admin[%d]: %s", count, adminlist[count])
	}
}

public client_putinserver(id)
{
	new authid[32]
	get_user_authid(id,authid,32)
	server_print("User has connected: %s", authid)
	
	for(new i=0;i<adminamount;i++)
	{
		if(equali(authid,adminlist[i])==1)
		{
			new username[32]
			server_print("User %s is admin according to Custom Admin list", authid)
			get_user_name(id,username,32)
			client_print(0,print_chat,"Admin %s has entered the server",username)
			
			strikelightning(id)
			
			return PLUGIN_CONTINUE
		}
	}
	return PLUGIN_CONTINUE
}

public roundstart()
{
	new players[32]
	new playercount
	
	get_players(players,playercount,"a")

	for (new i=0; i<playercount; i++)
	{
		new authid[32]
		get_user_authid(players[i],authid,32)
		
		for(new k=0;k<adminamount;k++)
		{
			if(equali(authid,adminlist[k])==1)
			{
				strikelightning(players[i])
			}
		}
	}
	
	return PLUGIN_CONTINUE
}

public strikelightning(id)
{
	new playerlocation[3]
	get_user_origin(id,playerlocation)
		
		for (new i = 0; i<10; i++) // goes through lightning spawn 7 times
		{
				new randomlocation[3] // random location for lightning placement
				new higherlocation[3] // location higher up in the sky
				randomlocation[2] = playerlocation[2]-130 // sets the z value of the random location to the same as the players
				randomlocation[0] = playerlocation[0]+(random_num(-3000,3000)) // sets random location for lightning spawn
				randomlocation[1] = playerlocation[1]+(random_num(-3000,3000)) // similiar
						
				higherlocation[0] = randomlocation[0]+(random_num(-100,100))
				higherlocation[1] = randomlocation[1]+(random_num(-100,100))
				higherlocation[2] = randomlocation[2]+7800 // sets height
								
				beampoints(randomlocation, higherlocation, SpriteLightning, 1, 10, 30, 190, 100, 0, 0, 255, 200, 200) // creates lightning bolt
							
				emit_sound(id,CHAN_AUTO, "ambience/port_suckin1.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
		}	
		
	
}


/* SVC_TEMPENTITY Effect using TE_BEAMPOINTS
   INPUT: below for description
   OUTPUT: Beam between two points
*/
public beampoints(startloc[3], endloc[3], spritename, startframe, framerate, life, width, amplitude, r, g, b, brightness, speed)
{
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY)
	write_byte(0) // TE_BEAMPOINTS
	write_coord(startloc[0])
	write_coord(startloc[1])
	write_coord(startloc[2]) // start location
	write_coord(endloc[0])
	write_coord(endloc[1])
	write_coord(endloc[2]) // end location
	write_short(spritename) // spritename
	write_byte(startframe) // start frame
	write_byte(framerate) // framerate
	write_byte(life) // life
	write_byte(width) // line width
	write_byte(amplitude) // amplitude
	write_byte(r)
	write_byte(g)
	write_byte(b) // color
	write_byte(brightness) // brightness
	write_byte(speed) // speed
	message_end()
}
//-------------------------------------------------------------------------------------------------------
/* SVC_TEMPENTITY Effect using TE_SMOKE
   INPUT: below for description
   OUTPUT: Gentle smoke stream travelling upwards
*/
public smoke(startloc[3], spritename, scale, framerate)
{
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY)
	write_byte(5) // TE_SMOKE
	write_coord(startloc[0])
	write_coord(startloc[1])
	write_coord(startloc[2]) // start location
	write_short(spritename) // spritename
	write_byte(scale) // scale of sprite
	write_byte(framerate) // framerate of sprite
	message_end()
}
//-------------------------------------------------------------------------------------------------------

public stopsound()
{
	client_cmd(0,"stopsound") // stops sound on all clients 
}

public createspark(location[3], set, sparknum, id)
{
	new Float:LocVec[3]
	IVecFVec(location, LocVec)
	
	sparks[set][sparknum] = create_entity("env_sprite") // creates enterance ball
	if (!sparks[set][sparknum]) // if not exist
		return PLUGIN_HANDLED
					
	entity_set_string(sparks[set][sparknum], EV_SZ_classname, "Sparks") // set name
	entity_set_edict(sparks[set][sparknum], EV_ENT_owner, id) // set owner
	set_rendering(sparks[set][sparknum], kRenderFxNoDissipation, 0, 0, 0, kRenderGlow, 200) // normal and slight glow
	entity_set_int(sparks[set][sparknum], EV_INT_solid, 1) // not a solid but interactive
	entity_set_int(sparks[set][sparknum], EV_INT_movetype, 0) // set move type to toss
	entity_set_float(sparks[set][sparknum], EV_FL_framerate, 10.0) // Frame Rate
	entity_set_model(sparks[set][sparknum], "sprites/xspark2.spr") // enterance sprite
	entity_set_origin(sparks[set][sparknum], LocVec) // start posistion 
	DispatchSpawn(sparks[set][sparknum]) // Dispatches the Fire
	
	return PLUGIN_CONTINUE
}

public removesparks(posistion)
{
	for (new i = 0; i<7; i++)
	{
		remove_entity(sparks[posistion][i])
		sparks[posistion][i] = 0
	}
}