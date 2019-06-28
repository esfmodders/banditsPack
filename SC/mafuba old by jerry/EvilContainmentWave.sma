#include <amxmodx>
#include <fakemeta>
#include <engine>
#include <fun>
#include <xs>

new TotalSwch[33] //to control if the player can use this plugin
new beam, trail //EvilContainmentWave's beam and trail
new swch[33] //to control which model the ricecooker entity uses
new piccolo[33] //a new entity instead of the player's model
new cooker[33] //ricecooker's entity
new Float: org1[3], Float: org2[3] //the player's position and the target's
new ScreenSwch[33], mfbbeamSwch[33], mfbtrailSwch[33] //Functions: ScreenFade, ScreenShake, ShowBeam, ShowSprite, ShowTrail
new target[33] // the target's index
new Float: targetorg[3] //the target's position
new newtent[33] //Maybe you can just call this The target's soul
new uservec[3] //an int-origin date of the player
new mfbspacefx[33],mfbsuckent[33] // FX when the player is using the function
new mfbheadspr //SPR beam head
new Float: frame[33] //frame of the spr file
new mfbexp[33] //explosion when the ricecooker is unlocked
new Float: vec2[3], Float: vec3[3] //For making the target get closer with the player


#define PLUGIN_NAME	"EvilContainmentWave"
#define PLUGIN_VERSION	"1.0"
#define PLUGIN_AUTHOR	"Jerry&Dc.Mit"


public plugin_init()
{
	register_plugin(PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_AUTHOR);
	
	register_clcmd(".Special2","specialbg") //register a client command
}

public client_PostThink(id)
{
	if(ScreenSwch[id] == 1)
	{
		ScreenFade(id, 10, {0, 255, 0}, 150)
		screen_shake(id, 110, 1, 23)
	}
	if(mfbbeamSwch[id] == 1)
	{
		mfb_beam(id, target[id])
		mfb_head(uservec[0], uservec[1], uservec[2])
	}
	if(mfbtrailSwch[id] == 1)
	{
		mfb_trail(newtent[id], 255, 255, 255)
	}
}

