#include <xtension/special>
#include <ipci/ascend>
#include <ipci/fxlib>
#include <amxx/fakemeta_util>

#define KamehamehaMaxDmg (80.0)
#define KamehamehaMaxRadius (800.0)
#define KamehamehaMaxDmgRadius (500.0)
#define KiLines (100.0)
#define KamehamehaCooldown (10.0)

stock SpecialXtension:sxKamehameha;

stock BeamStart[33];
stock SPR_Shockwave[] = "spriteswod/shockwave.spr";
stock SPR_Kamehameha[] = "spriteswod/kamehameha_small_s.spr";
stock SPR_Kamehameha_t[] = "spriteswod/kamehameha_small_t.spr";
stock BeamStartMDL[] = "models/evolution/wod/wod.cellsphere.mdl";
stock SPR_Beam;
stock SPR_Beam_t;
stock SPR_Energy;

stock MSG_Explosion;
stock FxExplosionBlue;
stock SPR_Rocks;
stock SPR_Rocks2;
stock SPR_Rocks3;


stock KamehamehaEnt[33] = { 0, ... };
stock KamehamehaEnt2[33] = { 0, ... };
stock ShockwaveEnt[33] = { 0, ... };

stock getposition(id,Float:forw,Float:right,Float:up,Float:vStart[])
{
	new Float:vOrigin[3], Float:vAngle[3], Float:vForward[3], Float:vRight[3], Float:vUp[3]

	pev(id, pev_origin, vOrigin)
	pev(id, pev_view_ofs,vUp)
	xs_vec_add(vOrigin,vUp,vOrigin)
	pev(id, pev_v_angle, vAngle)

	angle_vector(vAngle,ANGLEVECTOR_FORWARD,vForward) 
	angle_vector(vAngle,ANGLEVECTOR_RIGHT,vRight)
	angle_vector(vAngle,ANGLEVECTOR_UP,vUp)

	vStart[0] = vOrigin[0] + vForward[0] * forw + vRight[0] * right + vUp[0] * up
	vStart[1] = vOrigin[1] + vForward[1] * forw + vRight[1] * right + vUp[1] * up
	vStart[2] = vOrigin[2] + vForward[2] * forw + vRight[2] * right + vUp[2] * up
}




public plugin_init ()
{
	register_forward( FM_Touch, "KamehamehaTouch" );
	//register_forward( FM_Think, "FinalcrushThink" );
	//register_forward( FM_PlayerPreThink, "KamehamehaThink" );
	register_message( get_user_msgid( "BlockStrug" ), "BlockStrug" )
	
	MSG_Explosion		= 	MSGID( "Explosion" );
}
public BlockStrug( msgid, dest, id )
{
	client_print(id,print_chat,"%d",dest);
	return PLUGIN_CONTINUE;
}
public plugin_precache()
{
	precache_model( SPR_Kamehameha );
	precache_model( SPR_Kamehameha_t );
	precache_model( SPR_Shockwave );
	precache_model( BeamStartMDL );
	
	SPR_Beam = precache_model( "spriteswod/kamehameha_small_s.spr" );
	SPR_Beam_t = precache_model( "spriteswod/kamehameha_small_t.spr" );
	
	SPR_Energy = precache_model( "sprites/smoke.spr" );
	FxExplosionBlue = precache_model( "spriteswod/explosion_blue_4.spr" );
	SPR_Rocks = precache_model( "sprites/rock2.spr" );
	SPR_Rocks2 = precache_model( "sprites/rock1.spr" );
	SPR_Rocks3 = precache_model( "sprites/rock4.spr" );
	
	precache_sound( "wod.krillin/kamehame_c.wav" );
	precache_sound( "wod.krillin/kamehame_ha.wav" );
	precache_sound( "evolution/null.wav" );
	precache_sound( "weapons/kame_charge2.wav");
	precache_sound( "weapons/beamhead.wav");
}

