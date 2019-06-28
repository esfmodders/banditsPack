#include <amxmodx>
#include <engine>
#include <engine_const>
#include <fun>
#include <fakemeta>
#include <fakemeta_const>

public plugin_init()
	
{

	register_plugin("[EvoSSJ4]","[DEVEL]","[EncorE_SX]")
	register_message( get_user_msgid( "Explosion" ) , "explosion1")
	register_message( get_user_msgid( "Explosion" ) , "explosion2")
	register_message( get_user_msgid( "Explosion" ) , "explosion3")
	register_message( get_user_msgid( "Flare" ), "flare1" );
	register_message( get_user_msgid( "Flare" ), "flare2" );
	register_message( get_user_msgid( "EETrail" ), "trail" );
	register_message( get_user_msgid( "EETrail" ), "trail2" );
	register_message( get_user_msgid( "EETrail" ), "trail3" );
	register_forward( FM_EmitSound, "EmitSound" );
	register_forward( FM_EmitSound, "EmitSound2" )
	register_forward( FM_EmitSound, "EmitSound3" )
	register_forward( FM_EmitSound, "EmitSound4" );
	register_cvar(".giji","1")
	register_forward( FM_GetGameDescription, "GameDesc" )
	register_event( "DeathMsg","giji_ssj_death",  "a" )
	register_event("DeathMsg",  "DeathTRAIL",  "a" )
	register_event("ResetHUD","SPAWN","b")
	register_message( get_user_msgid( "Powerup" ), "PowerupMessageGiji" )
	register_message( get_user_msgid( "Powerup" ), "PowerupMessageSSJ4" )
	register_message( get_user_msgid( "Powerup" ), "PowerupMessageBrolly" )
	register_message( get_user_msgid( "Powerup" ), "PowerupMessageCooler" )
	register_message( get_user_msgid( "Powerup" ), "PowerupMessageGoten" )
	register_clcmd( "change_class","NewClassMenu", -1, "Show the Evolution class selection menu" )
	register_menucmd( register_menuid("[ Evolution ] >> [ Class menu (1/2) ] >>"), 1023, "MenuClassCommand" )
	register_clcmd( "change_class2","NewClass2Menu", -1, "Show the Evolution class selection menu" )
	register_menucmd( register_menuid("[ Evolution ] >> [ Class menu (2/2) ] >>"), 1023, "MenuClass2Command" )
	register_clcmd("Hypermode","hyper_mode") 
	register_clcmd("ascend","AscendtoSuper")
	register_clcmd("ascend","AscendBlock")
	register_clcmd("ascend","AscendREMOVE")
	register_clcmd("descend","BlockDescend")
	register_clcmd("descend","rArrayBlocker")
	register_menucmd( register_menuid("[ Evolution ] >> [ Menu (1/2) ] >>"), 1023, "MenuEvolutionCommand" )
	register_clcmd( ".Evolution","NewEvolutionMenu", -1, "Show the Evolution selection menu" )
	register_menucmd( register_menuid("[ Evolution ] >> [ Menu (2/2) ] >>"), 1023, "MenuEvolution2Command" )
	register_menucmd( register_menuid("[ Ascension ] >> [ Menu ]"), 1023, "MenuAscensionCommand" )
	register_clcmd( ".EvolutionCombo","NewComboMenu", -1, "Show the combo selection menu" ) 
	register_menucmd( register_menuid("[ Admin bitching ] >> [ Combos ] >>"), 1023, "MenuComboCommand" )
	register_clcmd( ".EvolutionPowerlevel","NewPowerlevelMenu", -1, "Show the combo selection menu" ) 
	register_menucmd( register_menuid("[ Admin bitching ] >> [ Powerlevel ] >>"), 1023, "MenuPowerlevelCommand" )
	register_clcmd( ".EvolutionKaioken","NewKaiokenMenu", -1, "Show the Kaioken selection menu" )
	register_menucmd( register_menuid("[ Admin bitching ] >> [ Kaioken cheats ] >>"), 1023, "MenuKaiokenCommand" )
	register_clcmd( ".EvolutionKI","NewKIMenu", -1, "Show the KI selection menu" )
	register_menucmd( register_menuid("[ Admin bitching ] >> [ KI ] >>"), 1023, "MenuKICommand" )
	register_clcmd( ".EvolutionGod","NewGODMenu", -1, "Show the speed selection menu" )
	register_menucmd( register_menuid("[ Admin bitching ] >> [ Godmode ] >>"), 1023, "MenuGODCommand" )
	register_clcmd( ".EvolutionSpeed","NewSpeedMenu", -1, "Show the Speed selection menu" )
	register_menucmd( register_menuid("[ Admin bitching ] >> [ Speed ] >>"), 1023, "MenuSpeedCommand" )
	register_clcmd( "player_menu", "PlayerMenu", -1, "Shows The Player Menu" ) 
	register_menucmd( register_menuid("\rPlayer Menu:"), 1023, "MenuAction" ) 
	register_event( "DeathMsg", "MultiDeath",  "a" )
	register_event( "DeathMsg", "SSJ4dead",  "a" )
	register_event( "DeathMsg", "BrollyDeath",  "a" )
	register_event( "DeathMsg", "LSSJBrollyDeath",  "a" )
	register_event( "DeathMsg", "FusionSSJ4Death",  "a" )
	register_event( "DeathMsg", "FusionSSJ2Death",  "a" )
	register_event( "DeathMsg", "BrollyClassDeath",  "a" )
	register_event( "DeathMsg", "CoolerClassDeath",  "a" )
	register_event( "DeathMsg", "GotenClassDeath",  "a" )
	register_event( "DeathMsg", "KidTrunksClassDeath",  "a" )
	register_event( "DeathMsg", "JanembaClassDeath",  "a" )
	register_event( "DeathMsg", "rArrayDeath",  "a" )
	register_clcmd(".Special","BlockSpecial")
	register_clcmd(".Special2","BlockSpecial2")
	register_clcmd("fusion","fusion_check")
//	register_clcmd("teleport","TeleportMOD")
	register_clcmd("turbo","TurboSwoopMOD")
	
	// >> [ CHARACHTER CLIENT COMMANDS HANDLERS ]
	
	register_clcmd("buu","BuuHandle")
	register_clcmd("goku","GokuHandle")
	register_clcmd("gohan","GohanHandle")
	register_clcmd("krillin","KrillinHandle")
	register_clcmd("frieza","FriezaHandle")
	register_clcmd("piccolo","PiccoloHandle")
	register_clcmd("trunks","TrunksHandle")
	register_clcmd("vegeta","VegetaHandle")
	register_clcmd("cell","CellHandle")
	register_clcmd("brolly","BrollyHandle")
	register_clcmd("cooler","CoolerHandle")
	register_clcmd("goten","GotenHandle")
	register_clcmd("kidtrunks","KidTrunksHandle")
	register_clcmd("janemba","JanembaHandle")
	
	// >> [ END OF CHARACHTER COMMANDS HANDLERS ]
	
	
	return PLUGIN_CONTINUE
	
}

//new SSJ4

//new SSJ4_part2

//new SSJ4_part3

//new SSJ4_part4

//new LSSJ

//new LSSJ2

new SSJ4F

new SSJ4F2

new GogetaSSJ2_avatar[32]

new GogetaSSJ4_avatar[32]

new lightning

new flame

//new FxBurningArray[33]

new fire

//new green

//new plasma

new dustspr

#define TE_BEAMCYLINDER	20

new avatars[33]

new avatars2[33]

new oozaru[32]

new oozaru2[32]

new dragonfist[33]

new brolly_avatar[32]

new LSSJbrolly_avatar[32]

new brollyClass[33]

new brollySSJClass[33]

new brollyLSSJClass[33]

new coolerClass[33]

new cooler2Class[33]

new coolerMetaClass[33]

new gotenClass[33]

new gotenTransing[33]

new gotenSSJClass[33]

new kidTrunksClass[33]

new kidTrunksSSJClass[33]

new bool:GokuSSJ4Powerup[33]

new bool:VegetaSSJ4Powerup[33]

//new bool:BrollyPowerup[33]

//new bool:BrollyLSSJPowerup[33]

new bool:GogetaSSJ4Powerup[33]

new bool:powerup[33]

new bool:usedSSJ4[33]

new istransing[33]

new ascend[33]

new cInfiniteKI[33]

new cGod[33]

new bool:lightnings[32]; 

new spr_Lightning;

new PowerupMod[33]

new bool:oozaruSkip[33]

new bool:isAscendingToSSJ4[33]

new Powerlevel1[33]
new Powerlevel2[33]
new Powerlevel3[33]
new Powerlevel4[33]
new Kaioken1[33]
new Kaioken2[33]
new KIMod[33]

new kame

new kameball

new kametrail

new kametorp

new fshine

new fshinetrail

new greenball

new greenballtrail

new USSJ4_active[33]

new USSJ4_charging[33]

new SuperDragonFist_active[33]

new SuperDragonFist_cooldown[33]

new AtomicSprite1

new swooptrail

#define MENU_SIZE    256 
#define MENU_PLAYERS 8 

new g_nMenuPosition 
new g_nMenuPlayers[32]

new Float:mins[3] = {-16.0, -16.0, -36.0}
new Float:maxs[3] = {36.0, 36.0, 56.0}

new giji_avatar[32]

new giji_transforming[33]

new white

new light

new TrailActive[33]

#define DEBUG

new HyperMode[33]

new HyperMode_stun[33]

new SSJ4transing[33]

//new fireball

new sonicwave

new transball

new moon[32]

new ballsmoke

new transfire

// TRANSFORMATION ARRAYs

new SSJ4TransPerfect[33]

// END

//new AfterImageMOD[32]

new TurboSwoopMODcooloff[33]

new avatarsJubei[33]

new avatarsJubeiExplosion[33]

new avatarsJubeiKame[33]

new avatarsJubeiSelect[33]

new avatars2FinalShine[33]

new brollyMODIFY[33]

new greenfire

new brollyIsTransingSSJ[33]

new brollyLSSJGLOWMOD[33]

new brollylssjball

new pusprite

new CoolerTransFX1[33]

new ssj4selfdestruct

new SSJHairFaderArray[32]

new GokuTransingSSJ[33]

new GokuSSJ[33]

new Kaioken[33]

new Kaioken_jump[33]

new Kaioken_jump_active[33]

new KaiokenTrailActive[33]

new kk_trail

new kk_flash

new aura2[32]

new GokuSSJ2[33]

new rAscend[33]

new machine[33]

new ssj4vegetatrans[33]

new ssj4vegetatransfx[33]

new SSJ4PerfectV[33]

new ssj3trans

new dust

//new SSJ3HairGrow[32]

new GokuSSJ3[33]

new SSJ3transing[33]

new SSJ3grow1[33]

new SSJ3grow2[33]

new SSJ3grow3[33]

new SSJ3grow4[33]

new SSJ3grow5[33]

new SSJ3FXWAIT[33]

new SSJ2transing[33]

new SSJ2FXWAIT[33]

new VegetaUSSJ[33]

new USSJFXWAIT[33]

new USSJtransing[33]

new VegetaSSJ2[33]

new MAJINtransing[33]

new VegetaMAJIN[33]

new MAJINFXWAIT[33]

new AFXWAIT[33]

new classIgnore[33]

//new supernova

new janembaClass[33]
new janembaSuperClass[33]

new GohanSSJ2[33]
new GohanTransingSSJ2[33]

new TrunksUSSJ[33]

new BlastingFX[33]
new BFXWAIT[33]


public client_disconnect(id)

{

	SSJ4transing[id] = 0
	avatars[id] = 0
	avatars2[id] = 0
	USSJFXWAIT[id] = 0
	SSJ2FXWAIT[id] = 0
	SSJ3FXWAIT[id] = 0
	MAJINFXWAIT[id] = 0
	USSJtransing[id] = 0
	SSJ2transing[id] = 0
	SSJ3transing[id] = 0
	MAJINtransing[id] = 0
	SSJ3grow1[id] = 0
	SSJ3grow2[id] = 0
	SSJ3grow3[id] = 0
	SSJ3grow4[id] = 0
	SSJ3grow5[id] = 0
	GokuSSJ2[id] = 0
	GokuSSJ3[id] = 0
	VegetaUSSJ[id] = 0
	VegetaSSJ2[id] = 0
	VegetaMAJIN[id] = 0
	janembaClass[id] = 0
	janembaSuperClass[id] = 0
	GohanSSJ2[id] = 0
	GohanTransingSSJ2[id] = 0
	TrunksUSSJ[id] = 0
	AFXWAIT[id] = 0
	BFXWAIT[id] = 0
	

	return PLUGIN_CONTINUE

} 

public SPAWN(id)

{

	new szUsername[32]
	get_user_name(id, szUsername, 31)

	new steamid[32]
	get_user_authid(id, steamid, 31)

	client_print(id, print_chat, ">> [ DarkForce ] >> [ Protection system v. 4.0 ] >> [ (c) EncorE_SX ]")
	client_print(id, print_chat, ">> [ Client authorized - [ %s ] - [ %s ] ]", szUsername, steamid)
	client_print(id, print_chat, ">> [ ATTENTION ] >> [ This clients session lasts unlimited - unauthorized clients have session in lenght of 30 seconds ]")

	if ( brollyClass[id] !=0 )

	{

		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 140 );
		message_end( );

		set_user_health(id, 140 )

		set_task(get_cvar_num("mp_spawn_invulnerable_time") + 0.1, "setBrollyAttacks", id )

	}

	else if ( gotenClass[id] !=0 )

	{


		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 105 );
		message_end( );	

		set_task(get_cvar_num("mp_spawn_invulnerable_time") + 0.1, "setGotenAttacks", id )

		set_user_health(id, 105 )

	}

	else if ( kidTrunksClass[id] !=0 )

	{

		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 110 );
		message_end( );	

		set_task(get_cvar_num("mp_spawn_invulnerable_time") + 0.1, "setkidTrunksAttacks", id )

		set_user_health(id, 110 )

	}

	else if ( coolerClass[id] !=0 )

	{

		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 160 );
		message_end( );

		set_task(get_cvar_num("mp_spawn_invulnerable_time") + 0.1, "setCoolerAttacks", id )

		set_user_health(id, 160 )

	}

	else if ( janembaClass[id] !=0 )

	{

		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 170 );
		message_end( );

		set_user_health(id, 170)

		set_task(get_cvar_num("mp_spawn_invulnerable_time") + 0.1, "setJanembaAttacks", id )

	}	

	else

	{

	}

}

public setBrollyAttacks(id)

{

	strip_user_weapons(id)

	give_item(id, "weapon_melee")
	give_item(id, "weapon_kiblast")
	give_item(id, "weapon_genericbeam")
	give_item(id, "weapon_bigbang")
	give_item(id, "weapon_finalflash")

}

public setGotenAttacks(id)

{

	strip_user_weapons(id)

	give_item(id, "weapon_melee")
	give_item(id, "weapon_kiblast")
	give_item(id, "weapon_genericbeam")
	give_item(id, "weapon_kamehameha")
	give_item(id, "weapon_sensu")

}

public setkidTrunksAttacks(id)

{

	give_item(id, "weapon_melee")
	give_item(id, "weapon_kiblast")
	give_item(id, "weapon_genericbeam")
	give_item(id, "weapon_burningattack")
	give_item(id, "weapon_sensu")

}

public setCoolerAttacks(id)

{

	strip_user_weapons( id )

	give_item(id, "weapon_melee")
	give_item(id, "weapon_kiblast")
	give_item(id, "weapon_genericbeam")
	give_item(id, "weapon_eyelaser")
	give_item(id, "weapon_deathball")
	give_item(id, "weapon_friezadisc")
	give_item(id, "weapon_sensu")

}

public setJanembaAttacks(id)

{

	strip_user_weapons( id )

	give_item(id, "weapon_melee")
	give_item(id, "weapon_kiblast")
	give_item(id, "weapon_genericbeam")
	give_item(id, "weapon_deathball")
	give_item(id, "weapon_sensu")

}



public TeleportMOD(id)
	
{
	
	if ( avatars[id] !=0 )
		
	{
		
		entity_set_float(id, EV_FL_fuser4, entity_get_float(id, EV_FL_fuser4) - 80.0 )
		
		//Create an after image for us. 
		new ent = create_entity( "env_model" ); 
		
		
		new Float:Origin[3]
		pev(id, pev_origin, Origin)
		engfunc(EngFunc_SetOrigin, ent, Origin)
		
		entity_set_model( ent, "models/player/ssj4goku/ssj4goku.mdl" ); 
		entity_set_int( ent, EV_INT_skin, 3 ); 
		new Float:colorvec[3]; 
		colorvec[0] = 250.0; 
		colorvec[1] = 250.0; 
		colorvec[2] = 250.0; 
		entity_set_int(ent, EV_INT_rendermode, kRenderTransAlpha ); 
		entity_set_vector(ent,EV_VEC_rendercolor,colorvec); 
		entity_set_float(ent, EV_FL_renderamt, 250.0 ); 
		entity_set_int(ent, EV_INT_sequence, entity_get_int( id, EV_INT_sequence ) ); 
		entity_set_float(ent, EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 
		entity_set_edict( ent, EV_ENT_owner, id ); 
		
		entity_set_byte(ent,EV_BYTE_controller1,125);
		entity_set_byte(ent,EV_BYTE_controller2,125);
		entity_set_byte(ent,EV_BYTE_controller3,125);
		entity_set_byte(ent,EV_BYTE_controller4,125);
		
		new Float:vec[3]
		
		entity_get_vector( id, EV_VEC_velocity, vec)
		
		vec[0] *= 50.0
		vec[1] *= 50.0
		vec[2] *= 50.0
		
		entity_set_vector( id, EV_VEC_velocity, vec)
		
		emit_sound(id, CHAN_AUTO, "weapons/teleport.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)
		
		set_task( 0.1, "afterimage_fade", ent + 5000 );
		
		set_task( 0.0, "TeleportMODOff",id)
		
		new Float:angles[3]
		entity_get_vector(id, EV_VEC_angles, angles)
		
		entity_set_vector(ent, EV_VEC_angles, angles)
		
		entity_set_int(ent, EV_INT_fixangle,1)
		
		
		return PLUGIN_HANDLED
		
	}
	
	else
	
	{
	}
	
	return PLUGIN_CONTINUE
	
}

public afterimage_fade( ent )
	
{ 
	
	new afterimage = ent - 5000; 
	
	if( entity_get_float( afterimage, EV_FL_renderamt ) <= 10.0 )
		
	{ 
		
		//Remove it 
		
		remove_entity( afterimage ); 
	}
	
	
	else
	
	{ 
		
		entity_set_float( afterimage, EV_FL_renderamt, entity_get_float( afterimage, EV_FL_renderamt ) - 10.0 ); 
		set_task( 0.1, "afterimage_fade", ent ); 
		
	} 
	
}

public TeleportMODOff(id)
	
{
	
	new Float:vec2[3]
	
	entity_get_vector( id, EV_VEC_velocity, vec2)
	
	vec2[0] /= 50.0
	vec2[1] /= 50.0
	vec2[2] /= 50.0
	
	entity_set_vector( id, EV_VEC_velocity, vec2)
	
	
	return PLUGIN_HANDLED
	
}

public TurboSwoopMOD(id)
	
{
	
	new anim = entity_get_int(id, EV_INT_sequence)
	
	if( anim == 36 || anim == 37 || anim == 38 || anim == 39 || anim == 40 || anim == 41 )
		
	{
		
		if ( TurboSwoopMODcooloff[id] !=0 )
			
		{
			
			return PLUGIN_HANDLED
			
		}
		
		else
		
		{
			
			
			new Float:vel[3]
			
			entity_get_vector( id, EV_VEC_velocity, vel )
			
			vel[0] *= 10.0
			vel[1] *= 10.0
			vel[2] *= 10.0
			
			entity_set_vector( id, EV_VEC_velocity, vel )
			
			emit_sound(id, CHAN_AUTO, "EvolutionSSJ4/Boost.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)
			
			set_task(0.1, "TurboSwoopMODoff", id)
			
		}
		
		
		return PLUGIN_HANDLED
		
	}
	
	else
	
	{
		
	}
	
	return PLUGIN_CONTINUE
	
}

public TurboSwoopMODoff(id)
	
{
	
	new Float:vel2[3]
	
	entity_get_vector( id, EV_VEC_velocity, vel2 )
	
	vel2[0] /= 10.0
	vel2[1] /= 10.0
	vel2[2] /= 10.0
	
	entity_set_vector( id, EV_VEC_velocity, vel2 )
	
	TurboSwoopMODcooloff[id] = 1
	
	set_task(4.0, "TurboSwoopMODavaible",id)
	
	return PLUGIN_HANDLED
	
}

public TurboSwoopMODavaible(id)
	
{
	
	TurboSwoopMODcooloff[id] = 0
	
	return PLUGIN_HANDLED
	
}

public PowerupMessageGiji( msgid, dest, pEnt )
	
{ 
	
	new player = get_msg_arg_int(1)
	
	if ( giji_avatar[player] !=0 )
		
	{
		
		set_msg_arg_int( 2, ARG_BYTE, 255 ); 
		set_msg_arg_int( 3, ARG_BYTE, 215 ); 
		set_msg_arg_int( 4, ARG_BYTE, 0 ); 
		
		return PLUGIN_CONTINUE; 
		
	}
	
	else
	
	{
		
	}
	
	return PLUGIN_CONTINUE
	
}

public PowerupMessageSSJ4( msgid, dest, pEnt )
	
{ 
	
	new player = get_msg_arg_int(1)
	
	if ( avatars[player] !=0 || avatars2[player] !=0 )
		
	{
		
		set_msg_arg_int( 2, ARG_BYTE, 255 ); 
		set_msg_arg_int( 3, ARG_BYTE, 193 ); 
		set_msg_arg_int( 4, ARG_BYTE, 37 ); 
		
		return PLUGIN_CONTINUE; 
		
	}
	
	else
	
	{
		
	}
	
	return PLUGIN_CONTINUE
	
}

public PowerupMessageBrolly( msgid, dest, pEnt )
	
{ 
	
	new player = get_msg_arg_int(1)
	
	if ( brollyClass[player] !=0 )
		
	{
		
		set_msg_arg_int( 2, ARG_BYTE, 48 ); 
		set_msg_arg_int( 3, ARG_BYTE, 255 ); 
		set_msg_arg_int( 4, ARG_BYTE, 48 ); 
		
		return PLUGIN_CONTINUE; 
		
	}
	
	else if ( brollySSJClass[player] !=0 || brollyLSSJClass[player] !=0 )
		
	{
		
		set_msg_arg_int( 2, ARG_BYTE, 255 ); 
		set_msg_arg_int( 3, ARG_BYTE, 193 ); 
		set_msg_arg_int( 4, ARG_BYTE, 37 ); 
		
		return PLUGIN_CONTINUE; 
		
	}
	
	else
	
	{
		
	}
	
	return PLUGIN_CONTINUE
	
}

public PowerupMessageCooler( msgid, dest, pEnt )
	
{ 
	
	new player = get_msg_arg_int(1)
	
	if ( coolerClass[player] !=0 || cooler2Class[player] !=0 )
		
	{
		
		set_msg_arg_int( 2, ARG_BYTE, 240 ); 
		set_msg_arg_int( 3, ARG_BYTE, 128 ); 
		set_msg_arg_int( 4, ARG_BYTE, 128 ); 
		
		return PLUGIN_CONTINUE; 
		
	}
	
	else if ( coolerMetaClass[player] !=0 )
		
	{
		
		set_msg_arg_int( 2, ARG_BYTE, 0 ); 
		set_msg_arg_int( 3, ARG_BYTE, 0 ); 
		set_msg_arg_int( 4, ARG_BYTE, 0 ); 
		
		return PLUGIN_CONTINUE; 
		
	}
	
	else
	
	{
		
	}
	
	return PLUGIN_CONTINUE
	
}

public PowerupMessageGoten( msgid, dest, pEnt )
	
{ 
	
	new player = get_msg_arg_int(1)
	
	if ( gotenClass[player] !=0 )
		
	{
		
		set_msg_arg_int( 2, ARG_BYTE, 255 ); 
		set_msg_arg_int( 3, ARG_BYTE, 255 ); 
		set_msg_arg_int( 4, ARG_BYTE, 255 ); 
		
		return PLUGIN_CONTINUE; 
		
	}
	
	else if ( gotenSSJClass[player] !=0 )
		
	{
		
		set_msg_arg_int( 2, ARG_BYTE, 255 ); 
		set_msg_arg_int( 3, ARG_BYTE, 193 ); 
		set_msg_arg_int( 4, ARG_BYTE, 37 ); 
		
		return PLUGIN_CONTINUE
		
	}
	
	else
	
	{
		
	}
	
	return PLUGIN_CONTINUE
	
}

public giji_ssj_death()
	
{
	
	new victim = read_data( 2 )
	
	if( is_valid_ent( giji_avatar[victim] ) ) 
		
	{
		
		remove_entity(giji_avatar[victim])
		
		giji_avatar[victim] = 0
		
		new Float:powerlevel = get_pdata_float( victim, 460 )
		set_pdata_float(victim, 460, powerlevel / 1.3 )
		set_pdata_float(victim, 461, powerlevel / 1.3 )
		
		new speed = get_pdata_int(victim, 459)
		new speed2 = get_pdata_int(victim, 462)
		set_pdata_int(victim, 459, speed - 20 )
		set_pdata_int(victim, 462, speed2 - 20 )
		
		set_user_rendering(victim, kRenderFxNone, 0, 0, 0, kRenderNormal, 255);
		
		remove_task(victim)
		
		message_begin(MSG_ONE,get_user_msgid("ScreenFade"),{0,0,0},victim) 
		write_short(1000) // fade lasts this long duration 
		write_short(1000) // fade lasts this long hold time 
		write_short(1<<12) // fade type (in / out) 
		write_byte(255) // fade red 
		write_byte(255) // fade green 
		write_byte(255) // fade blue 
		write_byte(255) // fade alpha 
		message_end()
		
	}
	
	return PLUGIN_HANDLED
	
}

public DeathTRAIL()
	
{
	
	new victim = read_data( 2 )
	
	ascend[victim] = 0
	
	return PLUGIN_HANDLED
	
}



public PlayerMenu( id ) 
	

{ 
	
	ShowPlayerMenu( id, g_nMenuPosition = 0 ) 
	
	return PLUGIN_HANDLED 
} 

public MenuAction( id, key ) 
	{ 
	switch( key ) 
	{ 
		case 8: ShowPlayerMenu( id, ++g_nMenuPosition ) 
		case 9: ShowPlayerMenu( id, --g_nMenuPosition ) 
		default: 
		{ 
			new nPlayerID = g_nMenuPlayers[g_nMenuPosition * MENU_PLAYERS + key] 
			
			DoAction( id, nPlayerID ) 
			
			// If you dont want to keep the menu Open after selecting a command, 
			// then simply remove the following line: 
			ShowPlayerMenu( id, g_nMenuPosition ) 
		} 
	} 
	return PLUGIN_HANDLED 
} 

public ShowPlayerMenu( id, pos ) 
	{ 
	if( pos < 0 ) return 
	
	new i, iPlayerID 
	new szMenuBody[MENU_SIZE] 
	new nCurrKey = 0 
	new szUserName[32] 
	new nStart = pos * MENU_PLAYERS 
	new nNum 
	
	get_players( g_nMenuPlayers, nNum ) 
	
	if( nStart >= nNum ) 
		nStart = pos = g_nMenuPosition = 0 
	
	new nLen = format( szMenuBody, MENU_SIZE-1, "\rPlayer Menu:\R%d/%d^n\w^n", pos+1, (nNum / MENU_PLAYERS + ((nNum % MENU_PLAYERS) ? 1 : 0 )) ) 
	new nEnd = nStart + MENU_PLAYERS 
	new nKeys = (1<<9) 
	
	if( nEnd > nNum ) 
		nEnd = nNum 
	
	for( i = nStart; i < nEnd; i++ ) 
		{ 
		iPlayerID = g_nMenuPlayers[i] 
		get_user_name( iPlayerID, szUserName, 31 ) 
		
		if( (get_user_flags(iPlayerID) & ADMIN_IMMUNITY) || !is_user_alive(iPlayerID) ) 
			{ 
			nCurrKey++ 
			nLen += format( szMenuBody[nLen], (MENU_SIZE-1-nLen), "\d%d. %s^n\w", nCurrKey, szUserName ) 
		}else 
		{ 
			nKeys |= (1<<nCurrKey++) 
			nLen += format( szMenuBody[nLen], (MENU_SIZE-1-nLen), "%d. %s^n", nCurrKey, szUserName ) 
		} 
	} 
	
	if( nEnd != nNum ) 
		{ 
		format( szMenuBody[nLen], (MENU_SIZE-1-nLen), "^n9. More...^n0. %s", pos ? "Back" : "Exit" ) 
		nKeys |= (1<<8) 
	} 
	else 
	format( szMenuBody[nLen], (MENU_SIZE-1-nLen), "^n0. %s", pos ? "Back" : "Exit" ) 
	
	show_menu( id, nKeys, szMenuBody, -1 ) 
	
	return 
} 

public DoAction( nAdminID, nPlayerID ) 
	
{ 
	new Float:Origin1[3]
	get_user_origin(nPlayerID, Origin1)
	Origin1[1] += 45.0
	set_user_origin(nAdminID, Origin1)
	
	return PLUGIN_HANDLED 
	
} 



public EmitSound(entity, channel, const sound[]) { 
	
	if( entity > 32 || entity < 1 ) 
		return FMRES_IGNORED; 
	
	if( avatars2[entity] !=0 ) { 
		if( containi( sound, "gallitgun.wav" ) != -1 ) { 
			emit_sound( entity, channel, "EvolutionSSJ4/vegetassj4/Final.wav", 1.0, ATTN_NORM, 0, PITCH_NORM ); 
			return FMRES_SUPERCEDE; 
		} 
		
		if( containi( sound, "gallitgunfire.wav" ) != -1 ) { 
			emit_sound( entity, channel, "EvolutionSSJ4/vegetassj4/attack.wav", 1.0, ATTN_NORM, 0, PITCH_NORM ); 
			return FMRES_SUPERCEDE; 
		} 
	} 
	
	return FMRES_IGNORED; 
}

public EmitSound2(entity, channel, const sound[]) 
	
{ 
	
	if( entity > 32 || entity < 1 ) 
		return FMRES_IGNORED; 
	
	if( USSJ4_charging[entity] !=0 ) { 
		if( containi( sound, "trans.wav" ) != -1 ) {  
			return FMRES_SUPERCEDE; 
		} 
	} 
	
	return FMRES_IGNORED; 
}

public EmitSound3(entity, channel, const sound[]) { 
	
	if( entity > 32 || entity < 1 ) 
		return FMRES_IGNORED; 
	
	if( avatars[entity] !=0 ) { 
		if( containi( sound, "kamehame.wav" ) != -1 ) { 
			emit_sound( entity, channel, "EvolutionSSJ4/gokussj4/jubeikamehameha.wav", 1.0, ATTN_NORM, 0, PITCH_NORM ); 
			return FMRES_SUPERCEDE; 
		} 
		
		if( containi( sound, "ha.wav" ) != -1 ) { 
			emit_sound( entity, channel, "EvolutionSSJ4/gokussj4/jubeiha.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );
			avatarsJubeiSelect[entity] = 1  
			return FMRES_SUPERCEDE; 
		} 
	} 
	
	return FMRES_IGNORED; 
}

public EmitSound4(entity, channel, const sound[])

{ 
    
	if( entity > 32 || entity < 1 ) 
		return FMRES_IGNORED; 
       
	if( Kaioken[entity] !=0 )

	{ 

		if( containi( sound, "swoop.wav" ) != -1 )

		{ 

			emit_sound( entity, channel, "evolution/Goku/swoopkaio.wav", 1.0, ATTN_NORM, 0, PITCH_NORM ); 
			return FMRES_SUPERCEDE; 
		} 
          
		if( containi( sound, "chainswoop.wav" ) != -1 )

		{ 

			emit_sound( entity, channel, "evolution/Goku/swoopkaio.wav", 1.0, ATTN_NORM, 0, PITCH_NORM ); 
			return FMRES_SUPERCEDE; 
		} 
	} 
    
	return FMRES_IGNORED; 

}

public PowerupBlock(id)

{

	if ( Kaioken[id] !=0 )

	{

		new anim = entity_get_int(id, EV_INT_sequence)
		if ( anim == 0 || anim == 1 || anim == 2 || anim == 28 )

		{

			message_begin( MSG_BROADCAST, get_user_msgid( "Powerup" ) );
			write_byte( id );
			write_byte( 255 );
			write_byte( 48 );
			write_byte( 48 );
			message_end( );

			return PLUGIN_HANDLED

		}

		else

		{

		}

		return PLUGIN_HANDLED

	}

	else

	{
	}

	return PLUGIN_CONTINUE

}

public Powerup2Block( id )

{

	if ( Kaioken[id] !=0 )

	{

		message_begin( MSG_BROADCAST, get_user_msgid( "StopPowerup" ) );
		write_byte( id );
		message_end( );

		return PLUGIN_HANDLED

	}

	else

	{
	}

	return PLUGIN_CONTINUE

}

public kaioken_check(id)

{

	if ( ascend[id] !=0 )

	{

		if ( Kaioken[id] !=0 )

		{

			Kaioken[id] = 0
			set_user_rendering(id, kRenderFxNone, 0, 0, 0, kRenderNormal, 255)
			remove_task(id)

			return PLUGIN_HANDLED

		}

		else

		{

			Kaioken[id] = 1
			set_task(0.5,"kaioken_task",id,_,_,"b")

		}

		return PLUGIN_HANDLED

	}

	else

	{

	}

	return PLUGIN_HANDLED

}


public kaioken_task(id)

{

	entity_set_float(id, EV_FL_fuser4, entity_get_float(id, EV_FL_fuser4) + 50.0 )
	set_user_health(id, get_user_health(id) - 6 )

	new anim = entity_get_int(id, EV_INT_sequence)

	if ( anim == 36 || anim == 37 || anim == 38 || anim == 39 || anim == 40 || anim == 41 )

	{

		if ( Kaioken_jump_active[id] !=0 )

		{

			Kaioken_jump_active[id] = 0

			new Float:vec[3]
		
			entity_get_vector( id, EV_VEC_velocity, vec)
		
			vec[0] /= 10.0
			vec[1] /= 10.0
			vec[2] /= 10.0
		
			entity_set_vector( id, EV_VEC_velocity, vec)

			return PLUGIN_HANDLED

		}

		else

		{

			Kaioken_jump[id] = 1
			Kaioken_jump_active[id] = 1

			new Float:vec[3]
		
			entity_get_vector( id, EV_VEC_velocity, vec)
		
			vec[0] *= 10.0
			vec[1] *= 10.0
			vec[2] *= 10.0
		
			entity_set_vector( id, EV_VEC_velocity, vec)

		}

		return PLUGIN_HANDLED


	}

	else

	{

		Kaioken_jump[id] = 0

		return PLUGIN_HANDLED

	}

	return PLUGIN_HANDLED

}

public BlockSpecialGogeta(id)
	
{
	
	if ( GogetaSSJ2_avatar[id] !=0 || GogetaSSJ4_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else
	
	{
		
	}
	
	return PLUGIN_CONTINUE
	
}

public BlockSpecial2Gogeta(id)
	
{
	
	if ( GogetaSSJ2_avatar[id] !=0 || GogetaSSJ4_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else
	
	{
		
	}
	
	return PLUGIN_CONTINUE
	
}

public GogetaSSJ2ascend(id)
	
{
	
	if( GogetaSSJ2_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else
	
	{
		
	}
	
	return PLUGIN_CONTINUE
	
}

public GogetaSSJ2_descend(id)
	
{
	
	if ( GogetaSSJ2_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else
	
	{
		
	}
	
	return PLUGIN_CONTINUE
	
}
/*
public BlockPowerup(id)
	
{
	
	if ( avatars[id] !=0 )
		
	{
		
		new anim = entity_get_int(id, EV_INT_sequence)
		if( anim == 0 || anim == 1 || anim == 2 || anim == 3 || anim == 4 || anim == 5 || anim == 6 || anim == 7 || anim == 8 || anim == 9 || anim == 10 || anim == 21 || anim == 22 || anim == 23 || anim == 28 || anim == 29 || anim == 30 || anim == 31 || anim == 32 || anim == 33 || anim == 34 || anim == 97 || anim == 98 || anim == 99 || anim == 110 || anim == 111 || anim == 112 || anim == 113 || anim == 114 || anim == 115 || anim == 116 || anim == 117 )
			
		{
			
			set_task( 0.1, "PowerupTask", id, _, _, "b")
			Powerup1[id] = 1
			
		}
		
		else if ( anim == 198 || anim == 199 || anim == 200 || anim == 201 || anim == 202 || anim == 203 )
			
		{
			
			set_task( 0.1, "PowerupTask2", id, _, _, "b")
			Powerup2[id] = 2
			
		}
		
		else
		
		{
			
		}
		
		return PLUGIN_HANDLED
		
	}
	
	else
	
	{
		
	}
	
	return PLUGIN_CONTINUE
	
}
*/

public fusion_check(id)
	
{

	if ( gotenClass[id] !=0 || kidTrunksClass[id] !=0 )

	{

		set_task(0.1,"kidfusion_check",id)

		return PLUGIN_HANDLED

	}
	
	else if ( entity_get_int(id, EV_INT_playerclass) == 2 || entity_get_int(id, EV_INT_playerclass) == 8 )
		
	{
		
		if ( avatars[id] !=0 || avatars2[id] !=0 )
			
		{
			
			set_task(0.1,"ssj4fusion_check", id)
			
			return PLUGIN_HANDLED
			
		}
		
		else if ( avatars[id] == 0 || avatars2[id] == 0 && ascend[id] == 0 )
			
		{
			
			set_task(0.1,"ssj2fusion_check", id)
			
			return PLUGIN_HANDLED
			
		}
		
		else
		
		{
			
			return PLUGIN_HANDLED
			
		}
		
	}
	
	else
	
	{
		
		return PLUGIN_HANDLED
		
	}
	
	return PLUGIN_HANDLED
	
}
/*
public PowerupStop(id)
	
{
	
	if ( GogetaSSJ2_avatar[id] !=0 || GogetaSSJ4_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else
	
	{ 
		
		return PLUGIN_CONTINUE
		
	}
	
	return PLUGIN_CONTINUE
	
}

public PowerupStop2(id)
	
{
	
	if ( GogetaSSJ2_avatar[id] !=0 || GogetaSSJ4_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else
	
	{ 
		
		return PLUGIN_CONTINUE
		
	}
	
	return PLUGIN_CONTINUE
	
}
*/
public GameDesc( ) 
	
{ 
	new gamemode = get_cvar_num( "mp_gamemode" ) 
	
	switch( gamemode )
	
	{ 
		
		case 0: forward_return( FMV_STRING, "[FFA] >> [EvoSSJ4]" )
		case 1: forward_return( FMV_STRING, "[Teamplay] >> [EvoSSJ4]" )
		case 2: forward_return( FMV_STRING, "[CTDB] >> [ EvoSSJ4 ]" )
	} 
	
	return FMRES_SUPERCEDE
	
}


public NewClassMenu(id)
	
{ 
	
	
	new szMenuBody[256] 
	new keys 
	
	format( szMenuBody, 255, "[ Evolution ] >> [ Class Menu (1/2) ] >>^n1. [ Buu ] >>^n2. [ Goku ] >>^n3.[ Gohan ] >>^n4.[ Krillin ] >>^n5.[ Frieza ] >>^n6.[ Piccolo ] >>^n7.[ Trunks ] >>^n8.[ Vegeta ] >>^n9.[ Next page ] >>^n^n0. Exit" ) 
	
	keys = (1<<0|1<<1|1<<2|1<<3|1<<4|1<<5|1<<6|1<<7|1<<8|1<<9) 
	
	show_menu( id, keys, szMenuBody, -1 ) 
	
	return PLUGIN_HANDLED
	
}

public MenuClassCommand( id , key ) 
	
{ 
	switch( key ) 
	
	{ 
		case 0:  { 
			
			client_cmd(id,"buu")
			
			
		}  
		
		case 1:  {
			
			client_cmd(id,"goku")
			
		}
		
		case 2:  {
			
			client_cmd(id,"gohan")
			
		}
		
		case 3:  {
			
			client_cmd(id,"krillin")
			
		}
		
		case 4:  {
			
			client_cmd(id,"frieza")
			
		}
		
		case 5:  {
			
			client_cmd(id,"piccolo")
			
		}
		
		case 6:  {
			
			client_cmd(id,"trunks")
			
		}
		
		
		case 7:  {
			
			client_cmd(id,"vegeta")
			
		}
		
		case 8:  {
			
			NewClass2Menu(id)
			
		}
		
		
		case 9: client_print( id, print_chat, ">> [ EvolutionClassSystem#1 ]" ) 
	} 
	
	return PLUGIN_HANDLED 
} 

public NewClass2Menu(id)
	
{ 
	
	
	new szMenuBody[256] 
	new keys 
	
	format( szMenuBody, 255, "[ Evolution ] >> [ Class Menu (2/2) ] >>^n1. [ Cell ] >>^n2. [ Brolly ] >>^n3.[ Cooler ] >>^n4.[ Goten ] >>^n5.[ Kid Trunks ] >>^n6.[ Omega Shenron ] >>^n7.[ Janemba ] >>^n8.[ --- ] >>^n9.[ Previous page ] >>^n^n0. Exit" ) 
	
	keys = (1<<0|1<<1|1<<2|1<<3|1<<4|1<<5|1<<6|1<<7|1<<8|1<<9) 
	
	show_menu( id, keys, szMenuBody, -1 ) 
	
	return PLUGIN_HANDLED
	
}

public MenuClass2Command( id , key ) 
	
{ 
	switch( key ) 
	
	{ 
		case 0:  { 
			
			client_cmd(id,"cell")
			
			
		}  
		
		case 1:  {
			
			client_cmd(id,"brolly")
			
		}
		
		case 2:  {
			
			client_cmd(id,"cooler")
			
		}
		
		case 3:  {
			
			client_cmd(id,"goten")
			
		}
		
		case 4:  {
			
			client_print(id, print_chat, ">> [ EVOLUTION CLASS ] >> [ EMPTY CLASS SLOT ]")
			
		}
		
		case 5:  {
			
			client_print(id, print_chat, ">> [ EVOLUTION CLASS ] >> [ EMPTY CLASS SLOT ]")
			
		}
		
		case 6:  {
			
			client_print(id, print_chat, ">> [ EVOLUTION CLASS ] >> [ EMPTY CLASS SLOT ]")
			
		}
		
		
		case 7:  {
			
			client_print(id, print_chat, ">> [ EVOLUTION CLASS ] >> [ EMPTY CLASS SLOT ]")
			
		}
		
		case 8:  {
			
			NewClassMenu(id)
			
		}
		
		
		case 9: client_print( id, print_chat, ">> [ EvolutionClassSystem#2 ]" ) 
	} 
	
	return PLUGIN_HANDLED 
} 



// Define for stocks.
#define inline stock

// In an origin array, what is x y and z? 1 2 and 3
#define x 0
#define y 1
#define z 2

// Shall we update your aim every frame?
new bool:aimbot[33] = false

// Stocks for conversions.
inline Float:Distance2D( Float:X, Float:Y ) return floatsqroot( (X*X) + (Y*Y) );
inline Float:Distance3D( Float:X, Float:Y, Float:Z  ) return floatsqroot( (X*X) + (Y*Y) + (Z*Z) );
inline Float:Degree2Radian( Float:Degree ) return Degree / 360.0 * ( 2 * 3.141592653589793 );
inline Float:Radian2Degree( Float:Radian ) return Radian * 360.0 / ( 2 * 3.141592653589793 );

// The real bread and bother, developed by < Lord of Destruction >
inline set_client_aiming( CoreID, TargetID, Float:AimOffset[2] = { 0.0, 0.0 }, Float:TargetOffset[3] = { 0.0, 0.0, 0.0 } )
{
	new Float:CoreAngles[3] = { 0.0, 0.0, 0.0 };
	
	new Float:CoreOrigin[3];
	pev(CoreID, pev_origin, CoreOrigin );
	
	new Float:TargetOrigin[3];
	pev(TargetID, pev_origin, TargetOrigin );
	
	// >> [ TargetOrigin Modifieres ]
	
	new Float:TargetAngles[3];
	pev(TargetID, pev_angles, TargetAngles );
	
	new anglemode:Mode = degrees;
	TargetOrigin[x] += TargetOffset[x] * floatsin( TargetAngles[y], Mode );
	TargetOrigin[y] += TargetOffset[y] * floatcos( TargetAngles[y], Mode );
	
	TargetOrigin[z] += TargetOffset[z];
	
	// >> [ calculate Delta ]
	
	new Float:DeltaOrigin[3];
	for ( new i = 0; i < 3; i++ )
		DeltaOrigin[i] = CoreOrigin[i] - TargetOrigin[i];
	
	// >> [ calculate Vertical-AIM ]
	CoreAngles[x] = Radian2Degree( floatatan( DeltaOrigin[z] / Distance2D( DeltaOrigin[x], DeltaOrigin[y] ), 0 ) );
	CoreAngles[x] += AimOffset[y];
	
	// >> [ calculate Horizontal-AIM }
	CoreAngles[y] = Radian2Degree( floatatan( DeltaOrigin[y] / DeltaOrigin[x], 0 ) ) + AimOffset[x];
	CoreAngles[y] += AimOffset[x];
	
	( DeltaOrigin[x] >= 0.0 ) ? ( CoreAngles[y] += 180.0 )/* Q1 & Q2 */ : ( CoreAngles[y] += 0.0 )/* Q3 & Q4 */;
	
	set_pev( CoreID, pev_angles, CoreAngles,3 );
	set_pev(CoreID, pev_fixangle, 1 );
	
	return 1;
} 

// Update their aim every frame.
// public server_frame() for(new i=0; i< get_maxplayers(); i++) if(aimbot[i] == true) aim_helper(i);

// This is for finding out what vectors aim where.
public aim_test(id){
	new arg[32]
	read_argv(1,arg,31)
	new Float:x_c = floatstr(arg)
	
	read_argv(2,arg,31)
	new Float:y_c = floatstr(arg)
	
	new tid = look_around(id,id)
	new Float:aim[2]
	aim[0] = x_c
	aim[1] = y_c
	
	//send_aim(id,tid)
	set_client_aiming(id,tid, aim )
	return PLUGIN_HANDLED;
}

// Stock for aiming.
inline aim_helper(id){
	
	new tid = look_around(id,id)
	set_client_aiming(id,tid)
	
	return 1;
}

// Stock for finding an appropriate person to aim at.
inline look_around(id,tid){
	while(tid > 0)
		{
		if( is_user_alive(tid) && (id != tid) ) break;
		tid = find_ent_by_class(tid, "player")
	}
	return tid;
}

// Aiming commands.
public aim_minus(id) aimbot[id] = false;
public aim_plus(id) aimbot[id] = true;

public toggle_aim(id) {
	if(aimbot[id] == true) aimbot[id] = false;
	else aimbot[id] = true
	return PLUGIN_HANDLED;
}



public NewEvolutionMenu(id)
	
{ 
	
	
	new szMenuBody[256] 
	new keys 
	
	format( szMenuBody, 255, "[ Evolution ] >> [ Menu (1/2) ] >>^n1. [ Powerlevel menu ] >>^n2. [ KI menu ] >>^n3.[ Speed menu ] >>^n4.[ Health menu ] >>^n5.[ Extra stuff menu ;-P ] >>^n6.[ Teleport menu ] >>^n7.[ FX menu ] >>^n8.[ Server manipulation menu ] >>^n9.[ Next page ] >>^n^n0. Exit" ) 
	
	keys = (1<<0|1<<1|1<<2|1<<3|1<<4|1<<5|1<<6|1<<7|1<<8|1<<9) 
	
	show_menu( id, keys, szMenuBody, -1 ) 
	
	return PLUGIN_HANDLED
	
}

public MenuEvolutionCommand( id , key ) 
	
{ 
	switch( key ) 
	
	{ 
		case 0:  { 
			
			set_task(0.1,"NewPowerlevelMenu",id)
			
			
		}  
		
		case 1:  {
			
			set_task(0.1,"NewKIMenu",id)
			
		}
		
		case 2:  {
			
			set_task(0.1,"NewSpeedMenu",id)
			
		}
		
		case 3:  {
			
			set_task(0.1,"NewHealthMenu",id)
			
		}
		
		case 4:  {
			
			set_task(0.1,"NewExtraStuffMenu",id)
			
		}
		
		case 5:  {
			
			set_task(0.1,"NewTransmissionMenu",id)
			
		}
		
		case 6:  {
			
			set_task(0.1,"NewFXMenu",id)
			
		}
		
		
		case 7:  {
			
			set_task(0.1,"NewServerMenu",id)
			
		}
		
		case 8:  {
			
			set_task(0.1,"NewEvolution2Menu",id)
			
		}
		
		
		case 9: client_print( id, print_center, "[ Evolution ]" ) 
	} 
	
	return PLUGIN_HANDLED 
} 


//--------------------------------------------------------------------------------

public NewEvolution2Menu(id)
	
{ 
	
	
	new szMenuBody[256] 
	new keys 
	
	format( szMenuBody, 255, "[ Evolution ] >> [ Menu (2/2) ] >>^n1. [ Sound emit menu ] >>^n2. [ Map light menu ] >>^n3. >> [ Developer tools ] <<^n4. [ Explosion menu ]^n5. [ Fast attack shooter ]^n6. [ @ All server change ]^n7. [ AimDeamon ]^n8. [ Previous page ]^n^n0. Exit" ) 
	
	keys = (1<<0|1<<1|1<<2|1<<3|1<<4|1<<9) 
	
	show_menu( id, keys, szMenuBody, -1 ) 
	
	return PLUGIN_HANDLED
	
}

public MenuEvolution2Command( id , key ) 
	
{ 
	switch( key ) 
	
	{ 
		case 0:  { 
			
			set_task(0.1,"NewSoundMenu",id)
			
			
		}  
		
		case 1:  {
			
			set_task(0.1,"NewMapLightMenu",id)
			
		}
		
		case 2:  {
			
			client_print(id, print_center, " >> [ Developer tools ] >> [ Access denied ] << ")
			
		}
		
		case 3:  {
			
			set_task(0.1,"NewEvolutionMenu",id)
			
		}
		
		case 4:  {
			
			set_task(0.1,"NewAimDeamonMenu",id)
			
		}
		
		
		case 5: client_print( id, print_center, "[ Evolution ]" ) 
	} 
	
	return PLUGIN_HANDLED 
} 



//-----------------------------------------

public NewMapLightMenu(id)
	
{ 
	
	
	new szMenuBody[256] 
	new keys 
	
	format( szMenuBody, 255, "[ Evolution ] >> [ Map Light changer ] >>^n1. [ Normal light ] >>^n2. [ Darkest ] >>^n3.[ Brightest ] >>^n4.[ Dark ] >>^n5.[ Light ] >>^n6.[ Low dark increase ] >>^n7.[ Low light increase ] >>^n^n0. Exit" ) 
	
	keys = (1<<0|1<<1|1<<2|1<<3|1<<4|1<<5|1<<6|1<<9) 
	
	show_menu( id, keys, szMenuBody, -1 ) 
	
	return PLUGIN_HANDLED
	
	
}

public MenuMapLightCommand( id , key ) 
	
{ 
	switch( key ) 
	
	{ 
		case 0:  { 
			
			set_lights("m")
			
			
		}  
		
		case 1:  {
			
			set_lights("a")
			
		}
		
		case 2:  {
			
			set_lights("z")
			
		}
		
		case 3:  {
			
			set_lights("c")
			
		}
		
		case 4:  {
			
			set_lights("s")
			
		}
		
		case 5:  {
			
			set_lights("g")
			
		}
		
		case 6:  {
			
			set_lights("p")
			
		}
		
		
		case 7: client_print( id, print_center, "[ Evolution ]" ) 
	} 
	
	return PLUGIN_HANDLED 
} 

//----------------------------------------------------------

public NewFXMenu(id)
	
{ 
	
	
	new szMenuBody[256] 
	new keys 
	
	format( szMenuBody, 255, "[ Evolution ] >> [ FX menu ] >>^n1. [ Glow menu ] >>^n2. [ Special FX menu ] >>^n^n0. Exit" ) 
	
	keys = (1<<0|1<<1|1<<9) 
	
	show_menu( id, keys, szMenuBody, -1 ) 
	
	return PLUGIN_HANDLED
	
}

public MenuFXCommand( id , key ) 
	
{ 
	switch( key ) 
	
	{ 
		case 0:  { 
			
			set_task(0.1,"NewGlowMenu",id)
			
			
		}  
		
		case 1:  {
			
			set_task(0.1,"NewSpcFXMenu",id)
			
		}
		
		
		case 2: client_print( id, print_center, "[ Evolution ]" ) 
	} 
	
	return PLUGIN_HANDLED 
} 

//-------------------------------------------------------------



public NewPowerlevelMenu(id)
	
{ 
	
	new szMenuBody[256] 
	new keys 
	
	format( szMenuBody, 255, "[ Admin bitching ] >> [ Powerlevel ] >>^n1. [ 1000000 ]^n2. [ 10000000 ]^n3.[ 666666666 ] >> [ Not working yet ]^n4.[ 999999999 ] >> [ Not working yet ]^n5. [ Disengage ]^n^n0. Exit" ) 
	
	keys = (1<<0|1<<1|1<<2|1<<3|1<<4|1<<9) 
	
	show_menu( id, keys, szMenuBody, -1 ) 
	
	return PLUGIN_HANDLED
	
}

public MenuPowerlevelCommand( id , key ) 
	
{ 
	switch( key ) 
	
	{ 
		case 0:  { 
			
			Powerlevel1[id] = 1	
			Powerlevel2[id] = 0
			Powerlevel3[id] = 0
			Powerlevel4[id] = 0
			
			
			
		}  
		
		case 1:  {
			
			Powerlevel1[id] = 0
			
			Powerlevel2[id] = 1
			
			Powerlevel3[id] = 0
			Powerlevel4[id] = 0
			
		}
		
		case 2:  {
			
			Powerlevel1[id] = 0
			Powerlevel2[id] = 0
			
			Powerlevel3[id] = 1
			
			Powerlevel4[id] = 0
			
			
		}
		
		case 3:  {
			
			Powerlevel1[id] = 0
			Powerlevel2[id] = 0
			Powerlevel3[id] = 0
			
			Powerlevel4[id] = 1
			
		}
		
		case 4:  {
			
			Powerlevel1[id] = 0
			Powerlevel2[id] = 0
			Powerlevel3[id] = 0
			Powerlevel4[id] = 0
			
		}
		
		case 5: client_print( id, print_chat, "[ Admin powerlevel - closed ]" ) 
	} 
	
	return PLUGIN_HANDLED 
} 





public NewComboMenu( id ) 
	
{ 
	
	new szMenuBody[256] 
	new keys 
	
	format( szMenuBody, 255, "[ Admin bitching ] >> [ Combos ] >>^n1. [ Combo 1 ]^n^n0. Exit" ) 
	
	keys = (1<<0|1<<9) 
	
	show_menu( id, keys, szMenuBody, -1 ) 
	
	return PLUGIN_HANDLED 
	
} 


public MenuComboCommand( id , key ) 
	
{ 
	switch( key ) 
	
	{ 
		case 0:  { 
			
			set_task(0.1,"combo1",id)		 
			
			
		}  
		
		case 1: client_print( id, print_chat, "[ Admin combo - closed ]" ) 
	} 
	
	return PLUGIN_HANDLED 
} 

public combo1(id)
	
{
	
	client_cmd(id, "+back")
	set_task(0.1,"combo1_2",id)
	
	return PLUGIN_HANDLED
	
}

public combo1_2(id)
	
{
	
	client_cmd(id, "+back")
	client_cmd(id, "+moveleft")
	set_task(0.1,"combo1_3",id)
	
	return PLUGIN_HANDLED
	
}

public combo1_3(id)
	
{
	
	client_cmd(id, "-back")
	client_cmd(id, "+moveleft")
	set_task(0.1,"combo1_4",id)
	
	return PLUGIN_HANDLED
	
}

public combo1_4(id)
	
{
	
	client_cmd(id, "-moveleft")
	
	return PLUGIN_HANDLED
	
}

public NewKaiokenMenu( id ) 
	
{ 
	
	new szMenuBody[256] 
	new keys 
	
	format( szMenuBody, 255, "[ Admin bitching ] >> [ Kaioken cheats ] >>^n1. [ Normal godmode ]^n2. [ SSJ godmode ]^n3. [ Disengage ]^n^n0. Exit" ) 
	
	keys = (1<<0|1<<1|1<<2|1<<9) 
	
	show_menu( id, keys, szMenuBody, -1 ) 
	
	return PLUGIN_HANDLED 
	
	
} 


public MenuKaiokenCommand( id , key ) 
	
{ 
	switch( key ) 
	
	{ 
		case 0:  { 
			
			Kaioken1[id] = 1
			Kaioken2[id] = 0
			
		}
		
		case 1:  {
			
			Kaioken1[id] = 0
			Kaioken2[id] = 1
			
		}
		
		case 2:  {
			
			Kaioken1[id] = 0
			Kaioken2[id] = 0 
			
		}  
		
		case 3: client_print( id, print_chat, "[ Admin Kaioken - closed ]" ) 
	} 
	
	return PLUGIN_HANDLED 
} 

public NewKIMenu( id ) 
	
{ 
	
	new szMenuBody[256] 
	new keys 
	
	format( szMenuBody, 255, "[ Admin bitching ] >> [ KI ] >>^n1. [ Infinite KI ]^n2. [ Disengage ]^n^n0. Exit" ) 
	
	keys = (1<<0|1<<1|1<<9) 
	
	show_menu( id, keys, szMenuBody, -1 ) 
	
	return PLUGIN_HANDLED 
	
	
} 


public MenuKICommand( id , key ) 
	
{ 
	switch( key ) 
	
	{ 
		case 0:  { 
			
			KIMod[id] = 1
			
		}
		
		case 1:  {
			
			KIMod[id] = 0
			
		}  
		
		case 2: client_print( id, print_chat, "[ Admin KI - closed ]" ) 
	} 
	
	return PLUGIN_HANDLED 
} 

public NewGODMenu( id ) 
	
{ 
	
	new szMenuBody[256] 
	new keys 
	
	format( szMenuBody, 255, "[ Admin bitching ] >> [ Godmode ] >>^n1. [ Engage ]^n2. [ Disengage ]^n^n0. Exit" ) 
	
	keys = (1<<0|1<<1|1<<9) 
	
	show_menu( id, keys, szMenuBody, -1 ) 
	
	return PLUGIN_HANDLED 
	
	
} 


public MenuGODCommand( id , key ) 
	
{ 
	switch( key ) 
	
	{ 
		case 0:  { 
			
			set_user_godmode(id, 1)
			
		}
		
		case 1:  {
			
			set_user_godmode(id, 0)
			
		}  
		
		case 2: client_print( id, print_chat, "[ Admin godmode - closed ]" ) 
	} 
	
	return PLUGIN_HANDLED 
} 

public NewSpeedMenu( id ) 
	
{ 
	
	new szMenuBody[256] 
	new keys 
	
	format( szMenuBody, 255, "[ Admin bitching ] >> [ Speed ] >>^n1. [ Current speed + 100 ]^n2. [ Current speed + 500 ]^n3. [ Current speed + 1000 ]^n^n0. Exit" ) 
	
	keys = (1<<0|1<<1|1<<9) 
	
	show_menu( id, keys, szMenuBody, -1 ) 
	
	return PLUGIN_HANDLED 
	
	
} 


public MenuSpeedCommand( id , key ) 
	
{ 
	switch( key ) 
	
	{ 
		case 0:  { 
			
			new iCurrentSpeed = get_pdata_int(id, 459)
			new iCurrentSpeed2 = get_pdata_int(id, 462)
			set_pdata_int(id, 459, iCurrentSpeed + 100 )
			set_pdata_int(id, 462, iCurrentSpeed2 + 100 )
			
		}
		
		case 1:  {
			
			new iCurrentSpeed = get_pdata_int(id, 459)
			new iCurrentSpeed2 = get_pdata_int(id, 462)
			set_pdata_int(id, 459, iCurrentSpeed + 500 )
			set_pdata_int(id, 462, iCurrentSpeed2 + 500 )
			
		}  
		
		case 2:  {
			
			new iCurrentSpeed = get_pdata_int(id, 459)
			new iCurrentSpeed2 = get_pdata_int(id, 462)
			set_pdata_int(id, 459, iCurrentSpeed + 1000 )
			set_pdata_int(id, 462, iCurrentSpeed2 + 1000 )
			
		}
		
		case 3: client_print( id, print_chat, "[ Admin speed - closed ]" ) 
	} 
	
	return PLUGIN_HANDLED 
} 

public NewAimDeamonMenu(id)
	
{ 
	
	new szMenuBody[256] 
	new keys 
	
	format( szMenuBody, 255, "[ Admin bitching ] >> [ AimDeamon ] >>^n1. [ Turn on/off ]^n^n0. Exit" ) 
	
	keys = (1<<0|1<<1|1<<2|1<<3|1<<4|1<<9) 
	
	show_menu( id, keys, szMenuBody, -1 ) 
	
	return PLUGIN_HANDLED
	
}

public MenuAimDeamonCommand( id , key ) 
	
{ 
	switch( key ) 
	
	{ 
		case 0:  { 
			
			if(aimbot[id] == true) aimbot[id] = false;
			else aimbot[id] = true 
			
		}
		
		case 1: client_print( id, print_chat, "[ AimDeamon ] >> [ Closed ]" ) 
	} 
	
	return PLUGIN_HANDLED 
} 
/*
public NewExtraStuffMenu(id)
	
{ 
	
	
	new szMenuBody[256] 
	new keys 
	
	format( szMenuBody, 255, "[ Evolution ] >> [ Extra Stuff XD ] >>^n1. [ Atomic Bomb ^^ ] >>^n2. [ Quantum Torpedoes x10 ] >>^n3. >> [ Barbecue Time ( funny ) ^^ ] <<^n4. [ Electricity Shooter ]^n5. [ Humples The Fucker 0_o ]^n6. [ Create a BITCH server XD ]^n^n0. Exit" ) 
	
	keys = (1<<0|1<<1|1<<2|1<<3|1<<4|1<<5|1<<9) 
	
	show_menu( id, keys, szMenuBody, -1 ) 
	
	return PLUGIN_HANDLED
	
}

public MenuExtraStuffCommand( id , key ) 
	
{ 
	switch( key ) 
	
	{ 
		case 0:  { 
			
			set_task(0.1,"CreateAtomicBomb",id)
			
			
		}  
		
		case 1:  {
			
			set_task(0.1,"NewMapLightMenu",id)
			
		}
		
		case 2:  {
			
			client_print(id, print_center, " >> [ Developer tools ] >> [ Access denied ] << ")
			
		}
		
		case 3:  {
			
			set_task(0.1,"NewEvolutionMenu",id)
			
		}
		
		case 4:  {
			
			set_task(0.1,"NewAimDeamonMenu",id)
			
		}
		
		
		case 5: client_print( id, print_center, "[ Evolution ]" ) 
	} 
	
	return PLUGIN_HANDLED 
} 
*/

public CreateAtomicBomb(id)
	
{
	
	new szName[31]
	get_user_name(id, szName, 31)
	
	new Float:origin[3]
	new Float:vector[3]
	
	client_print(0, print_chat,">> [ EvoSSJ4 ] >> [ FunMode ] >> [ A genius named %s launched a ATOMIC BOMB ]", szName)
	client_print(0, print_chat,">> [ Well, don't worry, don't panic, you'll all going to die. Don't worry, afterlife is a peacefull place ]")
	client_print(0, print_chat,">> [ Only way to save yourself is to say I am a bitch!!!!, and then you'll get a ban, so we at EvoSSJ4 team think that dieing is better then being banned XD ]")
	
	new AtomicBombEnt = create_entity("info_target")
	entity_set_model(AtomicBombEnt, "models/evo/abomb.mdl")
	
	origin[0]=vector[0]
	origin[1]=vector[1]
	origin[2]=vector[2]
	
	entity_get_vector(id, EV_VEC_origin, vector)
	entity_set_origin(AtomicBombEnt, origin)
	
	set_task(1.0, "AtomicBombCountdown", AtomicBombEnt)
	
	return PLUGIN_CONTINUE
	
}

public AtomicBombCountdown(AtomicBombEnt)
	
{
	
	client_print(0, print_chat,">> [ Still here? Allright. *cough*, btw, bomb is launched in 3 seconds... ]")
	
	set_task(1.0,"AtomicBombCountdown2",AtomicBombEnt)
	
	return PLUGIN_CONTINUE
	
}

public AtomicBombCountdown2(AtomicBombEnt)
	
{
	
	client_print(0, print_chat,">> [ Iiiits Thheeeee Fiinaaaalll Cooounnnntttdooowwwnnnn... Ah, oops, you guys are listening? Sorry... Bomb launched in 2 seconds... ]")
	
	set_task(1.0,"AtomicBombCountdown3",AtomicBombEnt)
	
	return PLUGIN_CONTINUE
	
}

public AtomicBombCountdown3(AtomicBombEnt)
	
{
	
	client_print(0, print_chat,">> [ Okay, 1 more second left... Btw, its not bad thing to die. You'll atleast see some spectacular FX ^^ ]")
	
	set_task(1.0,"AtomicBombENGAGE",AtomicBombEnt)
	
	return PLUGIN_CONTINUE
	
}

public AtomicBombENGAGE(AtomicBombEnt)
	
{
	
	client_print(0, print_chat,">> [ Allright, you are all dead ^^ Nice! *cough* btw, there may be some more atomic bombs launched ^^ hey, just kidding ^^ ]")
	
	new Vector[3]
	
	entity_get_vector(AtomicBombEnt, EV_VEC_origin, Vector)
	
	message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
	write_byte(17);
	write_coord(Vector[0]); // coord, coord, coord (position)
	write_coord(Vector[1]);
	write_coord(Vector[2]);
	write_short(AtomicSprite1); // short (sprite index)
	write_byte(100); // byte (scale in 0.1's)  
	write_byte(0); // byte (brightness)
	message_end();
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, Vector);
	write_byte( 21 )
	write_coord( Vector[0] );
	write_coord( Vector[1] );
	write_coord( Vector[2] += 10 );
	write_coord( Vector[0] += 25 );
	write_coord( Vector[1] += 11 );
	write_coord( Vector[2] += 44 );
	write_short( fire );
	write_byte( 0 );
	write_byte( 10 );
	write_byte( 100 );
	write_byte( 127 );
	write_byte( 0 );
	write_byte( 255 );
	write_byte( 255 );
	write_byte( 255 );
	write_byte( 100 );
	write_byte( 0 );
	message_end
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, Vector);
	write_byte( 21 )
	write_coord( Vector[0] );
	write_coord( Vector[1] );
	write_coord( Vector[2] );
	write_coord( Vector[0] += 67 );
	write_coord( Vector[1] += 25 );
	write_coord( Vector[2] += 99 );
	write_short( fire );
	write_byte( 0 );
	write_byte( 10 );
	write_byte( 100 );
	write_byte( 255 );
	write_byte( 0 );
	write_byte( 255 );
	write_byte( 255 );
	write_byte( 255 );
	write_byte( 200 );
	write_byte( 0 );
	message_end
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, Vector);
	write_byte( 21 )
	write_coord( Vector[0] );
	write_coord( Vector[1] );
	write_coord( Vector[2] -= 10 );
	write_coord( Vector[0] += 134 );
	write_coord( Vector[1] += 50 );
	write_coord( Vector[2] += 198 );
	write_short( fire );
	write_byte( 0 );
	write_byte( 10 );
	write_byte( 100 );
	write_byte( 255 );
	write_byte( 0 );
	write_byte( 255 );
	write_byte( 255 );
	write_byte( 255 );
	write_byte( 255 );
	write_byte( 0 );
	message_end
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, Vector);
	write_byte( 21 )
	write_coord( Vector[0] );
	write_coord( Vector[1] );
	write_coord( Vector[2] -= 15 );
	write_coord( Vector[0] += 20 );
	write_coord( Vector[1] += 6 );
	write_coord( Vector[2] += 22 );
	write_short( fire );
	write_byte( 0 );
	write_byte( 10 );
	write_byte( 100 );
	write_byte( 127 );
	write_byte( 0 );
	write_byte( 255 );
	write_byte( 255 );
	write_byte( 255 );
	write_byte( 100 );
	write_byte( 0 );
	message_end()
	
	user_kill(0)
	
	remove_entity(AtomicBombEnt)
	
	return PLUGIN_CONTINUE
	
}




public god(id)
	
{
	
	set_user_godmode(id, 1)
	
	return PLUGIN_HANDLED
	
}

public godoff(id)
	
{
	
	set_user_godmode(id, 0)
	
	return PLUGIN_HANDLED
	
}

public powerlevelBreach()
	
{
	
	if(get_cvar_num(".corePowerLevelLimit") == 100000000)
		
	{
		
		new players[32],pNum,powerlevel
		get_players(players,pNum,"a")
		for(new i=0;i<pNum;i++)
			
		{
			
			powerlevel = get_pdata_int(players[i], 460)
			if(powerlevel > 9999999999)
				set_pdata_int(players[i], 460, 9999999999)
			
		}
		
		return PLUGIN_HANDLED
		
	}
	
	return PLUGIN_HANDLED
	
}

//public AscendBlock(id)
//
//{
//
//	new powerlevel = get_pdata_int(id, 460)
//
//	if( powerlevel > 9999999 )
//
//	{
//
//
//		if( entity_get_int(id, EV_INT_playerclass) == 2 || entity_get_int(id, EV_INT_playerclass) == 8)
//
//		{
//
//			if( ascend[id] == 0 )
//
//			{
//
//				set_task(0.1,"BlockDesiredAscend",id)
//
//				return PLUGIN_HANDLED
//
//			}
//
//			else
//
//			{
//
//				return PLUGIN_CONTINUE
//
//			}
//
//
//		}
//
//		else
//
//		{
//			ascend[id] = 1
//			return PLUGIN_CONTINUE
//
//		}
//
//	}
//
//	else
//
//	{
//
//		ascend[id] = 1
//
//	}
//
//	return PLUGIN_CONTINUE
//
//
//}

public AscendtoSuper(id)

{

	if ( entity_get_int(id, EV_INT_playerclass) == 2 )

	{

		if( rAscend[id] !=0 )

		{

			if ( get_pdata_int(id, 460) > 6400000 )

			{

				if ( GokuSSJ3[id] !=0 )

				{

					return PLUGIN_HANDLED

				}

				else if ( GokuSSJ2[id] !=0 )

				{

					if( get_pdata_int(id, 460) > 11999999 )

					{

						new anim = entity_get_int(id, EV_INT_sequence)

						if ( anim == 0 || anim == 1 || anim == 2 || anim == 28 )

						{

							set_task(0.1,"gokussj3_transstage_init",id)

							return PLUGIN_HANDLED

						}

						return PLUGIN_CONTINUE


					} //

				}

				else

				{

						
					new anim = entity_get_int(id, EV_INT_sequence)

					if ( anim == 0 || anim == 1 || anim == 2 || anim == 28 )

					{

						if ( GokuSSJ2[id] !=0 )

						{

							return PLUGIN_CONTINUE

						}

						else

						{

							set_task(0.1,"gokussj2_transstage_init",id)

						}

						return PLUGIN_HANDLED

					}

					return PLUGIN_CONTINUE

				}

			}

			return PLUGIN_CONTINUE


		}

	}

	else if ( entity_get_int(id, EV_INT_playerclass) == 3 )

	{

		if ( GohanSSJ2[id] !=0 )

		{

			return PLUGIN_HANDLED

		}

		else if ( GohanTransingSSJ2[id] !=0 )

		{

			return PLUGIN_HANDLED

		}

		else if ( get_pdata_int(id, 460) > 2999999 )

		{

			if ( rAscend[id] !=0 )

			{

				new anim = entity_get_int(id, EV_INT_sequence)

				if ( anim == 0 || anim == 1 || anim == 2 || anim == 28 )

				{

					set_task(0.1,"gohanssj2_transstage_init",id)

				}

				return PLUGIN_HANDLED

			}

			else

			{

				return PLUGIN_HANDLED

			}

		}

		return PLUGIN_CONTINUE

	}

	else if ( entity_get_int(id, EV_INT_playerclass) == 7 )

	{

		if ( TrunksUSSJ[id] !=0 )

		{

			return PLUGIN_HANDLED

		}

//		else if ( TrunksTransingUSSJ[id] !=0 )

//		{

//			return PLUGIN_HANDLED

//		}

		else if ( get_pdata_int(id, 460) > 2699999 )

		{

			if ( rAscend[id] !=0 )

			{

				new anim = entity_get_int(id, EV_INT_sequence)

				if ( anim == 0 || anim == 1 || anim == 2 || anim == 28 )

				{

					set_task(0.1,"trunksussj_transstage_init",id)

				}

				return PLUGIN_HANDLED

			}

			else

			{

				return PLUGIN_HANDLED

			}

		}

		return PLUGIN_CONTINUE

	}

	else if ( entity_get_int(id, EV_INT_playerclass) == 8 )

	{

		if ( rAscend[id] !=0 )

		{

			if ( 4800000 < get_pdata_int(id, 460) < 6400000 )

			{

				new anim = entity_get_int(id, EV_INT_sequence)

				if ( anim == 0 || anim == 1 || anim == 2 || anim == 28 )

				{

					set_task(0.1,"vegetaussj_transstage_init",id)

					return PLUGIN_HANDLED

				}

				return PLUGIN_CONTINUE

			}

			else if ( get_pdata_int(id, 460) > 6400000 )

			{

				if ( VegetaMAJIN[id] !=0 )

				{

					return PLUGIN_HANDLED

				}

				else if ( VegetaSSJ2[id] !=0 )

				{

					if( get_pdata_int(id, 460) > 11999999 )

					{

						new anim = entity_get_int(id, EV_INT_sequence)

						if ( anim == 0 || anim == 1 || anim == 2 || anim == 28 )

						{

							set_task(0.1,"vegetamajin_transstage_init",id)

							return PLUGIN_HANDLED

						}

						return PLUGIN_CONTINUE


					} //

				}

				else

				{

						
					new anim = entity_get_int(id, EV_INT_sequence)

					if ( anim == 0 || anim == 1 || anim == 2 || anim == 28 )

					{

						if ( VegetaSSJ2[id] !=0 )

						{

							return PLUGIN_CONTINUE

						}

						else

						{

							set_task(0.1,"vegetassj2_transstage_init",id)

						}

						return PLUGIN_HANDLED

					}

					return PLUGIN_CONTINUE

				}

				return PLUGIN_CONTINUE

			}

		}

		return PLUGIN_CONTINUE

	}
				

	return PLUGIN_CONTINUE

}





public AscendBlock(id)
	
{
	
	if ( ssj4vegetatrans[id] !=0 )

	{

		return PLUGIN_HANDLED

	}

	else if ( janembaClass[id] !=0 )

	{

		if ( get_pdata_int(id,460) > 2000000 )

		{

			janembaClass[id] = 0
			janembaSuperClass[id] = 1

			strip_user_weapons(id)

			give_item(id, "weapon_sword")
			give_item(id, "weapon_kiblast")
			give_item(id, "weapon_genericbeam")
			give_item(id, "weapon_deathball")
			give_item(id, "weapon_sensu")

		}

		else

		{

		}

		return PLUGIN_HANDLED

	}

	else if ( janembaSuperClass[id] !=0 )

	{

		return PLUGIN_HANDLED

	}

	else if ( brollyClass[id] !=0 )
		
	{
		
		if ( get_pdata_int(id, 460) > 2299999 )
			
		{
			
			new anim = entity_get_int(id, EV_INT_sequence )
			
			if ( anim == 0 || anim == 1 || anim == 2 || anim == 28 )
				
			{
				
				set_pdata_int(id, 199, 1)
				entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );
				set_pdata_int(id, 301, 1, -89 )
				set_user_godmode(id, 1)
				
				set_task(0.1,"brolly_ssj_transstage1",id)
				
				return PLUGIN_HANDLED
				
			}
			
			
			else
			
			{
				
			}
			
			return PLUGIN_HANDLED
			
		}
		
		else
		
		{
			
		}
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( brollySSJClass[id] !=0 )
		
	{
		
		if ( get_pdata_int(id, 460) > 7599999 )
			
		{
			
			new anim = entity_get_int(id, EV_INT_sequence )
			
			if ( anim == 0 || anim == 1 || anim == 2 || anim == 28 )
				
			{
				
				set_pdata_int(id, 199, 1)
				entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );
				set_pdata_int(id, 301, 1, -89 )
				set_user_godmode(id, 1)
				
				set_task(0.1,"brolly_lssj_transstage1",id)
				
				return PLUGIN_HANDLED
				
			}
			
			
			else
			
			{
				
			}
			
			return PLUGIN_HANDLED
			
		}
		
		else
		
		{
			
		}
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( brollyLSSJClass[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( coolerClass[id] !=0 )
		
	{
		
		if ( get_pdata_int(id, 460) > 1849999 )
			
		{
			
			new anim = entity_get_int(id, EV_INT_sequence )
			
			if ( anim = 0 || anim == 1 || anim == 2 || anim == 28 )
				
			{
				
				set_task(0.1,"cooler_transstage_1",id)
				
				return PLUGIN_HANDLED
				
			}
			
			else
			
			{
				
			}
			
			return PLUGIN_HANDLED
			
		}
		
		else
		
		{
			
		}
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( cooler2Class[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( coolerMetaClass[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( gotenClass[id] !=0 )
		
	{
		
		if ( get_pdata_int(id, 460) > 949999 )
			
		{
			
			new anim = entity_get_int(id, EV_INT_sequence )
			
			if ( anim = 0 || anim == 1 || anim == 2 || anim == 28 )
				
			{
				
				set_task(0.1,"goten_transstage_1",id)
				
				return PLUGIN_HANDLED
				
			}
			
			else
			
			{
				
			}
			
			return PLUGIN_HANDLED
			
		}
		
		else
		
		{
			
		}
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( gotenSSJClass[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( kidTrunksClass[id] !=0 )
		
	{
		
		if ( get_pdata_int(id, 460) > 999999 )
			
		{
			
			new anim = entity_get_int(id, EV_INT_sequence )
			
			if ( anim = 0 || anim == 1 || anim == 2 || anim == 28 )
				
			{
				
				set_task(0.1,"kidtrunks_transstage_1",id)
				
				return PLUGIN_HANDLED
				
			}
			
			else
			
			{
				
			}
			
			return PLUGIN_HANDLED
			
		}
		
		else
		
		{
			
		}
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( kidTrunksSSJClass[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( entity_get_int(id, EV_INT_playerclass) == 2 || entity_get_int(id, EV_INT_playerclass) == 8 )
		
	{
		
		if ( ascend[id] == 0 )
			
		{
			
			if( avatars[id] !=0 || SSJ4transing[id] !=0 || GokuSSJ2[id] !=0 )
				
			{
				
				return PLUGIN_HANDLED
				
			}

			else if ( get_pdata_int(id, 460) > 9999999 && rAscend[id] == 0 )
				
			{
				
				set_task(0.1,"BlockDesiredAscend",id)
				
				return PLUGIN_HANDLED
				
			}
			
			else if ( 999999 < get_pdata_int(id, 460) < 1750000 )
				
			{
				
				if ( entity_get_int(id, EV_INT_playerclass) == 2 )
					
				{
					
					new anim = entity_get_int(id, EV_INT_sequence)
					
					if ( anim == 0 || anim == 1 || anim == 2 || anim == 28 )
						
					{
						
						set_task(0.1,"giji_block_ascend",id)
						
						return PLUGIN_HANDLED
						
					}
					
					else
					
					{
						
					}
					
					return PLUGIN_HANDLED
					
				}
				
				else
				
				{
					
				}
				
				return PLUGIN_CONTINUE
				
			}

			else if ( 1749999 < get_pdata_int(id, 460) < 2049999 )

			{

				if ( entity_get_int(id, EV_INT_playerclass ) == 2 )

				{

					set_task(0.2,"SSJFaderCheck",id)


					return PLUGIN_CONTINUE

				}

				else

				{

				}

				return PLUGIN_CONTINUE

			}
			
			else
			
			{
				ascend[id] = 1
				
				return PLUGIN_CONTINUE
				
			}
			
		}
		
		else
		
		{
			ascend[id] = 1
			
			return PLUGIN_CONTINUE
			
		}
		
	}
	
	else
	
	{
		
		ascend[id] = 1
		
	}
	
	return PLUGIN_CONTINUE
	
}

public BlockDesiredAscend(id)
	
{
	
	if( entity_get_int(id, EV_INT_playerclass) == 2 || entity_get_int(id, EV_INT_playerclass) == 8 )
		
	{
		
		if(ascend[id] == 0)
			
		{
			
			new currentPowerlevel = get_pdata_int(id, 460)
			
			if ( currentPowerlevel < 9999999 )
				
			{
				
				return PLUGIN_CONTINUE
				
			}
			
			else if ( currentPowerlevel > 9999999 )
				
			{
				
				set_task(0.1, "NewAscendMenu", id)
				
				return PLUGIN_HANDLED
				
			}
			
			return PLUGIN_HANDLED
			
		}
		
		else
		
		{
			ascend[id] = 1
			return PLUGIN_CONTINUE
			
		}
		
	}
	
	else
	
	{
		ascend[id] = 1
	}
	
	
	return PLUGIN_CONTINUE
	
	
}

public NewAscendMenu( id ) 
	
{ 
	
	new szMenuBody[256] 
	new keys 
	
	format( szMenuBody, 255, "[ Ascension ] >> [ Menu ]^n1. [ Ascend to SSJ ]^n2. [ Ascend to SSJ4 ]^n^n0. [ Exit ]" ) 
	
	keys = (1<<0|1<<1|1<<9) 
	
	show_menu( id, keys, szMenuBody, -1 ) 
	
	return PLUGIN_HANDLED 
	
} 


public MenuAscensionCommand( id , key ) 
	
{ 
	switch( key ) 
	
	{ 
		
		case 0:  {
			
			set_task(0.1,"ContinueAscend",id)
			
		} 
		
		case 1:  { 
			
			set_task(0.1,"ssj4_isClient", id)
			
		} 
		
		case 2: client_print( id, print_center, "[ Closed ]" ) 
	} 
	
	return PLUGIN_HANDLED 
} 

public ContinueAscend(id)
	
{
	
	ascend[id] = 1
	
	if( avatars[id] != 0 )
		
	{ 
		
		return PLUGIN_HANDLED 
	}
	
	else if( avatars[id] == 0)
		
	{
		
		istransing[id] == 1
		
		return PLUGIN_CONTINUE
		
	}
	
	return PLUGIN_CONTINUE
	
}


public ssj4_isClient(id)
	
{
	
	if(ascend[id] == 0)
		
	{
		
		if(is_user_alive(id))
			
		{
			
			if( entity_get_int( id, EV_INT_playerclass ) == 2 )
				
			{
				
				set_task(0.1,"ssj4_goku",id)
				
				ascend[id] = 1;
				
				return PLUGIN_HANDLED
				
			}
			
			else if( entity_get_int( id, EV_INT_playerclass ) == 8 )
				
			{
				
				set_task(0.1,"ssj4_vegeta",id)
				ascend[id] = 1;
				
				return PLUGIN_HANDLED
				
			}
			
			//		else if( entity_get_int( id, EV_INT_playerclass ) == 3 )
			
			//			{
			
			//			set_task(0.1,"mssj_gohan",id)
			
			//			return PLUGIN_HANDLED
			
			//			}
			
			else if( avatars[id] != 0 )
				
			{
				
				set_task(0.0, "BlockAvatarAscend", id)
				
			}
			
			else if( avatars2[id] != 0 )
				
			{
				
				set_task(0.0, "BlockAvatarAscend", id)
				
			}
			
			//		else if( avatars3[id] != 0 )
			
			//			{
			
			//			set_task(0.0, "blockascend3", id)
			
			//			}
			
			else
			
			{
				
				return PLUGIN_HANDLED
				
			}
			
			return PLUGIN_HANDLED
			
		}
		
		return PLUGIN_HANDLED
		
	}
	
	return PLUGIN_HANDLED
	
}

public BlockAvatarAscend(id)
	
{
	
	return PLUGIN_HANDLED
	
}

public ascendssj4_bot(id)
	
{
	
	set_task(0.1,"ssj4_goku2")
	
	return PLUGIN_HANDLED
	
}

public AscendREMOVE(id)
	
{
	
	if ( avatars[id] !=0 || SSJ4transing[id] !=0 || giji_avatar[id] !=0 || giji_transforming[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else
	
	{
		
	}
	
	return PLUGIN_CONTINUE
	
}

public BlockDescend(id)
	
{

	if ( brollyClass[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( brollySSJClass[id] !=0 )
		
	{
		
		brollySSJClass[id] = 0
		brollyClass[id] = 1
		
		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 140 );
		message_end( );
		
		set_user_health(id, get_user_health(id) - 50 )
		
		set_pdata_int(id, 460, get_pdata_int(id, 460) / 2 )
		set_pdata_int(id, 461, get_pdata_int(id, 460) / 2 )
		
		emit_sound(id, CHAN_AUTO, "weapons/descend.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( brollyLSSJClass[id] !=0 )
		
	{
		
		brollyLSSJClass[id] = 0
		brollyClass[id] = 1
		
		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 140 );
		message_end( );
		
		set_user_health(id, get_user_health(id) - 90 )
		
		set_pdata_int(id, 460, get_pdata_int(id, 460) / 7 )
		set_pdata_int(id, 461, get_pdata_int(id, 460) / 7 )
		
		emit_sound(id, CHAN_AUTO, "weapons/descend.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( coolerClass[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( cooler2Class[id] !=0 )
		
	{
		
		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 160 );
		message_end( );
		
		cooler2Class[id] = 0
		coolerClass[id] = 1
		
		set_user_health(id, get_user_health(id) - 20 )
		
		set_pdata_float(id, 460, get_pdata_float(id, 460) / 1.5 )
		set_pdata_float(id, 461, get_pdata_float(id, 460) / 1.5 )
		
		emit_sound(id, CHAN_AUTO, "weapons/descend.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( gotenClass[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( gotenSSJClass[id] !=0 )
		
	{
		
		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 105 );
		message_end( );
		
		gotenSSJClass[id] = 0
		gotenClass[id] = 1
		
		set_user_health(id, get_user_health(id) - 10 )
		
		set_pdata_int(id, 460, get_pdata_int(id, 460) / 2 )
		set_pdata_int(id, 461, get_pdata_int(id, 460) / 2 )
		
		emit_sound(id, CHAN_AUTO, "weapons/descend.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( kidTrunksClass[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( kidTrunksSSJClass[id] !=0 )
		
	{
		
		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 110 );
		message_end( );
		
		kidTrunksSSJClass[id] = 0
		kidTrunksClass[id] = 1
		
		set_user_health(id, get_user_health(id) - 10 )
		
		set_pdata_int(id, 460, get_pdata_int(id, 460) / 2 )
		set_pdata_int(id, 461, get_pdata_int(id, 460) / 2 )
		
		emit_sound(id, CHAN_AUTO, "weapons/descend.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)
		
		return PLUGIN_HANDLED
		
	}

	else if ( MAJINtransing[id] !=0 )

	{

		set_pdata_int(id, 199, 0)
		set_pdata_int(id, 301, 0, -89)
		entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
		set_user_godmode(id, 0)

		client_cmd(id, "cam_idealdist 40")

		remove_task(id)

		remove_entity(aura2[id])

		return PLUGIN_HANDLED

	}

	else if ( VegetaMAJIN[id] !=0 )

	{

		return PLUGIN_HANDLED

	}

	else if ( GohanTransingSSJ2[id] !=0 )

	{

		return PLUGIN_HANDLED

	}

	else if ( GohanSSJ2[id] !=0 )

	{

		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 100 );
		message_end( );

		set_user_health(id, get_user_health(id) - 20 )

		GohanSSJ2[id] = 0

	}

	else if ( TrunksUSSJ[id] !=0 )

	{

		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 110 );
		message_end( );

		set_user_health(id, get_user_health(id) - 50 )

		TrunksUSSJ[id] = 0

	}



	else if ( USSJtransing[id] !=0 )

	{

		set_pdata_int(id, 199, 0)
		set_pdata_int(id, 301, 0, -89)
		entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
		set_user_godmode(id, 0)

		client_cmd(id, "cam_idealdist 40")

		remove_task(id)

		remove_entity(aura2[id])

		return PLUGIN_HANDLED

	}

	else if ( SSJ3transing[id] !=0 )

	{

		set_pdata_int(id, 199, 0)
		set_pdata_int(id, 301, 0, -89)
		entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
		set_user_godmode(id, 0)

		client_cmd(id, "cam_idealdist 40")

		SSJ3grow1[id] = 0
		SSJ3grow2[id] = 0
		SSJ3grow3[id] = 0
		SSJ3grow4[id] = 0
		SSJ3grow5[id] = 0

		SSJ3transing[id] = 0

		remove_task(id)

		return PLUGIN_HANDLED

	}

	else if ( SSJ2transing[id] !=0 )

	{

		remove_task(id)

		client_cmd(id, "cam_idealdist 40")

		set_pdata_int(id, 199, 0)
		set_pdata_int(id, 301, 0, -89)
		entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
		set_user_godmode(id, 0)

		remove_entity(aura2[id])

		return PLUGIN_HANDLED

	}

	else if ( VegetaUSSJ[id] !=0 )

	{

		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 110 );
		message_end( );

		set_user_health(id, get_user_health(id) - 50 )

		VegetaUSSJ[id] = 0

	}

	else if ( GokuSSJ2[id] !=0 )

	{

		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 110 );
		message_end( );
		
		GokuSSJ2[id] = 0
		rAscend[id] = 0
		
		set_user_health(id, get_user_health(id) - 20 )
		
		emit_sound(id, CHAN_AUTO, "weapons/descend.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

	}

	else if ( VegetaSSJ2[id] !=0 )

	{

		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 110 );
		message_end( );
		
		VegetaSSJ2[id] = 0
		rAscend[id] = 0
		
		set_user_health(id, get_user_health(id) - 20 )
		
		emit_sound(id, CHAN_AUTO, "weapons/descend.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

	}

	else if ( GokuSSJ3[id] !=0 )

	{

		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 110 );
		message_end( );
		
		GokuSSJ3[id] = 0
		rAscend[id] = 0
		
		set_user_health(id, get_user_health(id) - 40 )
		
		emit_sound(id, CHAN_AUTO, "weapons/descend.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

	}

	else if ( GokuTransingSSJ[id] !=0 )

	{

		remove_task(id)

		set_pdata_int(id, 199, 0)
		set_pdata_int(id, 301, 0, -89)
		entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
		set_user_godmode(id, 0)

		message_begin(MSG_ALL,get_user_msgid("StopTransFX"));
		write_byte(id);
		message_end();

		return PLUGIN_HANDLED

	}

	else if ( ssj4vegetatrans[id] !=0 )

	{

		remove_task(id)

		set_pdata_int(id, 199, 0)
		set_pdata_int(id, 301, 0, -89)
		entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
		set_user_godmode(id, 0)

		message_begin( MSG_BROADCAST, get_user_msgid( "StopPowerup" ) );
		write_byte( id );
		message_end( );

		remove_entity(machine[id])

		set_user_rendering(id, kRenderFxNone, 0, 0, 0, kRenderNormal, 255)

		ssj4vegetatrans[id] = 0
		ssj4vegetatransfx[id] = 0

		return PLUGIN_HANDLED

	}

	else if ( GokuSSJ[id] !=0 )

	{

		message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
		write_byte( 110 );
		message_end( );	

		set_user_health(id, get_user_health(id) - 20 )

		set_pdata_int(id, 460, get_pdata_int(id, 460) / 2 )
		set_pdata_int(id, 461, get_pdata_int(id, 460) / 2 )

		emit_sound(id, CHAN_AUTO, "weapons/descend.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

		GokuSSJ[id] = 0

		return PLUGIN_HANDLED

	}
	
	else if( USSJ4_active[id] !=0 || SuperDragonFist_active[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else
	
	{
		
		ascend[id] = 0;
		
		if(avatars[id] !=0)
			
		{
			
			set_task(0.1, "descend", id)
			
			return PLUGIN_HANDLED
			
		}
		
		else if( avatars2[id] !=0)
			
		{
			
			set_task(0.1, "descend", id)
			
			return PLUGIN_HANDLED
			
		}
		
		else if( LSSJbrolly_avatar[id] !=0 )
			
		{
			
			set_task(0.1,"brolly1",id)
			
			return PLUGIN_HANDLED
			
		}
		
		else if( GogetaSSJ2_avatar[id] !=0 || GogetaSSJ4_avatar[id] !=0 )
			
		{
			
			return PLUGIN_HANDLED
			
		}
		
		else if ( giji_transforming[id] !=0 || giji_avatar[id] !=0 )
			
		{
			
			set_task(0.1,"giji_block_descend",id)
			
			return PLUGIN_HANDLED
			
		}
		
		else if ( SSJ4transing[id] !=0 )
			
		{
			
			set_pdata_int(id, 199, 0)
			set_pdata_int(id, 301, 0, -89)
			entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
			set_user_godmode(id, 0)	
			
			istransing[id] = 0
			ascend[id] = 0
			SSJ4transing[id] = 0
			
			message_begin( MSG_BROADCAST, get_user_msgid( "StopPowerup" ) );
			write_byte( id );
			message_end( );
			
			remove_task(id)
			
			engclient_cmd(id, "turbo")
			
			remove_entity(moon[id])
			remove_entity(oozaru[id])
			
			client_cmd(id, "cam_idealdist 40")
			
			return PLUGIN_HANDLED
			
		}
		
		else 
		
		{
			
			return PLUGIN_CONTINUE
			
		}
		
	}
	
	return PLUGIN_CONTINUE
	
}

public rArrayBlocker(id)

{

	rAscend[id] = 0

}

public USSJtakepl(id)

{

	set_pdata_int(id, 460, get_pdata_int(id, 460) / 3 )
	set_pdata_int(id, 461, get_pdata_int(id, 460) / 3 )

}

public SSJ2takepl(id)

{

	set_pdata_float(id, 460, get_pdata_float(id, 460) / 1.5 )
	set_pdata_float(id, 461, get_pdata_float(id, 460) / 1.5 )

}

public thirdtakepl(id)

{

	set_pdata_float(id, 460, get_pdata_float(id, 460) / 2.25 )
	set_pdata_float(id, 461, get_pdata_float(id, 460) / 2.25 )

}


public giji_block_ascend(id)
	
{
	
	ascend[id] = 1
	
	if ( giji_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( giji_transforming[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else
	
	{
		
		if(get_cvar_num(".giji") == 0 )
			return PLUGIN_HANDLED
		
		new powerlevel = get_pdata_int(id, 460)
		
		if ( entity_get_int(id, EV_INT_playerclass) == 2 )
			
		{
			
			if ( 999999 < powerlevel < 1750000 )
				
			{
				
				new anim = entity_get_int(id, EV_INT_sequence)
				
				if( anim == 0 || anim == 1 || anim == 2 || anim == 28 )
					
				{
					
					set_task(0.1,"giji_transform",id)
					set_user_godmode(id, 1)
					ascend[id] = 1
					
					return PLUGIN_HANDLED
					
				}
				
				else
				
				{
					
				}
				
			}
			
			else
			
			{
				
				return PLUGIN_CONTINUE
				
			}
			
		}
		
		else
		
		{
			
			return PLUGIN_CONTINUE
			
		}
		
	}
	
	return PLUGIN_CONTINUE
	
}

public giji_block_descend(id)
	
{
	
	ascend[id] = 0
	
	if ( giji_avatar[id] !=0 )
		
	{
		
		set_task(0.1,"giji_wearoff",id)
		
		return PLUGIN_HANDLED
		
	}
	
	else if ( giji_transforming[id] !=0 )
		
	{
		
		remove_task(id)
		giji_transforming[id] = 0
		message_begin(MSG_ALL,get_user_msgid("StopTransFX"));
		write_byte(id);
		message_end();
		set_user_godmode(id, 0)
		entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN )
		set_pdata_int(id, 199, 0)
		
		
		return PLUGIN_HANDLED
		
	}
	
	else
	
	{
		
	}
	
	return PLUGIN_CONTINUE
	
}

public giji_transform(id)
	
{
	
	message_begin(MSG_ALL,get_user_msgid("TransformFX"));
	write_byte(id);
	write_byte(100);
	write_byte(1)
	message_end();
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN )
	set_pdata_int(id, 199, 1)
	
	set_task(0.1,"giji_transform1",id)
	
	return PLUGIN_HANDLED
	
}

public giji_transform1(id)
	
{
	
	giji_transforming[id] = 1
	emit_sound(id, CHAN_AUTO, "goku/scream.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)	
	set_task(5.0, "giji_go",id)
	
	return PLUGIN_HANDLED
	
}

public giji_go(id)
	
{
	
	
	set_user_godmode(id, 0)
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN )
	message_begin(MSG_ALL,get_user_msgid("StopTransFX"));
	set_pdata_int(id, 199, 0)
	write_byte(id);
	message_end();
	engclient_cmd(id, "turbo")
	giji_transforming[id] = 0
	new vec1[3]
	get_user_origin(id, vec1, 0)
	message_begin(MSG_ONE,SVC_TEMPENTITY,vec1, id)  
	write_byte( 21 );  
	write_coord(vec1[0]);  
	write_coord(vec1[1]);  
	write_coord(vec1[2] + 64);  
	write_coord(vec1[0]);  
	write_coord(vec1[1]);  
	write_coord(vec1[2] + 760);  //1936
	write_short( white );  
	write_byte( 0 ); // startframe 
	write_byte( 1 ); // framerate 
	write_byte( 6 ); // 3 life 2 
	write_byte( 64 ); // width 16 
	write_byte( 1 ); // noise 
	write_byte( 255 ); // r 
	write_byte( 215 ); // g 
	write_byte( 0 ); // b 
	write_byte( 255 ); //brightness 
	write_byte( 0 ); // speed 
	message_end();
	message_begin(MSG_ONE,get_user_msgid("ScreenFade"),{0,0,0},id) 
	write_short(1000) // fade lasts this long duration 
	write_short(1000) // fade lasts this long hold time 
	write_short(1<<12) // fade type (in / out) 
	write_byte(255) // fade red 
	write_byte(215) // fade green 
	write_byte(0) // fade blue 
	write_byte(150) // fade alpha 
	message_end()
	set_task(0.1,"giji_become",id)
	
	return PLUGIN_HANDLED
	
}

public giji_become(id)
	
{
	
	set_task(0.3,"giji_task",id,_,_,"b")
	
	giji_avatar[id] = create_entity( "env_model" ) 
	entity_set_int( giji_avatar[id], EV_INT_movetype, MOVETYPE_FOLLOW ) 
	entity_set_edict( giji_avatar[id], EV_ENT_aiment, id )
	entity_set_model( giji_avatar[id], "models/player/gssjgoku/gssjgoku.mdl" )
	
	new health = get_user_health(id)
	new health_set = health + 15
	set_user_health(id, health_set)
	
	message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
	write_byte( 125 );
	message_end( );
	
	new Float:powerlevel = get_pdata_float( id, 460 )
	set_pdata_float(id, 460, powerlevel * 1.3 )
	set_pdata_float(id, 461, powerlevel * 1.3 )
	
	new speed = get_pdata_int(id, 459)
	new speed2 = get_pdata_int(id, 462)
	set_pdata_int(id, 459, speed + 20 )
	set_pdata_int(id, 462, speed2 + 20 )
	
	strip_user_weapons(id)
	
	give_item(id, "weapon_melee")
	give_item(id, "weapon_kiblast")
	give_item(id, "weapon_genericbeam")
	give_item(id, "weapon_kamehameha")
	give_item(id, "weapon_solarflare")
	give_item(id, "weapon_kametorpedo")
	give_item(id, "weapon_sensu")
	
	return PLUGIN_HANDLED
	
}

public giji_task(id)
	
{
	
	entity_set_float(id, EV_FL_fuser4, entity_get_float(id, EV_FL_fuser4) - 10.0 )
	
	return PLUGIN_HANDLED
	
}

public giji_wearoff(id)
	
{
	
	remove_entity(giji_avatar[id])
	
	giji_avatar[id] = 0
	
	new health = get_user_health(id)
	new health_set = health - 15
	set_user_health(id, health_set)
	
	message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
	write_byte( 110 );
	message_end( );
	
	new Float:powerlevel = get_pdata_float( id, 460 )
	set_pdata_float(id, 460, powerlevel / 1.3 )
	set_pdata_float(id, 461, powerlevel / 1.3 )
	
	new speed = get_pdata_int(id, 459)
	new speed2 = get_pdata_int(id, 462)
	set_pdata_int(id, 459, speed - 20 )
	set_pdata_int(id, 462, speed2 - 20 )
	
	set_user_rendering(id, kRenderFxNone, 0, 0, 0, kRenderNormal, 255);
	
	strip_user_weapons(id)
	
	give_item(id, "weapon_melee")
	give_item(id, "weapon_kiblast")
	give_item(id, "weapon_genericbeam")
	give_item(id, "weapon_kamehameha")
	give_item(id, "weapon_spiritbomb")
	give_item(id, "weapon_solarflare")
	give_item(id, "weapon_kametorpedo")
	give_item(id, "weapon_sensu")
	
	message_begin(MSG_ONE,get_user_msgid("ScreenFade"),{0,0,0},id) 
	write_short(1000) // fade lasts this long duration 
	write_short(1000) // fade lasts this long hold time 
	write_short(1<<12) // fade type (in / out) 
	write_byte(255) // fade red 
	write_byte(255) // fade green 
	write_byte(255) // fade blue 
	write_byte(255) // fade alpha 
	message_end()
	
	remove_task(id)
	
	
	return PLUGIN_HANDLED
	
}

public SSJFaderCheck(id)

{

	new anim = entity_get_int(id, EV_INT_sequence ) 

	if ( anim == 101 )

	{

		set_task(0.8,"SSJFader1",id)
		entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );

		return PLUGIN_CONTINUE

	}

	else

	{

	}

	return PLUGIN_CONTINUE

}

public SSJFader1(id)

{
/*
	SSJHairFaderArray[id] = create_entity( "env_model" ) 
	entity_set_int( SSJHairFaderArray[id], EV_INT_movetype, MOVETYPE_FOLLOW ) 
	entity_set_edict( SSJHairFaderArray[id], EV_ENT_aiment, id )
	entity_set_model( SSJHairFaderArray[id], "models/player/ssjfgoku/ssjfgoku.mdl" )

	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 1.0 ); 
*/



	SSJHairFaderArray[id] = create_entity( "env_model" ); 
		
	
	new Float:Origin[3]
	pev(id, pev_origin, Origin)
	engfunc(EngFunc_SetOrigin, SSJHairFaderArray[id], Origin)


		
	entity_set_model( SSJHairFaderArray[id], "models/player/ssjfgoku/ssjfgoku.mdl" ); 
	entity_set_int( SSJHairFaderArray[id], EV_INT_skin, 3 ); 
	new Float:colorvec[3]; 
	colorvec[0] = 250.0; 
	colorvec[1] = 250.0; 
	colorvec[2] = 250.0; 
	entity_set_int(SSJHairFaderArray[id], EV_INT_rendermode, kRenderTransAlpha ); 
	entity_set_vector(SSJHairFaderArray[id],EV_VEC_rendercolor,colorvec); 
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 1.0 ); 
	entity_set_int(SSJHairFaderArray[id], EV_INT_sequence, entity_get_int( id, EV_INT_sequence ) ); 
	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 
	entity_set_edict( SSJHairFaderArray[id], EV_ENT_owner, id ); 
	entity_set_float(SSJHairFaderArray[id], EV_FL_scale, entity_get_float(id, EV_FL_scale) * 1.3 )
		
	entity_set_byte(SSJHairFaderArray[id],EV_BYTE_controller1,125);
	entity_set_byte(SSJHairFaderArray[id],EV_BYTE_controller2,125);
	entity_set_byte(SSJHairFaderArray[id],EV_BYTE_controller3,125);
	entity_set_byte(SSJHairFaderArray[id],EV_BYTE_controller4,125);

	new Float:angles[3]
	entity_get_vector(id, EV_VEC_angles, angles)
		
	entity_set_vector(SSJHairFaderArray[id], EV_VEC_angles, angles)
		
	entity_set_int(SSJHairFaderArray[id], EV_INT_fixangle,1)



	set_task(0.1,"SSJFader2",id)

	return PLUGIN_CONTINUE

}

public SSJFader2(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 10.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader3",id) 

	return PLUGIN_CONTINUE
	
}

public SSJFader3(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 20.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader4",id)

	return PLUGIN_CONTINUE 
	
}

public SSJFader4(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 30.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader5",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader5(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 40.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader6",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader6(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 50.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader7",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader7(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 60.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader8",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader8(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 70.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader9",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader9(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 80.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader10",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader10(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 90.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader11",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader11(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 100.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader12",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader12(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 110.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader13",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader13(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 120.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader14",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader14(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 130.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader15",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader15(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 140.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader16",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader16(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 150.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader17",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader17(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 160.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader18",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader18(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 170.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader19",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader19(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 180.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader20",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader20(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 190.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader21",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader21(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 200.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader22",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader22(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 210.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader23",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader23(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 220.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader24",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader24(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 230.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader25",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader25(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 240.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader26",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader26(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 250.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader27",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader27(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 240.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader28",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader28(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 230.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader29",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader29(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 220.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader30",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader30(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 210.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader31",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader31(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 200.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader32",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader32(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 190.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader33",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader33(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 180.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader34",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader34(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 170.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader35",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader35(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 160.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader36",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader36(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 150.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader37",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader37(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 140.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader38",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader38(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 130.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader39",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader39(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 120.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader40",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader40(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 110.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader41",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader41(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 100.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader42",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader42(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 90.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader43",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader43(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 80.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader44",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader44(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 70.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader45",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader45(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 60.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader46",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader46(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 50.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader47",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader47(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 40.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader48",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader48(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 30.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader49",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader49(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 20.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader50",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader50(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 10.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader51",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader51(id)
	
{ 
	
	entity_set_float(SSJHairFaderArray[id], EV_FL_renderamt, 5.0 );

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 

	set_task(0.1,"SSJFader52",id)

	return PLUGIN_CONTINUE
	
}

public SSJFader52(id)
	
{ 
	
	remove_entity( SSJHairFaderArray[id] )

	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN )

	SSJHairFaderArray[id] = 0

	return PLUGIN_CONTINUE
	
}


//-----------------------------
// Restrictions part
//-----------------------------

public BlockAscend(id)
	
{
	
	ascend[id] = 1
	
	if( avatars[id] != 0 )
		
	{ 
		
		return PLUGIN_HANDLED 
	}
	
	else if( avatars[id] == 0)
		
	{
		
		istransing[id] == 1
		
		set_task(0.1,"BlockDesiredAscend",id)
		
		return PLUGIN_CONTINUE
		
	}
	
	else if( avatars2[id] != 0 )
		
	{ 
		
		return PLUGIN_HANDLED 
	}
	
	else if( avatars2[id] == 0)
		
	{
		
		istransing[id] == 1
		
		set_task(0.1,"BlockDesiredAscend",id)
		
		return PLUGIN_CONTINUE
		
	}
	
	else if( brolly_avatar[id] != 0 )
		
	{
		
		set_task(0.1,"brolly_lssj",id) 
		
		return PLUGIN_HANDLED 
	}
	
	else if( brolly_avatar[id] == 0)
		
	{
		
		return PLUGIN_CONTINUE
		
	}
	
	else if( GogetaSSJ2_avatar[id] !=0 || GogetaSSJ4_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if( GogetaSSJ2_avatar[id] == 0 || GogetaSSJ4_avatar[id] == 0 )
		
	{
		
		return PLUGIN_CONTINUE
		
	}
	
	return PLUGIN_CONTINUE
	
}

public BlockAscend_Menu(id)
	
{
	
	ascend[id] = 1
	
	if( avatars[id] != 0 )
		
	{ 
		
		return PLUGIN_HANDLED 
	}
	
	else if( avatars[id] == 0)
		
	{
		
		istransing[id] == 1
		
	}
	
	return PLUGIN_CONTINUE
	
}

public BlockSpecial(id)
	
{

	if( entity_get_int(id, EV_INT_playerclass) == 2 )

	{

		if ( rAscend[id] !=0 )

		{

			if ( Kaioken[id] !=0 )

			{

				Kaioken[id] = 0
				set_user_rendering(id, kRenderFxNone, 0, 0, 0, kRenderNormal, 255)
				remove_task(id)

				return PLUGIN_HANDLED

			}

			else

			{

				Kaioken[id] = 1
				emit_sound(id, CHAN_AUTO, "evolution/Goku/goku_ssj_kaioken.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)
				set_task(0.5,"kaioken_task",id,_,_,"b")

			}

			return PLUGIN_HANDLED

		}

		else

		{

		}

		return PLUGIN_HANDLED

	}
	
	else if( avatars[id] != 0 )
		
	{ 
		
		
		if ( SuperDragonFist_active[id] !=0 )
			
		{
			
			return PLUGIN_HANDLED
			
		}
		
		else
		
		{
			
			set_task(0.1, "Selfdestruction_SSJ4", id)
			
		}
		
		return PLUGIN_HANDLED 
	}
	
	else if( avatars2[id] !=0 )
		
	{
		
		set_task(0.1,"Explosion",id)
		
		return PLUGIN_HANDLED
		
	}
	
	else if( GogetaSSJ4_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if( brolly_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if( LSSJbrolly_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if( GogetaSSJ2_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else
	
	{
	}
	
	return PLUGIN_CONTINUE
	
}

public BlockSpecial2(id)
	
{
	
	if( avatars[id] != 0 )
		
	{ 
		
		
		if ( USSJ4_active[id] !=0 )
			
		{
			
			return PLUGIN_HANDLED
			
		}
		
		else
		
		{
			
			set_task(0.1,"SuperDragonFist",id)
			
		}
		
		return PLUGIN_HANDLED 
	}
	
	else if( avatars2[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if( GogetaSSJ4_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if( brolly_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if( LSSJbrolly_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else if( GogetaSSJ2_avatar[id] !=0 )
		
	{
		
		return PLUGIN_HANDLED
		
	}
	
	else
	
	{
	}
	
	return PLUGIN_CONTINUE
	
}

public Selfdestruction_SSJ4(id)
	
{
	
	set_pdata_int(id, 199, 1)
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );
	set_pdata_int(id, 301, 1, -89 )
	set_user_godmode(id, 1)
	
	set_task(0.1,"selfdestruction_ssj4_task",id,_,_,"b")
	
	return PLUGIN_HANDLED
	
}

public selfdestruction_ssj4_task(id)
	
{
	
	if ( get_user_health(id) < 2 )
		
	{
		
		remove_task(id)

		new gmsgDeathMsg	= get_user_msgid( "DeathMsg"	);
		new gmsgScoreInfo	= get_user_msgid( "ScoreInfo"	);
		set_msg_block( gmsgDeathMsg, BLOCK_ONCE );
		set_msg_block( gmsgScoreInfo, BLOCK_ONCE );
		entity_set_float( id, EV_FL_frags, entity_get_float( id, EV_FL_frags ) );
		user_kill( id, 1 )
		make_deathmsg( id, id, 0, "SSJ4 Selfdestruct")

		set_pdata_int(id, 199, 0)
		set_pdata_int(id, 301, 0, -89)
		entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
		set_user_godmode(id, 0)	

		new origin[3], eOrigin[3]; 

		//Get our origin.. Part of distance calculation 
		get_user_origin( id, origin ); 

		//Simply find all players near us. then get their current velocity and then invert it 
		new players[32]; 
		new num, player; 
		get_players(players, num, "a");      //Don't get dead players. 
		for (new i = 0; i < num; i++)

		{ 
		
			player = players[i];      //Just easier this way. 
	
			if( player != id )

			{ 
		
				//Check their range. 
				get_user_origin( player, eOrigin ); 
		
				if( get_distance( origin, eOrigin ) <= 2048 )

				{

					user_silentkill( player )
					make_deathmsg(id, player, 0, "SSJ4 Selfdestruct" )

				}

			}

		}

new vec1[3]
get_user_origin(id, vec1)
message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
write_byte( 21 ) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 100) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 1936) 
write_short( fire ) 
write_byte( 0 ) // startframe 
write_byte( 0 ) // framerate 
write_byte( 24 ) // life 2
write_byte( 32 ) // width 16 
write_byte( 0 ) // noise 
write_byte( 255 ) // r 
write_byte( 48 ) // g 
write_byte( 48 ) // b 
write_byte( 255 ) //brightness 
write_byte( 0 ) // speed 
message_end()
message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
write_byte( 21 ) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 50) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 1936) 
write_short( fire ) 
write_byte( 0 ) // startframe 
write_byte( 0 ) // framerate 
write_byte( 24 ) // life 2
write_byte( 64 ) // width 16 
write_byte( 0 ) // noise 
write_byte( 255 ) // r 
write_byte( 48 ) // g 
write_byte( 48 ) // b 
write_byte( 255 ) //brightness 
write_byte( 0 ) // speed 
message_end()
message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
write_byte( 21 ) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2]) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 1936) 
write_short( fire ) 
write_byte( 0 ) // startframe 
write_byte( 0 ) // framerate 
write_byte( 24 ) // life 2
write_byte( 128 ) // width 16 
write_byte( 0 ) // noise 
write_byte( 255 ) // r 
write_byte( 48 ) // g 
write_byte( 48 ) // b 
write_byte( 255 ) //brightness 
write_byte( 0 ) // speed 
message_end()
message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
write_byte( 21 ) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] - 100) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 1936) 
write_short( fire ) 
write_byte( 0 ) // startframe 
write_byte( 0 ) // framerate 
write_byte( 24 ) // life 2
write_byte( 256 ) // width 16 
write_byte( 0 ) // noise 
write_byte( 255 ) // r 
write_byte( 48 ) // g 
write_byte( 48 ) // b 
write_byte( 255 ) //brightness 
write_byte( 0 ) // speed 
message_end()
message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
write_byte( 21 ) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] - 200) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 1936) 
write_short( fire ) 
write_byte( 0 ) // startframe 
write_byte( 0 ) // framerate 
write_byte( 24 ) // life 2
write_byte( 512 ) // width 16 
write_byte( 0 ) // noise 
write_byte( 255 ) // r 
write_byte( 48 ) // g 
write_byte( 48 ) // b 
write_byte( 255 ) //brightness 
write_byte( 0 ) // speed 
message_end()
message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
write_byte( 21 ) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] - 300) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 1936) 
write_short( fire ) 
write_byte( 0 ) // startframe 
write_byte( 0 ) // framerate 
write_byte( 24 ) // life 2
write_byte( 1024 ) // width 16 
write_byte( 0 ) // noise 
write_byte( 255 ) // r 
write_byte( 48 ) // g 
write_byte( 48 ) // b  
write_byte( 255 ) //brightness 
write_byte( 0 ) // speed 
message_end()

	new Vector[3]
	get_user_origin(id, Vector)
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, Vector);
	write_byte( 21 )
	write_coord( Vector[0] );
	write_coord( Vector[1] );
	write_coord( Vector[2] += 10 );
	write_coord( Vector[0] += 25 );
	write_coord( Vector[1] += 11 );
	write_coord( Vector[2] += 44 );
	write_short( fire );
	write_byte( 0 );
	write_byte( 10 );
	write_byte( 100 );
	write_byte( 127 );
	write_byte( 0 );
	write_byte( 255 );
	write_byte( 48 );
	write_byte( 48 );
	write_byte( 100 );
	write_byte( 0 );
	message_end
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, Vector);
	write_byte( 21 )
	write_coord( Vector[0] );
	write_coord( Vector[1] );
	write_coord( Vector[2] );
	write_coord( Vector[0] += 67 );
	write_coord( Vector[1] += 25 );
	write_coord( Vector[2] += 99 );
	write_short( fire );
	write_byte( 0 );
	write_byte( 10 );
	write_byte( 100 );
	write_byte( 255 );
	write_byte( 0 );
	write_byte( 255 );
	write_byte( 48 );
	write_byte( 48 );
	write_byte( 200 );
	write_byte( 0 );
	message_end
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, Vector);
	write_byte( 21 )
	write_coord( Vector[0] );
	write_coord( Vector[1] );
	write_coord( Vector[2] -= 10 );
	write_coord( Vector[0] += 134 );
	write_coord( Vector[1] += 50 );
	write_coord( Vector[2] += 198 );
	write_short( fire );
	write_byte( 0 );
	write_byte( 10 );
	write_byte( 100 );
	write_byte( 255 );
	write_byte( 0 );
	write_byte( 255 );
	write_byte( 48 );
	write_byte( 48 );
	write_byte( 255 );
	write_byte( 0 );
	message_end
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, Vector);
	write_byte( 21 )
	write_coord( Vector[0] );
	write_coord( Vector[1] );
	write_coord( Vector[2] -= 15 );
	write_coord( Vector[0] += 20 );
	write_coord( Vector[1] += 6 );
	write_coord( Vector[2] += 22 );
	write_short( fire );
	write_byte( 0 );
	write_byte( 10 );
	write_byte( 100 );
	write_byte( 127 );
	write_byte( 0 );
	write_byte( 255 );
	write_byte( 48 );
	write_byte( 48 );
	write_byte( 100 );
	write_byte( 0 );
	message_end()

return PLUGIN_HANDLED

}

else

{

set_user_health(id, get_user_health(id) - 1 )
set_pdata_int(id, 460, get_pdata_int(id, 460) + 100000 )
set_pdata_int(id, 461, get_pdata_int(id, 460) + 100000 )

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(ssj4selfdestruct); // short (sprite index)
write_byte(30); // byte (scale in 0.1's)  
write_byte(225); // byte (brightness)
message_end();

}

return PLUGIN_HANDLED

}


public PowerupModification(id)

{

PowerupMod[id] = 1

return PLUGIN_CONTINUE

}

public PowerupModificationOff(id)

{

PowerupMod[id] = 0

return PLUGIN_CONTINUE

}

public BuuHandle(id)

{

brollyClass[id] = 0
brollySSJClass[id] = 0
brollyLSSJClass[id] = 0
coolerClass[id] = 0
cooler2Class[id] = 0
coolerMetaClass[id] = 0
gotenClass[id] = 0
gotenSSJClass[id] = 0
janembaClass[id] = 0
janembaSuperClass[id] = 0

return PLUGIN_CONTINUE

}

public GokuHandle(id)

{

brollyClass[id] = 0
brollySSJClass[id] = 0
brollyLSSJClass[id] = 0
coolerClass[id] = 0
cooler2Class[id] = 0
coolerMetaClass[id] = 0
gotenClass[id] = 0
gotenSSJClass[id] = 0
janembaClass[id] = 0
janembaSuperClass[id] = 0

return PLUGIN_CONTINUE

}

public GohanHandle(id)

{

if ( kidTrunksClass[id] !=0 && classIgnore[id] !=0 )

{

classIgnore[id] = 0

}

else if ( gotenClass[id] !=0 && classIgnore[id] !=0 )

{

classIgnore[id] = 0

}

else

{

brollyClass[id] = 0
brollySSJClass[id] = 0
brollyLSSJClass[id] = 0
coolerClass[id] = 0
cooler2Class[id] = 0
coolerMetaClass[id] = 0
gotenClass[id] = 0
gotenSSJClass[id] = 0
janembaClass[id] = 0
janembaSuperClass[id] = 0

}

return PLUGIN_CONTINUE

}

public KrillinHandle(id)

{

brollyClass[id] = 0
brollySSJClass[id] = 0
brollyLSSJClass[id] = 0
coolerClass[id] = 0
cooler2Class[id] = 0
coolerMetaClass[id] = 0
gotenClass[id] = 0
gotenSSJClass[id] = 0
janembaClass[id] = 0
janembaSuperClass[id] = 0

return PLUGIN_CONTINUE

}

public FriezaHandle(id)

{

if ( coolerClass[id] !=0 && classIgnore[id] !=0 )

{

classIgnore[id] = 0

}

else if ( janembaClass[id] !=0 && classIgnore[id] !=0 )

{

classIgnore[id] = 0

}

else

{

brollyClass[id] = 0
brollySSJClass[id] = 0
brollyLSSJClass[id] = 0
coolerClass[id] = 0
cooler2Class[id] = 0
coolerMetaClass[id] = 0
gotenClass[id] = 0
gotenSSJClass[id] = 0
janembaClass[id] = 0
janembaSuperClass[id] = 0

}

return PLUGIN_CONTINUE

}

public PiccoloHandle(id)

{

brollyClass[id] = 0
brollySSJClass[id] = 0
brollyLSSJClass[id] = 0
coolerClass[id] = 0
cooler2Class[id] = 0
coolerMetaClass[id] = 0
gotenClass[id] = 0
gotenSSJClass[id] = 0
janembaClass[id] = 0
janembaSuperClass[id] = 0

return PLUGIN_CONTINUE

}

public TrunksHandle(id)

{

brollyClass[id] = 0
brollySSJClass[id] = 0
brollyLSSJClass[id] = 0
coolerClass[id] = 0
cooler2Class[id] = 0
coolerMetaClass[id] = 0
gotenClass[id] = 0
gotenSSJClass[id] = 0
janembaClass[id] = 0
janembaSuperClass[id] = 0

return PLUGIN_CONTINUE

}

public VegetaHandle(id)

{

if ( brollyClass[id] !=0 && classIgnore[id] !=0 )

{

classIgnore[id] = 0

}

else

{

brollyClass[id] = 0
brollySSJClass[id] = 0
brollyLSSJClass[id] = 0
coolerClass[id] = 0
cooler2Class[id] = 0
coolerMetaClass[id] = 0
gotenClass[id] = 0
gotenSSJClass[id] = 0
janembaClass[id] = 0
janembaSuperClass[id] = 0

}

return PLUGIN_CONTINUE

}

public CellHandle(id)

{

brollyClass[id] = 0
brollySSJClass[id] = 0
brollyLSSJClass[id] = 0
coolerClass[id] = 0
cooler2Class[id] = 0
coolerMetaClass[id] = 0
gotenClass[id] = 0
gotenSSJClass[id] = 0
janembaClass[id] = 0
janembaSuperClass[id] = 0

return PLUGIN_CONTINUE

}

public BrollyHandle(id)

{

brollyClass[id] = 1
brollySSJClass[id] = 0
brollyLSSJClass[id] = 0
coolerClass[id] = 0
cooler2Class[id] = 0
coolerMetaClass[id] = 0
gotenClass[id] = 0
gotenSSJClass[id] = 0
janembaClass[id] = 0
janembaSuperClass[id] = 0

set_task(0.1,"BrollyCreate",id)

return PLUGIN_CONTINUE

}

public CoolerHandle(id)

{

brollyClass[id] = 0
brollySSJClass[id] = 0
brollyLSSJClass[id] = 0
coolerClass[id] = 1
cooler2Class[id] = 0
coolerMetaClass[id] = 0
gotenClass[id] = 0
gotenSSJClass[id] = 0
janembaClass[id] = 0
janembaSuperClass[id] = 0

set_task(0.1,"CoolerCreate",id)

return PLUGIN_CONTINUE

}

public GotenHandle(id)

{

brollyClass[id] = 0
brollySSJClass[id] = 0
brollyLSSJClass[id] = 0
coolerClass[id] = 0
cooler2Class[id] = 0
coolerMetaClass[id] = 0
gotenClass[id] = 1
gotenSSJClass[id] = 0
janembaClass[id] = 0
janembaSuperClass[id] = 0

set_task(0.1,"GotenCreate",id)

return PLUGIN_CONTINUE

}

public KidTrunksHandle(id)

{

brollyClass[id] = 0
brollySSJClass[id] = 0
brollyLSSJClass[id] = 0
coolerClass[id] = 0
cooler2Class[id] = 0
coolerMetaClass[id] = 0
gotenClass[id] = 0
gotenSSJClass[id] = 0
kidTrunksClass[id] = 1
kidTrunksSSJClass[id] = 0
janembaClass[id] = 0
janembaSuperClass[id] = 0

set_task(0.1,"KidTrunksCreate",id)

return PLUGIN_CONTINUE

}

public JanembaHandle(id)

{

brollyClass[id] = 0
brollySSJClass[id] = 0
brollyLSSJClass[id] = 0
coolerClass[id] = 0
cooler2Class[id] = 0
coolerMetaClass[id] = 0
gotenClass[id] = 0
gotenSSJClass[id] = 0
kidTrunksClass[id] = 0
kidTrunksSSJClass[id] = 0
janembaClass[id] = 1
janembaSuperClass[id] = 0

set_task(0.1,"JanembaCreate",id)

return PLUGIN_CONTINUE

}

// >> [ ::BROLLY:: ]

public JanembaCreate(id)

{

janembaClass[id] = 1

classIgnore[id] = 1

set_pdata_int(id, 460, 1200000)
set_pdata_int(id, 461, 1200000)

client_cmd(id, "frieza" )

return PLUGIN_HANDLED

}

public BrollyCreate(id)

{

brollyClass[id] = 1

classIgnore[id] = 1

set_pdata_int(id, 460, 1450000 )
set_pdata_int(id, 461, 1450000 )

client_cmd(id, "vegeta")

set_task(0.7,"brollyTASK",id,_,_,"b")


return PLUGIN_HANDLED

}

public brolly_ssj_transstage1(id)

{

new origin[3]
get_user_origin(id, origin)

brollyIsTransingSSJ[id] = 1

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

emit_sound(id, CHAN_AUTO, "EvolutionSSJ4/brolly/brollyssj.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

client_cmd(id, "cam_idealdist 500")

set_task(0.5,"brolly_ssj_transstage2",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage2(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage3",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage3(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage4",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage4(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage5",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage5(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage6",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage6(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage7",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage7(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage8",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage8(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage9",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage9(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage10",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage10(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage11",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage11(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage12",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage12(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage13",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage13(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage14",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage14(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage15",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage15(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage16",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage16(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage17",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage17(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage18",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage18(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage19",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage19(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage20",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage20(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage21",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage21(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage22",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage22(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage23",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage23(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage24",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage24(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage25",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage25(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage26",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage26(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage27",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage27(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage28",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage28(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage29",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage29(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage30",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage30(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 100 )
write_byte( 255 )
write_byte( 1 )
message_end()

set_task(0.5,"brolly_ssj_transstage31",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage31(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 1);
case 2: write_coord(origin[0] += 1);
case 3: write_coord(origin[0] -= 2);
case 4: write_coord(origin[0] += 2);
case 5: write_coord(origin[0] -= 3);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 1);
case 2: write_coord(origin[1] += 1);
case 3: write_coord(origin[1] -= 2);
case 4: write_coord(origin[1] += 2);
case 5: write_coord(origin[1] -= 3);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(6); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

set_task(0.5,"brolly_ssj_transstage32",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage32(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 1);
case 2: write_coord(origin[0] += 1);
case 3: write_coord(origin[0] -= 2);
case 4: write_coord(origin[0] += 2);
case 5: write_coord(origin[0] -= 3);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 1);
case 2: write_coord(origin[1] += 1);
case 3: write_coord(origin[1] -= 2);
case 4: write_coord(origin[1] += 2);
case 5: write_coord(origin[1] -= 3);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(6); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

set_task(0.5,"brolly_ssj_transstage33",id)

return PLUGIN_HANDLED

}


public brolly_ssj_transstage33(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 1);
case 2: write_coord(origin[0] += 1);
case 3: write_coord(origin[0] -= 2);
case 4: write_coord(origin[0] += 2);
case 5: write_coord(origin[0] -= 3);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 1);
case 2: write_coord(origin[1] += 1);
case 3: write_coord(origin[1] -= 2);
case 4: write_coord(origin[1] += 2);
case 5: write_coord(origin[1] -= 3);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(6); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

set_task(0.5,"brolly_ssj_transstage34",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage34(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 1);
case 2: write_coord(origin[0] += 1);
case 3: write_coord(origin[0] -= 2);
case 4: write_coord(origin[0] += 2);
case 5: write_coord(origin[0] -= 3);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 1);
case 2: write_coord(origin[1] += 1);
case 3: write_coord(origin[1] -= 2);
case 4: write_coord(origin[1] += 2);
case 5: write_coord(origin[1] -= 3);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(6); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

set_task(0.5,"brolly_ssj_transstage35",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage35(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 1);
case 2: write_coord(origin[0] += 1);
case 3: write_coord(origin[0] -= 2);
case 4: write_coord(origin[0] += 2);
case 5: write_coord(origin[0] -= 3);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 1);
case 2: write_coord(origin[1] += 1);
case 3: write_coord(origin[1] -= 2);
case 4: write_coord(origin[1] += 2);
case 5: write_coord(origin[1] -= 3);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(6); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

set_task(0.5,"brolly_ssj_transstage36",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage36(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 1);
case 2: write_coord(origin[0] += 1);
case 3: write_coord(origin[0] -= 2);
case 4: write_coord(origin[0] += 2);
case 5: write_coord(origin[0] -= 3);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 1);
case 2: write_coord(origin[1] += 1);
case 3: write_coord(origin[1] -= 2);
case 4: write_coord(origin[1] += 2);
case 5: write_coord(origin[1] -= 3);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(6); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

set_task(0.5,"brolly_ssj_transstage37",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage37(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 1);
case 2: write_coord(origin[0] += 1);
case 3: write_coord(origin[0] -= 2);
case 4: write_coord(origin[0] += 2);
case 5: write_coord(origin[0] -= 3);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 1);
case 2: write_coord(origin[1] += 1);
case 3: write_coord(origin[1] -= 2);
case 4: write_coord(origin[1] += 2);
case 5: write_coord(origin[1] -= 3);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(6); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

set_task(0.5,"brolly_ssj_transstage38",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage38(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 1);
case 2: write_coord(origin[0] += 1);
case 3: write_coord(origin[0] -= 2);
case 4: write_coord(origin[0] += 2);
case 5: write_coord(origin[0] -= 3);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 1);
case 2: write_coord(origin[1] += 1);
case 3: write_coord(origin[1] -= 2);
case 4: write_coord(origin[1] += 2);
case 5: write_coord(origin[1] -= 3);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(6); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

set_task(0.5,"brolly_ssj_transstage39",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage39(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 1);
case 2: write_coord(origin[0] += 1);
case 3: write_coord(origin[0] -= 2);
case 4: write_coord(origin[0] += 2);
case 5: write_coord(origin[0] -= 3);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 1);
case 2: write_coord(origin[1] += 1);
case 3: write_coord(origin[1] -= 2);
case 4: write_coord(origin[1] += 2);
case 5: write_coord(origin[1] -= 3);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(origin[0]);
case 1: write_coord(origin[0] -= 4);
case 2: write_coord(origin[0] += 4);
case 3: write_coord(origin[0] -= 5);
case 4: write_coord(origin[0] += 5);
case 5: write_coord(origin[0] -= 6);

}

switch(random_num(0,5))

{

case 0: write_coord(origin[1]);
case 1: write_coord(origin[1] -= 4);
case 2: write_coord(origin[1] += 4);
case 3: write_coord(origin[1] -= 5);
case 4: write_coord(origin[1] += 5);
case 5: write_coord(origin[1] -= 6);

}

write_coord(origin[2] += 7)

write_short(greenfire); // short (sprite index)
write_byte(6); // byte (scale in 0.1's)  
write_byte(15); // byte (brightness)
message_end();

set_task(0.5,"brolly_ssj_transstage40",id)

return PLUGIN_HANDLED

}

public brolly_ssj_transstage40(id)

{

brollyClass[id] = 0
brollySSJClass[id] = 1

brollyIsTransingSSJ[id] = 0


message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
write_byte( 190 );
message_end( );

set_user_health(id, get_user_health(id) + 50 )

set_pdata_int(id, 460, get_pdata_int(id, 460) * 2 )
set_pdata_int(id, 461, get_pdata_int(id, 460) * 2 )

set_pdata_int(id, 199, 0)
set_pdata_int(id, 301, 0, -89 )
entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
set_user_godmode(id, 0)

client_cmd(id, "cam_idealdist 40")

set_task(0.5,"brollyTASK",id,_,_,"b")

return PLUGIN_HANDLED

}

// >> [ ::BROLLY LSSJ TRANS:: ]

public brolly_lssj_transstage1(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin( MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 0 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_coord( origin[0] )
write_coord( origin[1] + 10 )
write_coord( origin[2] )
write_short( pusprite )
write_byte( 0 )
write_byte( 255 )
write_byte( 2 )
write_byte( 5 )
write_byte( 0 )
write_byte( 48 )
write_byte( 255 )
write_byte( 48 )
write_byte( 200 )
write_byte( 0 )
message_end()

emit_sound(id, CHAN_AUTO, "EvolutionSSJ4/brolly/brollylssj.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

client_cmd(id, "cam_idealdist 500")

set_task(0.1,"brolly_lssj_transstage2",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstage2(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin( MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 0 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_coord( origin[0] )
write_coord( origin[1] + 50 )
write_coord( origin[2] + 50 )
write_short( pusprite )
write_byte( 0 )
write_byte( 255 )
write_byte( 2 )
write_byte( 90 )
write_byte( 0 )
write_byte( 48 )
write_byte( 255 )
write_byte( 48 )
write_byte( 200 )
write_byte( 0 )
message_end()

set_task(0.1,"brolly_lssj_transstage3",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstage3(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin( MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 0 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] + 50 )
write_short( pusprite )
write_byte( 0 )
write_byte( 255 )
write_byte( 2 )
write_byte( 90 )
write_byte( 0 )
write_byte( 48 )
write_byte( 255 )
write_byte( 48 )
write_byte( 200 )
write_byte( 0 )
message_end()

set_task(0.1,"brolly_lssj_transstage4",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstage4(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin( MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 0 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_coord( origin[0] )
write_coord( origin[1] - 50)
write_coord( origin[2] + 50)
write_short( pusprite )
write_byte( 0 )
write_byte( 255 )
write_byte( 2 )
write_byte( 90 )
write_byte( 0 )
write_byte( 48 )
write_byte( 255 )
write_byte( 48 )
write_byte( 200 )
write_byte( 0 )
message_end()

set_task(0.1,"brolly_lssj_transstage5",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstage5(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin( MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 0 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_coord( origin[0] )
write_coord( origin[1] - 50 )
write_coord( origin[2] )
write_short( pusprite )
write_byte( 0 )
write_byte( 255 )
write_byte( 2 )
write_byte( 90 )
write_byte( 0 )
write_byte( 48 )
write_byte( 255 )
write_byte( 48 )
write_byte( 200 )
write_byte( 0 )
message_end()

set_task(0.1,"brolly_lssj_transstage6",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstage6(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin( MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 0 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_coord( origin[0] )
write_coord( origin[1] + 50 )
write_coord( origin[2] + 50 )
write_short( pusprite )
write_byte( 0 )
write_byte( 255 )
write_byte( 2 )
write_byte( 90 )
write_byte( 0 )
write_byte( 48 )
write_byte( 255 )
write_byte( 48 )
write_byte( 200 )
write_byte( 0 )
message_end()

set_task(0.1,"brolly_lssj_transstage7",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstage7(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin( MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 0 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] + 50 )
write_short( pusprite )
write_byte( 0 )
write_byte( 255 )
write_byte( 2 )
write_byte( 90 )
write_byte( 0 )
write_byte( 48 )
write_byte( 255 )
write_byte( 48 )
write_byte( 200 )
write_byte( 0 )
message_end()

set_task(0.1,"brolly_lssj_transstage8",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstage8(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin( MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 0 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_coord( origin[0] )
write_coord( origin[1] - 50)
write_coord( origin[2] + 50)
write_short( pusprite )
write_byte( 0 )
write_byte( 255 )
write_byte( 2 )
write_byte( 90 )
write_byte( 0 )
write_byte( 48 )
write_byte( 255 )
write_byte( 48 )
write_byte( 200 )
write_byte( 0 )
message_end()

set_task(0.1,"brolly_lssj_transstage9",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstage9(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin( MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 0 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_coord( origin[0] )
write_coord( origin[1] - 50 )
write_coord( origin[2] )
write_short( pusprite )
write_byte( 0 )
write_byte( 255 )
write_byte( 2 )
write_byte( 90 )
write_byte( 0 )
write_byte( 48 )
write_byte( 255 )
write_byte( 48 )
write_byte( 200 )
write_byte( 0 )
message_end()

set_task(0.1,"brolly_lssj_transstage10",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstage10(id)

{

brollyLSSJGLOWMOD[id] = 1

set_task(8.0, "brolly_lssj_transstage11", id )

return PLUGIN_HANDLED

}

public brolly_lssj_transstage11(id)

{

brollyLSSJGLOWMOD[id] = 0

set_user_rendering(id, kRenderFxNone, 0, 0, 0, kRenderNormal, 255);

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 17 )
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short( brollylssjball )
write_byte( 50 )
write_byte( 200 )
message_end()

set_task(0.5,"brolly_lssj_transstage12",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstage12(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 17 )
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short( brollylssjball )
write_byte( 50 )
write_byte( 200 )
message_end()

set_task(0.5,"brolly_lssj_transstage13",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstage13(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 17 )
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short( brollylssjball )
write_byte( 50 )
write_byte( 200 )
message_end()

set_task(0.5,"brolly_lssj_transstage14",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstage14(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 17 )
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short( brollylssjball )
write_byte( 50 )
write_byte( 200 )
message_end()

set_task(0.5,"brolly_lssj_transstage15",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstage15(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 17 )
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short( brollylssjball )
write_byte( 50 )
write_byte( 200 )
message_end()

set_task(0.5,"brolly_lssj_transstage16",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstage16(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 17 )
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short( brollylssjball )
write_byte( 50 )
write_byte( 200 )
message_end()

set_task(0.5,"brolly_lssj_transstage17",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstage17(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 17 )
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short( brollylssjball )
write_byte( 50 )
write_byte( 200 )
message_end()

set_task(0.5,"brolly_lssj_transstagefinish",id)

return PLUGIN_HANDLED

}

public brolly_lssj_transstagefinish(id)

{

message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
write_byte( 230 );
message_end( );

set_pdata_int(id, 199, 0)
set_pdata_int(id, 301, 0, -89 )
entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
set_user_godmode(id, 0)

set_user_health(id, get_user_health(id) + 40 )

set_pdata_int(id, 460, get_pdata_int(id, 460) * 5 )
set_pdata_int(id, 461, get_pdata_int(id, 460) * 5 )

brollySSJClass[id] = 0
brollyLSSJClass[id] = 1

client_cmd(id, "cam_idealdist 60")

set_task(0.1,"brollyTASK",id,_,_,"b")

return PLUGIN_HANDLED

}

// >> [ :: COOLER :: ]

public CoolerCreate(id)

{

coolerClass[id] = 1

classIgnore[id] = 1

client_cmd(id, "frieza")

set_pdata_int(id, 460, 850000 )
set_pdata_int(id, 461, 850000 )

return PLUGIN_HANDLED

}

public cooler_transstage_1(id)

{

message_begin(MSG_ALL,get_user_msgid("TransformFX"));
write_byte(id);
write_byte(100);
write_byte(1)
message_end();

message_begin( MSG_BROADCAST, get_user_msgid( "Powerup" ) );
write_byte( id );
write_byte( 200 );
write_byte( 96 );
write_byte( 96 );
message_end( );

entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );
set_pdata_int(id, 199, 1)
set_pdata_int(id, 301, 1, -89 )
set_user_godmode(id, 1)

set_task(1.0,"cooler_transstage_2",id)

return PLUGIN_HANDLED

}

public cooler_transstage_2(id)

{

CoolerTransFX1[id] = 1

set_task(15.0,"cooler_transstage_finish",id)

return PLUGIN_HANDLED

}

public cooler_transstage_finish(id)

{

CoolerTransFX1[id] = 0

entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
set_pdata_int(id, 199, 0)
set_pdata_int(id, 301, 0, -89 )
set_user_godmode(id, 0)

message_begin(MSG_ALL,get_user_msgid("StopTransFX"));
write_byte(id);
message_end();

message_begin( MSG_BROADCAST, get_user_msgid( "StopPowerup" ) );
write_byte( id );
message_end( );

coolerClass[id] = 0
cooler2Class[id] = 1

message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
write_byte( 180 );
message_end( );

set_user_health(id, get_user_health(id) + 20 )

set_pdata_float(id, 460, get_pdata_float(id, 460) * 1.5 )
set_pdata_float(id, 461, get_pdata_float(id, 460) * 1.5 )

return PLUGIN_HANDLED

}


/*
public metacooler_transstage_init()

{


entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );
set_pdata_int(id, 199, 1)
set_pdata_int(id, 301, 1, -89 )
set_user_godmode(id, 1)

*/


public GotenCreate(id)

{

set_pdata_int(id, 460, 750000 )
set_pdata_int(id, 461, 750000 )

gotenClass[id] = 1

classIgnore[id] = 1

client_cmd(id, "gohan")


return PLUGIN_HANDLED

}

public goten_transstage_1(id)

{

message_begin(MSG_ALL,get_user_msgid("TransformFX"));
write_byte(id);
write_byte(100);
write_byte(1)
message_end();

message_begin( MSG_BROADCAST, get_user_msgid( "Powerup" ) );
write_byte( id );
write_byte( 255 );
write_byte( 193 );
write_byte( 37 );
message_end( );

entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );
set_pdata_int(id, 199, 1)
set_pdata_int(id, 301, 1, -89 )
set_user_godmode(id, 1)

gotenTransing[id] = 1

set_task(3.0,"goten_transstage_2",id)

return PLUGIN_HANDLED

}

public goten_transstage_2(id)

{

client_cmd(id, "turbo")

set_task(3.0,"goten_transstage_3",id)

return PLUGIN_HANDLED

}

public goten_transstage_3(id)

{

message_begin(MSG_ONE,get_user_msgid("ScreenFade"),{0,0,0},id) 
write_short(1000) // fade lasts this long duration 
write_short(1000) // fade lasts this long hold time 
write_short(1<<12) // fade type (in / out) 
write_byte(255) // fade red 
write_byte(255) // fade green 
write_byte(255) // fade blue 
write_byte(155) // fade alpha 
message_end()

gotenClass[id] = 0
gotenSSJClass[id] = 1

set_task(2.0,"goten_transstage_4",id)

return PLUGIN_HANDLED

}

public goten_transstage_4(id)

{

message_begin(MSG_ONE,get_user_msgid("ScreenFade"),{0,0,0},id) 
write_short(1000) // fade lasts this long duration 
write_short(1000) // fade lasts this long hold time 
write_short(1<<12) // fade type (in / out) 
write_byte(255) // fade red 
write_byte(255) // fade green 
write_byte(255) // fade blue 
write_byte(155) // fade alpha 
message_end()

gotenClass[id] = 1
gotenSSJClass[id] = 0

set_task(2.0,"goten_transstage_5",id)

return PLUGIN_HANDLED

}

public goten_transstage_5(id)

{

message_begin(MSG_ONE,get_user_msgid("ScreenFade"),{0,0,0},id) 
write_short(1000) // fade lasts this long duration 
write_short(1000) // fade lasts this long hold time 
write_short(1<<12) // fade type (in / out) 
write_byte(255) // fade red 
write_byte(255) // fade green 
write_byte(255) // fade blue 
write_byte(155) // fade alpha 
message_end()

gotenClass[id] = 0
gotenSSJClass[id] = 1

set_task(1.0,"goten_transstage_6",id)

return PLUGIN_HANDLED

}

public goten_transstage_6(id)

{

message_begin(MSG_ONE,get_user_msgid("ScreenFade"),{0,0,0},id) 
write_short(1000) // fade lasts this long duration 
write_short(1000) // fade lasts this long hold time 
write_short(1<<12) // fade type (in / out) 
write_byte(255) // fade red 
write_byte(255) // fade green 
write_byte(255) // fade blue 
write_byte(155) // fade alpha 
message_end()

gotenClass[id] = 1
gotenSSJClass[id] = 0

set_task(2.0,"goten_transstage_finish",id)

return PLUGIN_HANDLED

}

public goten_transstage_finish(id)

{

entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
set_pdata_int(id, 199, 0)
set_pdata_int(id, 301, 0, -89 )
set_user_godmode(id, 0)

message_begin( MSG_BROADCAST, get_user_msgid( "StopPowerup" ) );
write_byte( id );
message_end( );

message_begin(MSG_ALL,get_user_msgid("StopTransFX"));
write_byte(id);
message_end();

gotenClass[id] = 0
gotenTransing[id] = 0
gotenSSJClass[id] = 1

message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
write_byte( 115 );
message_end( );

set_user_health(id, get_user_health(id) + 10 )

set_pdata_int(id, 460, get_pdata_int(id, 460) * 2 )
set_pdata_int(id, 461, get_pdata_int(id, 460) * 2 )

return PLUGIN_HANDLED

}

public KidTrunksCreate(id)

{

set_pdata_int(id, 460, 800000 )
set_pdata_int(id, 461, 800000 )

kidTrunksClass[id] = 1

classIgnore[id] = 1

client_cmd(id, "gohan")


return PLUGIN_HANDLED

}

// >> [ :: USSJ4 :: ]



public USSJ4_task(id)

{

if ( USSJ4_active[id] !=0 )

{

USSJ4_active[id] = 0

new powerlevel = get_pdata_int(id, 460)

set_pdata_int(id, 460, powerlevel - 1000000 )
set_pdata_int(id, 461, powerlevel - 1000000 )

set_pdata_int(id, 459, 400 )
set_pdata_int(id, 462, 400 )
entity_set_float(id, EV_FL_fuser1, 580.0 )

return PLUGIN_HANDLED

}

else if( USSJ4_charging[id] !=0 )

{

message_begin( MSG_ONE, get_user_msgid( "Charge" ), {0,0,0}, id );
write_byte( 0 );
message_end( );

message_begin( MSG_BROADCAST, get_user_msgid( "StopPowerup" ) );
write_byte( id );
message_end( );

message_begin( MSG_BROADCAST, get_user_msgid( "StopTransFX" ) );
write_byte( id );
message_end( );

set_pdata_int(id, 199, 0)

remove_task( id )

USSJ4_charging[id] = 0

return PLUGIN_HANDLED

}


else

{


new seq = entity_get_int(id, EV_INT_sequence )

if( seq == 1 || seq == 2 || seq == 3 || seq == 28 )
	
{
	
	set_task(0.1,"USSJ4_task1",id)
	
	return PLUGIN_HANDLED
	
}

else

{
	
	return PLUGIN_HANDLED
	
}

}

return PLUGIN_HANDLED

}

public USSJ4_task1(id)

{

message_begin( MSG_ONE, get_user_msgid( "Charge" ), {0,0,0}, id );
write_byte( 10 );
message_end( );

message_begin(MSG_ALL,get_user_msgid("TransformFX"));
write_byte(id);
write_byte(100);
write_byte(1)
message_end();

set_pdata_int(id, 199, 1)

USSJ4_charging[id] = 1

set_task(0.5, "USSJ4_task2", id)

message_begin( MSG_BROADCAST, get_user_msgid( "Powerup" ) );
write_byte( id );
write_byte( 255 );
write_byte( 0 );
write_byte( 0 );
message_end( );

return PLUGIN_HANDLED

}

public USSJ4_task2(id)

{


message_begin( MSG_ONE, get_user_msgid( "Charge" ), {0,0,0}, id );
write_byte( 20 );
message_end( );

set_task(0.5, "USSJ4_task3", id)

return PLUGIN_HANDLED

}

public USSJ4_task3(id)

{


message_begin( MSG_ONE, get_user_msgid( "Charge" ), {0,0,0}, id );
write_byte( 30 );
message_end( );

set_task(0.5, "USSJ4_task4", id)

return PLUGIN_HANDLED

}

public USSJ4_task4(id)

{


message_begin( MSG_ONE, get_user_msgid( "Charge" ), {0,0,0}, id );
write_byte( 40 );
message_end( );

set_task(0.5, "USSJ4_task5", id)

return PLUGIN_HANDLED

}

public USSJ4_task5(id)

{


message_begin( MSG_ONE, get_user_msgid( "Charge" ), {0,0,0}, id );
write_byte( 50 );
message_end( );

set_task(0.5, "USSJ4_task6", id)

return PLUGIN_HANDLED

}

public USSJ4_task6(id)

{


message_begin( MSG_ONE, get_user_msgid( "Charge" ), {0,0,0}, id );
write_byte( 60 );
message_end( );

set_task(0.5, "USSJ4_task7", id)

return PLUGIN_HANDLED

}

public USSJ4_task7(id)

{


message_begin( MSG_ONE, get_user_msgid( "Charge" ), {0,0,0}, id );
write_byte( 70 );
message_end( );

set_task(0.5, "USSJ4_task8", id)

return PLUGIN_HANDLED

}

public USSJ4_task8(id)

{


message_begin( MSG_ONE, get_user_msgid( "Charge" ), {0,0,0}, id );
write_byte( 80 );
message_end( );

set_task(0.5, "USSJ4_task9", id)

return PLUGIN_HANDLED

}

public USSJ4_task9(id)

{


message_begin( MSG_ONE, get_user_msgid( "Charge" ), {0,0,0}, id );
write_byte( 90 );
message_end( );

set_task(0.5, "USSJ4_task10", id)

return PLUGIN_HANDLED

} 

public USSJ4_task10(id)

{


message_begin( MSG_ONE, get_user_msgid( "Charge" ), {0,0,0}, id );
write_byte( 100 );
message_end( );

set_task(0.5, "USSJ4_task_final", id)

USSJ4_charging[id] = 0

return PLUGIN_HANDLED

}

public USSJ4_task_final(id)

{

message_begin( MSG_ONE, get_user_msgid( "Charge" ), {0,0,0}, id );
write_byte( 0 );
message_end( );

message_begin( MSG_BROADCAST, get_user_msgid( "StopPowerup" ) );
write_byte( id );
message_end( );

message_begin(MSG_ALL,get_user_msgid("StopTransFX"));
write_byte(id);
message_end();

set_pdata_int(id, 199, 0)

new powerlevel = get_pdata_int(id, 460)
set_pdata_int(id, 460, powerlevel + 1000000 )
set_pdata_int(id, 461, powerlevel + 1000000 )

set_pdata_int(id, 459, 250 )
set_pdata_int(id, 462, 250 )

entity_set_float(id, EV_FL_fuser1, 300.0 )

USSJ4_active[id] = 1

return PLUGIN_HANDLED

}

public SuperDragonFist(id)

{

if ( SuperDragonFist_cooldown[id] !=0 )

{

return PLUGIN_HANDLED

}

else

{

SuperDragonFist_active[id] = 1

set_task(30.0,"SuperDragonFist_off",id)

}

return PLUGIN_HANDLED

}

public SuperDragonFist_off(id)

{

SuperDragonFist_active[id] = 0

SuperDragonFist_cooldown[id] = 1

set_task(180.0,"SuperDragonFist_coolover",id)

return PLUGIN_HANDLED

}

public SuperDragonFist_coolover(id)

{

SuperDragonFist_cooldown[id] = 0

return PLUGIN_HANDLED

}

public Explosion(id)

{

new Float:explosion_origin[3]

get_user_origin(id, explosion_origin)

message_begin( MSG_BROADCAST, get_user_msgid( "Explosion" ) );
write_coord( explosion_origin[0] );
write_coord( explosion_origin[1] );
write_coord( explosion_origin[2] );
write_long( 85 );
write_byte( 1 );
message_end( );

new health = get_user_health(id)
set_user_health(id, health - 25 )

return PLUGIN_HANDLED

}



//------------------------------------
//Specials part
//------------------------------------

public DragonFist(id)

{

if( dragonfist[id] !=0 )

{

return PLUGIN_HANDLED

}

else

{

set_task(0.1, "DragonFist2", id)

return PLUGIN_HANDLED

}

return PLUGIN_HANDLED

}

public DragonFist2(id)

{

dragonfist[id] = 1
engclient_cmd(id, "weapon_spiritbomb")
client_cmd(id, "+attack")
set_task(5.0, "DragonFist3", id)

return PLUGIN_HANDLED

}

public DragonFist3(id)

{

engclient_cmd(id, "weapon_melee")
client_cmd(id, "-attack")

return PLUGIN_HANDLED

}




//------------------------------------
//------------------------------------

// SSJ4 Gogeta part
//------------------------------------

public ssj2fusion_check(id)

{

if ( GogetaSSJ2_avatar[id] !=0 )

{

return PLUGIN_HANDLED

}

else

{

new CoreIndexID, CoreBodypartID

get_user_aiming(id, CoreIndexID, CoreBodypartID, 100 )

if( CoreIndexID )
	
{
	
	if( entity_get_int(id, EV_INT_playerclass ) == 2 )
		
	{
		
		if( entity_get_int(CoreIndexID, EV_INT_playerclass ) == 8 )
			
		{
			
			if ( ascend[id] == 0 )
				
			{
				
				if ( ascend[CoreIndexID] == 0 )
					
				{
					
					new powerlevel1 = get_pdata_int(id, 460)
					new powerlevel2 = get_pdata_int(CoreIndexID, 460 )
					set_pdata_int(id, 460, powerlevel1 * 2 + powerlevel2 * 2)
					set_pdata_int(id, 461, powerlevel1 * 2 + powerlevel2 * 2)
					set_task(0.1, "gogetassj2",id)
					
				}
				
				else
				
				{
				}
				
			}
			
			else
			
			{
			}
			
		}
		
		else
		
		{
			
		}
		
	}
	
	else if ( entity_get_int( id, EV_INT_playerclass ) == 8 )
		
	{
		
		if( entity_get_int(CoreIndexID, EV_INT_playerclass ) == 2 )
			
		{
			
			if ( ascend[id] == 0 )
				
			{
				
				if ( ascend[CoreIndexID] == 0 )
					
				{
					
					new powerlevel1 = get_pdata_int(id, 460)
					new powerlevel2 = get_pdata_int(CoreIndexID, 460 )
					set_pdata_int(id, 460, powerlevel1 * 2 + powerlevel2 * 2)
					set_pdata_int(id, 461, powerlevel1 * 2 + powerlevel2 * 2)
					set_task(0.1, "gogetassj2",id)
					
				}
				
				else
				
				{
				}
				
			}
			
			else
			{
			}
			
		}
		
		else
		
		{
			
		}			
		
	}
	
}

else

{
	
}


return PLUGIN_HANDLED

}

return PLUGIN_HANDLED

}


public gogetassj2(id)

{

if( GogetaSSJ2_avatar[id] == 0 )

{

GogetaSSJ2_avatar[id] = create_entity( "env_model" ) 
entity_set_int( GogetaSSJ2_avatar[id], EV_INT_movetype, MOVETYPE_FOLLOW ) 
entity_set_edict( GogetaSSJ2_avatar[id], EV_ENT_aiment, id )
entity_set_model( GogetaSSJ2_avatar[id], "models/player/ssj2gogeta/ssj2gogeta.mdl" )

}


message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
write_byte( 255 );
message_end( );

set_user_health(id, 255)

strip_user_weapons(id)

set_user_godmode(id, 1)

give_item(id, "weapon_melee")
give_item(id, "weapon_kiblast")
give_item(id, "weapon_renzoku")
give_item(id, "weapon_genericbeam")
give_item(id, "weapon_finalflash")
give_item(id, "weapon_bigbang")
give_item(id, "weapon_kamehameha")
give_item(id, "weapon_spiritbomb")

set_pdata_int(id, 459, 450 )
set_pdata_int(id, 462, 450 )

set_task(0.1,"fusionssj2_make",id)

return PLUGIN_HANDLED

}

public gogetassj2FX1(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(30); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(30); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
client_cmd(id, "cam_idealdist 500")
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj2FX2", id)

return PLUGIN_HANDLED

}

public gogetassj2FX2(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(29); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(29); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX3", id)

return PLUGIN_HANDLED

}

public gogetassj2FX3(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(28); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(28); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj2FX4", id)

return PLUGIN_HANDLED

}

public gogetassj2FX4(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(27); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(27); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj2FX5", id)

return PLUGIN_HANDLED

}

public gogetassj2FX5(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(26); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(26); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj2FX6", id)

return PLUGIN_HANDLED

}

public gogetassj2FX6(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(25); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(25); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj2FX7", id)

return PLUGIN_HANDLED

}

public gogetassj2FX7(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(24); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(24); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj2FX8", id)

return PLUGIN_HANDLED

}

public gogetassj2FX8(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(23); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(23); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj2FX9", id)

return PLUGIN_HANDLED

}

public gogetassj2FX9(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(22); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(22); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj2FX10", id)

return PLUGIN_HANDLED

}

public gogetassj2FX10(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(21); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(21); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj2FX11", id)

return PLUGIN_HANDLED

}

public gogetassj2FX11(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(20); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(20); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj2FX12", id)

return PLUGIN_HANDLED

}

public gogetassj2FX12(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(15); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(15); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj2FX13", id)

return PLUGIN_HANDLED

}

public gogetassj2FX13(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(10); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(10); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj2FX14", id)

return PLUGIN_HANDLED

}

public gogetassj2FX14(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj2FX15", id)

return PLUGIN_HANDLED

}

public gogetassj2FX15(id)

{

set_user_rendering(id, kRenderFxGlowShell, 255, 155, 0, kRenderTransAdd, 50)
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj2FX16", id)

return PLUGIN_HANDLED

}

public gogetassj2FX16(id)

{

set_user_godmode(id, 0)
client_cmd(id,"cam_idealdist 40")
engclient_cmd(id, "-powerup")
set_task(300.0,"gogetaSSJ2_defuse", id)

return PLUGIN_HANDLED

}

public ssj4fusion_check(id)

{

if ( GogetaSSJ4_avatar[id] !=0 )

{

return PLUGIN_HANDLED

}

else

{

new CoreIndexID, CoreBodypartID

get_user_aiming(id, CoreIndexID, CoreBodypartID, 100 )

if( CoreIndexID )
	
{
	
	if( entity_get_int(id, EV_INT_playerclass ) == 2 )
		
	{
		
		if( entity_get_int(CoreIndexID, EV_INT_playerclass ) == 8 )
			
		{
			
			if ( avatars[id] !=0 )
				
			{
				
				if ( avatars2[CoreIndexID] !=0 )
					
				{
					
					new powerlevel1 = get_pdata_int(id, 460)
					new powerlevel2 = get_pdata_int(CoreIndexID, 460 )
					set_pdata_int(id, 460, powerlevel1 * 2 + powerlevel2 * 2)
					set_pdata_int(id, 461, powerlevel1 * 2 + powerlevel2 * 2)
					set_task(0.1, "gogetassj4",id)
					
				}
				
				else
				
				{
				}
				
			}
			
			else
			
			{
			}
			
		}
		
		else
		
		{
			
		}
		
	}
	
	else if ( entity_get_int( id, EV_INT_playerclass ) == 8 )
		
	{
		
		if( entity_get_int(CoreIndexID, EV_INT_playerclass ) == 2 )
			
		{
			
			if ( avatars2[id] !=0 )
				
			{
				
				if ( avatars[CoreIndexID] !=0 )
					
				{
					
					new powerlevel1 = get_pdata_int(id, 460)
					new powerlevel2 = get_pdata_int(CoreIndexID, 460 )
					set_pdata_int(id, 460, powerlevel1 * 2 + powerlevel2 * 2)
					set_pdata_int(id, 461, powerlevel1 * 2 + powerlevel2 * 2)
					set_task(0.1, "gogetassj4",id)
					
				}
				
				else
				
				{
				}
				
			}
			
			else
			{
			}
			
		}
		
		else
		
		{
			
		}			
		
	}
	
}

else

{
	
}


return PLUGIN_HANDLED

}

return PLUGIN_HANDLED

}

public gogetassj4(id)

{

if( GogetaSSJ4_avatar[id] == 0 )

{

GogetaSSJ4_avatar[id] = create_entity( "env_model" ) 
entity_set_int( GogetaSSJ4_avatar[id], EV_INT_movetype, MOVETYPE_FOLLOW ) 
entity_set_edict( GogetaSSJ4_avatar[id], EV_ENT_aiment, id )
entity_set_model( GogetaSSJ4_avatar[id], "models/player/ssj4gogeta/ssj4gogeta.mdl" )

}

GogetaSSJ4Powerup[id] = true

remove_entity(avatars2[id])

avatars[id] = 0
avatars2[id] = 0



message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
write_byte( 510 );
message_end( );

set_user_health(id, 510)

strip_user_weapons(id)

set_user_godmode(id, 1)

give_item(id, "weapon_melee")
give_item(id, "weapon_kiblast")
give_item(id, "weapon_renzoku")
give_item(id, "weapon_genericbeam")
give_item(id, "weapon_finalflash")
give_item(id, "weapon_bigbang")
give_item(id, "weapon_kamehameha")
give_item(id, "weapon_spiritbomb")

set_pdata_int(id, 459, 490 )
set_pdata_int(id, 462, 490 )

set_task(0.1,"fusionssj4_make",id)

return PLUGIN_HANDLED

}


public gogetassj4FX1(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(30); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(30); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
set_lights("b")
client_cmd(id, "cam_idealdist 500")
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX2", id)

return PLUGIN_HANDLED

}

public gogetassj4FX2(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(29); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(29); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX3", id)

return PLUGIN_HANDLED

}

public gogetassj4FX3(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(28); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(28); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX4", id)

return PLUGIN_HANDLED

}

public gogetassj4FX4(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(27); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(27); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX5", id)

return PLUGIN_HANDLED

}

public gogetassj4FX5(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(26); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(26); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX6", id)

return PLUGIN_HANDLED

}

public gogetassj4FX6(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(25); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(25); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX7", id)

return PLUGIN_HANDLED

}

public gogetassj4FX7(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(24); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(24); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX8", id)

return PLUGIN_HANDLED

}

public gogetassj4FX8(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(23); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(23); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX9", id)

return PLUGIN_HANDLED

}

public gogetassj4FX9(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(22); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(22); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX10", id)

return PLUGIN_HANDLED

}

public gogetassj4FX10(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(21); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(21); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX11", id)

return PLUGIN_HANDLED

}

public gogetassj4FX11(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(20); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(20); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX12", id)

return PLUGIN_HANDLED

}

public gogetassj4FX12(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(15); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(15); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX13", id)

return PLUGIN_HANDLED

}

public gogetassj4FX13(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(10); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(10); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX14", id)

return PLUGIN_HANDLED

}

public gogetassj4FX14(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4F2); // short (sprite index)
write_byte(5); // byte (scale in 0.1's)  
write_byte(0); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX15", id)

return PLUGIN_HANDLED

}

public gogetassj4FX15(id)

{

set_user_rendering(id, kRenderFxGlowShell, 255, 155, 0, kRenderTransAdd, 50)
engclient_cmd(id, "+powerup")
set_task(0.5, "gogetassj4FX16", id)

return PLUGIN_HANDLED

}

public gogetassj4FX16(id)

{

set_user_godmode(id, 0)
set_lights("m")
client_cmd(id,"cam_idealdist 40")
engclient_cmd(id, "-powerup")
//	set_task(120.0,"gogetaSSJ4_defuse", id)

return PLUGIN_HANDLED

}

public gogetaSSJ4_defuse(id)

{

set_rendering(GogetaSSJ4_avatar[id],kRenderFxGlowShell, 255, 0, 0, kRenderNormal, 100 )

set_task(4.0,"gogetaSSJ4_defuse_finish",id)

return PLUGIN_HANDLED

}

public gogetaSSJ4_defuse_finish(id)

{

remove_entity(GogetaSSJ4_avatar[id])

message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
write_byte( 110 );
message_end( );

GogetaSSJ4_avatar[id] = 0;

set_user_health(id, 110)

set_user_rendering(id, kRenderFxNone, 0, 0, 0, kRenderNormal, 255 )

strip_user_weapons(id)

set_pdata_int(id, 459, 216 )
set_pdata_int(id, 462, 216 )

if ( entity_get_int(id, EV_INT_playerclass ) == 2 )

{

give_item(id,"weapon_melee")
give_item(id,"weapon_kiblast")
give_item(id,"weapon_genericbeam")
give_item(id,"weapon_kamehameha")
give_item(id,"weapon_spiritbomb")
give_item(id,"weapon_solarflare")
give_item(id,"weapon_kametorpedo")

}

else

{


give_item(id,"weapon_melee")
give_item(id,"weapon_kiblast")
give_item(id,"weapon_genericbeam")
give_item(id,"weapon_gallitgun")
give_item(id,"weapon_bigbang")
give_item(id,"weapon_finalflash")

}

return PLUGIN_HANDLED

}

public gogetaSSJ2_defuse(id)

{

remove_entity(GogetaSSJ2_avatar[id])

message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
write_byte( 110 );
message_end( );

GogetaSSJ2_avatar[id] = 0;

set_user_health(id, 110)

set_user_rendering(id, kRenderFxNone, 0, 0, 0, kRenderNormal, 255 )

strip_user_weapons(id)

set_pdata_int(id, 459, 216 )
set_pdata_int(id, 462, 216 )

if ( entity_get_int(id, EV_INT_playerclass ) == 2 )

{

give_item(id,"weapon_melee")
give_item(id,"weapon_kiblast")
give_item(id,"weapon_genericbeam")
give_item(id,"weapon_kamehameha")
give_item(id,"weapon_spiritbomb")
give_item(id,"weapon_solarflare")
give_item(id,"weapon_kametorpedo")

}

else

{


give_item(id,"weapon_melee")
give_item(id,"weapon_kiblast")
give_item(id,"weapon_genericbeam")
give_item(id,"weapon_gallitgun")
give_item(id,"weapon_bigbang")
give_item(id,"weapon_finalflash")

}

return PLUGIN_HANDLED

}


public fusionssj4_make(id)

{

new CoreEntity, CoreBodyPart

get_user_aiming(id, CoreEntity, CoreBodyPart)

if(CoreEntity)

{

new Float:origin[3]
origin[2] -= 10000.0

entity_set_origin( CoreEntity, origin )

set_task(0.1,"gogetassj4FX1",id)

}

else

{

client_print(id, print_chat, "Fuck you")
}

return PLUGIN_HANDLED

}

public fusionssj2_make(id)

{

new CoreEntity, CoreBodyPart

get_user_aiming(id, CoreEntity, CoreBodyPart)

if(CoreEntity)

{

new Float:origin[3]
origin[2] -= 10000.0

entity_set_origin( CoreEntity, origin )

set_task(0.1,"gogetassj2FX1",id)

}

else

{

client_print(id, print_chat, "Fuck you")
}

return PLUGIN_HANDLED

}

// Brolly part
//--------------------------------

//-----------------------------------------------------------
//
//-----------------------------------------------------------
// Goku part
//-----------------------------------------------------------
public gokussj2_transstage_init(id)

{

	set_pdata_int(id, 199, 1)
	set_pdata_int(id, 301, 1, -89 )
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );
	set_user_godmode(id, 1)

	SSJ2transing[id] = 1

	SSJ2FXWAIT[id] = 0

	client_cmd(id, "cam_idealdist 400")

	emit_sound(id, CHAN_AUTO, "EvolutionSSJ4/gokussj2/ssj2trans.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)


	message_begin( MSG_BROADCAST, get_user_msgid( "Powerup" ) );
	write_byte( id );
	write_byte( 255 );
	write_byte( 215 );
	write_byte( 0 );
	message_end( );

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	src[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 
	dest[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	dest[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );

	set_task(1.0,"gokussj2_transstage_2",id)

	return PLUGIN_HANDLED

}

public gokussj2_transstage_2(id)

{


	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	src[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 
	dest[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	dest[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 


	

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(3.0,"gokussj2_transstage_3",id)

	return PLUGIN_HANDLED

}

public gokussj2_transstage_3(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	src[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 
	dest[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	dest[2] = random_num( origin[2] - 15, origin[2] + 15 );      // ''

	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );


	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(3.0,"gokussj2_transstage_4",id)

	return PLUGIN_HANDLED

}

public gokussj2_transstage_4(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	src[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 
	dest[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	dest[2] = random_num( origin[2] - 15, origin[2] + 15 );      // ''

	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 142) 
	write_coord(vec1[1]+ 484 ) 
	write_coord(vec1[2] + 124) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 50 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(2.0,"gokussj2_transstage_5",id)

	return PLUGIN_HANDLED

}

public gokussj2_transstage_5(id)

{

	client_cmd(id, "turbo")


	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	src[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 
	dest[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	dest[2] = random_num( origin[2] - 15, origin[2] + 15 );      // ''

	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );


	aura2[id] = create_entity("env_model")
	new Float:Origin[3]
	new Float:AuraOrigin[3]
	pev(id, pev_origin, Origin)
	AuraOrigin[0] = Origin[0]
	AuraOrigin[1] = Origin[1]
	AuraOrigin[2] = Origin[2]


	entity_set_model(aura2[id], "models/evo/aura.mdl")
	entity_set_origin(aura2[id], AuraOrigin)
	entity_set_byte(aura2[id],EV_BYTE_controller1,125);
	entity_set_byte(aura2[id],EV_BYTE_controller2,125);
	entity_set_byte(aura2[id],EV_BYTE_controller3,125);
	entity_set_byte(aura2[id],EV_BYTE_controller4,125);
	entity_set_int(aura2[id], EV_INT_sequence, 0 );
	entity_set_int(aura2[id], EV_INT_skin, 4 );
	entity_set_float(aura2[id], EV_FL_framerate, 1.0 )

	set_rendering(aura2[id], kRenderFxNone, 0, 0, 0, kRenderTransAdd, 55 )

	set_task(2.0,"gokussj2_transstage_6",id)

	return PLUGIN_HANDLED

}

public gokussj2_transstage_6(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	src[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 
	dest[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	dest[2] = random_num( origin[2] - 15, origin[2] + 15 );      // ''

	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(2.0, "gokussj2_transstage_7",id)

	return PLUGIN_HANDLED

}

public gokussj2_transstage_7(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	src[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 
	dest[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	dest[2] = random_num( origin[2] - 15, origin[2] + 15 );      // ''

	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(1.0, "gokussj2_transstage_finish",id)

	return PLUGIN_HANDLED

}

public gokussj2_transstage_finish(id)

{

	emit_sound(id, CHAN_AUTO, "goku/scream.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

	GokuSSJ2[id] = 1

	set_pdata_int(id, 199, 0)
	set_pdata_int(id, 301, 0, -89)
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
	set_user_godmode(id, 0)

	message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
	write_byte( 150 );
	message_end( );

	message_begin( MSG_BROADCAST, get_user_msgid( "StopPowerup" ) );
	write_byte( id );
	message_end( );

	SSJ2transing[id] = 0

	client_cmd(id, "turbo")

	client_cmd(id, "cam_idealdist 40")

	remove_entity( aura2[id] )

	aura2[id] = 0

	set_user_health(id, get_user_health(id) + 20 )

	set_pdata_float(id, 460, get_pdata_float(id, 460) * 1.5 )
//	set_pdata_float(id, 461, get_pdata_float(id, 460) * 1.5 )

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 57, origin[0] + 57 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 57, origin[1] + 57 );      // '' 
	src[2] = random_num( origin[2] - 55, origin[2] + 55 );      // '' 
	dest[0] = random_num( origin[0] - 57, origin[0] + 57 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 57, origin[1] + 57 );      // '' 
	dest[2] = random_num( origin[2] - 55, origin[2] + 55 );      // ''

	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 142) 
	write_coord(vec1[1]+ 484 ) 
	write_coord(vec1[2] + 124) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 230 ) // r 
	write_byte( 129 ) // g 
	write_byte( 17 ) // b
	write_byte( 50 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 142) 
	write_coord(vec1[1]+ 484 ) 
	write_coord(vec1[2] + 124) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise
	write_byte( 230 ) // r 
	write_byte( 129 ) // g 
	write_byte( 17 ) // b
	write_byte( 50 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 142) 
	write_coord(vec1[1]+ 484 ) 
	write_coord(vec1[2] + 124)  
	write_short( sonicwave ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 64 ) // width 16 
	write_byte( 0 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b
	write_byte( 50 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 71) 
	write_coord(vec1[1]+ 242 ) 
	write_coord(vec1[2] + 62)  
	write_short( sonicwave ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 64 ) // width 16 
	write_byte( 0 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b
	write_byte( 50 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 71) 
	write_coord(vec1[1]+ 242 ) 
	write_coord(vec1[2] + 62) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise
	write_byte( 230 ) // r 
	write_byte( 129 ) // g 
	write_byte( 17 ) // b
	write_byte( 50 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	new origin2[3]
	get_user_origin(id, origin2)
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] + 400)
	write_coord( origin2[1] + 400)
	write_coord( origin2[2] + 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] - 400)
	write_coord( origin2[1] + 400)
	write_coord( origin2[2] + 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] + 400)
	write_coord( origin2[1] - 400)
	write_coord( origin2[2] + 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] + 400)
	write_coord( origin2[1] + 400)
	write_coord( origin2[2] - 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] - 400)
	write_coord( origin2[1] - 400)
	write_coord( origin2[2] + 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] - 400)
	write_coord( origin2[1] + 400)
	write_coord( origin2[2] - 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] + 400)
	write_coord( origin2[1] - 400)
	write_coord( origin2[2] - 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] - 400)
	write_coord( origin2[1] - 400)
	write_coord( origin2[2] - 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] - 300)
	write_coord( origin2[1] - 300)
	write_coord( origin2[2] - 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] + 200)
	write_coord( origin2[1] - 200)
	write_coord( origin2[2] + 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] - 300)
	write_coord( origin2[1] + 500)
	write_coord( origin2[2] - 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()

	return PLUGIN_HANDLED

}

public gokussj3_transstage_init(id)

{

	set_pdata_int(id, 199, 1)
	set_pdata_int(id, 301, 1, -89 )
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );
	set_user_godmode(id, 1)

	SSJ3transing[id] = 1

	SSJ3FXWAIT[id] = 0

	client_cmd(id, "cam_idealdist 400")

	emit_sound(id, CHAN_AUTO, "EvolutionSSJ4/goku/ssj3trans.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

	client_cmd(id, "turbo")

//	new id2 = id

//	set_task(0.1,"gokussj3_ssj3fx",id2)

	set_task(10.0,"gokussj3_transstage_2",id)

	FX_SSJ3(id)
	FX_SSJ3(id)

	return PLUGIN_HANDLED

}

/*
public gokussj3_ssj3fx(id2)

{

	if ( SSJ3transing[id2] !=0 )

	{


		new src[3], dest[3], origin[3]; 

		//Get our origin 
		get_user_origin( id2, origin ); 

		//Calculate the random lightning around them. 
		src[0] = random_num( origin[0] - 170, origin[0] + 170 );      //Random x based on origin 
		src[1] = random_num( origin[1] - 170, origin[1] + 170 );      // '' 
		src[2] = random_num( origin[2] - 150, origin[2] + 150 );      // '' 
		dest[0] = random_num( origin[0] - 170, origin[0] + 170 );      //Random x based on origin 
		dest[1] = random_num( origin[1] - 170, origin[1] + 170 );      // '' 
		dest[2] = random_num( origin[2] - 150, origin[2] + 150 );      // ''

		//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );

		message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin )
		write_byte( 17 )
		write_coord( origin[0] )
		write_coord( origin[1] )
		write_coord( origin[2] )
		write_short( ssj3trans )
		write_byte( 15 )
		write_byte( 200 )
		message_end()

		FX_SSJ3(id2)


	}

	else

	{

		remove_task(id2)

	}

}
*/

public gokussj3_transstage_2(id)

{

	FX_SSJ3(id)
	FX_SSJ3(id)

	SSJ3grow1[id] = 1

	set_task(2.0,"gokussj3_transstage_3",id)

	return PLUGIN_HANDLED

}

public gokussj3_transstage_3(id)

{

	SSJ3grow1[id] = 0
	SSJ3grow2[id] = 1

	set_task(2.0,"gokussj3_transstage_4",id)

	return PLUGIN_HANDLED

}

public gokussj3_transstage_4(id)

{

	SSJ3grow2[id] = 0
	SSJ3grow3[id] = 1

	set_task(2.0,"gokussj3_transstage_5",id)

	return PLUGIN_HANDLED

}

public gokussj3_transstage_5(id)

{

	SSJ3grow3[id] = 0
	SSJ3grow4[id] = 1

	set_task(2.0,"gokussj3_transstage_6",id)

	return PLUGIN_HANDLED

}

public gokussj3_transstage_6(id)

{

	SSJ3grow4[id] = 0
	SSJ3grow5[id] = 1

	set_task(2.0,"gokussj3_transstage_7",id)

	return PLUGIN_HANDLED

}

public gokussj3_transstage_7(id)

{

	FX_SSJ3(id)
	FX_SSJ3(id)

	set_task(10.0,"gokussj3_transstage_finish",id)

	return PLUGIN_HANDLED

}

public gokussj3_transstage_finish(id)

{

	SSJ3grow5[id] = 0
	set_pdata_int(id, 199, 0)
	set_pdata_int(id, 301, 0, -89)
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
	set_user_godmode(id, 0)

	SSJ3FXWAIT[id] = 0

	remove_task(id)
//	remove_task(id2)

	emit_sound(id, CHAN_AUTO, "goku/scream.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

	GokuSSJ2[id] = 0
	GokuSSJ3[id] = 1

	SSJ3transing[id] = 0

	message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
	write_byte( 170 );
	message_end( );

	set_user_health(id, get_user_health(id) + 20 )

	client_cmd(id, "turbo")

	client_cmd(id, "cam_idealdist 40")

	set_pdata_float(id, 460, get_pdata_float(id, 460) * 1.5 )
//	set_pdata_float(id, 461, get_pdata_float(id, 460) * 1.5 )

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2] + 20) 
	write_coord(vec1[0] + 38) 
	write_coord(vec1[1] + 20) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 255 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 255 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2] + 30) 
	write_coord(vec1[0] + 48) 
	write_coord(vec1[1] + 30) 
	write_coord(vec1[2] + 600) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 255 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 255 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	return PLUGIN_HANDLED

}


public gohanssj2_transstage_init(id)

{

	GohanTransingSSJ2[id] = 1

	set_pdata_int(id, 199, 1)
	set_pdata_int(id, 301, 1, -89 )
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );
	set_user_godmode(id, 1)

	client_cmd(id, "cam_idealdist 400")
	client_cmd(id, "turbo")

	aura2[id] = create_entity("env_model")
	new Float:Origin[3]
	new Float:AuraOrigin[3]
	pev(id, pev_origin, Origin)
	AuraOrigin[0] = Origin[0]
	AuraOrigin[1] = Origin[1]
	AuraOrigin[2] = Origin[2]
	entity_set_model(aura2[id], "models/evo/aura.mdl")
	entity_set_origin(aura2[id], AuraOrigin)
	entity_set_byte(aura2[id],EV_BYTE_controller1,125);
	entity_set_byte(aura2[id],EV_BYTE_controller2,125);
	entity_set_byte(aura2[id],EV_BYTE_controller3,125);
	entity_set_byte(aura2[id],EV_BYTE_controller4,125);
	entity_set_int(aura2[id], EV_INT_sequence, 0 );
	entity_set_int(aura2[id], EV_INT_skin, 4 );
	entity_set_float(aura2[id], EV_FL_framerate, 1.0 )

	set_rendering(aura2[id], kRenderFxGlowShell, 0, 0, 0, kRenderTransAdd, 55 )

	set_task(4.0,"gohanssj2_transstage_2",id)

	return PLUGIN_HANDLED

}

public gohanssj2_transstage_2(id)

{

	new vec1[3]
	get_user_origin(id, vec1)

	new origin2[3]
	get_user_origin(id, origin2)

	message_begin(MSG_ONE,SVC_TEMPENTITY,{0,0,0},id)
	write_byte(TE_BEAMCYLINDER)
	write_coord(origin2[0])	// center pos
	write_coord(origin2[1])
	write_coord(origin2[2])	
	write_coord(origin2[0])	// axis and radius
	write_coord(origin2[1])
	write_coord(origin2[2] + 400)
	write_short(dustspr)	// sprite index
	write_byte(1)		// starting frame
	write_byte(5)		// frame rate
	write_byte(6)		// life
	write_byte(8)		// line width
	write_byte(1)		// noise
	write_byte(239)	// RED
	write_byte(147)	// GREEN
	write_byte(37)	// BLUE
	write_byte(255)	// brightness
	write_byte(0)	// scroll speed
	message_end()

	message_begin(MSG_ONE,get_user_msgid("ScreenFade"),{0,0,0},id) 
	write_short(1000) // fade lasts this long duration 
	write_short(1000) // fade lasts this long hold time 
	write_short(1<<12) // fade type (in / out) 
	write_byte(255) // fade red 
	write_byte(255) // fade green 
	write_byte(255) // fade blue 
	write_byte(150) // fade alpha 
	message_end()

	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 35) 
	write_coord(vec1[1]+ 121 ) 
	write_coord(vec1[2] + 31)  
	write_short( sonicwave ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 35 ) // width 16 
	write_byte( 0 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b
	write_byte( 100 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(4.0, "gohanssj2_transstage_3",id)

	return PLUGIN_HANDLED

}

public gohanssj2_transstage_3(id)

{

	new vec1[3]
	get_user_origin(id, vec1)

	new origin2[3]
	get_user_origin(id, origin2)

	message_begin(MSG_ONE,SVC_TEMPENTITY,{0,0,0},id)
	write_byte(TE_BEAMCYLINDER)
	write_coord(origin2[0])	// center pos
	write_coord(origin2[1])
	write_coord(origin2[2])	
	write_coord(origin2[0])	// axis and radius
	write_coord(origin2[1])
	write_coord(origin2[2] + 400)
	write_short(dustspr)	// sprite index
	write_byte(1)		// starting frame
	write_byte(5)		// frame rate
	write_byte(6)		// life
	write_byte(8)		// line width
	write_byte(1)		// noise
	write_byte(239)	// RED
	write_byte(147)	// GREEN
	write_byte(37)	// BLUE
	write_byte(255)	// brightness
	write_byte(0)	// scroll speed
	message_end()

	message_begin(MSG_ONE,get_user_msgid("ScreenFade"),{0,0,0},id) 
	write_short(1000) // fade lasts this long duration 
	write_short(1000) // fade lasts this long hold time 
	write_short(1<<12) // fade type (in / out) 
	write_byte(255) // fade red 
	write_byte(255) // fade green 
	write_byte(255) // fade blue 
	write_byte(150) // fade alpha 
	message_end()

	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 35) 
	write_coord(vec1[1]+ 121 ) 
	write_coord(vec1[2] + 31)  
	write_short( sonicwave ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 35 ) // width 16 
	write_byte( 0 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b
	write_byte( 100 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(4.0, "gohanssj2_transstage_finish",id)

	return PLUGIN_HANDLED

}

public gohanssj2_transstage_finish(id)

{

	set_pdata_int(id, 199, 0)
	set_pdata_int(id, 301, 0, -89)
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
	set_user_godmode(id, 0)

	client_cmd(id, "cam_idealdist 40")

	message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
	write_byte( 140 );
	message_end( );

	remove_entity(aura2[id])

	set_user_health(id, get_user_health(id) + 20 )

	set_pdata_float(id, 460, get_pdata_float(id, 460) * 1.5 )

	GohanTransingSSJ2[id] = 0
	GohanSSJ2[id] = 1

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 142) 
	write_coord(vec1[1]+ 484 ) 
	write_coord(vec1[2] + 62) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 230 ) // r 
	write_byte( 129 ) // g 
	write_byte( 17 ) // b
	write_byte( 50 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 142) 
	write_coord(vec1[1]+ 484 ) 
	write_coord(vec1[2] + 62) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise
	write_byte( 230 ) // r 
	write_byte( 129 ) // g 
	write_byte( 17 ) // b
	write_byte( 50 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 142) 
	write_coord(vec1[1]+ 484 ) 
	write_coord(vec1[2] + 124)  
	write_short( sonicwave ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 0 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b
	write_byte( 50 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	new origin2[3]
	get_user_origin(id, origin2)
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] + 400)
	write_coord( origin2[1] + 400)
	write_coord( origin2[2] + 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] - 400)
	write_coord( origin2[1] + 400)
	write_coord( origin2[2] + 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] + 400)
	write_coord( origin2[1] - 400)
	write_coord( origin2[2] + 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] + 400)
	write_coord( origin2[1] + 400)
	write_coord( origin2[2] - 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] - 400)
	write_coord( origin2[1] - 400)
	write_coord( origin2[2] + 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] - 400)
	write_coord( origin2[1] + 400)
	write_coord( origin2[2] - 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] + 400)
	write_coord( origin2[1] - 400)
	write_coord( origin2[2] - 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] - 400)
	write_coord( origin2[1] - 400)
	write_coord( origin2[2] - 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] - 300)
	write_coord( origin2[1] - 300)
	write_coord( origin2[2] - 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] + 200)
	write_coord( origin2[1] - 200)
	write_coord( origin2[2] + 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 0 )
	write_coord( origin2[0] )
	write_coord( origin2[1] )
	write_coord( origin2[2] )
	write_coord( origin2[0] - 300)
	write_coord( origin2[1] + 500)
	write_coord( origin2[2] - 100)
	write_short( spr_Lightning )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 1 )
	write_byte( 5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 238 )
	write_byte( 47 )
	write_byte( 255 )
	write_byte( 95 )
	message_end()

	return PLUGIN_HANDLED

}

public trunksussj_transstage_init(id)

{

	set_pdata_int(id, 199, 1)
	set_pdata_int(id, 301, 1, -89 )
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );
	set_user_godmode(id, 1)

	BlastingFX[id] = 1

	client_cmd(id, "cam_idealdist 400" )

	aura2[id] = create_entity("env_model")
	new Float:Origin[3]
	new Float:AuraOrigin[3]
	pev(id, pev_origin, Origin)
	AuraOrigin[0] = Origin[0]
	AuraOrigin[1] = Origin[1]
	AuraOrigin[2] = Origin[2]

	entity_set_model(aura2[id], "models/evo/aura.mdl")
	entity_set_origin(aura2[id], AuraOrigin)
	entity_set_byte(aura2[id],EV_BYTE_controller1,125);
	entity_set_byte(aura2[id],EV_BYTE_controller2,125);
	entity_set_byte(aura2[id],EV_BYTE_controller3,125);
	entity_set_byte(aura2[id],EV_BYTE_controller4,125);
	entity_set_int(aura2[id], EV_INT_sequence, 0 );
	entity_set_int(aura2[id], EV_INT_skin, 4 );
	entity_set_float(aura2[id], EV_FL_framerate, 1.0 )

	set_rendering(aura2[id], kRenderFxGlowShell, 0, 0, 0, kRenderTransAdd, 55 )

	set_rendering(id, kRenderFxGlowShell, 255, 238, 95, kRenderNormal, 10 )

	set_task(2.0, "trunksussj_transstage_2",id)

	return PLUGIN_HANDLED

}

public trunksussj_transstage_2(id)

{

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 200) 
	write_coord(vec1[1] - 100) 
	write_coord(vec1[2] + 300) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 12 ) // life 2 
	write_byte( 100 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 238 ) // g 
	write_byte( 48 ) // b 
	write_byte( 155 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_rendering(id, kRenderFxNone, 0, 0, 0, kRenderNormal, 10 )

	set_task(0.5,"trunksussj_transstage_3",id)

	return PLUGIN_HANDLED

}

public trunksussj_transstage_3(id)

{

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 200) 
	write_coord(vec1[1] - 100) 
	write_coord(vec1[2] + 300) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 12 ) // life 2 
	write_byte( 100 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 238 ) // g 
	write_byte( 48 ) // b 
	write_byte( 10 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_rendering(id, kRenderFxGlowShell, 255, 238, 95, kRenderNormal, 10 )

	set_task(0.5,"trunksussj_transstage_4",id)

	return PLUGIN_HANDLED

}

public trunksussj_transstage_4(id)

{

	USSJtransing[id] = 1

	USSJFXWAIT[id] = 0

	set_rendering(id, kRenderFxNone, 0, 0, 0, kRenderNormal, 10 )

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 200) 
	write_coord(vec1[1] - 100) 
	write_coord(vec1[2] + 300) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 12 ) // life 2 
	write_byte( 100 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 238 ) // g 
	write_byte( 48 ) // b 
	write_byte( 10 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(0.5,"trunksussj_transstage_5",id)

	return PLUGIN_HANDLED

}

public trunksussj_transstage_5(id)

{

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 200) 
	write_coord(vec1[1] - 100) 
	write_coord(vec1[2] + 300) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 12 ) // life 2 
	write_byte( 100 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 238 ) // g 
	write_byte( 48 ) // b 
	write_byte( 10 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_rendering(id, kRenderFxGlowShell, 255, 238, 95, kRenderNormal, 10 )

	set_task(8.0,"trunksussj_transstage_finish",id)

	return PLUGIN_HANDLED

}

public trunksussj_transstage_finish(id)

{

	set_pdata_int(id, 199, 0)
	set_pdata_int(id, 301, 0, -89 )
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
	set_user_godmode(id, 0)

	message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
	write_byte( 170 );
	message_end( );

	set_user_health(id, get_user_health(id) + 50 )

	set_pdata_float(id, 460, get_pdata_float(id, 460) * 1.5 )
	set_pdata_float(id, 461, get_pdata_float(id, 460) * 1.5 )

	BlastingFX[id] = 0
	USSJtransing[id] = 0

	TrunksUSSJ[id] = 1

	client_cmd(id, "cam_idealdist 40" )

	remove_entity(aura2[id])

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 200) 
	write_coord(vec1[1] - 100) 
	write_coord(vec1[2] + 300) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 12 ) // life 2 
	write_byte( 100 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 238 ) // g 
	write_byte( 48 ) // b 
	write_byte( 255 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	return PLUGIN_HANDLED

}



	

public vegetaussj_transstage_init(id)

{

	set_pdata_int(id, 199, 1)
	set_pdata_int(id, 301, 1, -89 )
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );
	set_user_godmode(id, 1)

	client_cmd(id, "cam_idealdist 400")

	USSJtransing[id] = 1

	USSJFXWAIT[id] = 0

	aura2[id] = create_entity("env_model")
	new Float:Origin[3]
	new Float:AuraOrigin[3]
	pev(id, pev_origin, Origin)
	AuraOrigin[0] = Origin[0]
	AuraOrigin[1] = Origin[1]
	AuraOrigin[2] = Origin[2]

	emit_sound(id, CHAN_AUTO, "EvolutionSSJ4/vegeta/ussjtrans.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)


	entity_set_model(aura2[id], "models/evo/aura.mdl")
	entity_set_origin(aura2[id], AuraOrigin)
	entity_set_byte(aura2[id],EV_BYTE_controller1,125);
	entity_set_byte(aura2[id],EV_BYTE_controller2,125);
	entity_set_byte(aura2[id],EV_BYTE_controller3,125);
	entity_set_byte(aura2[id],EV_BYTE_controller4,125);
	entity_set_int(aura2[id], EV_INT_sequence, 0 );
	entity_set_int(aura2[id], EV_INT_skin, 4 );
	entity_set_float(aura2[id], EV_FL_framerate, 1.0 )

	set_rendering(aura2[id], kRenderFxGlowShell, 0, 0, 0, kRenderTransAdd, 55 )

	set_task(4.0,"vegetaussj_transstage_2",id)

	return PLUGIN_HANDLED

}

public vegetaussj_transstage_2(id)

{

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 200) 
	write_coord(vec1[1] - 100) 
	write_coord(vec1[2] + 300) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 12 ) // life 2 
	write_byte( 100 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 55 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(4.0,"vegetaussj_transstage_3",id)

	return PLUGIN_HANDLED
}

public vegetaussj_transstage_3(id)

{


	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 200) 
	write_coord(vec1[1] - 100) 
	write_coord(vec1[2] + 300) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 12 ) // life 2 
	write_byte( 100 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 55 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_rendering(aura2[id], kRenderFxNone, 0, 0, 0, kRenderTransAdd, 55 )

	set_task(8.0,"vegetaussj_transstage_4",id)

	return PLUGIN_HANDLED
}

public vegetaussj_transstage_4(id)

{

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 200) 
	write_coord(vec1[1] - 100) 
	write_coord(vec1[2] + 300) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 12 ) // life 2 
	write_byte( 100 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 55 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(4.0,"vegetaussj_transstage_5",id)

	return PLUGIN_HANDLED
}

public vegetaussj_transstage_5(id)

{

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 200) 
	write_coord(vec1[1] - 100) 
	write_coord(vec1[2] + 300) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 12 ) // life 2 
	write_byte( 100 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 55 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(6.0,"vegetaussj_transstage_finish",id)

	return PLUGIN_HANDLED
}

public vegetaussj_transstage_finish(id)

{

	set_pdata_int(id, 199, 0)
	set_pdata_int(id, 301, 0, -89)
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
	set_user_godmode(id, 0)

	message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
	write_byte( 170 );
	message_end( );

	remove_entity(aura2[id])

	set_user_health(id, get_user_health(id) + 50 )

	set_pdata_int(id, 460, get_pdata_int(id, 460) * 3 )
//	set_pdata_int(id, 461, get_pdata_int(id, 460) * 3 )

	USSJtransing[id] = 0

	VegetaUSSJ[id] = 1

	client_cmd(id, "cam_idealdist 40")

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 200) 
	write_coord(vec1[1] - 100) 
	write_coord(vec1[2] + 300) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 12 ) // life 2 
	write_byte( 100 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 155 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 200) 
	write_coord(vec1[1] - 100) 
	write_coord(vec1[2] + 300) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 12 ) // life 2 
	write_byte( 100 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 255 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	return PLUGIN_HANDLED
}




public vegetassj2_transstage_init(id)

{

	set_pdata_int(id, 199, 1)
	set_pdata_int(id, 301, 1, -89 )
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );
	set_user_godmode(id, 1)

	SSJ2transing[id] = 1

	SSJ2FXWAIT[id] = 0

	AFXWAIT[id] = 0

	client_cmd(id, "cam_idealdist 400")

	emit_sound(id, CHAN_AUTO, "EvolutionSSJ4/vegeta/ssj2trans.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)


	message_begin( MSG_BROADCAST, get_user_msgid( "Powerup" ) );
	write_byte( id );
	write_byte( 255 );
	write_byte( 215 );
	write_byte( 0 );
	message_end( );

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	src[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 
	dest[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	dest[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );

	set_task(1.0,"vegetassj2_transstage_2",id)

	return PLUGIN_HANDLED

}

public vegetassj2_transstage_2(id)

{


	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	src[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 
	dest[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	dest[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(3.0,"vegetassj2_transstage_3",id)

	return PLUGIN_HANDLED

}

public vegetassj2_transstage_3(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	src[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 
	dest[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	dest[2] = random_num( origin[2] - 15, origin[2] + 15 );      // ''

	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );


	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(3.0,"vegetassj2_transstage_4",id)

	return PLUGIN_HANDLED

}

public vegetassj2_transstage_4(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	src[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 
	dest[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	dest[2] = random_num( origin[2] - 15, origin[2] + 15 );      // ''

	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 142) 
	write_coord(vec1[1]+ 484 ) 
	write_coord(vec1[2] + 124) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 50 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(2.0,"vegetassj2_transstage_5",id)

	return PLUGIN_HANDLED

}

public vegetassj2_transstage_5(id)

{

	client_cmd(id, "turbo")


	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	src[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 
	dest[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	dest[2] = random_num( origin[2] - 15, origin[2] + 15 );      // ''

	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );


	aura2[id] = create_entity("env_model")
	new Float:Origin[3]
	new Float:AuraOrigin[3]
	pev(id, pev_origin, Origin)
	AuraOrigin[0] = Origin[0]
	AuraOrigin[1] = Origin[1]
	AuraOrigin[2] = Origin[2]


	entity_set_model(aura2[id], "models/evo/aura.mdl")
	entity_set_origin(aura2[id], AuraOrigin)
	entity_set_byte(aura2[id],EV_BYTE_controller1,125);
	entity_set_byte(aura2[id],EV_BYTE_controller2,125);
	entity_set_byte(aura2[id],EV_BYTE_controller3,125);
	entity_set_byte(aura2[id],EV_BYTE_controller4,125);
	entity_set_int(aura2[id], EV_INT_sequence, 0 );
	entity_set_int(aura2[id], EV_INT_skin, 4 );
	entity_set_float(aura2[id], EV_FL_framerate, 1.0 )

	set_rendering(aura2[id], kRenderFxNone, 0, 0, 0, kRenderTransAdd, 55 )

	set_task(2.0,"vegetassj2_transstage_6",id)

	return PLUGIN_HANDLED

}

public vegetassj2_transstage_6(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	src[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 
	dest[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	dest[2] = random_num( origin[2] - 15, origin[2] + 15 );      // ''

	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(2.0, "vegetassj2_transstage_7",id)

	return PLUGIN_HANDLED

}

public vegetassj2_transstage_7(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	src[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 
	dest[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
	dest[2] = random_num( origin[2] - 15, origin[2] + 15 );      // ''

	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task(1.0, "vegetassj2_transstage_finish",id)

	return PLUGIN_HANDLED

}

public vegetassj2_transstage_finish(id)

{

	VegetaSSJ2[id] = 1

	set_pdata_int(id, 199, 0)
	set_pdata_int(id, 301, 0, -89)
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
	set_user_godmode(id, 0)

	message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
	write_byte( 150 );
	message_end( );

	message_begin( MSG_BROADCAST, get_user_msgid( "StopPowerup" ) );
	write_byte( id );
	message_end( );

	SSJ2transing[id] = 0

	client_cmd(id, "turbo")

	client_cmd(id, "cam_idealdist 40")

	remove_entity( aura2[id] )

	aura2[id] = 0

	set_user_health(id, get_user_health(id) + 30 )

	set_pdata_float(id, 460, get_pdata_float(id, 460) * 1.5 )
//	set_pdata_float(id, 461, get_pdata_float(id, 460) * 1.5 )

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 57, origin[0] + 57 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 57, origin[1] + 57 );      // '' 
	src[2] = random_num( origin[2] - 55, origin[2] + 55 );      // '' 
	dest[0] = random_num( origin[0] - 57, origin[0] + 57 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 57, origin[1] + 57 );      // '' 
	dest[2] = random_num( origin[2] - 55, origin[2] + 55 );      // ''

	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 255, 255, 200, 200 );

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise 
	write_byte( 230 ) // r 
	write_byte( 129 ) // g 
	write_byte( 17 ) // b
	write_byte( 50 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 6) 
	write_coord(vec1[1]+ 600) 
	write_coord(vec1[2] + 600) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 5 ) // noise
	write_byte( 230 ) // r 
	write_byte( 129 ) // g 
	write_byte( 17 ) // b
	write_byte( 50 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 8) 
	write_coord(vec1[1]+ 800) 
	write_coord(vec1[2] + 800) 
	write_short( sonicwave ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 128 ) // width 16 
	write_byte( 0 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 255 ) // g 
	write_byte( 255 ) // b
	write_byte( 50 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	return PLUGIN_HANDLED

}

public vegetamajin_transstage_init(id)

{

	set_pdata_int(id, 199, 1)
	set_pdata_int(id, 301, 1, -89 )
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );
	set_user_godmode(id, 1)

	MAJINFXWAIT[id] = 0

	AFXWAIT[id] = 1

	SSJ2transing[id] = 0

	emit_sound(id, CHAN_AUTO, "EvolutionSSJ4/vegeta/majintrans.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

	message_begin( MSG_BROADCAST, get_user_msgid( "Powerup" ) );
	write_byte( id );
	write_byte( 255 );
	write_byte( 35 );
	write_byte( 0 );
	message_end( );

	MAJINtransing[id] = 1

	client_cmd(id, "cam_idealdist 400" )


	set_task(5.0, "vegetamajin_transstage_1",id)

	return PLUGIN_HANDLED

}

public vegetamajin_transstage_1(id)

{

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 196 ) // width 16 
	write_byte( 10 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 48 ) // g 
	write_byte( 48 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task( 5.0, "vegetamajin_transstage_2",id)

	return PLUGIN_HANDLED

}

public vegetamajin_transstage_2(id)

{

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 196 ) // width 16 
	write_byte( 10 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 48 ) // g 
	write_byte( 48 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task( 5.0, "vegetamajin_transstage_3",id)

	return PLUGIN_HANDLED

}

public vegetamajin_transstage_3(id)

{

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 196 ) // width 16 
	write_byte( 10 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 48 ) // g 
	write_byte( 48 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task( 5.0, "vegetamajin_transstage_4",id)

	return PLUGIN_HANDLED

}

public vegetamajin_transstage_4(id)

{

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 196 ) // width 16 
	write_byte( 10 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 48 ) // g 
	write_byte( 48 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task( 5.0, "vegetamajin_transstage_5",id)

	return PLUGIN_HANDLED

}

public vegetamajin_transstage_5(id)

{

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 196 ) // width 16 
	write_byte( 10 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 48 ) // g 
	write_byte( 48 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task( 5.0, "vegetamajin_transstage_6",id)

	return PLUGIN_HANDLED

}

public vegetamajin_transstage_6(id)

{

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 142) 
	write_coord(vec1[1]+ 484 ) 
	write_coord(vec1[2] + 124) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 196 ) // width 16 
	write_byte( 10 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 48 ) // g 
	write_byte( 48 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	aura2[id] = create_entity("env_model")
	new Float:Origin[3]
	new Float:AuraOrigin[3]
	pev(id, pev_origin, Origin)
	AuraOrigin[0] = Origin[0]
	AuraOrigin[1] = Origin[1]
	AuraOrigin[2] = Origin[2]


	entity_set_model(aura2[id], "models/evo/aura.mdl")
	entity_set_origin(aura2[id], AuraOrigin)
	entity_set_byte(aura2[id],EV_BYTE_controller1,125);
	entity_set_byte(aura2[id],EV_BYTE_controller2,125);
	entity_set_byte(aura2[id],EV_BYTE_controller3,125);
	entity_set_byte(aura2[id],EV_BYTE_controller4,125);
	entity_set_int(aura2[id], EV_INT_sequence, 0 );
	entity_set_int(aura2[id], EV_INT_skin, 3 );
	entity_set_float(aura2[id], EV_FL_framerate, 1.0 )

	set_rendering(aura2[id], kRenderFxHologram, 0, 0, 0, kRenderTransAdd, 10 )

	set_task( 5.0, "vegetamajin_transstage_7",id)

	return PLUGIN_HANDLED

}

public vegetamajin_transstage_7(id)

{

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 196 ) // width 16 
	write_byte( 10 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 48 ) // g 
	write_byte( 48 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task( 5.0, "vegetamajin_transstage_8",id)

	return PLUGIN_HANDLED

}

public vegetamajin_transstage_8(id)

{

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 196 ) // width 16 
	write_byte( 10 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 48 ) // g 
	write_byte( 48 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	set_task( 5.0, "vegetamajin_transstage_finish",id)

	return PLUGIN_HANDLED

}
	

public vegetamajin_transstage_finish(id)

{

	VegetaSSJ2[id] = 0
	VegetaMAJIN[id] = 1

	MAJINtransing[id] = 0

	new vec1[3]
	get_user_origin(id,vec1)
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 196 ) // width 16 
	write_byte( 10 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 48 ) // g 
	write_byte( 48 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 6) 
	write_coord(vec1[1]+ 600) 
	write_coord(vec1[2] + 600) 
	write_short( lightning ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 196 ) // width 16 
	write_byte( 10 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 48 ) // g 
	write_byte( 48 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
	write_byte( 19 ) 
	write_coord(vec1[0]) 
	write_coord(vec1[1]) 
	write_coord(vec1[2]) 
	write_coord(vec1[0] + 5) 
	write_coord(vec1[1]+ 500) 
	write_coord(vec1[2] + 500) 
	write_short( sonicwave ) 
	write_byte( 0 ) // startframe 
	write_byte( 0 ) // framerate 
	write_byte( 24 ) // life 2 
	write_byte( 196 ) // width 16 
	write_byte( 0 ) // noise 
	write_byte( 255 ) // r 
	write_byte( 48 ) // g 
	write_byte( 48 ) // b 
	write_byte( 25 ) //brightness 
	write_byte( 0 ) // speed 
	message_end()

	message_begin( MSG_BROADCAST, get_user_msgid( "StopPowerup" ) );
	write_byte( id );
	message_end( );

	client_cmd(id, "cam_idealdist 40")

	remove_entity( aura2[id] )

	set_user_health(id, get_user_health(id) + 20 )

	set_pdata_float(id, 460, get_pdata_float(id, 460) * 1.5 )
//	set_pdata_float(id, 461, get_pdata_float(id, 460) * 1.5 )

	message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
	write_byte( 170 );
	message_end( );

	set_pdata_int(id, 199, 0)
	set_pdata_int(id, 301, 0, -89)
	entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
	set_user_godmode(id, 0)

	return PLUGIN_HANDLED

}




//----------------------------------------------------



public ssj4_goku(id)

{

if ( avatars[id] !=0 )

{

return PLUGIN_HANDLED

}

if( SSJ4TransPerfect[id] !=0 )

{

set_task(0.1,"ssj4_transstage_perfect",id)

return PLUGIN_HANDLED

}

else

{

SSJ4transing[id] = 1
ascend[id] = 1
istransing[id] = 1
SSJ4TransPerfect[id] = 1

engclient_cmd(id,"turbo")
set_pdata_int(id, 199, 1)
set_pdata_int(id, 301, 1, -89 )
entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );
set_user_godmode(id, 1)
message_begin( MSG_BROADCAST, get_user_msgid( "Powerup" ) );
write_byte( id );
write_byte( 255 );
write_byte( 48 );
write_byte( 48 );
message_end( );
client_cmd(id,"cam_idealdist 400")

emit_sound(id, CHAN_AUTO, "EvolutionSSJ4/gokussj4/ssj4trans.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

moon[id] = create_entity("info_target")
entity_set_model(moon[id], "models/evo/Moon.mdl")

new Float:Origin[3]
new Float:MoonOrigin[3]
pev(id, pev_origin, Origin)
MoonOrigin[0] = Origin[0]
MoonOrigin[1] = Origin[1]
MoonOrigin[2] = Origin[2] + 600

engfunc(EngFunc_SetOrigin, moon[id], MoonOrigin)

new Float:Min[3] = {-4.0, -4.0, -1.0}
new Float:Max[3] = {4.0, 4.0, 12.0}

engfunc(EngFunc_SetSize, moon[id], Min, Max )

set_rendering(moon[id], kRenderFxGlowShell, 255, 255, 255, kRenderFxNone, 1)

set_task(0.5,"ssj4_transstage_1", id)

}

return PLUGIN_CONTINUE

}

public ssj4_transstage_1(id)

{



new src[3], dest[3], origin[3]; 

//Get our origin 
get_user_origin( id, origin ); 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 40, 255, 48, 48, 255, 200 );

set_task(1.0, "ssj4_transstage_2",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_2(id)

{

new Vector[3]
get_user_origin(id, Vector)
message_begin( MSG_BROADCAST, SVC_TEMPENTITY, Vector )
write_byte( 7 )
write_coord( Vector[0] )
write_coord( Vector[1] )
write_coord( Vector[2] )
write_coord( Vector[0] + 100 )
write_coord( Vector[1] )
write_coord( Vector[2] + 100 )
write_byte( 10 )
write_byte( 100 )
write_byte( 10 )
write_short( lightning )
message_end()
message_begin( MSG_BROADCAST, SVC_TEMPENTITY, Vector )
write_byte( 7 )
write_coord( Vector[0] )
write_coord( Vector[1] )
write_coord( Vector[2] )
write_coord( Vector[0] - 100 )
write_coord( Vector[1] )
write_coord( Vector[2] + 100 )
write_byte( 10 )
write_byte( 100 )
write_byte( 10 )
write_short( lightning )
message_end()
message_begin( MSG_BROADCAST, SVC_TEMPENTITY, Vector )
write_byte( 7 )
write_coord( Vector[0] )
write_coord( Vector[1] )
write_coord( Vector[2] )
write_coord( Vector[0] + 100 )
write_coord( Vector[1] )
write_coord( Vector[2] - 100 )
write_byte( 10 )
write_byte( 100 )
write_byte( 10 )
write_short( lightning )
message_end()
message_begin( MSG_BROADCAST, SVC_TEMPENTITY, Vector )
write_byte( 7 )
write_coord( Vector[0] )
write_coord( Vector[1] )
write_coord( Vector[2] )
write_coord( Vector[0] - 100 )
write_coord( Vector[1] )
write_coord( Vector[2] - 100 )
write_byte( 10 )
write_byte( 100 )
write_byte( 10 )
write_short( lightning )
message_end()

new src[3], dest[3], origin[3]; 

//Get our origin 
get_user_origin( id, origin ); 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 40, 255, 48, 48, 255, 200 );

set_task(2.0,"ssj4_transstage_3",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_3(id)

{

new vec1[3]
get_user_origin(id, vec1)

message_begin( MSG_BROADCAST, SVC_TEMPENTITY, vec1 )
write_byte( 21 )
write_short( sonicwave )
write_coord( vec1[0] )
write_coord( vec1[1] )
write_coord( vec1[2] )
write_coord( vec1[0] )
write_coord( vec1[1] )
write_coord( vec1[2] + 15 )
write_byte( 0 )
write_byte( 0 )
write_byte( 10 )
write_byte( 5.0 )
write_byte( 0 )
write_byte( 255 )
write_byte( 48 )
write_byte( 48 )
write_byte( 155 )
write_byte( 0 )
message_end()
message_begin( MSG_BROADCAST, SVC_TEMPENTITY, vec1 )
write_byte( 21 )
write_short( sonicwave )
write_coord( vec1[0] )
write_coord( vec1[1] )
write_coord( vec1[2] )
write_coord( vec1[0] )
write_coord( vec1[1] )
write_coord( vec1[2] + 25 )
write_byte( 0 )
write_byte( 0 )
write_byte( 10 )
write_byte( 5.0 )
write_byte( 0 )
write_byte( 255 )
write_byte( 48 )
write_byte( 48 )
write_byte( 155 )
write_byte( 0 )
message_end()
message_begin( MSG_BROADCAST, SVC_TEMPENTITY, vec1 )
write_byte( 21 )
write_short( sonicwave )
write_coord( vec1[0] )
write_coord( vec1[1] )
write_coord( vec1[2] )
write_coord( vec1[0] )
write_coord( vec1[1] )
write_coord( vec1[2] + 35 )
write_byte( 0 )
write_byte( 0 )
write_byte( 10 )
write_byte( 5.0 )
write_byte( 0 )
write_byte( 255 )
write_byte( 48 )
write_byte( 48 )
write_byte( 155 )
write_byte( 0 )
message_end()
message_begin( MSG_BROADCAST, SVC_TEMPENTITY, vec1 )
write_byte( 21 )
write_short( sonicwave )
write_coord( vec1[0] )
write_coord( vec1[1] )
write_coord( vec1[2] )
write_coord( vec1[0] )
write_coord( vec1[1] )
write_coord( vec1[2] + 45 )
write_byte( 0 )
write_byte( 0 )
write_byte( 10 )
write_byte( 5.0 )
write_byte( 0 )
write_byte( 255 )
write_byte( 48 )
write_byte( 48 )
write_byte( 155 )
write_byte( 0 )
message_end()

message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
write_byte( 21 ) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 20) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 2000) 
write_short( lightning ) 
write_byte( 0 ) // startframe 
write_byte( 0 ) // framerate 
write_byte( 24 ) // life 2 
write_byte( 256 ) // width 16 
write_byte( 0 ) // noise 
write_byte( 255 ) // r 
write_byte( 48 ) // g 
write_byte( 48 ) // b 
write_byte( 200 ) //brightness 
write_byte( 0 ) // speed 
message_end()

new src[3], dest[3], origin[3]; 

//Get our origin 
get_user_origin( id, origin ); 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 40, 255, 48, 48, 255, 200 );

set_task(3.0,"ssj4_transstage_4",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_4(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] + 10)
write_short(lightning)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] - 10)
write_short(lightning)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 10)
write_coord(origin[1])
write_coord(origin[2])
write_short(lightning)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 10)
write_coord(origin[1])
write_coord(origin[2])
write_short(lightning)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 10)
write_coord(origin[2])
write_short(lightning)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 10)
write_coord(origin[2])
write_short(lightning)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 5)
write_coord(origin[2] + 5)
write_short(lightning)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 5)
write_coord(origin[2] - 5)
write_short(lightning)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 5)
write_coord(origin[2] + 5)
write_short(lightning)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 5)
write_coord(origin[2] - 5)
write_short(lightning)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 5)
write_coord(origin[1])
write_coord(origin[2] + 5)
write_short(lightning)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 5)
write_coord(origin[1])
write_coord(origin[2] + 5)
write_short(lightning)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 5)
write_coord(origin[1])
write_coord(origin[2] - 5)
write_short(lightning)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 5)
write_coord(origin[1])
write_coord(origin[2] - 5)
write_short(lightning)
write_byte(15)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 
get_user_origin( id, origin ); 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 40, 255, 48, 48, 255, 200 );

set_task(2.5,"ssj4_transstage_5",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_5(id)

{
oozaru[id] = create_entity("info_target")

new Float:Origin[3]
pev(id, pev_origin, Origin)
engfunc(EngFunc_SetOrigin, oozaru[id], Origin)

new Float:Min[3] = {-42.0, -42.0, -128.0}
new Float:Max[3] = {42.0, 42.0, 128.0}

engfunc(EngFunc_SetSize, oozaru[id], Min, Max )

entity_set_model(oozaru[id],"models/player/oozaru/oozaru.mdl")
entity_set_int(oozaru[id], EV_INT_sequence, 25 )
entity_set_float(oozaru[id], EV_FL_frame, 0.0 )
entity_set_float(oozaru[id], EV_FL_framerate, 1.0 )

entity_set_byte(oozaru[id],EV_BYTE_controller1,125);
entity_set_byte(oozaru[id],EV_BYTE_controller2,125);
entity_set_byte(oozaru[id],EV_BYTE_controller3,125);
entity_set_byte(oozaru[id],EV_BYTE_controller4,125);

new Float:angles[3]
entity_get_vector(id, EV_VEC_angles, angles)

entity_set_vector(oozaru[id], EV_VEC_angles, angles)

entity_set_int(oozaru[id], EV_INT_fixangle,1)

set_task(5.0,"ssj4_transstage_6",id)

emit_sound(id, CHAN_AUTO, "EvolutionSSJ4/gokussj4/ssj4trans2.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

return PLUGIN_CONTINUE

}

public ssj4_transstage_6(id)

{


new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] + 40)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] - 40)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 40)
write_coord(origin[1])
write_coord(origin[2])
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 40)
write_coord(origin[1])
write_coord(origin[2])
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 40)
write_coord(origin[2])
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 40)
write_coord(origin[2])
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 25)
write_coord(origin[2] + 25)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 25)
write_coord(origin[2] - 25)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 25)
write_coord(origin[2] + 25)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 25)
write_coord(origin[2] - 25)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 25)
write_coord(origin[1])
write_coord(origin[2] + 25)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 25)
write_coord(origin[1])
write_coord(origin[2] + 25)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 25)
write_coord(origin[1])
write_coord(origin[2] - 25)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 25)
write_coord(origin[1])
write_coord(origin[2] - 25)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] + 55)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] - 55)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 55)
write_coord(origin[1])
write_coord(origin[2])
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 55)
write_coord(origin[1])
write_coord(origin[2])
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 55)
write_coord(origin[2])
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 55)
write_coord(origin[2])
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 35)
write_coord(origin[2] + 35)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 35)
write_coord(origin[2] - 35)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 35)
write_coord(origin[2] + 35)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 35)
write_coord(origin[2] - 35)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 35)
write_coord(origin[1])
write_coord(origin[2] + 35)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 35)
write_coord(origin[1])
write_coord(origin[2] + 35)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 35)
write_coord(origin[1])
write_coord(origin[2] - 35)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 35)
write_coord(origin[1])
write_coord(origin[2] - 35)
write_short(lightning)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] + 70)
write_short(lightning)
write_byte(25)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] - 70)
write_short(lightning)
write_byte(25)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 70)
write_coord(origin[1])
write_coord(origin[2])
write_short(lightning)
write_byte(25)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 70)
write_coord(origin[1])
write_coord(origin[2])
write_short(lightning)
write_byte(25)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 70)
write_coord(origin[2])
write_short(lightning)
write_byte(25)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 70)
write_coord(origin[2])
write_short(lightning)
write_byte(25)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 55)
write_coord(origin[2] + 55)
write_short(lightning)
write_byte(25)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 55)
write_coord(origin[2] - 55)
write_short(lightning)
write_byte(25)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 55)
write_coord(origin[2] + 55)
write_short(lightning)
write_byte(25)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 55)
write_coord(origin[2] - 55)
write_short(lightning)
write_byte(25)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 55)
write_coord(origin[1])
write_coord(origin[2] + 55)
write_short(lightning)
write_byte(25)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 55)
write_coord(origin[1])
write_coord(origin[2] + 55)
write_short(lightning)
write_byte(25)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 55)
write_coord(origin[1])
write_coord(origin[2] - 55)
write_short(lightning)
write_byte(25)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 55)
write_coord(origin[1])
write_coord(origin[2] - 55)
write_short(lightning)
write_byte(25)
write_byte(255)
message_end()

new idx[1];
idx[0]=id;
new vec2[3];
get_user_origin(id,vec2,1);
vec2[2]-=16;
message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
write_byte( 14 );
write_coord(vec2[0]);
write_coord(vec2[1]);
write_coord(vec2[2]);
write_byte( 1500 );
write_byte( 1000 );
write_byte( 20 ); 
message_end();
message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
write_byte( 14 );
write_coord(vec2[0]);
write_coord(vec2[1]);
write_coord(vec2[2]);
write_byte( 1500 );
write_byte( 1000 );
write_byte( 20 ); 
message_end();
message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
write_byte( 14 );
write_coord(vec2[0]);
write_coord(vec2[1]);
write_coord(vec2[2]);
write_byte( 1500 );
write_byte( 1000 );
write_byte( 20 ); 
message_end();
message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
write_byte( 14 );
write_coord(vec2[0]);
write_coord(vec2[1]);
write_coord(vec2[2]);
write_byte( 1500 );
write_byte( 1000 );
write_byte( 20 ); 
message_end();
message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
write_byte( 14 );
write_coord(vec2[0]);
write_coord(vec2[1]);
write_coord(vec2[2]);
write_byte( 1500 );
write_byte( 1000 );
write_byte( 20 ); 
message_end();
message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
write_byte( 27 );
write_coord(vec2[0]);
write_coord(vec2[1]);
write_coord(vec2[2]);
write_byte( 100 ); // radius	
write_byte( 150 ); // count
write_byte( 150 ); // count
write_byte( 255 ); // count
write_byte( 10000 ); // radius
write_byte( 20 ); // radius
write_byte( 20); // radius
message_end();

new vec1[3]
get_user_origin(id, vec1)
message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
write_byte( 21 ) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 100) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 1936) 
write_short( lightning ) 
write_byte( 0 ) // startframe 
write_byte( 0 ) // framerate 
write_byte( 24 ) // life 2
write_byte( 32 ) // width 16 
write_byte( 0 ) // noise 
write_byte( 188 ) // r 
write_byte( 220 ) // g 
write_byte( 255 ) // b 
write_byte( 255 ) //brightness 
write_byte( 0 ) // speed 
message_end()
message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
write_byte( 21 ) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 50) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 1936) 
write_short( lightning ) 
write_byte( 0 ) // startframe 
write_byte( 0 ) // framerate 
write_byte( 24 ) // life 2
write_byte( 64 ) // width 16 
write_byte( 0 ) // noise 
write_byte( 188 ) // r 
write_byte( 220 ) // g 
write_byte( 255 ) // b 
write_byte( 255 ) //brightness 
write_byte( 0 ) // speed 
message_end()
message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
write_byte( 21 ) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2]) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 1936) 
write_short( lightning ) 
write_byte( 0 ) // startframe 
write_byte( 0 ) // framerate 
write_byte( 24 ) // life 2
write_byte( 128 ) // width 16 
write_byte( 0 ) // noise 
write_byte( 188 ) // r 
write_byte( 220 ) // g 
write_byte( 255 ) // b 
write_byte( 255 ) //brightness 
write_byte( 0 ) // speed 
message_end()
message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
write_byte( 21 ) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] - 100) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 1936) 
write_short( lightning ) 
write_byte( 0 ) // startframe 
write_byte( 0 ) // framerate 
write_byte( 24 ) // life 2
write_byte( 256 ) // width 16 
write_byte( 0 ) // noise 
write_byte( 188 ) // r 
write_byte( 220 ) // g 
write_byte( 255 ) // b 
write_byte( 255 ) //brightness 
write_byte( 0 ) // speed 
message_end()
message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
write_byte( 21 ) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] - 200) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 1936) 
write_short( fire ) 
write_byte( 0 ) // startframe 
write_byte( 0 ) // framerate 
write_byte( 24 ) // life 2
write_byte( 512 ) // width 16 
write_byte( 0 ) // noise 
write_byte( 188 ) // r 
write_byte( 220 ) // g 
write_byte( 255 ) // b 
write_byte( 255 ) //brightness 
write_byte( 0 ) // speed 
message_end()
message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
write_byte( 21 ) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] - 300) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 1936) 
write_short( lightning ) 
write_byte( 0 ) // startframe 
write_byte( 0 ) // framerate 
write_byte( 24 ) // life 2
write_byte( 1024 ) // width 16 
write_byte( 0 ) // noise 
write_byte( 188 ) // r 
write_byte( 220 ) // g 
write_byte( 255 ) // b 
write_byte( 255 ) //brightness 
write_byte( 0 ) // speed 
message_end()

new src[3], dest[3]; 

//Get our origin 
get_user_origin( id, origin ); 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 40, 255, 48, 48, 255, 200 );

set_task(0.1,"ssj4_transstage_7",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_7(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_8",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_8(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_9",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_9(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

entity_set_model(oozaru[id],"models/player/goozaru/goozaru.mdl")

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_10",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_10(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_11",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_11(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_12",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_12(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_13",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_13(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_14",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_14(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_15",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_15(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_16",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_16(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_17",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_17(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_18",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_18(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_19",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_19(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_20",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_20(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_21",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_21(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_22",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_22(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_23",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_23(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_24",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_24(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_25",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_25(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_26",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_26(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_27",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_27(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_28",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_28(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_29",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_29(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_30",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_30(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_31",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_31(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_32",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_32(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_33",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_33(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_34",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_34(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_35",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_35(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_36",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_36(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transfire)
write_byte(85)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_37",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_37(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transfire)
write_byte(85)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_38",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_38(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transfire)
write_byte(85)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_39",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_39(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transfire)
write_byte(85)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_40",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_40(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transfire)
write_byte(85)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_41",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_41(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transfire)
write_byte(85)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_42",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_42(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transfire)
write_byte(85)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_43",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_43(id)

{

new origin[3]
get_user_origin(id, origin)

remove_entity(oozaru[id])

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_44",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_44(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_45",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_45(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_46",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_46(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_47",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_47(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_48",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_48(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_49",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_49(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2])
write_short(transball)
write_byte(25)
write_byte(255)
message_end()

new src[3], dest[3]; 

//Get our origin 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
src[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
src[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 
dest[0] = random_num( origin[0] - 250, origin[0] + 250 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 250, origin[1] + 250 );      // '' 
dest[2] = random_num( origin[2] - 230, origin[2] + 230 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 40, 48, 48, 255, 255, 200 );

set_task(0.1,"ssj4_transstage_50",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_50(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] + 10)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] - 10)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 10)
write_coord(origin[1])
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 10)
write_coord(origin[1])
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 10)
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 10)
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 5)
write_coord(origin[2] + 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 5)
write_coord(origin[2] - 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 5)
write_coord(origin[2] + 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 5)
write_coord(origin[2] - 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 5)
write_coord(origin[1])
write_coord(origin[2] + 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 5)
write_coord(origin[1])
write_coord(origin[2] + 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 5)
write_coord(origin[1])
write_coord(origin[2] - 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 5)
write_coord(origin[1])
write_coord(origin[2] - 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] + 25)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] - 25)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 25)
write_coord(origin[1])
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 25)
write_coord(origin[1])
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 25)
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 25)
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 20)
write_coord(origin[2] + 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 20)
write_coord(origin[2] - 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 20)
write_coord(origin[2] + 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 20)
write_coord(origin[2] - 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 20)
write_coord(origin[1])
write_coord(origin[2] + 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 20)
write_coord(origin[1])
write_coord(origin[2] + 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 20)
write_coord(origin[1])
write_coord(origin[2] - 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 20)
write_coord(origin[1])
write_coord(origin[2] - 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] + 40)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] - 40)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 40)
write_coord(origin[1])
write_coord(origin[2])
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 40)
write_coord(origin[1])
write_coord(origin[2])
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 40)
write_coord(origin[2])
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 40)
write_coord(origin[2])
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 25)
write_coord(origin[2] + 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 25)
write_coord(origin[2] - 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 25)
write_coord(origin[2] + 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 25)
write_coord(origin[2] - 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 25)
write_coord(origin[1])
write_coord(origin[2] + 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 25)
write_coord(origin[1])
write_coord(origin[2] + 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 25)
write_coord(origin[1])
write_coord(origin[2] - 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 25)
write_coord(origin[1])
write_coord(origin[2] - 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()

set_task(0.5,"ssj4_transstage_51",id)

return PLUGIN_HANDLED

}


public ssj4_transstage_51(id)

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] + 10)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] - 10)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 10)
write_coord(origin[1])
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 10)
write_coord(origin[1])
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 10)
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 10)
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 5)
write_coord(origin[2] + 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 5)
write_coord(origin[2] - 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 5)
write_coord(origin[2] + 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 5)
write_coord(origin[2] - 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 5)
write_coord(origin[1])
write_coord(origin[2] + 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 5)
write_coord(origin[1])
write_coord(origin[2] + 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 5)
write_coord(origin[1])
write_coord(origin[2] - 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 5)
write_coord(origin[1])
write_coord(origin[2] - 5)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] + 25)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] - 25)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 25)
write_coord(origin[1])
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 25)
write_coord(origin[1])
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 25)
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 25)
write_coord(origin[2])
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 20)
write_coord(origin[2] + 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 20)
write_coord(origin[2] - 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 20)
write_coord(origin[2] + 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 20)
write_coord(origin[2] - 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 20)
write_coord(origin[1])
write_coord(origin[2] + 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 20)
write_coord(origin[1])
write_coord(origin[2] + 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 20)
write_coord(origin[1])
write_coord(origin[2] - 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 20)
write_coord(origin[1])
write_coord(origin[2] - 20)
write_short(ballsmoke)
write_byte(15)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] + 40)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1])
write_coord(origin[2] - 40)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 40)
write_coord(origin[1])
write_coord(origin[2])
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 40)
write_coord(origin[1])
write_coord(origin[2])
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 40)
write_coord(origin[2])
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 40)
write_coord(origin[2])
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 25)
write_coord(origin[2] + 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] + 25)
write_coord(origin[2] - 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 25)
write_coord(origin[2] + 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0])
write_coord(origin[1] - 25)
write_coord(origin[2] - 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 25)
write_coord(origin[1])
write_coord(origin[2] + 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 25)
write_coord(origin[1])
write_coord(origin[2] + 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] + 25)
write_coord(origin[1])
write_coord(origin[2] - 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()
message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
write_byte(17)
write_coord(origin[0] - 25)
write_coord(origin[1])
write_coord(origin[2] - 25)
write_short(ballsmoke)
write_byte(20)
write_byte(255)
message_end()

set_task(0.5,"ssj4_transstage_52",id)

return PLUGIN_HANDLED

}


public ssj4_transstage_52(id)

{

SSJ4transing[id] = 0
remove_entity(moon[id])
set_task(0.1,"finalize",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_perfect(id)

{

emit_sound(id, CHAN_AUTO, "EvolutionSSJ4/gokussj4/ssj4transperfect.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

engclient_cmd(id, "turbo")

set_pdata_int(id, 199, 1)

message_begin(MSG_ONE,get_user_msgid("ScreenFade"),{0,0,0},id) 
write_short(1000) // fade lasts this long duration 
write_short(1000) // fade lasts this long hold time 
write_short(1<<12) // fade type (in / out) 
write_byte(255) // fade red 
write_byte(48) // fade green 
write_byte(48) // fade blue 
write_byte(150) // fade alpha 
message_end()

set_task(1.0,"ssj4_transstage_perfect_fin",id)

return PLUGIN_HANDLED

}

public ssj4_transstage_perfect_fin(id)

{

set_pdata_int(id, 199, 0)

set_task(0.1,"finalize",id)

return PLUGIN_HANDLED

}


public finalize(id, msgid, dest, pEnt)

{


avatars[id] = 1

emit_sound(id, CHAN_AUTO, "EvolutionSSJ4/gokussj4/ssj4sentence.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

set_pdata_int(id, 459, 1400 )
set_pdata_int(id, 462, 400 )
entity_set_float(id, EV_FL_fuser1, 1400.0 )

istransing[id] == 0

engclient_cmd(id, "turbo")

set_task( 0.1, "ssj4_task", id, _, _, "b")

set_pdata_int(id, 199, 0)
set_pdata_int(id, 301, 0, -89)
entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
set_user_godmode(id, 0)	

message_begin( MSG_BROADCAST, get_user_msgid( "StopPowerup" ) );
write_byte( id );
message_end( );

strip_user_weapons(id)

give_item(id, "weapon_melee")
give_item(id, "weapon_kiblast")
give_item(id, "weapon_genericbeam")
give_item(id, "weapon_kamehameha")
give_item(id, "weapon_solarflare")
give_item(id, "weapon_kametorpedo")
give_item(id, "weapon_sensu")

set_user_godmode(id, 0)

message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
write_byte( 190 );
message_end( );

set_user_health(id, get_user_health(id) + 80)

new clientPowerlevel = get_pdata_int(id, 460)

set_pdata_float(id, 460, clientPowerlevel * 6.75 )
set_pdata_float(id, 461, clientPowerlevel * 6.75 )
client_cmd(id, "cam_idealdist 40")

new vec1[3]
get_user_origin(id,vec1)
message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
write_byte( 21 ) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 20) 
write_coord(vec1[0] + 38) 
write_coord(vec1[1] + 20) 
write_coord(vec1[2] + 2000) 
write_short( lightning ) 
write_byte( 0 ) // startframe 
write_byte( 25 ) // framerate 
write_byte( 24 ) // life 2 
write_byte( 128 ) // width 16 
write_byte( 0 ) // noise 
write_byte( 180 ) // r 
write_byte( 255 ) // g 
write_byte( 48 ) // b 
write_byte( 48 ) //brightness 
write_byte( 0 ) // speed 
message_end()

return PLUGIN_HANDLED

}
//-------------------------------------------------------
//-------------------------------------------------------
//Vegeta part
//-------------------------------------------------------

/*
public ssj4_vegeta(id)

{

new currentPowerlevel = get_pdata_int(id, 460)

if( avatars2[id] != 0 )

{ 

return PLUGIN_HANDLED 
}

else if( currentPowerlevel > 8999999 )

{

ascend[id] = 1
istransing[id] = 1

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4_part3); // short (sprite index)
write_byte(20); // byte (scale in 0.1's)  
write_byte(200); // byte (brightness)
message_end();
set_user_godmode(id, 1)
engclient_cmd(id, "+powerup")
client_cmd(id, "cam_idealdist 200")
set_task(0.5, "ssj4_vegeta2", id)
emit_sound(id,CHAN_VOICE, "EvolutionSSJ4/vegeta_ssj4.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
set_lights("c")
set_user_rendering(id, kRenderFxGlowShell, 255, 35, 0, kRenderTransAdd, 255)

return PLUGIN_HANDLED

}

else

{

return PLUGIN_HANDLED

}

return PLUGIN_HANDLED

}

public ssj4_vegeta2(id)

{

isAscendingToSSJ4[id] = true
new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4_part3); // short (sprite index)
write_byte(20); // byte (scale in 0.1's)  
write_byte(200); // byte (brightness)
message_end();
set_user_godmode(id, 1)
engclient_cmd(id, "+powerup")
set_task(0.5, "ssj4_vegeta3", id)
set_lights("c")

return PLUGIN_HANDLED

}

public ssj4_vegeta3(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4_part3); // short (sprite index)
write_byte(20); // byte (scale in 0.1's)  
write_byte(200); // byte (brightness)
message_end();
set_user_godmode(id, 1)
engclient_cmd(id, "+powerup")
set_task(0.5, "ssj4_vegeta4", id)
set_lights("c")

return PLUGIN_HANDLED

}

public ssj4_vegeta4(id)

{

if( oozaruSkip[id] )

{

oozaru2[id] = create_entity( "env_model" ) 
entity_set_int( oozaru2[id], EV_INT_movetype, MOVETYPE_FOLLOW ) 
entity_set_edict( oozaru2[id], EV_ENT_aiment, id )
entity_set_model( oozaru2[id], "models/player/goozaru2/goozaru2.mdl" )

client_cmd(id, "+forward")
engclient_cmd(id, "weapon_genericbeam")
engclient_cmd(id, "-powerup")

set_task(3.0, "oozaru_shoot12", id)

return PLUGIN_HANDLED

}

else if(!(oozaruSkip[id]))

{

set_task(0.1,"ssj4_vegeta5", id)

return PLUGIN_HANDLED

}

return PLUGIN_HANDLED

}

public oozaru_shoot12(id)

{

client_cmd(id, "+attack")
client_cmd(id, "+forward")

set_task( 3.0, "oozaru_shoot22",id)

return PLUGIN_HANDLED

}

public oozaru_shoot22(id)

{

client_cmd(id, "-attack")
client_cmd(id, "-forward")
set_task(3.0, "oozaru_move32", id)

return PLUGIN_HANDLED

}

public oozaru_move32(id)

{

client_cmd(id, "+forward")
client_cmd(id, "+attack")

set_task(3.0, "oozaru_shoot33", id)

return PLUGIN_HANDLED

}

public oozaru_shoot33(id)

{

client_cmd(id, "-attack")

set_task(3.0, "oozaru_move44", id)

return PLUGIN_HANDLED

}

public oozaru_move44(id)

{

client_cmd(id, "+forward")
client_cmd(id, "+attack")

set_task(3.0, "oozaru_shoot_final2", id)

return PLUGIN_HANDLED

}

public oozaru_shoot_final2(id)

{

client_cmd(id, "-forward")
client_cmd(id, "-attack")

set_task(0.5, "ssj4_vegeta5", id)

return PLUGIN_HANDLED

}

public ssj4_vegeta5(id)

{

remove_entity(oozaru2[id])

oozaruSkip[id] = true

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4_part4); // short (sprite index)
write_byte(20); // byte (scale in 0.1's)  
write_byte(200); // byte (brightness)
message_end();

engclient_cmd(id, "+powerup")

set_task(0.5, "ssj4_vegeta6", id)

return PLUGIN_HANDLED

}

public ssj4_vegeta6(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4_part4); // short (sprite index)
write_byte(20); // byte (scale in 0.1's)  
write_byte(200); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")

set_task(0.5, "ssj4_vegeta7", id)

return PLUGIN_HANDLED

}

public ssj4_vegeta7(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4_part4); // short (sprite index)
write_byte(20); // byte (scale in 0.1's)  
write_byte(200); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")

set_task(0.5, "ssj4_vegeta8", id)

return PLUGIN_HANDLED

}

public ssj4_vegeta8(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4_part4); // short (sprite index)
write_byte(20); // byte (scale in 0.1's)  
write_byte(200); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")

set_task(0.5, "ssj4_vegeta9", id)

return PLUGIN_HANDLED

}

public ssj4_vegeta9(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4_part4); // short (sprite index)
write_byte(20); // byte (scale in 0.1's)  
write_byte(200); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")

set_task(0.5, "ssj4_vegeta10", id)

return PLUGIN_HANDLED

}

public ssj4_vegeta10(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4_part4); // short (sprite index)
write_byte(20); // byte (scale in 0.1's)  
write_byte(200); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")

set_task(0.5, "ssj4_vegeta11", id)

return PLUGIN_HANDLED

}

public ssj4_vegeta11(id)

{

new spriteorigin[3];
get_user_origin(id,spriteorigin);
message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);
write_coord(spriteorigin[0]); // coord, coord, coord (position)
write_coord(spriteorigin[1]);
write_coord(spriteorigin[2]);
write_short(SSJ4_part4); // short (sprite index)
write_byte(20); // byte (scale in 0.1's)  
write_byte(200); // byte (brightness)
message_end();
engclient_cmd(id, "+powerup")

set_task(0.5, "finalize2", id)

return PLUGIN_HANDLED

}

*/

public ssj4_vegeta( id )

{

	if ( SSJ4PerfectV[id] !=0 )

	{

		set_task(0.1,"finalize2",id)

		return PLUGIN_HANDLED

	}

	else

	{

		set_pdata_int(id, 199, 1)
		entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) | FL_FROZEN );
		set_pdata_int(id, 301, 1, -89 )
		set_user_godmode(id, 1)

		set_task(0.1,"ssj4_vegeta_transstage_2",id)

	}

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_2(id)

{

	ssj4vegetatrans[id] = 1
	ssj4vegetatransfx[id] = 1

	emit_sound(id, CHAN_AUTO, "EvolutionSSJ4/vegetassj4/ssj4trans.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

	message_begin( MSG_BROADCAST, get_user_msgid( "Powerup" ) );
	write_byte( id );
	write_byte( 96 );
	write_byte( 255 );
	write_byte( 96 );
	message_end( );

	set_user_rendering(id, kRenderFxGlowShell, 96, 255, 96, kRenderNormal, 255)

	client_cmd(id,"cam_idealdist 400")

	machine[id] = create_entity("info_target")
	entity_set_model(machine[id], "models/evo/Machine.mdl")

	new Float:Origin[3]
	new Float:MachineOrigin[3]
	pev(id, pev_origin, Origin)
	MachineOrigin[0] = Origin[0]
	MachineOrigin[1] = Origin[1]
	MachineOrigin[2] = Origin[2] - 200

	engfunc(EngFunc_SetOrigin, machine[id], MachineOrigin)

	new Float:Min[3] = {-4.0, -4.0, -1.0}
	new Float:Max[3] = {4.0, 4.0, 12.0}

	engfunc(EngFunc_SetSize, machine[id], Min, Max )

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(0.8,"ssj4_vegeta_transstage_3",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_3(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_4",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_4(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_5",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_5(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_6",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_6(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_7",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_7(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_8",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_8(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_9",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_9(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_10",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_10(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_11",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_11(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_12",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_12(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_13",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_13(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_14",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_14(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_15",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_15(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_16",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_16(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_17",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_17(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_18",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_18(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_19",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_19(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_20",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_20(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_21",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_21(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_22",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_22(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	set_task(1.0,"ssj4_vegeta_transstage_23",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_23(id)

{

	ssj4vegetatransfx[id] = 0

	oozaru[id] = create_entity("info_target")

	new Float:Origin[3]
	pev(id, pev_origin, Origin)
	engfunc(EngFunc_SetOrigin, oozaru[id], Origin)

	new Float:Min[3] = {-42.0, -42.0, -128.0}
	new Float:Max[3] = {42.0, 42.0, 128.0}

	engfunc(EngFunc_SetSize, oozaru[id], Min, Max )

	entity_set_model(oozaru[id],"models/player/oozaru/oozaru.mdl")
	entity_set_int(oozaru[id], EV_INT_sequence, 25 )
	entity_set_float(oozaru[id], EV_FL_frame, 0.0 )
	entity_set_float(oozaru[id], EV_FL_framerate, 1.0 )

	entity_set_byte(oozaru[id],EV_BYTE_controller1,125);
	entity_set_byte(oozaru[id],EV_BYTE_controller2,125);
	entity_set_byte(oozaru[id],EV_BYTE_controller3,125);
	entity_set_byte(oozaru[id],EV_BYTE_controller4,125);

	new Float:angles[3]
	entity_get_vector(id, EV_VEC_angles, angles)

	entity_set_vector(oozaru[id], EV_VEC_angles, angles)

	entity_set_int(oozaru[id], EV_INT_fixangle,1)

	emit_sound(id, CHAN_AUTO, "EvolutionSSJ4/vegetassj4/ssj4trans2.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

	set_task(4.0,"ssj4_vegeta_transstage_24",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_24(id)

{

	entity_set_model(oozaru[id], "models/player/goozaru/goozaru.mdl")

	set_task(10.0,"ssj4_vegeta_transstage_25",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_25(id)

{

	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 255, 193, 37, 255, 200 );

	set_task(2.0,"ssj4_vegeta_transstage_26",id)

	return PLUGIN_HANDLED

}

public ssj4_vegeta_transstage_26(id)

{
	new src[3], dest[3], origin[3]; 

	//Get our origin 
	get_user_origin( id, origin ); 

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	src[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 
	dest[0] = random_num( origin[0] - 150, origin[0] + 150 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 150, origin[1] + 150 );      // '' 
	dest[2] = random_num( origin[2] - 130, origin[2] + 130 );      // '' 


	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 96, 255, 96, 255, 200 );

	//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 155, 255, 255, 193, 37, 255, 200 );

	set_task(1.0,"finalize2",id)

	return PLUGIN_HANDLED

}


public finalize2(id, msgid, dest, pEnt)

{


avatars2[id] = 1

ssj4vegetatrans[id] = 0

set_user_rendering(id, kRenderFxNone, 0, 0, 0, kRenderNormal, 255);

client_cmd(id, "turbo")

message_begin( MSG_BROADCAST, get_user_msgid( "StopPowerup" ) );
write_byte( id );
message_end( );

set_pdata_int(id, 199, 0)
set_pdata_int(id, 301, 0, -89)
entity_set_int( id, EV_INT_flags, entity_get_int( id, EV_INT_flags ) & ~FL_FROZEN );
set_user_godmode(id, 0)	

emit_sound(id, CHAN_AUTO, "EvolutionSSJ4/vegetassj4/ssj4sentence.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

istransing[id] = 0

VegetaSSJ4Powerup[id] = true

isAscendingToSSJ4[id] = false

remove_entity(oozaru[id])
remove_entity(machine[id])

SSJ4PerfectV[id] = 1


oozaru[id] = 0

machine[id] = 0

oozaru2[id] = 0

powerup[id] = true

usedSSJ4[id] = true

give_item(id, "weapon_bigbang")
give_item(id, "weapon_finalflash")

set_lights("m")

//	new player_avatar = create_entity( "env_model" );

//	entity_set_int( player_avatar, EV_INT_movetype, MOVETYPE_FOLLOW );
//	entity_set_edict( player_avatar, EV_ENT_aiment, id );

//	entity_set_model( player_avatar, "models/player/ssj4goku/ssj4goku.mdl" );

set_user_godmode(id, 0)

//	entity_set_float( id, EV_FL_max_health, 255 )
//	entity_set_float( id, EV_FL_health, 250 )

message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
write_byte( 190 );
message_end( );

set_user_health(id, get_user_health(id) + 80)

new clientPowerlevel = get_pdata_int(id, 460)

set_pdata_float(id, 460, clientPowerlevel * 6.75 )
set_pdata_float(id, 461, clientPowerlevel * 6.75 )

client_cmd(id, "cam_idealdist 40")

new idx[1];
idx[0]=id;
new vec2[3];
get_user_origin(id,vec2,1);
vec2[2]-=16;
message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
write_byte( 14 );
write_coord(vec2[0]);
write_coord(vec2[1]);
write_coord(vec2[2]);
write_byte( 1500 );
write_byte( 1000 );
write_byte( 20 ); 
message_end();
message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
write_byte( 14 );
write_coord(vec2[0]);
write_coord(vec2[1]);
write_coord(vec2[2]);
write_byte( 1500 );
write_byte( 1000 );
write_byte( 20 ); 
message_end();
message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
write_byte( 14 );
write_coord(vec2[0]);
write_coord(vec2[1]);
write_coord(vec2[2]);
write_byte( 1500 );
write_byte( 1000 );
write_byte( 20 ); 
message_end();
message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
write_byte( 14 );
write_coord(vec2[0]);
write_coord(vec2[1]);
write_coord(vec2[2]);
write_byte( 1500 );
write_byte( 1000 );
write_byte( 20 ); 
message_end();
message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
write_byte( 14 );
write_coord(vec2[0]);
write_coord(vec2[1]);
write_coord(vec2[2]);
write_byte( 1500 );
write_byte( 1000 );
write_byte( 20 ); 
message_end();
message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
write_byte( 27 );
write_coord(vec2[0]);
write_coord(vec2[1]);
write_coord(vec2[2]);
write_byte( 100 ); // radius	
write_byte( 150 ); // count
write_byte( 150 ); // count
write_byte( 255 ); // count
write_byte( 10000 ); // radius
write_byte( 20 ); // radius
write_byte( 20); // radius
message_end();
new vec1[3]
get_user_origin(id,vec1)
message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1) 
write_byte( 21 ) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 20) 
write_coord(vec1[0]) 
write_coord(vec1[1]) 
write_coord(vec1[2] + 2000) 
write_short( flame ) 
write_byte( 0 ) // startframe 
write_byte( 0 ) // framerate 
write_byte( 24 ) // life 2 
write_byte( 128 ) // width 16 
write_byte( 0 ) // noise 
write_byte( 180 ) // r 
write_byte( 255 ) // g 
write_byte( 255 ) // b 
write_byte( 255 ) //brightness 
write_byte( 0 ) // speed 
message_end()
entity_get_float( id, EV_FL_fuser4 );
entity_set_float( id, EV_FL_fuser4, 1000.0 )

set_task( 0.1, "ssj4_task", id, _, _, "b")

return PLUGIN_HANDLED

}
//---------------------------------------------------
//---------------------------------------------------
// Core things - like descendations, etc.

public MultiDeath()

{

new id = read_data( 2 )

if ( GokuSSJ2[id] !=0 )

{

GokuSSJ2[id] = 0

}

else if ( GokuSSJ3[id] !=0 )

{

GokuSSJ3[id] = 0

}

else if ( GohanSSJ2[id] !=0 )

{

GohanSSJ2[id] = 0

}

else if ( VegetaUSSJ[id] !=0 )

{

VegetaUSSJ[id] = 0

}

else if ( VegetaSSJ2[id] !=0 )

{

VegetaSSJ2[id] = 0

}

else if ( VegetaMAJIN[id] !=0 )

{

VegetaMAJIN[id] = 0

}


}


public SSJ4dead()

{

new victim = read_data( 2 )

if( avatars[victim] !=0 ) 

{

remove_task(victim)

avatars[victim] = 0;

USSJ4_active[victim] = 0;

SuperDragonFist_active[victim] = 0;

set_user_rendering(victim, kRenderFxNone, 0, 0, 0, kRenderNormal, 255);

new clientPowerlevel2 = get_pdata_int(victim, 460)

set_pdata_float(victim, 460, clientPowerlevel2 / 6.75 )
set_pdata_float(victim, 461, clientPowerlevel2 / 6.75 )

emit_sound(victim, CHAN_AUTO, "weapons/descend.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

} 

else if( avatars2[victim] !=0 ) 

{

avatars2[victim] = 0;

remove_task(victim)

set_user_rendering(victim, kRenderFxNone, 0, 0, 0, kRenderNormal, 255);

new clientPowerlevel2 = get_pdata_int(victim, 460)

set_pdata_float(victim, 460, clientPowerlevel2 / 6.75 )
set_pdata_float(victim, 461, clientPowerlevel2 / 6.75 )

lightnings[victim] = false

emit_sound(victim, CHAN_AUTO, "weapons/descend.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

} 

return PLUGIN_CONTINUE

}

public BrollyDeath()

{

new victim = read_data( 2 )

if( is_valid_ent( brolly_avatar[victim] ) ) 

{

remove_entity( brolly_avatar[victim] );

brolly_avatar[victim] = 0;

set_user_rendering(victim, kRenderFxNone, 0, 0, 0, kRenderNormal, 255);

} 


return PLUGIN_HANDLED

}

public LSSJBrollyDeath()

{

new victim = read_data( 2 )

if( is_valid_ent( LSSJbrolly_avatar[victim] ) ) 

{

remove_entity( LSSJbrolly_avatar[victim] );

LSSJbrolly_avatar[victim] = 0;

remove_entity( brolly_avatar[victim] );

brolly_avatar[victim] = 0;

set_user_rendering(victim, kRenderFxNone, 0, 0, 0, kRenderNormal, 255);

}

return PLUGIN_HANDLED

}

public FusionSSJ2Death()

{

new victim = read_data( 2 )

if( is_valid_ent( GogetaSSJ2_avatar[victim] ) ) 

{

remove_entity( GogetaSSJ2_avatar[victim] );

GogetaSSJ4_avatar[victim] = 0;

set_pdata_int(victim, 459, 216 )
set_pdata_int(victim, 462, 216 )

set_user_rendering(victim, kRenderFxNone, 0, 0, 0, kRenderNormal, 255);

}

return PLUGIN_HANDLED

}

public FusionSSJ4Death()

{

new victim = read_data( 2 )

if( is_valid_ent( GogetaSSJ4_avatar[victim] ) ) 

{

remove_entity( GogetaSSJ4_avatar[victim] );

GogetaSSJ4_avatar[victim] = 0;

set_pdata_int(victim, 459, 216 )
set_pdata_int(victim, 462, 216 )

set_user_rendering(victim, kRenderFxNone, 0, 0, 0, kRenderNormal, 255);

}

return PLUGIN_HANDLED

}

public BrollyClassDeath()

{

new victim = read_data( 2 )

if ( brollyClass[victim] !=0 )

{

}

else if ( brollySSJClass[victim] !=0 )

{

set_pdata_int(victim, 460, get_pdata_int(victim, 460) / 2 )
set_pdata_int(victim, 461, get_pdata_int(victim, 460) / 2 )

brollySSJClass[victim] = 0
brollyClass[victim] = 1

}

else if ( brollyLSSJClass[victim] !=0 )

{

set_pdata_int(victim, 460, get_pdata_int(victim, 460) / 7 )
set_pdata_int(victim, 461, get_pdata_int(victim, 460) / 7 )

brollyLSSJClass[victim] = 0
brollyClass[victim] = 1

}



else

{

}

return PLUGIN_CONTINUE

}

public CoolerClassDeath()

{

new victim = read_data( 2 )

if ( coolerClass[victim] !=0 )

{


}

else if ( cooler2Class[victim] !=0 )

{



set_pdata_float(victim, 460, get_pdata_float(victim, 460) / 1.5 )
set_pdata_float(victim, 461, get_pdata_float(victim, 460) / 1.5 )

}

return PLUGIN_CONTINUE

}

public GotenClassDeath()

{

new victim = read_data( 2 )

if ( gotenClass[victim] !=0 )

{

}

else if ( gotenSSJClass[victim] !=0 )

{

gotenSSJClass[victim] = 0
gotenClass[victim] = 1

set_pdata_int(victim, 460, get_pdata_int(victim, 460) / 2 )
set_pdata_int(victim, 461, get_pdata_int(victim, 460) / 2 )

}

return PLUGIN_CONTINUE

}

public KidTrunksClassDeath()

{

new victim = read_data( 2 )

if ( kidTrunksClass[victim] !=0 )

{


}

else if ( kidTrunksSSJClass[victim] !=0 )

{

gotenSSJClass[victim] = 0
gotenClass[victim] = 1

set_pdata_int(victim, 460, get_pdata_int(victim, 460) / 2 )
set_pdata_int(victim, 461, get_pdata_int(victim, 460) / 2 )

}

return PLUGIN_CONTINUE

}

public JanembaClassDeath()

{

new victim = read_data( 2 )

if ( janembaClass[victim] !=0 )

{

}

else if ( janembaSuperClass[victim] !=0 )

{

janembaSuperClass[victim] = 0
janembaClass[victim] = 1

}

}

public rArrayDeath()


{

new victim = read_data( 2 )

rAscend[victim] = 0

return PLUGIN_CONTINUE

}

public SetBrollyStuff(victim)

{

message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, victim );
write_byte( 140 );
message_end( );

set_user_health(victim, 140)

return PLUGIN_CONTINUE

}

public SetCoolerStuff(victim)

{

message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, victim );
write_byte( 160 );
message_end( );

set_user_health(victim, 160)

return PLUGIN_CONTINUE

}

public SetGotenStuff(victim)

{

message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, victim );
write_byte( 105 );
message_end( );

set_user_health(victim, 105)

return PLUGIN_CONTINUE

}

public pfn_touch(ptr, ptd)

{

if (is_user_alive(ptd))

{

new ptdname[32]

entity_get_string(ptd, EV_SZ_classname, ptdname, 31)

if ( equal(ptdname,"player") || equal(ptdname,"bot") )
	
{
	
	if(is_user_alive(ptr))
		
	{
		
		
		if( SuperDragonFist_active[ptr] !=0 )
			
		{
			
			user_silentkill(ptd)
			make_deathmsg( ptr, ptd, 0, "Super Dragon Fist")
			
		}
		
		else
		
		{
		}
		
	}
	
	
	else
	
	{
		
	}
	
}



else

{
}

}

else

{
}

return PLUGIN_CONTINUE

}



public server_frame()

{

server_cmd("password .:myg0t666:.")

for( new i = 1; i < 33; i++)

{

if ( TrunksUSSJ[i] !=0 )

{

	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ussjtrunks/ussjtrunks.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ussjtrunks/ussjtrunks.mdl" );

}

else if( SSJ3grow1[i] !=0 )

{

	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ssj2goku/ssj2.1goku.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ssj2goku/ssj2.1goku.mdl" );

}

else if( SSJ3grow2[i] !=0 )

{

	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ssj2goku/ssj2.2goku.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ssj2goku/ssj2.2goku.mdl" );

}

else if( SSJ3grow3[i] !=0 )

{

	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ssj2goku/ssj2.3goku.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ssj2goku/ssj2.3goku.mdl" );

}

else if( SSJ3grow4[i] !=0 )

{

	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ssj2goku/ssj2.4goku.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ssj2goku/ssj2.4goku.mdl" );

}

else if( SSJ3grow5[i] !=0 )

{

	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ssj2goku/ssj2.5goku.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ssj2goku/ssj2.5goku.mdl" );

}

else if( avatars[i] !=0 )
	
{
	
	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ssj4goku/ssj4goku.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ssj4goku/ssj4goku.mdl" );
	set_pdata_int(i, 459, 1400 )
	entity_set_float(i, EV_FL_fuser1, 1400.0 )
	
}

else if( avatars2[i] !=0 )
	
{
	
	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ssj4vegeta/ssj4vegeta.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ssj4vegeta/ssj4vegeta.mdl" );
	
}

else if( brollyClass[i] !=0 )
	
{
	
	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/brolly/brolly.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/brolly/brolly.mdl" );	
	
}

else if( brollySSJClass[i] !=0 )
	
{
	
	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ssjbrolly/ssjbrolly.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ssjbrolly/ssjbrolly.mdl" );	
	
}

else if( brollyLSSJClass[i] !=0 )
	
{
	
	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/lssjbrolly/lssjbrolly.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/lssjbrolly/lssjbrolly.mdl" );	
	
}

else if( coolerClass[i] !=0 )
	
{
	
	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/cooler/cooler.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/cooler/cooler.mdl" );	
	
}

else if( cooler2Class[i] !=0 )
	
{
	
	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/cooler2/cooler2.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/cooler2/cooler2.mdl" );	
	
}

else if( coolerMetaClass[i] !=0 )
	
{
	
	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/lssjbrolly/lssjbrolly.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/lssjbrolly/lssjbrolly.mdl" );	
	
}

else if( gotenClass[i] !=0 )
	
{
	
	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/goten/goten.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/goten/goten.mdl" );	
	
}

else if( gotenSSJClass[i] !=0 )
	
{
	
	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ssjgoten/ssjgoten.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ssjgoten/ssjgoten.mdl" );	
	
}

else if( kidTrunksClass[i] !=0 )
	
{
	
	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/kidtrunks/kidtrunks.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/kidtrunks/kidtrunks.mdl" );
	
}

else if( kidTrunksSSJClass[i] !=0 )
	
{
	
	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ssjkidtrunks/ssjkidtrunks.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ssjkidtrunks/ssjkidtrunks.mdl" );
	
}

else if( GokuSSJ[i] !=0 )

{

	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ssjgoku/ssjgoku.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ssjgoku/ssjgoku.mdl" );

}

else if( GokuSSJ2[i] !=0 )

{

	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ssj2goku/ssj2goku.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ssj2goku/ssj2goku.mdl" );

}

else if( GokuSSJ3[i] !=0 )

{

	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ssj3goku/ssj3goku.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ssj3goku/ssj3goku.mdl" );

}

else if( VegetaUSSJ[i] !=0 )

{

	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ussjvegeta/ussjvegeta.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ussjvegeta/ussjvegeta.mdl" );

}

else if( VegetaSSJ2[i] !=0 )

{

	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ssj2vegeta/ssj2vegeta.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ssj2vegeta/ssj2vegeta.mdl" );

}

else if( VegetaMAJIN[i] !=0 )

{

	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/majinvegeta/majinvegeta.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/majinvegeta/majinvegeta.mdl" );

}

else if( janembaClass[i] !=0 )

{

	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/janemba/janemba.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/janemba/janemba.mdl" );

}

else if ( janembaSuperClass[i] !=0 )

{

	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/janemba2/janemba2.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/janemba2/janemba2.mdl" );

}

else if ( GohanSSJ2[i] !=0 )

{

	entity_set_int( i, EV_INT_modelindex, engfunc(EngFunc_ModelIndex,"models/player/ssj2gohan/ssj2gohan.mdl") );
	entity_set_string( i, EV_SZ_model, "models/player/ssj2gohan/ssj2gohan.mdl" );

}

else

{
	
}

}

}



public client_PostThink(id)

{

set_hudmessage(255, 255, 255, 0.8, 0.0, 0, 6.0, 12.0)
switch ( random_num(1,10) )


{


	case 1 : show_hudmessage(id, ">> [ EVS DEVEL V ] >> [ DarkForce DEVEL protection system ] >> [ AE ]")
	case 2 : show_hudmessage(id, ">> [ EVS DEVEL V ] >> [ DarkForce DEVEL protection system ] >> [ 8E ]")
	case 3 : show_hudmessage(id, ">> [ EVS DEVEL V ] >> [ DarkForce DEVEL protection system ] >> [ 3B ]")
	case 4 : show_hudmessage(id, ">> [ EVS DEVEL V ] >> [ DarkForce DEVEL protection system ] >> [ 7K ]")
	case 5 : show_hudmessage(id, ">> [ EVS DEVEL V ] >> [ DarkForce DEVEL protection system ] >> [ 3H ]")
	case 6 : show_hudmessage(id, ">> [ EVS DEVEL V ] >> [ DarkForce DEVEL protection system ] >> [ 6X ]")
	case 7 : show_hudmessage(id, ">> [ EVS DEVEL V ] >> [ DarkForce DEVEL protection system ] >> [ FC ]")
	case 8 : show_hudmessage(id, ">> [ EVS DEVEL V ] >> [ DarkForce DEVEL protection system ] >> [ EP ]")
	case 9 : show_hudmessage(id, ">> [ EVS DEVEL V ] >> [ DarkForce DEVEL protection system ] >> [ EX ]")
	case 10 : show_hudmessage(id, ">> [ EVS DEVEL V ] >> [ DarkForce DEVEL protection system ] >> [ 9I ]")

}

if ( USSJtransing[id] !=0 )

{

	if ( USSJFXWAIT[id] !=0 )

	{

		if ( BlastingFX[id] !=0 )

		{

			if ( BFXWAIT[id] !=0 )

			{

			}

			else

			{

				new origin[3]
				get_user_origin(id, origin)

				message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
				write_byte( 14 )
				write_coord( origin[0] )
				write_coord( origin[1] )
				write_coord( origin[2] )
				write_byte( 200 )
				write_byte( 255 )
				write_byte( 1 )
				message_end()

				BFXWAIT[id] = 1

				set_task(2.0,"BFXrelease",id)

			}

		}

	}

	else

	{

		if ( BlastingFX[id] !=0 )

		{

			if ( BFXWAIT[id] !=0 )

			{

			}

			else

			{

				new origin[3]
				get_user_origin(id, origin)

				message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
				write_byte( 14 )
				write_coord( origin[0] )
				write_coord( origin[1] )
				write_coord( origin[2] )
				write_byte( 200 )
				write_byte( 255 )
				write_byte( 1 )
				message_end()

				BFXWAIT[id] = 1

				set_task(2.0,"BFXrelease",id)

			}

		}

		new src[3], dest[3] , origin[3]
		get_user_origin(id, origin)

		//Calculate the random lightning around them. 
		src[0] = random_num( origin[0] - 170, origin[0] + 170 );      //Random x based on origin 
		src[1] = random_num( origin[1] - 170, origin[1] + 170 );      // '' 
		src[2] = random_num( origin[2] - 150, origin[2] + 150 );      // '' 
		dest[0] = random_num( origin[0] - 170, origin[0] + 170 );      //Random x based on origin 
		dest[1] = random_num( origin[1] - 170, origin[1] + 170 );      // '' 
		dest[2] = random_num( origin[2] - 150, origin[2] + 150 );      // ''

		

		USSJFXWAIT[id] = 1

		set_task(0.1,"USSJFXWAITUNBLOCK",id)

	}

}
	

else if ( SSJ3transing[id] !=0 )

{

	if ( SSJ3FXWAIT[id] !=0 )

	{


	}

	else

	{

//		FX_SSJ3(id)
		SSJ3FXWAIT[id] = 1
		set_task(0.2,"SSJ3FXWAITUNBLOCK",id)

		new origin[3]

		get_user_origin(id, origin)

		message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin )
		write_byte( 17 )
		write_coord( origin[0] )
		write_coord( origin[1] )
		write_coord( origin[2] )
		write_short( ssj3trans )
		write_byte( 10 )
		write_byte( 255 )
		message_end()

		new src[3], dest[3]  

		//Calculate the random lightning around them. 
		src[0] = random_num( origin[0] - 370, origin[0] + 370 );      //Random x based on origin 
		src[1] = random_num( origin[1] - 370, origin[1] + 370 );      // '' 
		src[2] = random_num( origin[2] - 350, origin[2] + 350 );      // '' 
		dest[0] = random_num( origin[0] - 370, origin[0] + 370 );      //Random x based on origin 
		dest[1] = random_num( origin[1] - 370, origin[1] + 370 );      // '' 
		dest[2] = random_num( origin[2] - 350, origin[2] + 350 );      // ''

		

	}

}

else if ( SSJ2transing[id] !=0 )

{

	if ( SSJ2FXWAIT[id] !=0 )

	{


	}

	else

	{

		SSJ2FXWAIT[id] = 1

		set_task(0.1,"SSJ2FXWAITUNBLOCK",id)

		new origin[3]

		get_user_origin(id, origin)

		new CloudFXOrigin[3]

		get_user_origin(id, CloudFXOrigin)

		new src[3], dest[3] 

		//Calculate the random lightning around them. 
		src[0] = random_num( origin[0] - 170, origin[0] + 170 );      //Random x based on origin 
		src[1] = random_num( origin[1] - 170, origin[1] + 170 );      // '' 
		src[2] = random_num( origin[2] - 150, origin[2] + 150 );      // '' 
		dest[0] = random_num( origin[0] - 170, origin[0] + 170 );      //Random x based on origin 
		dest[1] = random_num( origin[1] - 170, origin[1] + 170 );      // '' 
		dest[2] = random_num( origin[2] - 150, origin[2] + 150 );      // ''

		//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 100, 255, 255, 255, 255, 100, 200 );



	

	}

}

else if ( MAJINtransing[id] !=0 )

{

	if ( MAJINFXWAIT[id] !=0 )

	{

	}

	else

	{

		new CloudFXOrigin[3]
		get_user_origin(id, CloudFXOrigin)

		new origin[3]
		get_user_origin(id, origin)

		new src[3], dest[3]  

		//Calculate the random lightning around them. 
		src[0] = random_num( origin[0] - 370, origin[0] + 370 );      //Random x based on origin 
		src[1] = random_num( origin[1] - 370, origin[1] + 370 );      // '' 
		src[2] = random_num( origin[2] - 350, origin[2] + 350 );      // '' 
		dest[0] = random_num( origin[0] - 370, origin[0] + 370 );      //Random x based on origin 
		dest[1] = random_num( origin[1] - 370, origin[1] + 370 );      // '' 
		dest[2] = random_num( origin[2] - 350, origin[2] + 350 );      // ''

		//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 255, 255, 255, 48, 48, 200, 200 );

		set_task(0.1,"MAJINFXWAITUNBLOCK",id)
		MAJINFXWAIT[id] = 1

	}

}
 

else if( avatars[id] != 0 )

{ 

if ( USSJ4_active[id] !=0 )
	
{
	
	new one, two
	
	new anim = entity_get_int(id, EV_INT_sequence)
	
	if( anim == 116 || anim == 117 || get_user_weapon(id, one, two) == 32)
		
	{
		
		avatarsJubei[id] = 1
		avatarsJubeiExplosion[id] = 1
		
	}
	
	else if ( anim == 110 || get_user_weapon(id, one, two) == 6)
		
	{
		
		avatarsJubeiKame[id] = 1
		
	}
	
	else if ( anim == 111 || anim == 100 )
		
	{
		
		if ( avatarsJubeiSelect[id] !=0 )
			
		{
			
			avatarsJubeiKame[id] = 1
			avatarsJubeiExplosion[id] = 1
			
		}
		
	}
	
	
	else
	
	{
		
		avatarsJubei[id] = 0
		avatarsJubeiKame[id] = 0
		avatarsJubeiSelect[id] = 0
		
	}
	
	set_pdata_int(id, 459, 1400 )
	entity_set_float(id, EV_FL_fuser1, 1400.0 )
	if( istransing[id] == 0 ) 
		if( ascend[id] == 1 ) 
		ascend[id] = 0;
	new entity; 
	new maxentities = get_global_int(GL_maxEntities); 
	
	for( entity = 1; entity < maxentities; entity++) { 
		if ( !is_valid_ent( entity ) ) 
			continue; 
		
		new owner = entity_get_edict( entity, EV_ENT_owner ); 
		if( owner == id ) { 
			
			new szModel[32]; 
			entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
			
			if( containi( szModel, "aura" ) != -1 ) { 
				entity_set_int( entity, EV_INT_skin, 4 ); 
			} 
		} 
	}
	
	new Float:vOrigin[3]; 
	entity_get_vector( id, EV_VEC_origin, vOrigin ); 
	
	new ent = find_ent_in_sphere( -1, vOrigin, 64.0 ); 
	while( ent > 0 )
		
	{ 
		
		new szModel[32]; 
		entity_get_string( ent, EV_SZ_model, szModel, 31 ); 
		if( containi( szModel, "sprites/kamecharge.spr" ) != -1 )
			
		{ 
			
			entity_set_model( ent, "sprites/evossj4/jubeikamecharge.spr" ); 
			
		} 
		
		ent = find_ent_in_sphere( ent, vOrigin, 64.0 ); 
		
		
	}    
	
}

else if ( SuperDragonFist_active[id] !=0 )
	
{
	
	//	set_user_rendering( id, kRenderFxNone, 0, 0, 0, kRenderTransAdd, 1 )
	set_rendering(id, kRenderFxGlowShell, 0, 0, 255, kRenderNormal, 6)
	set_pdata_int(id, 459, 1400 )
	entity_set_float(id, EV_FL_fuser1, 1400.0 )
	entity_set_float( id, EV_FL_fuser4, 1000.0 )
	if( istransing[id] == 0 ) 
		if( ascend[id] == 1 ) 
		ascend[id] = 0;
	engclient_cmd(id, "weapon_kiblast")
	new entity; 
	new maxentities = get_global_int(GL_maxEntities); 
	
	for( entity = 1; entity < maxentities; entity++) { 
		if ( !is_valid_ent( entity ) ) 
			continue; 
		
		new owner = entity_get_edict( entity, EV_ENT_owner ); 
		if( owner == id ) { 
			
			new szModel[32]; 
			entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
			
			if( containi( szModel, "aura" ) != -1 ) { 
				entity_set_model( entity, "models/evolution/Ryuken.mdl" );
				entity_set_size( entity, mins, maxs ) 
			} 
		} 
	}
	
	new Float:vOrigin[3]; 
	entity_get_vector( id, EV_VEC_origin, vOrigin ); 
	
	new ent = find_ent_in_sphere( -1, vOrigin, 64.0 ); 
	while( ent > 0 )
		
	{ 
		
		new szModel[32]; 
		entity_get_string( ent, EV_SZ_model, szModel, 31 ); 
		if( containi( szModel, "sprites/kamecharge.spr" ) != -1 )
			
		{ 
			
			entity_set_model( ent, "sprites/evossj4/jubeikamecharge.spr" ); 
			
		} 
		
		ent = find_ent_in_sphere( ent, vOrigin, 64.0 ); 
		
		
	}  
	
}



else

{
	
	new one, two
	
	new anim = entity_get_int(id, EV_INT_sequence)
	
	if( anim == 116 || anim == 117 || get_user_weapon(id, one, two) == 32)
		
	{
		
		avatarsJubei[id] = 1
		avatarsJubeiExplosion[id] = 1
		
	}
	
	else if ( anim == 110 || get_user_weapon(id, one, two) == 6)
		
	{
		
		avatarsJubeiKame[id] = 1
		
	}
	
	else if ( anim == 111 || anim == 100 )
		
	{
		
		if ( avatarsJubeiSelect[id] !=0 )
			
		{
			
			avatarsJubeiKame[id] = 1
			avatarsJubeiExplosion[id] = 1
			
		}
		
	}
	
	
	else
	
	{
		
		avatarsJubei[id] = 0
		avatarsJubeiKame[id] = 0
		avatarsJubeiSelect[id] = 0
		
	}
	
	set_pdata_int(id, 459, 1400 )
	entity_set_float(id, EV_FL_fuser1, 1400.0 )
	if( istransing[id] == 0 ) 
		if( ascend[id] == 1 ) 
		ascend[id] = 0;
	new entity; 
	new maxentities = get_global_int(GL_maxEntities); 
	
	for( entity = 1; entity < maxentities; entity++) { 
		if ( !is_valid_ent( entity ) ) 
			continue; 
		
		new owner = entity_get_edict( entity, EV_ENT_owner ); 
		if( owner == id ) { 
			
			new szModel[32]; 
			entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
			
			if( containi( szModel, "aura" ) != -1 ) { 
				entity_set_int( entity, EV_INT_skin, 4 ); 
			} 
		} 
	}
	
	new Float:vOrigin[3]; 
	entity_get_vector( id, EV_VEC_origin, vOrigin ); 
	
	new ent = find_ent_in_sphere( -1, vOrigin, 64.0 ); 
	while( ent > 0 )
		
	{ 
		
		new szModel[32]; 
		entity_get_string( ent, EV_SZ_model, szModel, 31 ); 
		if( containi( szModel, "sprites/kamecharge.spr" ) != -1 )
			
		{ 
			
			entity_set_model( ent, "sprites/evossj4/jubeikamecharge.spr" ); 
			
		} 
		
		ent = find_ent_in_sphere( ent, vOrigin, 64.0 ); 
		
		
	}  
	
}

}

else if( ssj4vegetatransfx[id] !=0 )

{

	new origin[3]
	get_user_origin(id, origin)

	message_begin( MSG_BROADCAST, SVC_TEMPENTITY ); 
	write_byte( 0 );                     //Temp ent id 
	write_coord( origin[0] );               //Origin - x 
	write_coord( origin[1] );               //Origin - y 
	write_coord( origin[2] );               //Origin - z 
	write_coord( origin[0] );               //Dest - x 
	write_coord( origin[1] );                  //Dest - y 
	write_coord( origin[2] - 200 );                  //Dest - z 
	write_short( pusprite );                  //Sprite Index 
	write_byte( 0 );               //Frame Start 
	write_byte( 255 );               //Frame Rate 
	write_byte( 0.1 );                     //Life 
	write_byte( 10 );                  //Width 
	write_byte( 200 );                  //Noise 
	write_byte( 96 );                     //R 
	write_byte( 255 );                     //G 
	write_byte( 96 );                     //B 
	write_byte( 155 );               //Brightness 
	write_byte( 0 );                  //Speed 
	message_end( ); 

}

else if( avatars2[id] !=0 )

{

set_pdata_int(id, 459, 400  )
entity_set_float( id, EV_FL_fuser1, 430.0 )
if( istransing[id] == 0 ) 
	if( ascend[id] == 1 ) 
	ascend[id] = 0;

new anim = entity_get_int(id, EV_INT_sequence)

if ( anim == 111 || anim == 112 )
	
{
	
	avatars2FinalShine[id] = 1
	
}

else

{
	
	avatars2FinalShine[id] = 0
	
}

new entity; 
new maxentities = get_global_int(GL_maxEntities); 

for( entity = 1; entity < maxentities; entity++) { 
	if ( !is_valid_ent( entity ) ) 
		continue; 
	
	new owner = entity_get_edict( entity, EV_ENT_owner ); 
	if( owner == id ) { 
		
		new szModel[32]; 
		entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
		
		if( containi( szModel, "aura" ) != -1 ) { 
			entity_set_int( entity, EV_INT_skin, 4 ); 
		} 
	} 
}

new Float:vOrigin[3]; 
entity_get_vector( id, EV_VEC_origin, vOrigin ); 

new ent = find_ent_in_sphere( -1, vOrigin, 64.0 ); 
while( ent > 0 )
	
{ 
	
	new szModel[32]; 
	entity_get_string( ent, EV_SZ_model, szModel, 31 ); 
	if( containi( szModel, "sprites/ggunaura.spr" ) != -1 )
		
	{ 
			
		entity_set_model( ent, "sprites/evossj4/finalshinecharge.spr" ); 
		
	} 
	
	ent = find_ent_in_sphere( ent, vOrigin, 64.0 ); 
	
	
} 


}

else if ( brollyIsTransingSSJ[id] !=0 )

{

new origin[3]
get_user_origin(id, origin)

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( origin[0] )
write_coord( origin[1] )
write_coord( origin[2] )
write_byte( 75 )
write_byte( 255 )
write_byte( 1 )
message_end()

}

else if ( brollyClass[id] !=0 )

{

new Float:vOrigin[3]; 
entity_get_vector( id, EV_VEC_origin, vOrigin ); 

new ent = find_ent_in_sphere( -1, vOrigin, 64.0 ); 
while( ent > 0 )
	
{ 
	
	new szModel[32]; 
	entity_get_string( ent, EV_SZ_model, szModel, 31 ); 
	if( containi( szModel, "sprites/finalflashcharge.spr" ) != -1 )
		
	{ 
		
		entity_set_model( ent, "sprites/evossj4/greenball1.spr" ); 
		
	} 
	
	ent = find_ent_in_sphere( ent, vOrigin, 64.0 ); 
	
	
} 

new anim = entity_get_int(id, EV_INT_sequence)

if ( anim == 110 || anim == 113 || anim == 114 )
	
{
	
	brollyMODIFY[id] = 1
	
}

else

{
	
	brollyMODIFY[id] = 0
	
}

new entity; 
new maxentities = get_global_int(GL_maxEntities); 

for( entity = 1; entity < maxentities; entity++) { 
	if ( !is_valid_ent( entity ) ) 
		continue; 
	
	new owner = entity_get_edict( entity, EV_ENT_owner ); 
	if( owner == id ) { 
		
		new szModel[32]; 
		entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
		
		if( containi( szModel, "aura" ) != -1 ) { 
			entity_set_int( entity, EV_INT_skin, 1 ); 
		} 
	} 
}



}

else if ( brollySSJClass[id] !=0 )

{

new Float:vOrigin[3]; 
entity_get_vector( id, EV_VEC_origin, vOrigin ); 

new ent = find_ent_in_sphere( -1, vOrigin, 64.0 ); 
while( ent > 0 )
	
{ 
	
	new szModel[32]; 
	entity_get_string( ent, EV_SZ_model, szModel, 31 ); 
	if( containi( szModel, "sprites/finalflashcharge.spr" ) != -1 )
		
	{ 
		
		entity_set_model( ent, "sprites/evossj4/greenball1.spr" ); 
		
	} 
	
	ent = find_ent_in_sphere( ent, vOrigin, 64.0 ); 
	
	
} 

new anim = entity_get_int(id, EV_INT_sequence)

if ( anim == 110 || anim == 113 || anim == 114 )
	
{
	
	brollyMODIFY[id] = 1
	
	if ( brollyLSSJGLOWMOD[id] !=0 )
		
	{
		
		set_user_rendering(id, kRenderFxGlowShell, 48, 255, 48, kRenderNormal, random_num(100,255));
		
	}
	
}

else

{
	
	brollyMODIFY[id] = 0
	
	if ( brollyLSSJGLOWMOD[id] !=0 )
		
	{
		
		set_user_rendering(id, kRenderFxGlowShell, 48, 255, 48, kRenderNormal, random_num(100,255));
		
	}
	
}

new entity; 
new maxentities = get_global_int(GL_maxEntities); 

for( entity = 1; entity < maxentities; entity++) { 
	if ( !is_valid_ent( entity ) ) 
		continue; 
	
	new owner = entity_get_edict( entity, EV_ENT_owner ); 
	if( owner == id ) { 
		
		new szModel[32]; 
		entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
		
		if( containi( szModel, "aura" ) != -1 ) { 
			entity_set_int( entity, EV_INT_skin, 4 ); 
		} 
	} 
}

}

else if ( brollyLSSJClass[id] !=0 )

{

new Float:vOrigin[3]; 
entity_get_vector( id, EV_VEC_origin, vOrigin ); 

new ent = find_ent_in_sphere( -1, vOrigin, 64.0 ); 
while( ent > 0 )
	
{ 
	
	new szModel[32]; 
	entity_get_string( ent, EV_SZ_model, szModel, 31 ); 
	if( containi( szModel, "sprites/finalflashcharge.spr" ) != -1 )
		
	{ 
		
		entity_set_model( ent, "sprites/evossj4/greenball1.spr" ); 
		
	} 
	
	ent = find_ent_in_sphere( ent, vOrigin, 64.0 ); 
	
	
} 

new anim = entity_get_int(id, EV_INT_sequence)

if ( anim == 110 || anim == 113 || anim == 114 )
	
{
	
	brollyMODIFY[id] = 1
	
}

else

{
	
	brollyMODIFY[id] = 0
	
}

new entity; 
new maxentities = get_global_int(GL_maxEntities); 

for( entity = 1; entity < maxentities; entity++) { 
	if ( !is_valid_ent( entity ) ) 
		continue; 
	
	new owner = entity_get_edict( entity, EV_ENT_owner ); 
	if( owner == id ) { 
		
		new szModel[32]; 
		entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
		
		if( containi( szModel, "aura" ) != -1 ) { 
			entity_set_int( entity, EV_INT_skin, 4 ); 
		} 
	} 
}

}

else if( CoolerTransFX1[id] !=0 )

{

}

else if ( coolerClass[id] !=0 || cooler2Class[id] !=0 )

{

	new Float:vOrigin[3]; 
	entity_get_vector( id, EV_VEC_origin, vOrigin ); 
	
	new ent = find_ent_in_sphere( -1, vOrigin, 64.0 ); 
	while( ent > 0 )
		
	{ 
		
		new szModel[32]; 
		entity_get_string( ent, EV_SZ_model, szModel, 31 ); 
		if( containi( szModel, "sprites/deathball.spr" ) != -1 )
			
		{ 
			
			entity_set_model( ent, "sprites/evossj4/supernova.spr" ); 
			
		} 
		
		ent = find_ent_in_sphere( ent, vOrigin, 64.0 ); 
		
		
	}  

}

else if ( gotenClass[id] !=0 )

{

new entity; 
new maxentities = get_global_int(GL_maxEntities); 

for( entity = 1; entity < maxentities; entity++) { 
	if ( !is_valid_ent( entity ) ) 
		continue; 
	
	new owner = entity_get_edict( entity, EV_ENT_owner ); 
	if( owner == id ) { 
		
		new szModel[32]; 
		entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
		
		if( containi( szModel, "aura" ) != -1 ) { 
			entity_set_int( entity, EV_INT_skin, 0 ); 
		} 
	} 
}

}

else if ( gotenTransing[id] !=0 || gotenSSJClass[id] !=0 )

{

new entity; 
new maxentities = get_global_int(GL_maxEntities); 

for( entity = 1; entity < maxentities; entity++) { 
	if ( !is_valid_ent( entity ) ) 
		continue; 
	
	new owner = entity_get_edict( entity, EV_ENT_owner ); 
	if( owner == id ) { 
		
		new szModel[32]; 
		entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
		
		if( containi( szModel, "aura" ) != -1 ) { 
			entity_set_int( entity, EV_INT_skin, 4 ); 
		} 
	} 
}

}

else if ( SSJHairFaderArray[id] !=0 )

{

/*
	new Float:angles[3]
	entity_get_vector(id, EV_VEC_angles, angles)
		
	entity_set_vector(SSJHairFaderArray[id], EV_VEC_angles, angles)
		
	entity_set_int(SSJHairFaderArray[id], EV_INT_fixangle,1)

	entity_set_float(SSJHairFaderArray[id], EV_FL_frame, entity_get_float( id, EV_FL_frame ) ); 
*/

}

	else if(Kaioken[id] !=0 )

	{

	new anim = entity_get_int(id, EV_INT_sequence)

	if( anim == 36 || anim == 37 || anim == 38 || anim == 39 || anim == 40 || anim == 41 )

	{

		if ( KaiokenTrailActive[id] !=0 )

		{
			return PLUGIN_CONTINUE

		}

		else

		{

		
			if ( Kaioken[id] !=0 )

			{

				set_user_rendering(id, kRenderFxGlowShell, 255, 48, 48, kRenderNormal, 255 )
				entity_set_float(id, EV_FL_fuser4, 1000.0 )
				message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
				write_byte( 22 ) // TE_BEAMFOLLOW 
				write_short( id ) // Entity 
				write_short( kk_trail ) // Precached in "plugin_precache" 
				write_byte( 10 ) // Life 
				write_byte( 8 ) // Width
				write_byte( 255 ) // red 
				write_byte( 255 ) // green 
				write_byte( 255 ) // blue
				write_byte( 196 ) // Brightness 
				message_end() 

				Kaioken_jump[id] = 1
				Kaioken_jump_active[id] = 1

				KaiokenTrailActive[id] = 1


				return PLUGIN_CONTINUE

			}

			else if ( Kaioken_jump_active[id] !=0 )

			{

				Kaioken_jump_active[id] = 0

			}

		}

	}

	else

	{

		if ( KaiokenTrailActive[id] !=0 )

		{

			entity_set_float(id, EV_FL_fuser4, 1000.0 )
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
			write_byte( 99 )
			write_short(id)
			message_end()
			new spriteorigin[3];
			get_user_origin(id,spriteorigin);
			message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
			write_byte(17);
			write_coord(spriteorigin[0]); // coord, coord, coord (position)
			write_coord(spriteorigin[1]);
			write_coord(spriteorigin[2]);
			write_short(kk_flash); // short (sprite index)
			write_byte(15); // byte (scale in 0.1's)  
			write_byte(100); // byte (brightness)
			message_end();

			set_user_rendering(id, kRenderFxGlowShell, 255, 48, 48, kRenderNormal, 6)

			KaiokenTrailActive[id] = 0

			return PLUGIN_CONTINUE

		}

		else

		{

			entity_set_float(id, EV_FL_fuser4, 1000.0 )
			set_user_rendering(id, kRenderFxGlowShell, 255, 48, 48, kRenderNormal, 6)

		}

		return PLUGIN_CONTINUE

	}

	}


else if( PowerupMod[id] !=0 )

{

set_user_rendering( id, kRenderFxGlowShell, 0, 0, 0, kRenderTransAdd, 0 )
set_rendering(avatars[id], kRenderFxHologram, 200, 200, 200, kRenderNormal, 50 )
set_rendering(avatars2[id], kRenderFxHologram, 200, 200, 200, kRenderNormal, 50 )

}


else if( brolly_avatar[id] !=0 )

{

set_user_rendering( id, kRenderFxNone, 0, 0, 0, kRenderTransAdd, 0 )

}

else if( LSSJbrolly_avatar[id] !=0 )

{

set_user_rendering( id, kRenderFxGlowShell, 0, 0, 0, kRenderTransAdd, 0 )

}

else if( GogetaSSJ2_avatar[id] !=0 )

{

set_user_rendering( id, kRenderFxNone, 0, 0, 0, kRenderTransAdd, 1 )
set_rendering(GogetaSSJ2_avatar[id], kRenderFxGlowShell, 255, 255, 0, kRenderNormal, 6)
entity_set_float( id, EV_FL_fuser1, 470.0 )
entity_set_float( id, EV_FL_fuser4, 1000.0 )
if( istransing[id] == 0 ) 
	if( ascend[id] == 1 ) 
	ascend[id] = 0;
new entity; 
new maxentities = get_global_int(GL_maxEntities); 

for( entity = 1; entity < maxentities; entity++) { 
	if ( !is_valid_ent( entity ) ) 
		continue; 
	
	new owner = entity_get_edict( entity, EV_ENT_owner ); 
	if( owner == id ) { 
		
		new szModel[32]; 
		entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
		
		if( containi( szModel, "aura" ) != -1 ) { 
			entity_set_int( entity, EV_INT_skin, 4 ); 
		} 
	} 
}

}

else if( GogetaSSJ4_avatar[id] !=0 )

{

set_user_rendering( id, kRenderFxNone, 0, 0, 0, kRenderTransAdd, 1 )
set_rendering(GogetaSSJ4_avatar[id], kRenderFxGlowShell, 255, 0, 0, kRenderNormal, 6)
entity_set_float( id, EV_FL_fuser1, 500.0 )
entity_set_float( id, EV_FL_fuser4, 1000.0 )
if( istransing[id] == 0 ) 
	if( ascend[id] == 1 ) 
	ascend[id] = 0;
new entity; 
new maxentities = get_global_int(GL_maxEntities); 

for( entity = 1; entity < maxentities; entity++) { 
	if ( !is_valid_ent( entity ) ) 
		continue; 
	
	new owner = entity_get_edict( entity, EV_ENT_owner ); 
	if( owner == id ) { 
		
		new szModel[32]; 
		entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
		
		if( containi( szModel, "aura" ) != -1 ) { 
			entity_set_int( entity, EV_INT_skin, 4 ); 
		} 
	} 
}

}

else if( KIMod[id] !=0 )

{

entity_get_float( id, EV_FL_fuser4 );
entity_set_float( id, EV_FL_fuser4, 1000.0 )

}

else if( cInfiniteKI[id] !=0 )

{

entity_get_float( id, EV_FL_fuser4 );
entity_set_float( id, EV_FL_fuser4, 1000.0 )

}

else if( cGod[id] !=0 )

{

set_user_health(id, 255)

}

else if( Powerlevel1[id] !=0 )

{

set_pdata_int(id,460, 1000000 )
set_pdata_int(id,461, 1000000 )

}

else if( Powerlevel2[id] !=0 )

{

set_pdata_int(id, 460, 10000000 )
set_pdata_int(id, 461, 10000000 )

}

else if( Powerlevel3[id] !=0 )

{

set_pdata_int(id, 460, 666666666 )
set_pdata_int(id, 461, 666666666 )

}

else if( Powerlevel4[id] !=0 )

{

set_pdata_int(id, 460, 999999999 )
set_pdata_int(id, 461, 999999999 )

}

else if( Kaioken1[id] !=0 )

{

set_user_health(id, 110 )

}

else if( Kaioken2[id] !=0 )

{

set_user_health(id, 130 )

}

else if( KIMod[id] !=0 )

{

entity_set_float(id, EV_FL_fuser4, 1000.0 )

}

else if( giji_avatar[id] !=0 )

{

new anim = entity_get_int(id, EV_INT_sequence)

if ( anim == 36 || anim == 37 || anim == 38 || anim == 39 || anim == 40 || anim == 41 )
	
{
	
	set_rendering(giji_avatar[id], kRenderFxGlowShell, 255, 215, 0, kRenderNormal, 5);
	set_user_rendering( id, kRenderFxNone, 0, 0, 0, kRenderTransAdd, 1 )
	
}

else if ( entity_get_float(id, EV_FL_fuser4 ) == 0 )
	
{
	
	entity_set_float(id, EV_FL_fuser4, 1)
	remove_entity(giji_avatar[id])
	
	giji_avatar[id] = 0
	
	new health = get_user_health(id)
	new health_set = health - 15
	set_user_health(id, health_set)
	
	message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
	write_byte( 110 );
	message_end( );
	
	new Float:powerlevel = get_pdata_float( id, 460 )
	set_pdata_float(id, 460, powerlevel / 1.3 )
	set_pdata_float(id, 461, powerlevel / 1.3 )
	
	new speed = get_pdata_int(id, 459)
	new speed2 = get_pdata_int(id, 462)
	set_pdata_int(id, 459, speed - 20 )
	set_pdata_int(id, 462, speed2 - 20 )
	
	set_user_rendering(id, kRenderFxNone, 0, 0, 0, kRenderNormal, 255);
	
	strip_user_weapons(id)
	
	give_item(id, "weapon_melee")
	give_item(id, "weapon_kiblast")
	give_item(id, "weapon_genericbeam")
	give_item(id, "weapon_kamehameha")
	give_item(id, "weapon_spiritbomb")
	give_item(id, "weapon_solarflare")
	give_item(id, "weapon_kametorpedo")
	give_item(id, "weapon_sensu")
	
	message_begin(MSG_ONE,get_user_msgid("ScreenFade"),{0,0,0},id) 
	write_short(1000) // fade lasts this long duration 
	write_short(1000) // fade lasts this long hold time 
	write_short(1<<12) // fade type (in / out) 
	write_byte(255) // fade red 
	write_byte(255) // fade green 
	write_byte(255) // fade blue 
	write_byte(255) // fade alpha 
	message_end()
	
	remove_task(id)
	
}

else

{
	
	set_rendering(giji_avatar[id], kRenderFxGlowShell, 255, 215, 0, kRenderNormal, 5);
	set_user_rendering( id, kRenderFxNone, 0, 0, 0, kRenderTransAdd, 1 )
	
}

new entity; 
new maxentities = get_global_int(GL_maxEntities); 

for( entity = 1; entity < maxentities; entity++) { 
	if ( !is_valid_ent( entity ) ) 
		continue; 
	
	new owner = entity_get_edict( entity, EV_ENT_owner ); 
	if( owner == id ) { 
		
		new szModel[32]; 
		entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
		
		if( containi( szModel, "aura" ) != -1 ) { 
			entity_set_int( entity, EV_INT_skin, 4 ); 
		} 
	} 
}

}

else if ( giji_transforming[id] !=0 )

{

engclient_cmd(id,"+powerup")

new vec1[3]
get_user_origin(id, vec1, 0)
new vec2[3]
get_user_origin(id, vec2)

message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
write_byte( 0 );
write_coord(vec1[0]);
write_coord(vec1[1]);
write_coord(vec1[2]);
write_coord(vec2[0]);
write_coord(vec2[1]);
write_coord(vec2[2]);
write_short( light );
write_byte( 1 ); // framestart 
write_byte( 5 ); // framerate 
write_byte( 2 ); // life 
write_byte( 20 ); // width 
//write_byte( 30 ); // noise 
write_byte(30);
write_byte( 200 ); // r, g, b 
write_byte( 200 ); // r, g, b 
write_byte( 200 ); // r, g, b 
write_byte( 200 ); // brightness 
write_byte( 200 ); // speed 
message_end();

message_begin( MSG_PVS, SVC_TEMPENTITY,vec2) 
write_byte( 9 ) 
write_coord( vec2[0] ) 
write_coord( vec2[1] ) 
write_coord( vec2[2] ) 
message_end() 

new origin[3], eOrigin[3]; 
new Float:vel[3]; 

//Get our origin.. Part of distance calculation 
get_user_origin( id, origin ); 

//Simply find all players near us. then get their current velocity and then invert it 
new players[32]; 
new num, player; 
get_players(players, num, "a");      //Don't get dead players. 
for (new i = 0; i < num; i++) { 
	player = players[i];      //Just easier this way. 
	
	if( player != id ) { 
		
		//Check their range. 
		get_user_origin( player, eOrigin ); 
		
		if( get_distance( origin, eOrigin ) <= 256 ) { 
			//Get and invert their velocity. 
			entity_get_vector( player, EV_VEC_velocity, vel ); 
			
			//Multiply it.. 
			vel[0] *= 10.0; 
			vel[1] *= 10.0; 
			vel[2] *= 10.0; 
			
			//Invert ( since small doesn't let me just do this vel[0] = -vel[0], 
			// I have to do it this way.. ) 
			vel[0] -= (vel[0] * 2.0); 
			vel[1] -= (vel[1] * 2.0); 
			vel[2] -= (vel[2] * 2.0); 
			
			//Set it back 
			entity_set_vector( player, EV_VEC_velocity, vel ); 
			
		} 
	} 
}

}

else if ( SSJ4transing[id] !=0 )

{

new origin[3], eOrigin[3]; 
new Float:vel[3]; 

//Get our origin.. Part of distance calculation 
get_user_origin( id, origin ); 

//Simply find all players near us. then get their current velocity and then invert it 
new players[32]; 
new num, player; 
get_players(players, num, "a");      //Don't get dead players. 
for (new i = 0; i < num; i++) { 
	player = players[i];      //Just easier this way. 
	
	if( player != id ) { 
		
		//Check their range. 
		get_user_origin( player, eOrigin ); 
		
		if( get_distance( origin, eOrigin ) <= 256 ) { 
			//Get and invert their velocity. 
			entity_get_vector( player, EV_VEC_velocity, vel ); 
			
			//Multiply it.. 
			vel[0] *= 10.0; 
			vel[1] *= 10.0; 
			vel[2] *= 10.0; 
			
			//Invert ( since small doesn't let me just do this vel[0] = -vel[0], 
			// I have to do it this way.. ) 
			vel[0] -= (vel[0] * 2.0); 
			vel[1] -= (vel[1] * 2.0); 
			vel[2] -= (vel[2] * 2.0); 
			
			//Set it back 
			entity_set_vector( player, EV_VEC_velocity, vel ); 
			
		} 
	} 
}

new entity; 
new maxentities = get_global_int(GL_maxEntities); 

for( entity = 1; entity < maxentities; entity++) { 
	if ( !is_valid_ent( entity ) ) 
		continue; 
	
	new owner = entity_get_edict( entity, EV_ENT_owner ); 
	if( owner == id ) { 
		
		new szModel[32]; 
		entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
		
		if( containi( szModel, "aura" ) != -1 ) { 
			entity_set_int( entity, EV_INT_skin, 3 ); 
		} 
		
	} 
}

}


else

{

}

return PLUGIN_CONTINUE

}

public USSJFXWAITUNBLOCK(id)

{

	USSJFXWAIT[id] = 0

	return PLUGIN_CONTINUE

}

public SSJ3FXWAITUNBLOCK(id)

{

	SSJ3FXWAIT[id] = 0

	return PLUGIN_CONTINUE

}

public SSJ2FXWAITUNBLOCK(id)

{

	SSJ2FXWAIT[id] = 0

	return PLUGIN_CONTINUE

}

public MAJINFXWAITUNBLOCK(id)

{

	MAJINFXWAIT[id] = 0

	return PLUGIN_CONTINUE

}

public BFXrelease(id)

{

	BFXWAIT[id] = 0

	return PLUGIN_CONTINUE

}


/*
public client_PreThink(id)

{

new anim = entity_get_int(id, EV_INT_sequence)

new ki = entity_get_float(id, EV_FL_fuser4)

if( anim == 36 || anim == 37 || anim == 38 || anim == 39 || anim == 40 || anim == 41 )

{

if ( TrailActive[id] !=0 )
	
{

	if ( get_pdata_int(id, 196) !=0 )

	{

		new entity; 
		new maxentities = get_global_int(GL_maxEntities); 

		for( entity = 1; entity < maxentities; entity++)

		{ 

		if ( !is_valid_ent( entity ) ) 
			continue; 
	
		new owner = entity_get_edict( entity, EV_ENT_owner ); 
		if( owner == id )

		{ 
		
			new szModel[32]; 
			entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
		
			if( containi( szModel, "aura" ) != -1 )

			{ 
				new auracolor = entity_get_int(entity, EV_INT_skin)

				new origin[3]

				get_user_origin(id, origin)

				if ( auracolor == 0 )

				{

		        	        message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
      					write_byte( 28 ); 
      					write_short( id ); 
      					write_coord( origin[0] ); 
      					write_coord( origin[1] ); 
      					write_coord( origin[2] ); 
      					write_coord( 350 ); 
      					write_byte( 255 ); // r
      					write_byte( 255 ); // g
      					write_byte( 255 ); // b
      					write_byte( 0.1 ); 
      					write_coord( 0 ); 
      					message_end(); 

				}

				else if ( auracolor == 1 )

				{ 

		        	        message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
      					write_byte( 28 ); 
      					write_short( id ); 
      					write_coord( origin[0] ); 
      					write_coord( origin[1] ); 
      					write_coord( origin[2] ); 
      					write_coord( 350 ); 
      					write_byte( 48 ); // r
      					write_byte( 255 ); // g
      					write_byte( 48 ); // b
      					write_byte( 0.1 ); 
      					write_coord( 0 ); 
      					message_end(); 

				}


				else if ( auracolor == 2 )

				{ 

		        	        message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
	      				write_byte( 28 ); 
	      				write_short( id ); 
	      				write_coord( origin[0] ); 
	      				write_coord( origin[1] ); 
	      				write_coord( origin[2] ); 
	      				write_coord( 350 ); 
	      				write_byte( 255 ); // r
	      				write_byte( 0 ); // g
	      				write_byte( 200 ); // b
	      				write_byte( 0.1 ); 
	      				write_coord( 0 ); 
	      				message_end(); 

				}


				else if ( auracolor == 3 )

				{ 

		        	        message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
	      				write_byte( 28 ); 
	      				write_short( id ); 
	      				write_coord( origin[0] ); 
	      				write_coord( origin[1] ); 
	      				write_coord( origin[2] ); 
	      				write_coord( 350 ); 
	      				write_byte( 255 ); // r
	      				write_byte( 48 ); // g
	      				write_byte( 48 ); // b
	      				write_byte( 0.1 ); 
	      				write_coord( 0 ); 
	      				message_end(); 

				}


				else if ( auracolor == 4 )

				{ 

		        	        message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
	      				write_byte( 28 ); 
	      				write_short( id ); 
	      				write_coord( origin[0] ); 
	      				write_coord( origin[1] ); 
	      				write_coord( origin[2] ); 
	      				write_coord( 350 ); 
	      				write_byte( 255 ); // r
	      				write_byte( 193 ); // g
	      				write_byte( 37 ); // b
	      				write_byte( 0.1 ); 
	      				write_coord( 0 ); 
	      				message_end(); 

				}
			} 
		
	}

	}

	} 
}
	
	return PLUGIN_CONTINUE
	
}

else

{
	
	new ClientClass = entity_get_int(id, EV_INT_playerclass)
	
	
	if ( brollyClass[id] !=0 )
		
	{
		
		message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
		write_byte( 22 ) // TE_BEAMFOLLOW 
		write_short( id ) // Entity 
		write_short( swooptrail ) // Precached in "plugin_precache" 
		write_byte( 15 ) // Life 
		write_byte( 5 ) // Width
		write_byte( 48 ) // red 
		write_byte( 255 ) // green 
		write_byte( 48 ) // blue
		write_byte( 36 ) // Brightness 
		message_end() 
		
		TrailActive[id] = 1
		
		return PLUGIN_CONTINUE
		
	}
	
	else if ( brollySSJClass[id] !=0 || brollyLSSJClass[id] !=0 )
		
	{
		
		message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
		write_byte( 22 ) // TE_BEAMFOLLOW 
		write_short( id ) // Entity 
		write_short( swooptrail ) // Precached in "plugin_precache" 
		write_byte( 15 ) // Life 
		write_byte( 5 ) // Width
		write_byte( 255 ) // red 
		write_byte( 215 ) // green 
		write_byte( 0 ) // blue
		write_byte( 36 ) // Brightness 
		message_end() 
		
		TrailActive[id] = 1
		
		return PLUGIN_CONTINUE
		
	}
	
	else if ( coolerClass[id] !=0 || cooler2Class[id] !=0 )
		
	{
		
		message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
		write_byte( 22 ) // TE_BEAMFOLLOW 
		write_short( id ) // Entity 
		write_short( swooptrail ) // Precached in "plugin_precache" 
		write_byte( 15 ) // Life 
		write_byte( 5 ) // Width
		write_byte( 240 ) // red 
		write_byte( 128 ) // green 
		write_byte( 128 ) // blue
		write_byte( 36 ) // Brightness 
		message_end() 
		
		TrailActive[id] = 1
		
		return PLUGIN_CONTINUE
		
	}
	
	else if ( coolerMetaClass[id] !=0 )
		
	{
		
		return PLUGIN_CONTINUE
		
	}
	
	
	else if ( gotenClass[id] !=0 )
		
	{
		
		message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
		write_byte( 22 ) // TE_BEAMFOLLOW 
		write_short( id ) // Entity 
		write_short( swooptrail ) // Precached in "plugin_precache" 
		write_byte( 15 ) // Life 
		write_byte( 5 ) // Width
		write_byte( 255 ) // red 
		write_byte( 255 ) // green 
		write_byte( 255 ) // blue
		write_byte( 36 ) // Brightness 
		message_end() 
		
		TrailActive[id] = 1
		
		return PLUGIN_CONTINUE
		
	}
	
	else if ( gotenSSJClass[id] !=0 )
		
	{
		message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
		write_byte( 22 ) // TE_BEAMFOLLOW 
		write_short( id ) // Entity 
		write_short( swooptrail ) // Precached in "plugin_precache" 
		write_byte( 15 ) // Life 
		write_byte( 5 ) // Width
		write_byte( 255 ) // red 
		write_byte( 215 ) // green 
		write_byte( 0 ) // blue
		write_byte( 36 ) // Brightness 
		message_end() 
		
		TrailActive[id] = 1
		
		return PLUGIN_CONTINUE
		
	}
	
	
	else if ( ClientClass == 1 )
		
	{
		
		message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
		write_byte( 22 ) // TE_BEAMFOLLOW 
		write_short( id ) // Entity 
		write_short( swooptrail ) // Precached in "plugin_precache" 
		write_byte( 15 ) // Life 
		write_byte( 5 ) // Width
		write_byte( 240 ) // red 
		write_byte( 128 ) // green 
		write_byte( 128 ) // blue
		write_byte( 36 ) // Brightness 
		message_end() 
		
		TrailActive[id] = 1
		
		
		return PLUGIN_CONTINUE
		
	}
	
	else if ( ClientClass == 2 )
		
	{
		
		if ( ascend[id] !=0 )
			
		{
			
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
			write_byte( 22 ) // TE_BEAMFOLLOW 
			write_short( id ) // Entity 
			write_short( swooptrail ) // Precached in "plugin_precache" 
			write_byte( 15 ) // Life 
			write_byte( 5 ) // Width
			write_byte( 255 ) // red 
			write_byte( 215 ) // green 
			write_byte( 0 ) // blue
			write_byte( 36 ) // Brightness 
			message_end() 
			
			TrailActive[id] = 1
			
			return PLUGIN_CONTINUE
			
		}

		else if ( avatars[id] !=0 )

		{

			message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
			write_byte( 22 ) // TE_BEAMFOLLOW 
			write_short( id ) // Entity 
			write_short( swooptrail ) // Precached in "plugin_precache" 
			write_byte( 15 ) // Life 
			write_byte( 5 ) // Width
			write_byte( 255 ) // red 
			write_byte( 215 ) // green 
			write_byte( 0 ) // blue
			write_byte( 36 ) // Brightness 
			message_end()

			set_pdata_int(id, 459, 2000 )
			entity_set_float(id, EV_FL_fuser1, 2000.0 ) 
			
			TrailActive[id] = 1
			
			return PLUGIN_CONTINUE
			
		}
		
		else
		
		{
			
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
			write_byte( 22 ) // TE_BEAMFOLLOW 
			write_short( id ) // Entity 
			write_short( swooptrail ) // Precached in "plugin_precache" 
			write_byte( 15 ) // Life 
			write_byte( 5 ) // Width
			write_byte( 255 ) // red 
			write_byte( 255 ) // green 
			write_byte( 255 ) // blue
			write_byte( 36 ) // Brightness 
			message_end() 
			
			TrailActive[id] = 1
			
			return PLUGIN_CONTINUE
			
		}
		
	}
	
	else if ( ClientClass == 3 )
		
	
	{
		
		if ( ascend[id] !=0 )
			
		{
			
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
			write_byte( 22 ) // TE_BEAMFOLLOW 
			write_short( id ) // Entity 
			write_short( swooptrail ) // Precached in "plugin_precache" 
			write_byte( 15 ) // Life 
			write_byte( 5 ) // Width
			write_byte( 255 ) // red 
			write_byte( 215 ) // green 
			write_byte( 0 ) // blue
			write_byte( 36 ) // Brightness 
			message_end() 
			
			TrailActive[id] = 1
			
			return PLUGIN_CONTINUE
			
		}
		
		else
		
		{
			
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
			write_byte( 22 ) // TE_BEAMFOLLOW 
			write_short( id ) // Entity 
			write_short( swooptrail ) // Precached in "plugin_precache" 
			write_byte( 15 ) // Life 
			write_byte( 5 ) // Width
			write_byte( 255 ) // red 
			write_byte( 255 ) // green 
			write_byte( 255 ) // blue
			write_byte( 36 ) // Brightness 
			message_end() 
			
			TrailActive[id] = 1
			
			return PLUGIN_CONTINUE
			
		}
		
	}
	
	
	else if ( ClientClass == 4 )
		
	{
		
		message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
		write_byte( 22 ) // TE_BEAMFOLLOW 
		write_short( id ) // Entity 
		write_short( swooptrail ) // Precached in "plugin_precache" 
		write_byte( 15 ) // Life 
		write_byte( 5 ) // Width
		write_byte( 255 ) // red 
		write_byte( 255 ) // green 
		write_byte( 255 ) // blue
		write_byte( 36 ) // Brightness 
		message_end() 
		
		TrailActive[id] = 1
		
		return PLUGIN_CONTINUE
		
	}
	
	
	else if ( ClientClass == 5 )
		
	{
		
		message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
		write_byte( 22 ) // TE_BEAMFOLLOW 
		write_short( id ) // Entity 
		write_short( swooptrail ) // Precached in "plugin_precache" 
		write_byte( 15 ) // Life 
		write_byte( 5 ) // Width
		write_byte( 240 ) // red 
		write_byte( 128 ) // green 
		write_byte( 128 ) // blue
		write_byte( 36 ) // Brightness 
		message_end() 
		
		TrailActive[id] = 1
		
		return PLUGIN_CONTINUE
		
	}
	
	else if ( ClientClass == 6 )
		
	{
		
		message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
		write_byte( 22 ) // TE_BEAMFOLLOW 
		write_short( id ) // Entity 
		write_short( swooptrail ) // Precached in "plugin_precache" 
		write_byte( 15 ) // Life 
		write_byte( 5 ) // Width
		write_byte( 255 ) // red 
		write_byte( 255 ) // green 
		write_byte( 255 ) // blue
		write_byte( 36 ) // Brightness 
		message_end()
		
		TrailActive[id] = 1
		
		return PLUGIN_CONTINUE 
		
		
	}
	
	else if ( ClientClass == 7 )
		
	{
		
		if ( ascend[id] !=0 )
			
		
		{
			
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
			write_byte( 22 ) // TE_BEAMFOLLOW 
			write_short( id ) // Entity 
			write_short( swooptrail ) // Precached in "plugin_precache" 
			write_byte( 15 ) // Life 
			write_byte( 5 ) // Width
			write_byte( 255 ) // red 
			write_byte( 215 ) // green 
			write_byte( 0 ) // blue
			write_byte( 36 ) // Brightness 
			message_end() 
			
			TrailActive[id] = 1
			
			return PLUGIN_CONTINUE
			
		}
		
		else
		
		{
			
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
			write_byte( 22 ) // TE_BEAMFOLLOW 
			write_short( id ) // Entity 
			write_short( swooptrail ) // Precached in "plugin_precache" 
			write_byte( 15 ) // Life 
			write_byte( 5 ) // Width
			write_byte( 255 ) // red 
			write_byte( 255 ) // green 
			write_byte( 255 ) // blue
			write_byte( 36 ) // Brightness 
			message_end() 
			
			TrailActive[id] = 1
			
			return PLUGIN_CONTINUE
			
		}
		
	}
	
	else if ( ClientClass == 8 )
		
	{
		
		if ( ascend[id] !=0 )
			
		{
			
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
			write_byte( 22 ) // TE_BEAMFOLLOW 
			write_short( id ) // Entity 
			write_short( swooptrail ) // Precached in "plugin_precache" 
			write_byte( 15 ) // Life 
			write_byte( 5 ) // Width
			write_byte( 255 ) // red 
			write_byte( 215 ) // green 
			write_byte( 0 ) // blue
			write_byte( 36 ) // Brightness 
			message_end() 
			
			TrailActive[id] = 1
			
			return PLUGIN_CONTINUE
			
		}
		
		else
		
		{
			
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
			write_byte( 22 ) // TE_BEAMFOLLOW 
			write_short( id ) // Entity 
			write_short( swooptrail ) // Precached in "plugin_precache" 
			write_byte( 15 ) // Life 
			write_byte( 5 ) // Width
			write_byte( 255 ) // red 
			write_byte( 255 ) // green 
			write_byte( 255 ) // blue
			write_byte( 36 ) // Brightness 
			message_end() 
			
			TrailActive[id] = 1
			
			return PLUGIN_CONTINUE
			
		}
		
	}
	
	else if ( ClientClass == 9 )
		
	{
		
		message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
		write_byte( 22 ) // TE_BEAMFOLLOW 
		write_short( id ) // Entity 
		write_short( swooptrail ) // Precached in "plugin_precache" 
		write_byte( 15 ) // Life 
		write_byte( 5 ) // Width
		write_byte( 0 ) // red 
		write_byte( 205 ) // green 
		write_byte( 0 ) // blue
		write_byte( 36 ) // Brightness 
		message_end()
		
		TrailActive[id] = 1
		
		return PLUGIN_CONTINUE 
		
	}
}

}

else if ( anim == 103 )

{

rAscend[id] = 1

}

else if ( ki == 0.0 )

{

ascend[id] = 0
TrailActive[id] = 0
message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
write_byte( 99 )
write_short(id)
message_end()

return PLUGIN_CONTINUE

}

	else if ( get_pdata_int(id, 196) !=0 )

	{

		new entity; 
		new maxentities = get_global_int(GL_maxEntities); 

		for( entity = 1; entity < maxentities; entity++)

		{ 

		if ( !is_valid_ent( entity ) ) 
			continue; 
	
		new owner = entity_get_edict( entity, EV_ENT_owner ); 
		if( owner == id )

		{ 
		
			new szModel[32]; 
			entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
		
			if( containi( szModel, "aura" ) != -1 )

			{ 
				new auracolor = entity_get_int(entity, EV_INT_skin)

				new origin[3]

				get_user_origin(id, origin)

				if ( auracolor == 0 )

				{

		        	        message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
      					write_byte( 28 ); 
      					write_short( id ); 
      					write_coord( origin[0] ); 
      					write_coord( origin[1] ); 
      					write_coord( origin[2] ); 
      					write_coord( 350 ); 
      					write_byte( 255 ); // r
      					write_byte( 255 ); // g
      					write_byte( 255 ); // b
      					write_byte( 0.1 ); 
      					write_coord( 0 ); 
      					message_end(); 

				}

				else if ( auracolor == 1 )

				{ 

		        	        message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
      					write_byte( 28 ); 
      					write_short( id ); 
      					write_coord( origin[0] ); 
      					write_coord( origin[1] ); 
      					write_coord( origin[2] ); 
      					write_coord( 350 ); 
      					write_byte( 48 ); // r
      					write_byte( 255 ); // g
      					write_byte( 48 ); // b
      					write_byte( 0.1 ); 
      					write_coord( 0 ); 
      					message_end(); 

				}


				else if ( auracolor == 2 )

				{ 

		        	        message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
	      				write_byte( 28 ); 
	      				write_short( id ); 
	      				write_coord( origin[0] ); 
	      				write_coord( origin[1] ); 
	      				write_coord( origin[2] ); 
	      				write_coord( 350 ); 
	      				write_byte( 255 ); // r
	      				write_byte( 0 ); // g
	      				write_byte( 200 ); // b
	      				write_byte( 0.1 ); 
	      				write_coord( 0 ); 
	      				message_end(); 

				}


				else if ( auracolor == 3 )

				{ 

		        	        message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
	      				write_byte( 28 ); 
	      				write_short( id ); 
	      				write_coord( origin[0] ); 
	      				write_coord( origin[1] ); 
	      				write_coord( origin[2] ); 
	      				write_coord( 350 ); 
	      				write_byte( 255 ); // r
	      				write_byte( 48 ); // g
	      				write_byte( 48 ); // b
	      				write_byte( 0.1 ); 
	      				write_coord( 0 ); 
	      				message_end(); 

				}


				else if ( auracolor == 4 )

				{ 

		        	        message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
	      				write_byte( 28 ); 
	      				write_short( id ); 
	      				write_coord( origin[0] ); 
	      				write_coord( origin[1] ); 
	      				write_coord( origin[2] ); 
	      				write_coord( 350 ); 
	      				write_byte( 255 ); // r
	      				write_byte( 193 ); // g
	      				write_byte( 37 ); // b
	      				write_byte( 0.1 ); 
	      				write_coord( 0 ); 
	      				message_end(); 

				}
			} 
		
	}

	}

	}

else

{

if ( TrailActive[id] !=0 )
	
{
	
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
	write_byte( 99 )
	write_short(id)
	message_end()
	
	TrailActive[id] = 0
	
	return PLUGIN_CONTINUE
	
}

else

{
	
}

return PLUGIN_CONTINUE

}

return PLUGIN_CONTINUE

}

*/

public client_PreThink(id)

{

	new anim = entity_get_int(id, EV_INT_sequence)

	new ki = entity_get_float(id, EV_FL_fuser4)

	if( SSJ2transing[id] !=0 )

	{

		if ( AFXWAIT[id] !=0 )

		{

		}

		else

		{

			set_task(4.0,"AFXWAITUNBLOCK",id)

			AFXWAIT[id] = 1

			new origin[3]

			get_user_origin(id, origin)

			new CloudFXOrigin[3]

			get_user_origin(id, CloudFXOrigin)

			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] )
			write_coord( origin[1] + 5 )
			write_coord( origin[2] + 50)
			write_coord( origin[0] )
			write_coord( origin[1] + 5)
			write_coord( origin[2] - 50)
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 150 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 193 )
			write_byte( 37 )
			write_byte( 200 )
			write_byte( 0 )
			message_end()
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] )
			write_coord( origin[1] - 5 )
			write_coord( origin[2] + 50)
			write_coord( origin[0] )
			write_coord( origin[1] - 5)
			write_coord( origin[2] - 50)
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 150 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 193 )
			write_byte( 37 )
			write_byte( 200 )
			write_byte( 0 )
			message_end()
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] + 5 )
			write_coord( origin[1] )
			write_coord( origin[2] + 50 )
			write_coord( origin[0] + 5)
			write_coord( origin[1])
			write_coord( origin[2] - 50)
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 150 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 193 )
			write_byte( 37 )
			write_byte( 200 )
			write_byte( 0 )
			message_end()
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] - 5 )
			write_coord( origin[1] )
			write_coord( origin[2] + 50 )
			write_coord( origin[0] - 5)
			write_coord( origin[1] )
			write_coord( origin[2] - 50)
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 150 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 193 )
			write_byte( 37 )
			write_byte( 200 )
			write_byte( 0 )
			message_end()
	
//==============================================================

			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] )
			write_coord( origin[1] + 15 )
			write_coord( origin[2] + 50)
			write_coord( origin[0] )
			write_coord( origin[1] + 15)
			write_coord( origin[2] - 50)
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 150 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 193 )
			write_byte( 37 )
			write_byte( 200 )
			write_byte( 0 )
			message_end()
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] )
			write_coord( origin[1] - 15 )
			write_coord( origin[2] + 50)
			write_coord( origin[0] )
			write_coord( origin[1] - 15)
			write_coord( origin[2] - 50)
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 150 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 193 )
			write_byte( 37 )
			write_byte( 200 )
			write_byte( 0 )
			message_end()
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] + 15 )
			write_coord( origin[1] )
			write_coord( origin[2] + 50 )
			write_coord( origin[0] + 15)
			write_coord( origin[1] )
			write_coord( origin[2] - 50)
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 150 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 193 )
			write_byte( 37 )
			write_byte( 200 )
			write_byte( 0 )
			message_end()
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] - 15 )
			write_coord( origin[1] )
			write_coord( origin[2] + 50 )
			write_coord( origin[0] - 15)
			write_coord( origin[1] )
			write_coord( origin[2] - 50)
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 150 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 193 )
			write_byte( 37 )
			write_byte( 200 )
			write_byte( 0 )
			message_end()

			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] + 5)
			write_coord( origin[1] + 5 )
			write_coord( origin[2] + 50)
			write_coord( origin[0] + 5)
			write_coord( origin[1] + 5)
			write_coord( origin[2]  - 50)
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 150 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 193 )
			write_byte( 37 )
			write_byte( 200 )
			write_byte( 0 )
			message_end()
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] - 5)
			write_coord( origin[1] + 5 )
			write_coord( origin[2] + 50)
			write_coord( origin[0] - 5)
			write_coord( origin[1] + 5)
			write_coord( origin[2]  - 50)
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 150 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 193 )
			write_byte( 37 )
			write_byte( 200 )
			write_byte( 0 )
			message_end()
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] + 5)
			write_coord( origin[1] - 5 )
			write_coord( origin[2] + 50)
			write_coord( origin[0] + 5)
			write_coord( origin[1] - 5)
			write_coord( origin[2]  - 50)
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 150 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 193 )
			write_byte( 37 )
			write_byte( 200 )
			write_byte( 0 )
			message_end()
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] - 5)
			write_coord( origin[1] - 5 )
			write_coord( origin[2] + 50)
			write_coord( origin[0] - 5)
			write_coord( origin[1] - 5)
			write_coord( origin[2]  - 50)
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 150 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 193 )
			write_byte( 37 )
			write_byte( 200 )
			write_byte( 0 )
			message_end()



		}

	}

	else if( MAJINtransing[id] !=0 )

	{

		if ( AFXWAIT[id] !=0 )

		{

		}

		else

		{

			set_task(0.5,"AFXWAITUNBLOCK",id)

			AFXWAIT[id] = 1

/*
			new origin[3]

			get_user_origin(id, origin)

			new CloudFXOrigin[3]

			get_user_origin(id, CloudFXOrigin)

			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] )
			write_coord( origin[1] + 5 )
			write_coord( origin[2] + 50)
			write_coord( origin[0] )
			write_coord( origin[1] + 5)
			write_coord( origin[2] )
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 50 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 48 )
			write_byte( 48 )
			write_byte( 150 )
			write_byte( 0 )
			message_end()
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] )
			write_coord( origin[1] - 5 )
			write_coord( origin[2] + 50)
			write_coord( origin[0] )
			write_coord( origin[1] - 5)
			write_coord( origin[2] )
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 50 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 48 )
			write_byte( 48 )
			write_byte( 150 )
			write_byte( 0 )
			message_end()
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] + 5 )
			write_coord( origin[1] )
			write_coord( origin[2] + 50 )
			write_coord( origin[0] + 5)
			write_coord( origin[1] )
			write_coord( origin[2])
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 50 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 48 )
			write_byte( 48 )
			write_byte( 150 )
			write_byte( 0 )
			message_end()
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] - 5 )
			write_coord( origin[1] )
			write_coord( origin[2] + 50 )
			write_coord( origin[0] - 5)
			write_coord( origin[1] )
			write_coord( origin[2])
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 50 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 48 )
			write_byte( 48 )
			write_byte( 150 )
			write_byte( 0 )
			message_end()
	
//==============================================================

			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] )
			write_coord( origin[1] + 15 )
			write_coord( origin[2] + 50)
			write_coord( origin[0] )
			write_coord( origin[1] + 15)
			write_coord( origin[2] )
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 50 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 48 )
			write_byte( 48 )
			write_byte( 150 )
			write_byte( 0 )
			message_end()
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] )
			write_coord( origin[1] - 15 )
			write_coord( origin[2] + 50)
			write_coord( origin[0] )
			write_coord( origin[1] - 15)
			write_coord( origin[2] )
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 50 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 48 )
			write_byte( 48 )
			write_byte( 150 )
			write_byte( 0 )
			message_end()
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] + 15 )
			write_coord( origin[1] )
			write_coord( origin[2] + 50 )
			write_coord( origin[0] + 15)
			write_coord( origin[1] )
			write_coord( origin[2])
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 50 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 48 )
			write_byte( 48 )
			write_byte( 150 )
			write_byte( 0 )
			message_end()
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
			write_byte( 0 )
			write_coord( origin[0] - 15 )
			write_coord( origin[1] )
			write_coord( origin[2] + 50 )
			write_coord( origin[0] - 15)
			write_coord( origin[1] )
			write_coord( origin[2])
			write_short( pusprite )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 0.1 )
			write_byte( 50 )
			write_byte( 0 )
			write_byte( 255 )
			write_byte( 48 )
			write_byte( 48 )
			write_byte( 150 )
			write_byte( 0 )
			message_end()
*/

		}

	}

	else if( anim == 36 || anim == 37 || anim == 38 || anim == 39 || anim == 40 || anim == 41 )

	{

		if ( TrailActive[id] !=0 )

		{

			return PLUGIN_CONTINUE

		}

		else

		{

		new ClientClass = entity_get_int(id, EV_INT_playerclass)

		if ( brollyClass[id] !=0 )
		
		{
		
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
			write_byte( 22 ) // TE_BEAMFOLLOW 
			write_short( id ) // Entity 
			write_short( swooptrail ) // Precached in "plugin_precache" 
			write_byte( 15 ) // Life 
			write_byte( 5 ) // Width
			write_byte( 48 ) // red 
			write_byte( 255 ) // green 
			write_byte( 48 ) // blue
			write_byte( 36 ) // Brightness 
			message_end() 
		
			TrailActive[id] = 1
		
			return PLUGIN_CONTINUE
		
		}
	
		else if ( brollySSJClass[id] !=0 || brollyLSSJClass[id] !=0 )
		
		{
		
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
			write_byte( 22 ) // TE_BEAMFOLLOW 
			write_short( id ) // Entity 
			write_short( swooptrail ) // Precached in "plugin_precache" 
			write_byte( 15 ) // Life 
			write_byte( 5 ) // Width
			write_byte( 255 ) // red 
			write_byte( 215 ) // green 
			write_byte( 0 ) // blue
			write_byte( 36 ) // Brightness 
			message_end() 
		
			TrailActive[id] = 1
		
			return PLUGIN_CONTINUE
		
		}
	
		else if ( coolerClass[id] !=0 || cooler2Class[id] !=0 )
		
		{
		
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
			write_byte( 22 ) // TE_BEAMFOLLOW 
			write_short( id ) // Entity 
			write_short( swooptrail ) // Precached in "plugin_precache" 
			write_byte( 15 ) // Life 
			write_byte( 5 ) // Width
			write_byte( 240 ) // red 
			write_byte( 128 ) // green 
			write_byte( 128 ) // blue
			write_byte( 36 ) // Brightness 
			message_end()
		
			TrailActive[id] = 1
		
			return PLUGIN_CONTINUE
		
		}
	
		else if ( coolerMetaClass[id] !=0 )
		
		{
		
			return PLUGIN_CONTINUE
		
		}
	
	
		else if ( gotenClass[id] !=0 )
		
		{
		
			message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
			write_byte( 22 ) // TE_BEAMFOLLOW 
			write_short( id ) // Entity 
			write_short( swooptrail ) // Precached in "plugin_precache" 
			write_byte( 15 ) // Life 
			write_byte( 5 ) // Width
			write_byte( 255 ) // red 
			write_byte( 255 ) // green 
			write_byte( 255 ) // blue
			write_byte( 36 ) // Brightness 
			message_end() 
		
			TrailActive[id] = 1
		
			return PLUGIN_CONTINUE
		
		}
	
			else if ( gotenSSJClass[id] !=0 )
		
			{
				message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
				write_byte( 22 ) // TE_BEAMFOLLOW 
				write_short( id ) // Entity 
				write_short( swooptrail ) // Precached in "plugin_precache" 
				write_byte( 15 ) // Life 
				write_byte( 5 ) // Width
				write_byte( 255 ) // red 
				write_byte( 215 ) // green 
				write_byte( 0 ) // blue
				write_byte( 36 ) // Brightness 
				message_end() 
		
				TrailActive[id] = 1
		
				return PLUGIN_CONTINUE
		
			}

			else if ( ClientClass == 1 )

			{

				message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
				write_byte( 22 ) // TE_BEAMFOLLOW 
				write_short( id ) // Entity 
				write_short( swooptrail ) // Precached in "plugin_precache" 
				write_byte( 8 ) // Life 
				write_byte( 5 ) // Width
				write_byte( 240 ) // red 
				write_byte( 128 ) // green 
				write_byte( 128 ) // blue
				write_byte( 36 ) // Brightness 
				message_end() 

				TrailActive[id] = 1


				return PLUGIN_CONTINUE

			}

			else if ( ClientClass == 2 )

			{

				if ( ascend[id] !=0 )

				{

					message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
					write_byte( 22 ) // TE_BEAMFOLLOW 
					write_short( id ) // Entity 
					write_short( swooptrail ) // Precached in "plugin_precache" 
					write_byte( 8 ) // Life 
					write_byte( 5 ) // Width
					write_byte( 255 ) // red 
					write_byte( 215 ) // green 
					write_byte( 0 ) // blue
					write_byte( 36 ) // Brightness 
					message_end() 

					TrailActive[id] = 1

					return PLUGIN_CONTINUE

				}

				else if ( avatars[id] !=0 )

				{

					message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
					write_byte( 22 ) // TE_BEAMFOLLOW 
					write_short( id ) // Entity 
					write_short( swooptrail ) // Precached in "plugin_precache" 
					write_byte( 15 ) // Life 
					write_byte( 5 ) // Width
					write_byte( 255 ) // red 
					write_byte( 215 ) // green 
					write_byte( 0 ) // blue
					write_byte( 36 ) // Brightness 
					message_end()
			
					TrailActive[id] = 1
			
					return PLUGIN_CONTINUE
			
				}

				else

				{

					message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
					write_byte( 22 ) // TE_BEAMFOLLOW 
					write_short( id ) // Entity 
					write_short( swooptrail ) // Precached in "plugin_precache" 
					write_byte( 8 ) // Life 
					write_byte( 5 ) // Width
					write_byte( 255 ) // red 
					write_byte( 255 ) // green 
					write_byte( 255 ) // blue
					write_byte( 36 ) // Brightness 
					message_end() 

					TrailActive[id] = 1

					return PLUGIN_CONTINUE

				}

			}

			else if ( ClientClass == 3 )


			{

				if ( ascend[id] !=0 )

				{

					message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
					write_byte( 22 ) // TE_BEAMFOLLOW 
					write_short( id ) // Entity 
					write_short( swooptrail ) // Precached in "plugin_precache" 
					write_byte( 8 ) // Life 
					write_byte( 5 ) // Width
					write_byte( 255 ) // red 
					write_byte( 215 ) // green 
					write_byte( 0 ) // blue
					write_byte( 36 ) // Brightness 
					message_end() 

					TrailActive[id] = 1

					return PLUGIN_CONTINUE

				}

				else

				{

					message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
					write_byte( 22 ) // TE_BEAMFOLLOW 
					write_short( id ) // Entity 
					write_short( swooptrail ) // Precached in "plugin_precache" 
					write_byte( 8 ) // Life 
					write_byte( 5 ) // Width
					write_byte( 255 ) // red 
					write_byte( 255 ) // green 
					write_byte( 255 ) // blue
					write_byte( 36 ) // Brightness 
					message_end() 

					TrailActive[id] = 1

					return PLUGIN_CONTINUE

				}

			}


			else if ( ClientClass == 4 )

			{

				message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
				write_byte( 22 ) // TE_BEAMFOLLOW 
				write_short( id ) // Entity 
				write_short( swooptrail ) // Precached in "plugin_precache" 
				write_byte( 8 ) // Life 
				write_byte( 5 ) // Width
				write_byte( 255 ) // red 
				write_byte( 255 ) // green 
				write_byte( 255 ) // blue
				write_byte( 36 ) // Brightness 
				message_end() 

				TrailActive[id] = 1

				return PLUGIN_CONTINUE

			}


			else if ( ClientClass == 5 )

			{

				message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
				write_byte( 22 ) // TE_BEAMFOLLOW 
				write_short( id ) // Entity 
				write_short( swooptrail ) // Precached in "plugin_precache" 
				write_byte( 8 ) // Life 
				write_byte( 5 ) // Width
				write_byte( 240 ) // red 
				write_byte( 128 ) // green 
				write_byte( 128 ) // blue
				write_byte( 36 ) // Brightness 
				message_end() 
	
				TrailActive[id] = 1

				return PLUGIN_CONTINUE

			}

			else if ( ClientClass == 6 )

			{

				message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
				write_byte( 22 ) // TE_BEAMFOLLOW 
				write_short( id ) // Entity 
				write_short( swooptrail ) // Precached in "plugin_precache" 
				write_byte( 8 ) // Life 
				write_byte( 5 ) // Width
				write_byte( 255 ) // red 
				write_byte( 255 ) // green 
				write_byte( 255 ) // blue
				write_byte( 36 ) // Brightness 
				message_end()

				TrailActive[id] = 1

				return PLUGIN_CONTINUE 


			}

			else if ( ClientClass == 7 )

			{

				if ( ascend[id] !=0 )


				{

					message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
					write_byte( 22 ) // TE_BEAMFOLLOW 
					write_short( id ) // Entity 
					write_short( swooptrail ) // Precached in "plugin_precache" 
					write_byte( 8 ) // Life 
					write_byte( 5 ) // Width
					write_byte( 255 ) // red 
					write_byte( 215 ) // green 
					write_byte( 0 ) // blue
					write_byte( 36 ) // Brightness 
					message_end() 

					TrailActive[id] = 1

					return PLUGIN_CONTINUE

				}

				else

				{

					message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
					write_byte( 22 ) // TE_BEAMFOLLOW 
					write_short( id ) // Entity 
					write_short( swooptrail ) // Precached in "plugin_precache" 
					write_byte( 8 ) // Life 
					write_byte( 5 ) // Width
					write_byte( 255 ) // red 
					write_byte( 255 ) // green 
					write_byte( 255 ) // blue
					write_byte( 36 ) // Brightness 
					message_end() 
	
					TrailActive[id] = 1

					return PLUGIN_CONTINUE

				}

			}

			else if ( ClientClass == 8 )

			{

				if ( ascend[id] !=0 )

				{

					message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
					write_byte( 22 ) // TE_BEAMFOLLOW 
					write_short( id ) // Entity 
					write_short( swooptrail ) // Precached in "plugin_precache" 
					write_byte( 8 ) // Life 
					write_byte( 5 ) // Width
					write_byte( 255 ) // red 
					write_byte( 215 ) // green 
					write_byte( 0 ) // blue
					write_byte( 36 ) // Brightness 
					message_end()

					TrailActive[id] = 1

					return PLUGIN_CONTINUE

				}

				else

				{

					message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
					write_byte( 22 ) // TE_BEAMFOLLOW 
					write_short( id ) // Entity 
					write_short( swooptrail ) // Precached in "plugin_precache" 
					write_byte( 8 ) // Life 
					write_byte( 5 ) // Width
					write_byte( 255 ) // red 
					write_byte( 255 ) // green 
					write_byte( 255 ) // blue
					write_byte( 36 ) // Brightness 
					message_end() 

					TrailActive[id] = 1

					return PLUGIN_CONTINUE

				}

			}

			else if ( ClientClass == 9 )

			{

				message_begin( MSG_BROADCAST, SVC_TEMPENTITY ) 
				write_byte( 22 ) // TE_BEAMFOLLOW 
				write_short( id ) // Entity 
				write_short( swooptrail ) // Precached in "plugin_precache" 
				write_byte( 8 ) // Life 
				write_byte( 5 ) // Width
				write_byte( 0 ) // red 
				write_byte( 205 ) // green 
				write_byte( 0 ) // blue
				write_byte( 36 ) // Brightness 
				message_end()

				TrailActive[id] = 1

				return PLUGIN_CONTINUE 

			}

		}

	}

	else if ( get_user_button(id) & IN_JUMP )

	{

		new anim = entity_get_int(id, EV_INT_sequence)

		if ( anim == 0 || anim == 1 || anim == 2 )

		{

			jump_dust(id)

		}

	}

	else if ( anim == 103 )

	{

		if ( rAscend[id] !=0 )

		{

		}

		else

		{

			rAscend[id] = 1

		}

	}

	else if ( ki == 0.0 )

	{

		ascend[id] = 0
		TrailActive[id] = 0
		message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
		write_byte( 99 )
		write_short(id)
		message_end()

		return PLUGIN_CONTINUE

	}


	else

	{

		if ( TrailActive[id] !=0 )

		{

			message_begin( MSG_BROADCAST, SVC_TEMPENTITY )
			write_byte( 99 )
			write_short(id)
			message_end()

			TrailActive[id] = 0

			return PLUGIN_CONTINUE

		}

		else

		{

		}

		return PLUGIN_CONTINUE

	}

	return PLUGIN_CONTINUE

}

public jump_dust(id)

{

	new origin2[3]
	get_user_origin(id, origin2)

	message_begin(MSG_ONE,SVC_TEMPENTITY,{0,0,0},id)
	write_byte(TE_BEAMCYLINDER)
	write_coord(origin2[0])	// center pos
	write_coord(origin2[1])
	write_coord(origin2[2])	
	write_coord(origin2[0])	// axis and radius
	write_coord(origin2[1])
	write_coord(origin2[2] + 200)
	write_short(dustspr)	// sprite index
	write_byte(1)		// starting frame
	write_byte(5)		// frame rate
	write_byte(6)		// life
	write_byte(8)		// line width
	write_byte(1)		// noise
	write_byte(139)	// RED
	write_byte(90)	// GREEN
	write_byte(43)	// BLUE
	write_byte(255)	// brightness
	write_byte(0)	// scroll speed
	message_end()

	return PLUGIN_HANDLED

}

public AFXWAITUNBLOCK(id)

{

	AFXWAIT[id] = 0

}

public TurboLight( id )

{


		new entity; 
		new maxentities = get_global_int(GL_maxEntities); 

		for( entity = 1; entity < maxentities; entity++)

		{ 

		if ( !is_valid_ent( entity ) ) 
			continue; 
	
		new owner = entity_get_edict( entity, EV_ENT_owner ); 
		if( owner == id )

		{ 
		
			new szModel[32]; 
			entity_get_string( entity, EV_SZ_model, szModel, 31 ); 
		
			if( containi( szModel, "aura" ) != -1 )

			{ 
				new auracolor = entity_get_int(entity, EV_INT_skin)

				new origin[3]

				get_user_origin(id, origin)

				if ( auracolor == 0 )

				{

		        	        message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
      					write_byte( 27 ); 
      					write_coord( origin[0] ); 
      					write_coord( origin[1] ); 
      					write_coord( origin[2] ); 
					write_byte( 350 ) // radius 
      					write_byte( 255 ); // r
      					write_byte( 255 ); // g
      					write_byte( 255 ); // b
      					write_byte( 200 ); 
					write_byte( 10 )
      					write_byte( 0 ); 
      					message_end(); 

				}

				else if ( auracolor == 1 )

				{ 

		        	        message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
      					write_byte( 27 ); 
      					write_coord( origin[0] ); 
      					write_coord( origin[1] ); 
      					write_coord( origin[2] ); 
					write_byte( 350 ) // radius 
      					write_byte( 48 ); // r
      					write_byte( 255 ); // g
      					write_byte( 48 ); // b
      					write_byte( 200 ); 
					write_byte( 10 )
      					write_byte( 0 ); 
      					message_end(); 

				}


				else if ( auracolor == 2 )

				{ 

		        	        message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
      					write_byte( 27 ); 
      					write_coord( origin[0] ); 
      					write_coord( origin[1] ); 
      					write_coord( origin[2] ); 
					write_byte( 350 ) // radius 
      					write_byte( 255 ); // r
      					write_byte( 0 ); // g
      					write_byte( 200 ); // b
      					write_byte( 200 ); 
					write_byte( 10 )
      					write_byte( 0 ); 
      					message_end();  

				}


				else if ( auracolor == 3 )

				{ 

		        	        message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
      					write_byte( 27 ); 
      					write_coord( origin[0] ); 
      					write_coord( origin[1] ); 
      					write_coord( origin[2] ); 
					write_byte( 350 ) // radius 
      					write_byte( 255 ); // r
      					write_byte( 48 ); // g
      					write_byte( 48 ); // b
      					write_byte( 200 ); 
					write_byte( 10 )
      					write_byte( 0 ); 
      					message_end(); 

				}


				else if ( auracolor == 4 )

				{ 
		        	        message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
      					write_byte( 27 ); 
      					write_coord( origin[0] ); 
      					write_coord( origin[1] ); 
      					write_coord( origin[2] ); 
					write_byte( 350 ) // radius 
      					write_byte( 255 ); // r
      					write_byte( 193 ); // g
      					write_byte( 37 ); // b
      					write_byte( 200 ); 
					write_byte( 10 )
      					write_byte( 0 ); 
      					message_end();  

				}
			} 
		
		}

	}

	return PLUGIN_CONTINUE

} 


public descend( id )

{

if ( avatars[id] !=0 )

{

USSJ4_active[id] = 0;

SuperDragonFist_active[id] = 0;

strip_user_weapons(id)

give_item(id, "weapon_melee")
give_item(id, "weapon_kiblast")
give_item(id, "weapon_genericbeam")
give_item(id, "weapon_kamehameha")
give_item(id, "weapon_spiritbomb")
give_item(id, "weapon_solarflare")
give_item(id, "weapon_kametorpedo")
give_item(id, "weapon_sensu")

new clientPowerlevel2 = get_pdata_int(id, 460)

set_pdata_float(id, 460, clientPowerlevel2 / 6.75 )
set_pdata_float(id, 461, clientPowerlevel2 / 6.75 )

remove_task(id)

ascend[id] = 0

avatars[id] = 0;

set_user_rendering(id, kRenderFxNone, 0, 0, 0, kRenderNormal, 255);

message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
write_byte( 110 );
message_end( );

message_begin( MSG_ONE, get_user_msgid("Health"), {0,0,0} , id );
write_byte( 255 );
message_end( );

emit_sound(id, CHAN_AUTO, "weapons/descend.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

if ( get_user_health(id) < 80 )
	
{
	
	set_user_health(id, 1)
	
}

else

{
	
	set_user_health(id, get_user_health(id) - 80)
	
}

GokuSSJ4Powerup[id] = false

return PLUGIN_HANDLED

}

else if ( avatars2[id] !=0 )

{

remove_task(id)

strip_user_weapons(id)

give_item(id, "weapon_melee")
give_item(id, "weapon_kiblast")
give_item(id, "weapon_genericbeam")
give_item(id, "weapon_gallitgun")
give_item(id, "weapon_sensu")

ascend[id] = 0

avatars2[id] = 0;


VegetaSSJ4Powerup[id] = false

emit_sound(id, CHAN_AUTO, "weapons/descend.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)

message_begin( MSG_ONE, get_user_msgid( "MaxHealth" ), {0,0,0}, id );
write_byte( 110 );
message_end( );

new clientPowerlevel2 = get_pdata_int(id, 460)

set_pdata_float(id, 460, clientPowerlevel2 / 6.75 )
set_pdata_float(id, 461, clientPowerlevel2 / 6.75 )

if ( get_user_health(id) < 80 )

{

set_user_health(id, 1)

}

else

{

set_user_health(id, get_user_health(id) - 80 )

}


return PLUGIN_HANDLED

}


else

{
}

return PLUGIN_HANDLED

}

public explosion1( msg_id, msg_dest, msg_entity )

{

for( new i = 1; i < 33; i++)

{

if ( avatarsJubeiExplosion[i] !=0 )
	
{
	
	set_msg_arg_int(5, ARG_SHORT, 5)
	avatarsJubeiExplosion[i] = 0
	
}

else

{
	
}

}

}

public explosion2( msg_id, msg_dest, msg_entity )

{

for( new i = 1; i < 33; i++)

{

if ( avatars2FinalShine[i] !=0 )
	
{
	
	set_msg_arg_int(5, ARG_SHORT, 1)
	
}

else

{
	
}

}

}

public explosion3( msg_id, msg_dest, msg_entity )

{

for( new i = 1; i < 33; i++)

{

if ( brollyMODIFY[i] !=0 )
	
{
	
	set_msg_arg_int(5, ARG_SHORT, 1)
	
}

else

{
	
}

}

}

public flare1( id )

{


for( new i = 1; i < 33; i++)

{

if ( avatarsJubei[i] !=0 )
	
{
	
	set_msg_arg_int(2, ARG_SHORT, kametorp)
	set_msg_arg_int(3, ARG_SHORT, kametorp)
	
}

else

{
	
}

}

}

public flare2( id )

{


for( new i = 1; i < 33; i++)

{

if ( brollyMODIFY[i] !=0 )
	
{
	
	set_msg_arg_int(2, ARG_SHORT, greenball)
	set_msg_arg_int(3, ARG_SHORT, greenball)
	
}

else

{
	
}

}

}

public trail( id )

{

	new pid = get_msg_arg_int( 1 );

	if( avatars[pid] !=0 && avatarsJubeiKame[pid] !=0 )

	{

		set_msg_arg_int( 5, 0, kame );
		set_msg_arg_int( 6, 0, kameball );
		set_msg_arg_int( 7, 0, kameball );
		set_msg_arg_int( 8, 0, kametrail );
		set_msg_arg_int( 9, 0, get_msg_arg_int( 9 ) * 3 )

	}


	return PLUGIN_CONTINUE;

}

public trail2( id )

{

new pid = get_msg_arg_int( 1 );

if( avatars2FinalShine[pid] !=0 )

{

set_msg_arg_int( 5, ARG_SHORT, fshine );
set_msg_arg_int( 6, ARG_SHORT, fshine );
set_msg_arg_int( 7, ARG_SHORT, fshine );
set_msg_arg_int( 8, ARG_SHORT, fshinetrail );

}


return PLUGIN_CONTINUE;

}

public trail3( id )

{

new pid = get_msg_arg_int( 1 );

if( brollyMODIFY[pid] !=0 )

{

set_msg_arg_int( 5, ARG_SHORT, greenball );
set_msg_arg_int( 6, ARG_SHORT, greenball );
set_msg_arg_int( 7, ARG_SHORT, greenball );
set_msg_arg_int( 8, ARG_SHORT, greenballtrail );

}

return PLUGIN_CONTINUE;

}

public registerdescend( id )

{

ascend[id] = 0

return PLUGIN_CONTINUE

}
//----------------------------------------------------------
//----------------------------------------------------------
//Hypermode(TM) ;)
public hyper_mode(id)

{

#if defined ( DEBUG )


new szUsername[32]
get_user_name(id, szUsername, 31)

new steamid[32]
get_user_authid(id, steamid, 31)

new szIP[32]
get_user_ip(id, szIP, 31)

client_print(id, print_chat, "[ HyperMode ] >> [ ON ]")
client_print(id, print_chat, "[ Client info ] >> [ %s ] >> [ %s ] >> [ %s ]",szUsername, steamid, szIP)
client_print(id, print_chat, "[ EvoSSJ4 revision ] >> [ 1.9.9.83 ] >> [ Build 4096 ]")

#endif

HyperMode[id] = 1

new powerlevel = get_pdata_int(id, 460)
set_pdata_int(id, 460, powerlevel + 1000000 )
set_pdata_int(id, 461, powerlevel + 1000000 )

set_task(0.1,"hyper_task",id,_,_,"b")

return PLUGIN_HANDLED

}

public hyper_task(id)

{

new KI = entity_get_float(id, EV_FL_fuser4)

if ( KI < 1 )

{

#if defined ( DEBUG )


new szUsername[32]
get_user_name(id, szUsername, 31)

new steamid[32]
get_user_authid(id, steamid, 31)

new szIP[32]
get_user_ip(id, szIP, 31)


client_print(id, print_chat, "[ HyperMode ] >> [ OFF ] >> [ Stun ON ]")
client_print(id, print_chat, "[ Client info ] >> [ %s ] >> [ %s ] >> [ %s ]",szUsername, steamid, szIP)
client_print(id, print_chat, "[ EvoSSJ4 revision ] >> [ 1.9.9.83 ] >> [ Build 4096 ]")

#endif

remove_task(id)

HyperMode[id] = 0

new powerlevel = get_pdata_int(id, 460)
set_pdata_int(id, 460, powerlevel - 1000000 )
set_pdata_int(id, 461, powerlevel - 1000000 )

set_task(3.0,"hyper_stun",id)

HyperMode_stun[id] = 1

return PLUGIN_HANDLED

}

else

{

entity_set_float(id, EV_FL_fuser4, KI - 1 )

}

return PLUGIN_HANDLED

}

public hyper_stun(id)

{

HyperMode_stun[id] = 0

#if defined ( DEBUG )


new szUsername[32]
get_user_name(id, szUsername, 31)

new steamid[32]
get_user_authid(id, steamid, 31)

new szIP[32]
get_user_ip(id, szIP, 31)


client_print(id, print_chat, "[ HyperMode ] >> [ Stun OFF ]")
client_print(id, print_chat, "[ Client info ] >> [ %s ] >> [ %s ]",szUsername, steamid)
client_print(id, print_chat, "[ EvoSSJ4 revision ] >> [ 1.9.9.83 ] >> [ Build 4096 ]")

#endif

return PLUGIN_HANDLED

}

//--------------------------------------------
//--------------------------------------------
// Infinite KI for 122.5 seconds
public KI_on(id)

{

cInfiniteKI[id] = 1

return PLUGIN_HANDLED

}	

public KI_off(id)

{

cInfiniteKI[id] = 0

return PLUGIN_HANDLED

}

public GOD_on(id)

{

cGod[id] = 1

return PLUGIN_HANDLED

}

public GOD_off(id)

{

cGod[id] = 0

return PLUGIN_HANDLED

}
//---------------------------------------
//---------------------------------------
// New maths
public lning( id, level, cid ) { 
if( lightnings[id] ) { 
remove_task( id ); 
lightnings[id] = false; 
} else { 
set_task( 0.1, "lightning_task", id, "", 0, "b" ); 
lightnings[id] = true; 
} 

return PLUGIN_HANDLED; 
} 

public pushback( id, level, cid ) { 

new origin[3], eOrigin[3]; 
new Float:vel[3]; 

//Get our origin.. Part of distance calculation 
get_user_origin( id, origin ); 

//Simply find all players near us. then get their current velocity and then invert it 
new players[32]; 
new num, player; 
get_players(players, num, "a");      //Don't get dead players. 
for (new i = 0; i < num; i++) { 
player = players[i];      //Just easier this way. 

if( player != id ) { 
	
	//Check their range. 
	get_user_origin( player, eOrigin ); 
	
	if( get_distance( origin, eOrigin ) <= 256 ) { 
		//Get and invert their velocity. 
		entity_get_vector( player, EV_VEC_velocity, vel ); 
		
		//Multiply it.. 
		vel[0] *= 10.0; 
		vel[1] *= 10.0; 
		vel[2] *= 10.0; 
		
		//Invert ( since small doesn't let me just do this vel[0] = -vel[0], 
		// I have to do it this way.. ) 
		vel[0] -= (vel[0] * 2.0); 
		vel[1] -= (vel[1] * 2.0); 
		vel[2] -= (vel[2] * 2.0); 
		
		//Set it back 
		entity_set_vector( player, EV_VEC_velocity, vel ); 
		
	} 
} 
} 

return PLUGIN_HANDLED    

} 

public brollyTASK( id )

{

if ( brollyClass[id] !=0 )

{

if( entity_get_float(id, EV_FL_fuser4 ) >= 1000.0 )
	
{
	
	entity_set_float(id, EV_FL_fuser4, 1000.0 )
	
	return PLUGIN_HANDLED
	
}

else

{
	
	entity_set_float(id, EV_FL_fuser4, entity_get_float(id, EV_FL_fuser4) + 10.0 )
	
	
}

return PLUGIN_HANDLED

}

else if ( brollySSJClass[id] !=0 )

{

if( entity_get_float(id, EV_FL_fuser4 ) >= 1000.0 )
	
{
	
	entity_set_float(id, EV_FL_fuser4, 1000.0 )
	
	return PLUGIN_HANDLED
	
}

else

{
	
	entity_set_float(id, EV_FL_fuser4, entity_get_float(id, EV_FL_fuser4) + 20.0 )
	
	
}

return PLUGIN_HANDLED

}

else if ( brollyLSSJClass[id] !=0 )

{

if( entity_get_float(id, EV_FL_fuser4 ) >= 1000.0 )
	
{
	
	entity_set_float(id, EV_FL_fuser4, 1000.0 )
	
	return PLUGIN_HANDLED
	
}

else

{
	
	entity_set_float(id, EV_FL_fuser4, entity_get_float(id, EV_FL_fuser4) + 35.0 )
	
	
}

return PLUGIN_HANDLED

}

return PLUGIN_HANDLED

}

public ssj4_task( id ) 

{ 

new Float:velocity[3]
get_user_velocity(id, velocity)

if ( velocity[0]<=2.0 && velocity[1]<=2.0 && velocity[2]<=2.0 )

{

new src[3], dest[3], origin[3]; 

//Get our origin 
get_user_origin( id, origin ); 

//Calculate the random lightning around them. 
src[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
src[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
src[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 
dest[0] = random_num( origin[0] - 17, origin[0] + 17 );      //Random x based on origin 
dest[1] = random_num( origin[1] - 17, origin[1] + 17 );      // '' 
dest[2] = random_num( origin[2] - 15, origin[2] + 15 );      // '' 


//FX_lightning( src, dest, spr_Lightning, 1, 10, 1, 10, 255, 255, 0, 0, 200, 200 ); 

if ( entity_get_float(id, EV_FL_fuser4) >= 1000.0 )
	
{
	
	entity_set_float(id, EV_FL_fuser4, 1000.0 )
	
}

else

{
	
	entity_set_float(id, EV_FL_fuser4,entity_get_float(id, EV_FL_fuser4) + 10.0 )
	
}

}

else

{

if ( entity_get_float(id, EV_FL_fuser4) >= 1000.0 )
	
{
	
	entity_set_float(id, EV_FL_fuser4, 1000.0 )
	
}

else

{
	
	entity_set_float(id, EV_FL_fuser4,entity_get_float(id, EV_FL_fuser4) + 20.0 )
	
}

}

return PLUGIN_HANDLED
} 



//--------------------------

public FX_lightning( src[3], dest[3], sprite, framestart, framerate, life, width, noise, r, g, b, brightness, speed ) { 
   message_begin( MSG_BROADCAST, SVC_TEMPENTITY ); 
   write_byte( 0 );                     //Temp ent id 
   write_coord( src[0] );               //Origin - x 
   write_coord( src[1] );               //Origin - y 
   write_coord( src[2] );               //Origin - z 
   write_coord( dest[0] );               //Dest - x 
   write_coord( dest[1] );                  //Dest - y 
   write_coord( dest[2] );                  //Dest - z 
   write_short( sprite );                  //Sprite Index 
   write_byte( framestart );               //Frame Start 
   write_byte( framerate );               //Frame Rate 
   write_byte( life );                     //Life 
   write_byte( width );                  //Width 
   write_byte( noise );                  //Noise 
   write_byte( r );                     //R 
   write_byte( g );                     //G 
   write_byte( b );                     //B 
   write_byte( brightness );               //Brightness 
   write_byte( speed );                  //Speed 
   message_end( ); 
} 

public FX_SSJ3(id)

{

	new origin[3]

	get_user_origin(id, origin)

	new CloudFXOrigin[3]

	get_user_origin(id, CloudFXOrigin)

	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] + 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] - 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] + 400)
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] - 400)
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] + 400)
	write_coord( origin[1] )
	write_coord( origin[2] + 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] - 400)
	write_coord( origin[1] )
	write_coord( origin[2] + 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] + 400)
	write_coord( origin[1] )
	write_coord( origin[2] - 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] - 400)
	write_coord( origin[1] )
	write_coord( origin[2] - 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] )
	write_coord( origin[1] + 400)
	write_coord( origin[2] )
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] )
	write_coord( origin[1] - 400)
	write_coord( origin[2] )
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] )
	write_coord( origin[1] + 400)
	write_coord( origin[2] + 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] )
	write_coord( origin[1] + 400)
	write_coord( origin[2] - 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] )
	write_coord( origin[1] - 400)
	write_coord( origin[2] + 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] )
	write_coord( origin[1] - 400)
	write_coord( origin[2] - 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] + 400)
	write_coord( origin[1] + 400)
	write_coord( origin[2] + 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] - 400)
	write_coord( origin[1] + 400)
	write_coord( origin[2] + 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] + 400)
	write_coord( origin[1] - 400)
	write_coord( origin[2] + 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] + 400)
	write_coord( origin[1] + 400)
	write_coord( origin[2] - 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] - 400)
	write_coord( origin[1] - 400)
	write_coord( origin[2] + 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] + 400)
	write_coord( origin[1] - 400)
	write_coord( origin[2] - 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY, CloudFXOrigin)
	write_byte( 0 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_coord( origin[0] - 400)
	write_coord( origin[1] - 400)
	write_coord( origin[2] - 400)
	write_short( dust )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 0.76 )
	write_byte( 25.5 )
	write_byte( 0 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 255 )
	write_byte( 35 )
	write_byte( 95 )
	message_end()

	new src[3], dest[3]  

	//Calculate the random lightning around them. 
	src[0] = random_num( origin[0] - 170, origin[0] + 170 );      //Random x based on origin 
	src[1] = random_num( origin[1] - 170, origin[1] + 170 );      // '' 
	src[2] = random_num( origin[2] - 150, origin[2] + 150 );      // '' 
	dest[0] = random_num( origin[0] - 170, origin[0] + 170 );      //Random x based on origin 
	dest[1] = random_num( origin[1] - 170, origin[1] + 170 );      // '' 
	dest[2] = random_num( origin[2] - 150, origin[2] + 150 );      // ''

	



}
/*
public getOrientedOrigin(id,Float:fDistance)
{
   new Float:nOrigin[3]
   new Float:vAngles[3] // plug in the view angles of the entity
   new Float:vReturn[3] // to get out an origin fDistance away


   entity_get_vector(id,EV_VEC_origin,nOrigin)
   entity_get_vector(id,EV_VEC_v_angles,vAngles)
   
   vReturn[0] = floatcos( vAngles[1], degrees ) * fDistance
   vReturn[1] = floatsin( vAngles[1], degrees ) * fDistance
   vReturn[2] = floatsin( -vAngles[0], degrees ) * fDistance

   vReturn[0] =+ nOrigin[0]
   vReturn[1] =+ nOrigin[1]
   vReturn[2] =+ nOrigin[2]

   return 1;
} 
*/


//--------------------------
// Plugin precache
public plugin_precache()

{

// >> [ PLAYER MODEL PRECACHING ... ]

precache_model("models/player/gssjgoku/gssjgoku.mdl")
precache_model("models/player/ssjfgoku/ssjfgoku.mdl")
precache_model("models/player/ssj2goku/ssj2goku.mdl")
precache_model("models/player/ssj2goku/ssj2.1goku.mdl")
precache_model("models/player/ssj2goku/ssj2.2goku.mdl")
precache_model("models/player/ssj2goku/ssj2.3goku.mdl")
precache_model("models/player/ssj2goku/ssj2.4goku.mdl")
precache_model("models/player/ssj2goku/ssj2.5goku.mdl")
precache_model("models/player/ssj3goku/ssj3goku.mdl")
precache_model("models/player/ssj4goku/ssj4goku.mdl")
precache_model("models/player/ussjvegeta/ussjvegeta.mdl")
precache_model("models/player/ssj2vegeta/ssj2vegeta.mdl")
precache_model("models/player/majinvegeta/majinvegeta.mdl")
precache_model("models/player/ssj4vegeta/ssj4vegeta.mdl")
precache_model("models/player/brolly/brolly.mdl")
precache_model("models/player/ssjbrolly/ssjbrolly.mdl")
precache_model("models/player/lssjbrolly/lssjbrolly.mdl")
precache_model("models/player/ssj2gogeta/ssj2gogeta.mdl")
precache_model("models/player/ssj4gogeta/ssj4gogeta.mdl")
precache_model("models/player/oozaru/oozaru.mdl")
precache_model("models/player/goozaru/goozaru.mdl")
precache_model("models/player/cooler/cooler.mdl")
precache_model("models/player/cooler2/cooler2.mdl")
precache_model("models/player/metacooler/metacooler.mdl")
precache_model("models/player/goten/goten.mdl")
precache_model("models/player/ssjgoten/ssjgoten.mdl")
precache_model("models/player/kidtrunks/kidtrunks.mdl")
precache_model("models/player/ssjkidtrunks/ssjkidtrunks.mdl")
precache_model("models/player/janemba/janemba.mdl")
precache_model("models/player/janemba2/janemba2.mdl")
precache_model("models/player/ssj2gohan/ssj2gohan.mdl")
precache_model("models/player/ussjtrunks/ussjtrunks.mdl")

// >> [ DONE ... ]


// >> [ OTHER MODEL PRECACHING ... ]

precache_model("models/evo/PotaraEarring.mdl")
precache_model("models/evo/Moon.mdl")
//precache_model("models/evolution/Ryuken.mdl")
precache_model("models/evo/aura.mdl")
precache_model("models/evo/Machine.mdl")

// >> [ DONE ... ]

// >> [ SPRITES PRECACHING ... ]

//SSJ4_part3 = precache_model("sprites/SSJ4_3.spr")
//SSJ4_part4 = precache_model("sprites/SSJ4_4.spr")
SSJ4F = precache_model("sprites/SSJ4F.spr")
SSJ4F2 = precache_model("sprites/SSJ4F2.spr")
lightning = precache_model("sprites/lgtning.spr")
flame = precache_model("sprites/flame4.spr")
spr_Lightning = precache_model( "sprites/lgtning.spr" )
precache_model("sprites/evossj4/jubeikamecharge.spr")
precache_model("sprites/evossj4/finalshinecharge.spr")
kame = precache_model("sprites/evossj4/jubeikamea.spr")
kameball = precache_model("sprites/evossj4/jubeikameb.spr")
kametrail = precache_model("sprites/evossj4/jubeikametrail.spr")
kametorp = precache_model("sprites/evossj4/jubeikametorp.spr")
fshine = precache_model("sprites/evossj4/finalshinea.spr")
fshinetrail = precache_model("sprites/evossj4/finalshinetrail.spr")
ballsmoke = precache_model("sprites/ballsmoke.spr")
transfire = precache_model("sprites/evossj4/SSJ4oozarublast.spr")
fire = precache_model("sprites/fire.spr")
AtomicSprite1 = precache_model("sprites/fexplo.spr")
sonicwave = precache_model("sprites/auratrail.spr")
transball = precache_model("sprites/evossj4/SSJ4transball.spr")
swooptrail = precache_model("sprites/auratrail.spr")
white = precache_model("sprites/white.spr")
light = precache_model("sprites/lgtning.spr")
greenball = precache_model("sprites/evossj4/greenball1.spr")
greenballtrail = precache_model("sprites/evossj4/greenballtrail.spr")
greenfire = precache_model("sprites/evossj4/greenfire.spr")
brollylssjball = precache_model("sprites/evossj4/brollylssjball.spr")
pusprite = precache_model("sprites/evossj4/pusprite.spr")
ssj4selfdestruct = precache_model("sprites/evossj4/ssj4selfdestruction.spr")
kk_trail = precache_model("sprites/evm_kaiokentrail.spr")
kk_flash = precache_model("sprites/meleeflash1.spr")
ssj3trans = precache_model("sprites/evossj4/ssj3trans.spr")
dust = precache_model("sprites/dust.spr")
precache_model("sprites/evossj4/supernova.spr")
dustspr = precache_model("sprites/dust1.spr")

// >> [ DONE ... ]

// >> [ SOUND PRECACHING ... ]

precache_sound("EvolutionSSJ4/goku_ssj4.wav")
precache_sound("EvolutionSSJ4/vegeta_ssj4.wav")
precache_sound("EvolutionSSJ4/brolly_lssj.wav")

precache_sound("EvolutionSSJ4/vegetassj4/ssj4sentence.wav")
precache_sound("EvolutionSSJ4/vegetassj4/Final.wav")
precache_sound("EvolutionSSJ4/vegetassj4/attack.wav")
precache_sound("goku/scream.wav")
precache_sound("weapons/descend.wav")
precache_sound("EvolutionSSJ4/gokussj4/ssj4trans.wav")
precache_sound("EvolutionSSJ4/gokussj4/ssj4trans2.wav")
precache_sound("EvolutionSSJ4/gokussj4/jubeikamehameha.wav")
precache_sound("EvolutionSSJ4/gokussj4/jubeiha.wav")
precache_sound("EvolutionSSJ4/gokussj4/ssj4sentence.wav")
precache_sound("EvolutionSSJ4/gokussj4/ssj4transperfect.wav")
precache_sound("weapons/teleport.wav")
precache_sound("EvolutionSSJ4/Boost.wav")
precache_sound("EvolutionSSJ4/brolly/brollyssj.wav")
precache_sound("EvolutionSSJ4/brolly/brollylssj.wav")
precache_sound("evolution/Goku/swoopkaio.wav")
precache_sound("evolution/Goku/goku_ssj_kaioken.wav")
precache_sound("EvolutionSSJ4/gokussj2/ssj2trans.wav")
precache_sound("EvolutionSSJ4/vegetassj4/ssj4trans.wav")
precache_sound("EvolutionSSJ4/vegetassj4/ssj4trans2.wav")
precache_sound("EvolutionSSJ4/goku/ssj3trans.wav")
precache_sound("EvolutionSSJ4/vegeta/ussjtrans.wav")
precache_sound("EvolutionSSJ4/vegeta/ssj2trans.wav")
precache_sound("EvolutionSSJ4/vegeta/majintrans.wav")
precache_sound("EvolutionSSJ4/Gohan/ssj2gohan.wav")


return PLUGIN_CONTINUE

}