public specialbg(id)
{
	new body;
	get_user_aiming(id, target[id], body); //get the guy's index whom the player is aiming at
	if(TotalSwch[id] == 0 && pev(id, pev_flags) & FL_ONGROUND && pev(target[id], pev_flags) & FL_ONGROUND) //the player and the target must be standing on the ground
	{
		new iPlayerModel[ 32 ];
		get_user_info( id, "model", iPlayerModel, 31 );
		pev(id, pev_origin, org1)
		pev(target[id], pev_origin, targetorg)
		new Float: rangevec[4] //set a range in which the player can't use the function
		rangevec[0] = org1[0] - 360.0
		rangevec[1] = org1[0] + 360.0
		rangevec[2] = org1[1] - 360.0
		rangevec[3] = org1[1] + 360.0
		if(rangevec[0] > targetorg[0] || rangevec[1] < targetorg[0] || rangevec[2] > targetorg[1] || rangevec[3] < targetorg[1])
		{
			if( equal( iPlayerModel, "piccolo2" ) && target[id] > 0 && UTIL_IsBusy( id ) == 0)
			{
				TotalSwch[id] = 1
				client_cmd(id, "resetview") //to make sure the FX can be shown more correctly
				new Float:vecViewAngles[3], Float: angvec[3]
				get_user_origin(id, uservec)
				piccolo[id] = create_entity( "env_model" );
				engfunc( EngFunc_SetModel, piccolo[id], "models/esfkami.piccolo.mdl" );
				set_pdata_int( id, 301, 1, -89 )
				set_pdata_int( target[id], 301, 1, -89 )
				
				if(is_user_bot(target[id])) //stop the player and the target doing anything else
				{
					set_pev(id, pev_flags, pev(id, pev_flags) | FL_FROZEN)
					set_pev(target[id], pev_flags, pev(target[id], pev_flags) | FL_FROZEN)
					client_cmd(1, "idlebots 1")
				}
				else{
					set_pev(id, pev_flags, pev(id, pev_flags) | FL_FROZEN)
					set_pev(target[id], pev_flags, pev(target[id], pev_flags) | FL_FROZEN)
				}
				
				pev( id, pev_v_angle, vecViewAngles ) //get the angle of the player
				angle_vector(vecViewAngles, 1, angvec) //get the vector from the player's angle
				new Float:angles[3]
				vector_to_angle(angvec, angles )
				org2[0] = vecViewAngles[0]
				org2[1] = vecViewAngles[1]
				org2[2] = vecViewAngles[2]
				set_pev(piccolo[id], pev_angles, angles)
				set_pev( piccolo[id], pev_v_angle, vecViewAngles ) //make the angle more perfect
				
				entity_set_float(piccolo[id], EV_FL_animtime, get_gametime()) //set the entity's animation time
				entity_set_float(piccolo[id], EV_FL_framerate, 1.0) //set the entity's animation rate
				set_pev( piccolo[id], pev_origin, org1)
				set_entity_visibility(id, 0)
				entity_set_int(piccolo[id], EV_INT_sequence, 214 ) //set the entity's animation sequence
				set_pev( piccolo[id], pev_controller, 125 )	
				set_pev( piccolo[id], pev_controller_0, 125 )
				set_pev( piccolo[id], pev_controller_1, 125 )
				set_pev( piccolo[id], pev_controller_2, 125 )
				set_pev( piccolo[id], pev_controller_3, 125 ) //make the entity's model play correctly
				client_cmd(id, "spk piccolo/mfb_special.wav")
				emit_sound(id,CHAN_STATIC, "piccolo/throw.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
				set_task(2.9,"ricecooker",id)
			}
		}
		else{
			client_print(id,print_chat,"You are too close with the target") 
		}
	}
	return PLUGIN_HANDLED
}

public newtargetent(id) //Perhaps, this is the target's soul...
{
	newtent[id] = create_entity( "env_sprite" );
	engfunc( EngFunc_SetModel, newtent[id], "sprites/finishingbustera.spr" );
	entity_set_float( newtent[id], EV_FL_scale, 3.0 )
	entity_set_int( newtent[id], EV_INT_renderfx, kRenderFxStrobeSlow );
	entity_set_int( newtent[id], EV_INT_rendermode, kRenderTransAdd );
	entity_set_float( newtent[id], EV_FL_renderamt, 255.0 );
	set_pev( newtent[id], pev_origin, targetorg)
	set_entity_visibility(target[id], 0)
	mfbtrailSwch[id] = 1
	mfbbeamSwch[id] = 0
	set_task(1.0,"suckent",id)
	set_task(3.0,"getcloser",id)
	set_task(15.0,"getover",id)
}
public ricecooker(id) 
{
	if(swch[id] ==0 || swch[id] ==2){
		cooker[id] = create_entity( "env_model" );
		engfunc( EngFunc_SetModel, cooker[id], "models/boom.mdl" );
		entity_set_float( cooker[id], EV_FL_scale, 1.0 );
		entity_set_int( cooker[id], EV_INT_rendermode, kRenderFxNone );
		entity_set_float( cooker[id], EV_FL_renderamt, 255.0 );
		entity_set_float(cooker[id], EV_FL_animtime, get_gametime()) //set the entity's animation time
		entity_set_float(cooker[id], EV_FL_framerate, 1.5) //set the entity's animation rate
		
		new Float: angvec2[3]
		angle_vector(org2, 1, angvec2)
		new Float:angles2[3]
		vector_to_angle(angvec2, angles2 )
		set_pev( cooker[id], pev_angles, angles2)
		set_pev( cooker[id], pev_v_angle, org2)
		set_pev( cooker[id], pev_origin, org1)
		
		emit_sound(id,CHAN_STATIC, "piccolo/throw2.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
		entity_set_int(cooker[id], EV_INT_sequence, 0) //set the entity's animation sequence
		set_pev( cooker[id], pev_controller, 125 )	
		set_pev( cooker[id], pev_controller_0, 125 )
		set_pev( cooker[id], pev_controller_1, 125 )
		set_pev( cooker[id], pev_controller_2, 125 )
		set_pev( cooker[id], pev_controller_3, 125 )
		swch[id]++
		set_task(1.0,"ricecooker",id)
	}
	else
	{
		set_task(2.5,"usericecooker",id)
		entity_set_int(piccolo[id], EV_INT_sequence, 2 )
		engfunc( EngFunc_SetModel, cooker[id], "models/ricecooker.mdl" );
		swch[id] = 0
	}
}

public usericecooker(id)
{
	entity_set_float(piccolo[id], EV_FL_animtime, get_gametime())
	entity_set_int(piccolo[id], EV_INT_sequence, 117 )
	emit_sound(id,CHAN_STATIC, "piccolo/mfb_charging.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
	set_task(8.0,"usericecooker2",id)
}
public usericecooker2(id)
{
	emit_sound(id,CHAN_STATIC, "piccolo/mfb.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
	set_task(2.0,"showbeam",id)
}
public showbeam(id) //connect with the target with a beam
{
	ScreenSwch[id] = 1
	mfbbeamSwch[id] = 1
	client_cmd(id, "default_fov 150")
	entity_set_int(piccolo[id], EV_INT_sequence, 118 )
	
	mfbspacefx[id] = create_entity( "env_sprite" );
	engfunc( EngFunc_SetModel, mfbspacefx[id], "sprites/spacefx.spr" );
	entity_set_int( mfbspacefx[id], EV_INT_rendermode, kRenderTransAdd );
	entity_set_float( mfbspacefx[id], EV_FL_renderamt, 255.0 );
	entity_set_float(  mfbspacefx[id], EV_FL_scale, 0.7 );
	set_pev(  mfbspacefx[id], pev_origin, org1)
	
	emit_sound(id,CHAN_STATIC, "weapons/buster_fire.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
	client_cmd(id, "spk piccolo/music.wav")
	set_task(6.6,"newtargetent",id)
}

public suckent(id) //sucking hole..am i right? this name is really..weird...
{
	mfbsuckent[id] = create_entity( "env_sprite" );
	engfunc( EngFunc_SetModel, mfbsuckent[id], "sprites/sucking.spr" );
	entity_set_int( mfbsuckent[id], EV_INT_rendermode, kRenderTransAdd );
	entity_set_float( mfbsuckent[id], EV_FL_renderamt, 255.0 );
	entity_set_float( mfbsuckent[id], EV_FL_scale, 1.0 );
	set_pev( mfbsuckent[id], pev_origin, org1)
	mfb_sucking(id)
}

public mfb_sucking(id) //animate the spr
{
	if(mfbtrailSwch[id] == 1)
	{
		if(frame[id] < 30.0){
			pev(mfbsuckent[id], pev_frame, frame[id])
			set_pev(mfbsuckent[id], pev_frame, frame[id] + 1.0)
			set_task(0.1,"mfb_sucking",id)
		}
		else{
			frame[id] = 0.0
			set_pev(mfbsuckent[id], pev_frame, 0.0)
			set_task(0.1,"mfb_sucking",id)
		}
	}
}

stock mfb_trail(id, r, g, b)
{
	message_begin(MSG_BROADCAST, SVC_TEMPENTITY) 
	write_byte(22)
	write_short(id) //entity index
	write_short(trail) //SPR
	write_byte(80) //Timer
	write_byte(10) //width
	write_byte(r) //R
	write_byte(g) //G
	write_byte(b) //B
	write_byte(255) //Brightness
	message_end()
}

stock mfb_beam(id,iEnt)
{
	message_begin(MSG_BROADCAST, SVC_TEMPENTITY)
	write_byte(8)
	write_short(id)
	write_short(iEnt)
	write_short(beam)
	write_byte(1)
	write_byte(1)
	write_byte(1)
	write_byte(255)
	write_byte(0)
	write_byte(0)
	write_byte(255)
	write_byte(0)
	write_byte(200)
	write_byte(100)
	message_end()
}

stock mfb_head(x, y, z)
{
	message_begin(MSG_BROADCAST, SVC_TEMPENTITY)
	write_byte(17)
	write_coord(x)
	write_coord(y)
	write_coord(z)
	write_short(mfbheadspr)
	write_byte(2)
	write_byte(200)
	message_end()
}

public getcloser(id) //make the target get closer with the player who is using the function
{
	pev(target[id], pev_origin, vec2)
	set_pev( newtent[id], pev_origin, vec2)
	xs_vec_normalize(vec3, vec3)
	vec3[0] = (org1[0] - vec2[0])
	vec3[1] = (org1[1] - vec2[1])
	vec3[2] = (org1[2] - vec2[2])
	set_pev(target[id], pev_velocity, vec3)
	if(swch[id] < 2){
		set_task(0.5,"getcloser",id)
	}
	return PLUGIN_HANDLED
}

public getover(id) //ready for finishing the function
{
	ScreenSwch[id] = 0
	ScreenFade(id, 25, {0, 255, 0}, 255)
	swch[id] = 2
	mfbtrailSwch[id] = 0
	remove_entity(newtent[id])
	remove_entity(mfbspacefx[id])
	client_cmd(id, "default_fov 0")
	remove_entity(piccolo[id])
	remove_entity(mfbsuckent[id])
	set_entity_visibility(id, 1)
	client_cmd(id, "cam_idealdist 150")
	entity_set_int(cooker[id], EV_INT_sequence, 1)
	entity_set_int( cooker[id], EV_INT_rendermode, kRenderTransAdd );
	emit_sound(id,CHAN_STATIC, "piccolo/ha2.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
	emit_sound(id,CHAN_STATIC, "piccolo/mfb_over.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
	set_pdata_int( id, 301, 0, -89 )
	set_task(2.0,"lockcooker",id)
	set_task(10.0,"getover2",id)
}

public getover2(id) //totally end
{
	entity_set_int( cooker[id], EV_INT_rendermode, kRenderFxNone );
	client_cmd(id, "cam_idealdist 40")
	set_pev( id, pev_flags, pev( id, pev_flags ) & ~FL_FROZEN );
}

public lockcooker(id)
{
	emit_sound(id,CHAN_STATIC, "piccolo/mfb_glowing.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
	set_task(180.0,"unlockcooker",id)
}

public unlockcooker(id) //unlock the ricecooker so make the target free
{
	new Float: org3[3]
	mfbexp[id] = create_entity( "env_sprite" );
	engfunc( EngFunc_SetModel, mfbexp[id], "sprites/exp1.spr" );
	entity_set_int( mfbexp[id], EV_INT_rendermode, kRenderTransAdd );
	entity_set_float( mfbexp[id], EV_FL_renderamt, 255.0 );
	entity_set_float(  mfbexp[id], EV_FL_scale, 3.0 );
	pev(target[id], pev_origin, org3)
	remove_entity(cooker[id])
	set_pev(  mfbexp[id], pev_origin, org3)
	emit_sound(target[id],CHAN_STATIC, "piccolo/throw2.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
	set_task(2.0,"unlockcooker2",id)
}

public unlockcooker2(id)
{
	new Float: org4[3]
	remove_entity(mfbexp[id])
	ScreenFade(target[id], 10, {255, 255, 255}, 200)
	emit_sound(target[id],CHAN_STATIC, "weapons/teleport.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
	pev(target[id], pev_origin, org4)
	org4[2] = org4[2] + 30.0
	set_pev(  target[id], pev_origin, org4)
	set_entity_visibility(target[id], 1)
	
	if(is_user_bot(target[id]))
	{
		set_pev( target[id], pev_flags, pev( target[id], pev_flags ) & ~FL_FROZEN );
		client_cmd(1, "idlebots 0")
	}
	else{
		set_pev( target[id], pev_flags, pev( target[id], pev_flags ) & ~FL_FROZEN );
	}
	set_pdata_int( target[id], 301, 0, -89 )
	TotalSwch[id] = 0
}

stock UTIL_IsBusy( id )
	{//tuty's code part
if( get_pdata_int( id, 459 ) == 0 	// Speed
|| get_pdata_int( id, 462 ) == 0 	// Speed
|| get_pdata_int( id, 196 )	 	// Turbo
|| get_pdata_int( id, 198 )		// Attack Block
|| get_pdata_int( id, 199 )		// Powerup
|| get_pdata_int( id, 200 )		// Attack Charge
|| get_pdata_int( id, 230 )		// Player is throw away		
|| get_pdata_int( id, 300 )		// Throw
|| get_pdata_int( id, 298 )		// Advanced Melee
|| get_pdata_int( id, 317 )		// Swooping
|| get_pdata_int( id, 464 ) == 0		// Shooting Attack
|| get_pdata_int( id, 27 ) == 0		// Falling down
|| pev( id, pev_health ) < 6.0 		// Hp less then 6 meaning KI is losing
|| pev( id, pev_movetype ) == 15		// Beam Jump 
|| pev( id, pev_sequence) > 2 )		// Not standing quietly on the ground 
{
return 1;			// So client is busy with something
}
return 0;				// Client is not busy, is ok.
}

stock ScreenFade(id, Timer, Colors[3], Alpha) 
{
	message_begin(MSG_ONE_UNRELIABLE, get_user_msgid("ScreenFade"), _, id);
	write_short((1<<12) * Timer)
	write_short(1<<12)
	write_short(0)
	write_byte(Colors[0])
	write_byte(Colors[1])
	write_byte(Colors[2])
	write_byte(Alpha)
	message_end()
}

stock screen_shake(id, amplitude, duration, frequency) 
{ 
	message_begin(MSG_ONE_UNRELIABLE, get_user_msgid("ScreenShake"), _, id) 
	write_short((1<<12)*amplitude) // amplitude
	write_short((1<<12)*duration) // duration 
	write_short((1<<12)*frequency) // frequency
	message_end() 
} 

public plugin_precache(){
	precache_model("models/esfkami.piccolo.mdl");
	precache_model("models/boom.mdl");
	precache_model("models/ricecooker.mdl");
	beam = precache_model("sprites/evm_kaiokentrail.spr");
	trail = precache_model("sprites/white.spr");
	precache_model("sprites/exp1.spr");
	precache_model("sprites/finishingbustera.spr");
	mfbheadspr = precache_model("sprites/Fusion.Engage.spr");
	precache_model("sprites/spacefx.spr");
	precache_model("sprites/sucking.spr");

	precache_sound("piccolo/throw.wav")
	precache_sound("piccolo/throw2.wav")
	precache_sound("piccolo/mfb_charging.wav")
	precache_sound("piccolo/mfb.wav")
	precache_sound("piccolo/buster_fire.wav")
	precache_sound("piccolo/ha2.wav")
	precache_sound("piccolo/mfb_over.wav")
	precache_sound("piccolo/mfb_glowing.wav")
	precache_sound("weapons/teleport.wav")
}
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang2052\\ f0\\ fs16 \n\\ par }
*/