public KamehamehaThink(Client)
{
	if(getClientSPECIALSTATE( Client, sxKamehameha) == true)
	{
		if(pev(KamehamehaEnt2[Client],pev_iuser3) == 1)
		{
			static Float:aim[3],Float:velocity[3],Float:endvelocity[3],Float:origin[3];
			fm_get_aim_origin( Client, aim );

			pev(KamehamehaEnt2[ Client ],pev_origin, origin );
			xs_vec_sub(aim,origin, velocity );
			xs_vec_normalize(velocity,endvelocity);
			xs_vec_mul_scalar(endvelocity, 250.0,endvelocity);
			set_pev( KamehamehaEnt2[ Client ], pev_velocity, endvelocity );
			
			setClientKI(Client, getClientKI(Client) -2);
			if(getClientKI(Client) <= 10)
			{
				release(Client);
				setClientSPECIALCOOLDOWN( Client, sxKamehameha, KamehamehaCooldown * 2);
			}
		}
	}
}
public @SpecialCreation ()
{
	beginSpecialCreation( "Kamehameha_Krillin", "", "callbackKamehameha", "special_kamehameha_krillin" );
	
	addSpecialCharge( IN_ATTACK, 3.0, 25.0, false );
	addSpecialControl( IN_ATTACK );
	addSpecialControl( IN_ATTACK2 );
		
	sxKamehameha = endSpecialCreation();
}

public callbackKamehameha ( Client, CSpecialState:Status, Control, Float:Charge )
{
	switch ( Status )
	{
		case ssCharge: // called every 0.1 secs
		{
			
			// allways including isDead, inTransform
			if ( ( getClientPOWERUP( Client ) && !getClientXFROZEN( Client ) )
			  || getClientTURBO( Client )
			  || getClientMELEE( Client )
			  || getClientWALLGND( Client )
			  || getClientSWOOPING( Client )
			  || getClientMELEEPUSHBACK( Client )
			  || getClientATKSHOOT( Client )
			  || getClientBLOCK( Client )
			  || getClientTHROWAWAY( Client )
			  || getClientTHROW( Client )
			   )
			{				
				return 0; // > ssChargeAborted if Charge > 0.0
			}
			if ( Charge == 0.0 )
			{
				//setClientXFROZEN( Client, false );
				setClientANIMATION( Client, 110, 0.45 );
				emit_sound( Client, CHAN_WEAPON, "weapons/kame_charge2.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );
				emit_sound( Client, CHAN_VOICE, "wod.krillin/kamehame_c.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );

				new CORE[ 1 ];
				CORE[ 0 ] = Client;
				
				set_task( 0.0, "fxCam", uniqueTaskID( Client,100 ), CORE, 1, "a",1 );
			}
			
			if (Charge == 0.3)
			{
				setClientANIMATION( Client, 110, 0.0 );
			}
			
			if( Charge == 0.5 )
			{
				fxAddBall( Client );
			}
			
			if( Charge >= 0.6 )
			{
				fxEnergylines( Client );
			}
			
			if( Charge == 0.7 )
			{
				fxAddShockwave( Client );
			}
			
			if( Charge == 1.0 )
			{
				setClientSPECIALCOOLDOWN( Client, sxKamehameha, KamehamehaCooldown * Charge );
			}
			
			return 1;
		}
		
		case ssChargeReleased:
		{
			if ( Charge == 1.0 )
			{		
				set_pdata_int(Client, 200,1);
				set_pdata_int(Client, 464,0);
				
				fireKamehameha( Client );
				setClientANIMATION( Client, 111, 1.0 );
				setClientXFROZEN( Client, true );
			}
			else if ( Charge < 1.0 )
			{
				new CORE[ 1 ];
				CORE[ 0 ] = Client;
				set_pdata_int(Client, 200,0);
				set_pdata_int(Client,464,1065353216);
				setClientANIMATION( Client, -1 );
				emit_sound( Client, CHAN_VOICE, "evolution/null.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );
				emit_sound( Client, CHAN_WEAPON, "evolution/null.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );
				set_task( 0.0, "fxCamFix", uniqueTaskID( Client,101 ), CORE, 1, "a",1 );
				fxRemBall(Client);
				remove_task( uniqueTaskID( Client, 100 ) );
			}
		}
		
		case ssControlInvocation:
		{
			if ( Control == IN_ATTACK2 && getClientSPECIALSTATE( Client, sxKamehameha) == true )
			{
				set_pdata_int(Client, 200,0);
				set_pdata_int(Client,464,1065353216);
				release( Client );	
			}
			
			if ( Control == IN_ATTACK && getClientSPECIALSTATE( Client, sxKamehameha) == true )
			{
				KamehamehaThink(Client);	
			}
		}	
		
		// Called when Specialstate = true by Death, Disconnect, IconSwitch to another Weapon
		case ssForceAbort,ssChargeAborted:
		{	
			new CORE[ 1 ];
			CORE[ 0 ] = Client;
			set_pdata_int(Client, 200,0);
			set_pdata_int(Client,464,1065353216);
			setClientANIMATION( Client, -1 );
			emit_sound( Client, CHAN_VOICE, "evolution/null.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );
			set_task( 0.0, "fxCamFix", uniqueTaskID( Client,101 ), CORE, 1, "a",1 );
			remove_task( uniqueTaskID( Client, 100 ) );
			fxRemBall(Client);
			return 0;
		}
	}
	
	return 1;
}


fxAddBall( Client, Float:scale=0.1 )
{

	KamehamehaEnt[ Client ] = fm_create_entity("env_sprite");
	if( !KamehamehaEnt[ Client ] )
		return KamehamehaEnt[ Client ];
		
	new Float:origin[3];
	pev(Client, pev_origin, origin );
	set_pev( KamehamehaEnt[ Client ], pev_origin, origin );	
		
	engfunc(EngFunc_SetModel, KamehamehaEnt[ Client ], SPR_Kamehameha );

	set_pev(KamehamehaEnt[ Client ], pev_owner, Client );	
	set_pev(KamehamehaEnt[ Client ], pev_scale, scale );	
	set_pev(KamehamehaEnt[ Client ], pev_mins, {-5.0,-5.0,-5.0} );
	set_pev(KamehamehaEnt[ Client ], pev_maxs, { 5.0, 5.0, 5.0} );
	
	set_pev(KamehamehaEnt[ Client ], pev_renderfx, kRenderFxNone );	
	set_pev(KamehamehaEnt[ Client ], pev_rendermode, kRenderTransAdd );
	set_pev(KamehamehaEnt[ Client ], pev_renderamt, 200.0 );
	
	set_pev(KamehamehaEnt[ Client ], pev_fuser2, 0.0 );
	set_pev(KamehamehaEnt[ Client ], pev_solid, SOLID_NOT );
	set_pev(KamehamehaEnt[ Client ], pev_speed, 150.0 );
	
	set_pev( KamehamehaEnt[Client], pev_skin, Client);
	set_pev( KamehamehaEnt[Client], pev_body, 1);
	set_pev( KamehamehaEnt[Client], pev_aiment, Client);
	set_pev( KamehamehaEnt[ Client ], pev_movetype, MOVETYPE_FOLLOW );
	
	entity_set_float( KamehamehaEnt[ Client ], EV_FL_framerate, 10.0 );
	DispatchSpawn( KamehamehaEnt[ Client ] );	
	//set_pev(KamehamehaEnt[ Client ], pev_solid, SOLID_NOT );
	
	return KamehamehaEnt[ Client ];
}

fxAddShockwave(Client)
{
	ShockwaveEnt[ Client ] = fm_create_entity("env_sprite");
	if( !ShockwaveEnt[ Client ] )
		return ShockwaveEnt[ Client ];
		
	new Float:origin[3];
	pev(Client, pev_origin, origin );
	set_pev( ShockwaveEnt[ Client ], pev_origin, origin );	
		
	engfunc(EngFunc_SetModel, ShockwaveEnt[ Client ], SPR_Shockwave );

	set_pev(ShockwaveEnt[ Client ], pev_owner, Client );	
	set_pev(ShockwaveEnt[ Client ], pev_scale, 0.1 );	
	set_pev(ShockwaveEnt[ Client ], pev_mins, {-5.0,-5.0,-5.0} );
	set_pev(ShockwaveEnt[ Client ], pev_maxs, { 5.0, 5.0, 5.0} );
	
	set_pev(ShockwaveEnt[ Client ], pev_renderfx, kRenderFxNone );	
	set_pev(ShockwaveEnt[ Client ], pev_rendermode, kRenderTransAdd );
	set_pev(ShockwaveEnt[ Client ], pev_renderamt, 50.0 );
	
	set_pev(ShockwaveEnt[ Client ], pev_fuser2, 0.0 );
	set_pev(ShockwaveEnt[ Client ], pev_solid, SOLID_NOT );
	set_pev(ShockwaveEnt[ Client ], pev_speed, 150.0 );
	
	set_pev( ShockwaveEnt[Client], pev_skin, Client);
	set_pev( ShockwaveEnt[Client], pev_body, 1);
	set_pev( ShockwaveEnt[Client], pev_aiment, Client);
	set_pev( ShockwaveEnt[ Client ], pev_movetype, MOVETYPE_FOLLOW );
	
	entity_set_float( ShockwaveEnt[ Client ], EV_FL_framerate, 10.0 );
	DispatchSpawn( ShockwaveEnt[ Client ] );	
	//set_pev(ShockwaveEnt[ Client ], pev_solid, SOLID_NOT );
	
	return ShockwaveEnt[ Client ];
}

public fxEnergylines ( Client )
{
	new ent = KamehamehaEnt[ Client ];
	static Float:vecOrigin[ 3 ];
	entity_get_vector( ent, EV_VEC_origin, vecOrigin );
	new dist = floatround(KiLines);

	
	for (new i=0; i<=dist ; i+=2000 )
	{	
		message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
		write_byte( TE_BEAMENTPOINT );
		write_short( ent );
		write_coord(floatround( vecOrigin[ 0 ] )+random_num(-dist /10, dist /10));
		write_coord(floatround( vecOrigin[ 1 ] )+random_num(-dist /10, dist /10));
		write_coord(floatround( vecOrigin[ 2 ] )+random_num(-dist /10, dist /10));
		write_short( SPR_Energy );
		write_byte( 1 ); // framestart
		write_byte( 10 ); // framerate
		write_byte( 10 ); // life
		write_byte( 4 ); // width
		write_byte( 0 ); // noise
		write_byte( 80 ); // r, g, b
		write_byte( 155 ); // r, g, b
		write_byte( 255 ); // r, g, b
		write_byte( 150 ); // brightness
		write_byte( 10 ); // speed
		message_end();
	}
}

fxRemBall( Client )
{
	if(is_valid_ent(KamehamehaEnt2[Client]))
	{
		fm_remove_entity(KamehamehaEnt2[ Client ]);
	}
	if(is_valid_ent(KamehamehaEnt[Client]))
	{
		fm_remove_entity(KamehamehaEnt[ Client ]);
	}
	if(is_valid_ent(ShockwaveEnt[Client]))
	{
		fm_remove_entity(ShockwaveEnt[ Client ]);
	}
}

fireKamehameha( Client )
{
	new CORE[ 1 ];
	CORE[ 0 ] = Client;
	//Beamhead(Client);
	setClientSPECIALSTATE( Client, sxKamehameha, true);	
	emit_sound( Client, CHAN_WEAPON, "evolution/null.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );
	emit_sound( Client, CHAN_VOICE, "wod.krillin/kamehame_ha.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );
	
	fm_remove_entity( KamehamehaEnt[ Client ] );
	fm_remove_entity( ShockwaveEnt[ Client ] );
	KamehamehaEnt2[ Client ] = fm_create_entity("env_sprite");
	if( !KamehamehaEnt2[ Client ] )
		return KamehamehaEnt2[ Client ];
		
	set_pev(KamehamehaEnt2[ Client ], pev_movetype, MOVETYPE_FLY );	
	engfunc(EngFunc_SetModel, KamehamehaEnt2[ Client ], SPR_Kamehameha );

	set_pev(KamehamehaEnt2[ Client ], pev_classname, "Kamehameha_krillin" );	
	set_pev(KamehamehaEnt2[ Client ], pev_owner, Client );
	
	set_pev(KamehamehaEnt2[ Client ], pev_renderfx, kRenderFxNone );	
	set_pev(KamehamehaEnt2[ Client ], pev_rendermode, kRenderTransAdd );
	set_pev(KamehamehaEnt2[ Client ], pev_renderamt, 200.0 );
	
	set_pev(KamehamehaEnt2[ Client ], pev_owner, Client );
	set_pev(KamehamehaEnt2[ Client ], pev_fuser2, 0.0 );
	set_pev(KamehamehaEnt2[ Client ], pev_iuser1,1);
	set_pev(KamehamehaEnt2[ Client ], pev_iuser3,1);
	
	set_pev(KamehamehaEnt2[ Client ], pev_speed, 150.0 );
	set_pev(KamehamehaEnt2[ Client ], pev_movetype, MOVETYPE_FLY );
		
	new Float:origin[3];
	pev(Client, pev_origin, origin );	
	origin[2] += 2;	
	set_pev( KamehamehaEnt2[ Client ], pev_origin, origin );
	
	entity_set_float( KamehamehaEnt2[ Client ], EV_FL_framerate, 10.0 );
	DispatchSpawn( KamehamehaEnt2[ Client ] );	
	set_pev(KamehamehaEnt2[ Client ], pev_solid, SOLID_BBOX );
	
	new ent = KamehamehaEnt2[ Client ];
	
	
	static Float:aim[3],Float:velocity[3],Float:endvelocity[3];
	fm_get_aim_origin( Client, aim );

	pev(ent,pev_origin, origin );
	xs_vec_sub(aim,origin, velocity );
	xs_vec_normalize(velocity,endvelocity);
	xs_vec_mul_scalar(endvelocity, 400.0,endvelocity);
	
	set_pev( ent, pev_movetype, MOVETYPE_FLY );
	set_pev( ent, pev_solid, SOLID_BBOX );
	set_pev( ent, pev_mins, {-20.0,-20.0,-20.0} );
	set_pev( ent, pev_maxs, { 20.0, 20.0, 20.0} );
	
	new Float:start[3];
	getposition(Client, 10.0, 0.0, -6.2, start );
	
	message_begin( MSG_ALL, get_user_msgid( "EETrail" ) );

	write_long( Client );
	write_long( ent );
	write_byte( 1 );
	write_short( SPR_Beam );
	write_short( SPR_Beam );
	write_short( SPR_Beam );
	write_short( SPR_Beam );
	write_short( SPR_Beam_t );
	write_byte( 2 );
	write_byte( 2 );
	write_coord( floatround( start[ 0 ]  ) );
	write_coord( floatround( start[ 1 ]  ) );
	write_coord( floatround( start[ 2 ]  ) );
	
	message_end();

	set_pev( ent, pev_velocity, endvelocity );
	set_pev( ent, pev_origin, start );
	//emit_sound(KamehamehaEnt2[Client], CHAN_WEAPON, "weapons/beamhead.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );
	return KamehamehaEnt2[ Client ];
}

public remfxKamehameha( ent )
{
	message_begin( MSG_ALL, get_user_msgid( "KillTrail" ) );
	write_long( ent );
	message_end();
}

public @ExplodeEntity( buudeathball )
{
	static Float:origin[3],Origin[3];
	pev(buudeathball, pev_origin, origin );
	FVecIVec(origin, Origin );
	new dist = floatround(KamehamehaMaxRadius);

	new Client;
	Client = pev(buudeathball, pev_owner);
	//client_print(Client,print_chat,"Touch2 %d",Client);
	
	setClientSPECIALSTATE( Client, sxKamehameha, false );
	setClientXFROZEN( Client, false );
	remBeamStart( Client );
	//emit_sound(buudeathball, CHAN_WEAPON, "evolution/null.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );
	
	new CORE[ 1 ];
	CORE[ 0 ] = Client;
	set_task( 0.0, "AnimationCancel", uniqueTaskID( Client,100 ), CORE, 1, "a",1 );
	set_task( 0.0, "fxCamFix", uniqueTaskID( Client,100 ), CORE, 1, "a",1 );

	radiusDamage ( buudeathball, "Kamehameha", KamehamehaMaxDmg
								  , KamehamehaMaxRadius
								  , KamehamehaMaxDmgRadius
				 );
				 
	
	fm_remove_entity( buudeathball );
	

	remfxKamehameha( buudeathball );
	
	
	message_begin	( MSG_ALL, MSG_Explosion );

	write_coord		( Origin[0] );
	write_coord		( Origin[1] );
	write_coord		( Origin[2]  );
	write_long		( 200 );
	write_byte		( 0 );
	
	message_end		();
	
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
	write_byte( TE_EXPLOSION );
	write_coord(Origin[0]);
	write_coord(Origin[1]);
	write_coord(Origin[2] +100);
	write_short( FxExplosionBlue );
	write_byte( 80 ); // scale
	write_byte( 0 ); // framerate
	write_byte( 4 ); // flags
	message_end();
	
	
	for (new i=0; i<=dist ; i+=500 )
	{

		message_begin (MSG_BROADCAST,SVC_TEMPENTITY); 
		write_byte( TE_SPRITETRAIL ); 
		write_coord(Origin[0]+random_num(0, dist /10)); 
		write_coord(Origin[1]+random_num(0, dist /10)); 
		write_coord(Origin[2]+random_num(0, dist /10)); 
		write_coord(Origin[0] + i /10); 
		write_coord(Origin[1] + i /10); 
		write_coord(Origin[2] + i /10); 
		write_short( SPR_Rocks );
		write_byte( 5 ); 				//count
		write_byte( 8 ); 				//life
		write_byte( 1 ); 				//scale
		write_byte( 50 ); 				//velocity
		write_byte( 0 ); 				//randomness
		message_end();
	}
	
	for (new i=0; i<=dist ; i+=500 )
	{
		message_begin (MSG_BROADCAST,SVC_TEMPENTITY); 
		write_byte( TE_SPRITETRAIL ); 
		write_coord(Origin[0]+random_num(0, dist /10)); 
		write_coord(Origin[1]+random_num(0, dist /10)); 
		write_coord(Origin[2]+random_num(0, dist /10)); 
		write_coord(Origin[0] + i /10); 
		write_coord(Origin[1] + i /10); 
		write_coord(Origin[2] + i /10); 
		write_short( SPR_Rocks2 );
		write_byte( 10 ); 				//count
		write_byte( 10 ); 				//life
		write_byte( 1 ); 				//scale
		write_byte( 80 ); 				//velocity
		write_byte( 0 ); 				//randomness
		message_end();
	}
	
	for (new i=0; i<=dist ; i+=500 )
	{

		message_begin (MSG_BROADCAST,SVC_TEMPENTITY); 
		write_byte( TE_SPRITETRAIL ); 
		write_coord(Origin[0]+random_num(0, dist /10)); 
		write_coord(Origin[1]+random_num(0, dist /10)); 
		write_coord(Origin[2]+random_num(0, dist /10)); 
		write_coord(Origin[0] + i /10); 
		write_coord(Origin[1] + i /10); 
		write_coord(Origin[2] + i /10); 
		write_short( SPR_Rocks3 );
		write_byte( 5 ); 				//count
		write_byte( 8 ); 				//life
		write_byte( 1 ); 				//scale
		write_byte( 40 ); 				//velocity
		write_byte( 0 ); 				//randomness
		message_end();
	}
	
}

public KamehamehaTouch(Toucher, Touched)
{
	// It is not advisable to return values in this type of functions...
	
	if(is_valid_ent(Toucher) && is_valid_ent(Touched))
	{
		// Better make a generic condition for both customers and bots...
		
		static __int_toucherOwner, __int_touchedOwner;
		
		__int_toucherOwner = entity_get_edict(Toucher, EV_ENT_owner);
		__int_touchedOwner = entity_get_edict(Touched, EV_ENT_owner);
		
		if(!(__int_toucherOwner == Touched) && !(Toucher == __int_touchedOwner))
		{
			if(is_user_alive(Toucher) && is_user_connected(Toucher) && getClientBLOCK(Toucher))
			{
				message_begin(MSG_ALL, get_user_msgid("BlockStrug"));
				{
					write_byte(__int_toucherOwner);
					write_byte(Toucher);
					write_byte(Touched);
					write_byte(500);
				}
				message_end();
				
				message_begin(MSG_ONE, get_user_msgid("PowerStrug"), _, __int_toucherOwner);
				{	write_char(0);}
				message_end();
				
				message_begin(MSG_ONE, get_user_msgid("PowerStrug"), _, Toucher);
				{	write_char(0);}
				message_end();
			}
			
			else if(entity_get_int(Touched, EV_INT_iuser1))
			{
				message_begin(MSG_ALL, get_user_msgid("BlockStrug"));
				{
					write_byte(__int_toucherOwner);
					write_byte(__int_touchedOwner);
					write_byte(Toucher);
					write_byte(Touched);
				}
				message_end();
				
				message_begin(MSG_ONE, get_user_msgid("PowerStrug"), _, __int_toucherOwner); 
				{	write_char(0);}
				message_end();
				
				message_begin(MSG_ONE, get_user_msgid("PowerStrug"), _, __int_touchedOwner); 
				{	write_char(0);}
				message_end();
			}
			
			else{	@ExplodeEntity(Touched);}
		}
	}
}

public Beamhead( Client )
{
	BeamStart[Client] = create_entity( "env_model" );
		
	entity_set_model( BeamStart[Client], BeamStartMDL );
	
	new Float:ClientOrigin[3];
	entity_get_vector( Client, EV_VEC_origin, ClientOrigin );
	entity_set_origin( BeamStart[Client], ClientOrigin );
	
	entity_set_int( BeamStart[Client], EV_INT_rendermode, kRenderNormal );
	entity_set_float( BeamStart[Client], EV_FL_renderamt, 150.0 );
	entity_set_float( BeamStart[Client], EV_FL_scale, 0.5 );
	
	entity_set_int( BeamStart[Client], EV_INT_movetype, MOVETYPE_FOLLOW );
	entity_set_edict( BeamStart[Client], EV_ENT_aiment, Client );
	
	new Float:start[3];
	getposition(Client,130.0,0.0,0.0,start)

	set_pev( BeamStart[Client], pev_origin, start );

	return 1;

}

public remBeamStart( Client )
{

	message_begin	( MSG_BROADCAST, SVC_TEMPENTITY );
	write_byte		( 99 );
	write_short		( Client );
	message_end		();
	
	remove_task( uniqueTaskID( Client, 100 ) );
	set_pdata_int(Client, 200,0);
	set_pdata_int(Client,464,1065353216);
	if( is_valid_ent( BeamStart[Client]) )
	{
		remove_entity( BeamStart[Client] );		
	}
}

public release( Client )
{
	setClientSPECIALSTATE( Client, sxKamehameha, false);
	setClientXFROZEN( Client, false );
	setClientANIMATION( Client, -1 );
	
	new CORE[ 1 ];
	CORE[ 0 ] = Client;
	set_task( 0.0, "fxCamFix", uniqueTaskID( Client,100 ), CORE, 1, "a",1 );
	
	remBeamStart( Client );
	new ent = KamehamehaEnt2[ Client ];
	remfxKamehameha( ent );
	
	message_begin	( MSG_BROADCAST, SVC_TEMPENTITY );
	write_byte		( TE_BEAMFOLLOW );
	write_short		( ent );
	write_short		( SPR_Beam_t );
	write_byte		( 16 );
	write_byte		( 12 );
	write_byte		( 255 );
	write_byte		( 255 );
	write_byte		( 255 );
	write_byte		( 255 );
	message_end		();
}

public AnimationCancel(Core[])
{
	setClientANIMATION( Core[0], -1 );
}

public fxCam( Core[])
{
	client_cmd( Core[0], "cam_idealdist 50" )
	client_cmd( Core[0], "cam_idealyaw 5" )
	client_cmd( Core[0], "cam_idealpitch -5" )
}

public fxCamFix( Core[])
{
	client_cmd( Core[0], "cam_idealdist 50" )
	client_cmd( Core[0], "cam_idealyaw 5" )
	client_cmd( Core[0], "cam_idealpitch -5" )
}
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang8202\\ f0\\ fs16 \n\\ par }
*/
