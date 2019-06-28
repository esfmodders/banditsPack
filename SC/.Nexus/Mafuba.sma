/*==================================================================================================
LIBRARIES.
==================================================================================================*/
 
#include <amxmodx>
#include <engine>
#include <hamsandwich>
#include <xs>

#include <ipci/Ascend>
#include <ipci/Core>
#include <ipci/FXLib>
 
#include <xtension/Special>
 
#include <amxmisc>
#include <fun>
#include <fakemeta>
 
#include <ipci/ascend>
#include <ipci/dragonball>
#include <xs>
 
//stock MSG_Explosion;


new bool:Mafubamaker[32];
new bool:Jumpboolcd[32];
new bool:Mafubavictim[32];
 
/*==================================================================================================
ADDITIONAL MATERIAL.
==================================================================================================*/
 
#define SPECIAL_VALREQSTATE 1
#define SPECIAL_NULREQSTATE 0

#define esf_get_ki(%1)		entity_get_float( %1, EV_FL_fuser4 )
#define esf_set_ki(%1,%2)	entity_set_float( %1, EV_FL_fuser4, %2 )  

 
stock SpecialXtension:__sx_Mafuba;

// Sequence
static __int_Sequence[2], __int_Capsule;

// Effects
static __int_Gibs[3], __int_Trail, __int_Lightning;

// Conditions
new sprLightning, sprSmoke;


stock SPR_Shockwave[] = "spriteswod/shockwave.spr";

new spr_blood_drop

/*==================================================================================================
START OF THE SPECIAL.
==================================================================================================*/
 
public plugin_init()
{
	register_plugin("Mafuba", "1337", "BANDIT/Recursive");
	
	register_forward(FM_AddToFullPack, "@FM_AddToFullPack", ._post = true);
	
	RegisterHam(Ham_Use, "func_button", "@Ham_Use");
	
	RegisterHam(Ham_TakeDamage, "info_target", "@Ham_TakeDamage");
	
	//register_clcmd("say c", "@CreateMafubaBeamEntity");
	
	register_think("capsule_jar", "@Think_Jar");
	
	register_touch("worldspawn", "capsule_jar", "@Touch_Jar");
	
	//register_forward( FM_Touch, "@EntityTouch" );  
	
	register_touch("mafubamain", "*", "Mafuba_Touch"); //This way, is will only run if the entity is "Mafuba"
	
	register_touch( "mafubaphase2", "*", "Mafubaphase2_Touch")
	
   
	//MSG_Explosion		= 	MSGID( "Explosion" );
	
	//register_clcmd("say 1", "@boomeffect");
	
	//register_clcmd("say 2", "unfreeze");
	
	//register_clcmd("say test", "hpweg");
	
	//register_clcmd("say test2", "@fxLight");
	
	//register_clcmd("say id", "maker");
	
	//register_clcmd("say test3", "@fxLightning");
	
	//register_clcmd("say test4", "pdata");
	
	register_event("DeathMsg", "Event_DeathMsg", "a" );
	
	//register_forward( MafubaCore, "@Think_MafubaCore" );
	
	//register_forward( mafuba, "@Think_Mafuba" );
	
	
}

public Event_DeathMsg()
{
	new victim = read_data( 2 ); // second parameter (the victim !)


	if(Mafubavictim[victim])
	{
		Mafubavictim[victim] = false
		
		//client_print(id, print_chat, "tot set");
	}
	else if(Mafubamaker[victim])
	{
		Mafubamaker[victim] = false
		
		//client_print(id, print_chat, "tot set");
	}
}
 
public plugin_precache()
{
	precache_model("models/capsule.mdl");
	precache_model("models/ricecooker.mdl");
	
	precache_model("sprites/mafuba.spr");
	
	__int_Trail = precache_model("sprites/auratrail.spr");
	
	__int_Lightning = precache_model("sprites/lgtning.spr");
	
	__int_Gibs[0] = precache_model("models/teil1.mdl");
	__int_Gibs[1] = precache_model("models/teil2.mdl");
	__int_Gibs[2] = precache_model("models/teil3.mdl");
	
	precache_model("models/mafubaspiral.mdl");
	
	precache_model("models/mafubaspiral2.mdl");
	
	precache_sound("weapons/mafuba/mafubafire.wav");
	precache_sound("weapons/mafuba/mafubayes.wav");
	
	precache_sound("weapons/mafuba/capsule_click.wav");
	precache_sound("weapons/mafuba/capsule_decompression.wav");
	
	precache_sound("weapons/mafuba/jar_use.wav");
	precache_sound("weapons/mafuba/jar_break.wav");
	
	precache_sound("weapons/mafuba/mafubacatch.wav");
	precache_sound("weapons/mafuba/mafubaphase2beam.wav");
	
	precache_sound("weapons/powerup.wav");
	precache_sound("weapons/mafuba/player_scream.wav");
	spr_blood_drop = precache_model("sprites/blood.spr") 	
	
	precache_model( "sprites/mafubatrail2.spr" );
	
	precache_model( "models/mafubafire.mdl" );
	
	precache_model( "models/mafubagreenspiral.mdl" );
	
	precache_model( "sprites/mafubaphase2.spr" );
	
	precache_model( "sprites/mafubaphase2trail.spr" );
	
	precache_sound("common/wpn_select.wav");
}
 
public Mafuba_Touch(ent, id)
{
	
	
	//Jump(ent);

	if(!pev_valid(ent))
		return
	
	if(!is_user_alive(id)) //Check if the touched thing is a player or not
		return
	
	
	if(id == pev(ent, pev_owner)) //Prevent owner from touch it (Put yourself in your own trap is so silly)
		return
		
	if(!task_exists(ent+9999))
	{
		if(!Mafubavictim[id])
		{
			//unregister_think(mafubaRegisterID);
			
			//unregister_forward( mafuba, "@Think_Mafuba" );
			//unregister_forward( MafubaCore, "@Think_MafubaCore" );
		
			set_task(1.0, "removeEntity", ent+9999); //Prevent from touching multiple time
			set_task(1.0, "removeEntity", entity_get_int(ent,EV_INT_iuser3)+9999);
			// remove follow_enemy-task
			//remove_task(ent);		
			
			new params[2];
			params[0] = id;
			params[1] = pev(ent, pev_owner);
			set_task(10.0, "StartPhase2", 12345, params, sizeof(params));
			
			set_task(1.0, "StartSpiral", 12345, params, sizeof(params));			
		
			Boom(id);				
			
			freezePlayer(id);
			
			set_task(1.0, "freezePlayer",id);
			
			set_task(10.0, "invisi",id);
		}
    }
}

public visi(id)
{
	set_entity_visibility(id, 1)
}

public hpweg(id)
{
	if (is_user_alive(id))
	{
		set_user_health(id, get_user_health(id) - 2 )
	}
}

public pdata(id)
{
	set_pdata_int(id, 301, 1, -89 )
}

public pdata2(id)
{
	set_pev( id, pev_maxspeed, 1000.0 )
}

public JBR(ent)
{
	Jumpboolcd[pev(ent, pev_owner)] = false;	
}

public fade(id)
{
	set_user_rendering(id,kRenderFxGlowShell,255,0,0,kRenderNormal,25) 
}

public invisi(id)
{
	set_entity_visibility(id, 0)
}

public @Movementlocker(Client)
{
	//console_print(0, "ficken");

	if(Mafubamaker[Client])
	{
		//return PLUGIN_HANDLED 
		//console_print(0, "XXX");
	}
}

public Mafubaphase2_Touch(ent, id)
{
	if(!pev_valid(ent))
		return
		
	if(is_user_alive(id)) //Check if the touched thing is a player or not
		return
		
	id = entity_get_int(ent,EV_INT_iuser4);
	
	if(!task_exists(ent+9999))
	{
		set_task(1.0, "removeEntity", ent+9999); //Prevent from touching multiple time
		
		Mafubamaker[pev(ent,pev_owner)] = false
		
		//client_print(pev(ent,pev_owner), print_chat, "Der macher macht nichtmehr");
		
		remove_task(ent);
		
		new Float:origin[3];
		pev(ent,pev_origin,origin);
		new mjar = -1;
            
		while((mjar = find_ent_in_sphere(mjar,origin,60.0)) != 0) 
		{
			new className[32];
			entity_get_string(mjar, EV_SZ_classname, className,32);
				
			if(equali(className, "capsule_jar"))
			{
				//console_print(0, "Krug erkannt und wäre treffer");
                
				Phase3(mjar, id);
				
				//freezePlayer(id)
				
				@CreateMafubafire(100, mjar, mjar, 1.0, 0);
				
				return;
			}
		}	
		
		//console_print(0, "Daneben");
		setFree(id,ent);
    }
}




public test2(id)
{
	static Float:origin[3];
	pev(id,pev_origin,origin);
	
	message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
	write_byte(TE_SPARKS)
	write_coord(floatround(origin[0])); // x
	write_coord(floatround(origin[1])); // y
	write_coord(floatround(origin[2])); // z	
	message_end();
}

public test3(id)
{
	static Float:origin[3];
	pev(id,pev_origin,origin);
	
	message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
	write_byte(TE_SMOKE)
	write_coord(floatround(origin[0])); // x
	write_coord(floatround(origin[1])); // y
	write_coord(floatround(origin[2])); // z	
	write_short(spr_blood_drop); 
	write_byte(2.0)
	write_byte(5)
	message_end();
}

public Phase3(__int_TheMainJar, __int_TheCapturedVictim)
{
    new __int_Data[2];
    
    __int_Data[0] = __int_TheMainJar;
    __int_Data[1] = __int_TheCapturedVictim;
    
    set_task(float(6), "CheckJarStatus", _, __int_Data, 2);
}

public CheckJarStatus(__int_Data[2])
{
	//client_print(0, print_chat, "jar sequence: %d", entity_get_int(__int_Data[0], EV_INT_sequence));

    if(is_user_alive(__int_Data[1]) && is_valid_ent(__int_Data[0]))
    {
		//console_print(0, "check2");
		
        if(entity_get_int(__int_Data[0], EV_INT_sequence) == 1) // Check if Jar is open.
        {
            // Set Victim's free ???? y ??????
			setFree(__int_Data[1], __int_Data[0]);
			
			//console_print(0, "Er ist entkommen");
			
        }
        else
        {
			CheckJarStatus2(__int_Data);
			
            // Closed jar.
			//console_print(0, "Mafuba geklappt");
			emit_sound(__int_Data[0], CHAN_WEAPON, "weapons/mafuba/mafubayes.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
			
			set_task(random_float(60.0, 320.0), "@fxKillJar", _, __int_Data, 2);
			
			freezePlayer(__int_Data[1])
			
			set_task(float(60), "@fxLightning", _, __int_Data, 2);
			
			//set_task(10.0, "destroyaftertimer",__int_Data[1]);	
			
			//@fxKillJar(__int_Data[0])  <---warum geht das!?
        }
    }
}

public opener(__int_Data[2])
{	
	entity_set_int(__int_Data[0], EV_INT_sequence,1)
}

public CheckJarStatus2(__int_Data[2])
{
	//console_print(0, "check");

	if(is_valid_ent(__int_Data[0]))
	{
		if(entity_get_int(__int_Data[0], EV_INT_sequence) == 0)
		{
			set_task(float(1), "CheckJarStatus2", _, __int_Data, 2);
		}
		else
		{
			setFree(__int_Data[1], __int_Data[1]);
			@fxKillJar(__int_Data[0]);
		}
	}
	else
	{
		setFree(__int_Data[1], __int_Data[1]);
		@fxKillJar(__int_Data[0]);
	}
}

public StartPhase2(params[],taskid)
{
	@CreateMafubaBeamEntityphase2(100,params[1],params[0], 1.0, 10);
}

public StartSpiral(params[],taskid)
{
	@CreateMafubaSpiral(100,params[1],params[0], 1.0, 0);
	
	@CreateMafubaSpiral20(100,params[1],params[0], 1.0, 0);
	
}

public freezePlayer(id)
{
	set_task(1.0, "freezePlayer2",id);

	set_pev(id, pev_flags, pev(id, pev_flags) | FL_FROZEN);
	
	// not a good solution! hp lock?
	set_task(0.1, "catch",id);
	
	setClientPROTECT(id);
	
	set_user_godmode(id,1);
	
	//set_user_noclip(id,1);
	
	set_pdata_int(id, 301, 1, -89 )
	
	entity_set_int(id,EV_INT_solid,SOLID_NOT)  
	
	set_pdata_int(id, 218, true);
	
	//client_print(0, print_chat, "1: %d", id);
	
	Mafubavictim[id] = true	
	
	//client_print(id, print_chat, "Das Opfa");
	
	if(is_user_bot(id))
	{
		server_cmd("observer 1")
	}
}

public freezePlayer2(id)
{
	//set_task(1.0, "freezePlayer2",id);

	set_pev(id, pev_flags, pev(id, pev_flags) | FL_FROZEN);
	
	// not a good solution! hp lock?
	//set_task(0.1, "catch",id);
	
	set_user_godmode(id,1);
	
	//set_user_noclip(id,1);
	
	set_pdata_int(id, 301, 1, -89 )
	
	entity_set_int(id,EV_INT_solid,SOLID_NOT)  
	
	set_pdata_int(id, 218, true);
	
	//client_print(0, print_chat, "1: %d", id);
	
	Mafubavictim[id] = true	
	
	//client_print(id, print_chat, "Das Opfa");
	
	
}

public catch(id)
{
	esf_set_ki(id, -1.0);
}

public kihelp(id)
{
	esf_set_ki(id, 50.0);
}

public removespiral(id)
{
	remove_entity(id);
}

public maker(id)
{
	Mafubamaker[id] = false
}

public RemoverM(id)
{
	remove_entity(id);
}

public Mafubamakerpart(id)
{
	//set_pev(id, pev_flags, pev(id, pev_flags) | FL_FROZEN);
	
	set_pdata_int(id, 218, true);
	
	set_pev( id, pev_maxspeed, 1.0 )
	
	//setClientFROZEN (id, true);
	
	setClientXFROZEN (id, true);
	
	//set_pdata_int(id, 200, true);
	
	//set_pev( id, pev_maxspeed, -1.0 )
	
	Mafubamackerpartcheck(id+8777);
	
	if(getClientCLASS( id ) == getCXbyName( "Goku:Training Suit" ))
	{
		setClientANIMATION(id, 128 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Vegeta:Training Suit" ))
	{
		setClientANIMATION(id, 126 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Frieza" ))
	{
		setClientANIMATION(id, 126 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Future Gohan DBZ" ))
	{
		setClientANIMATION(id, 135 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Trunks-AF" ))
	{
		setClientANIMATION(id, 121 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Cell" ))
	{
		setClientANIMATION(id, 130 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "broly" ))
	{
		setClientANIMATION(id, 129 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "A18" ))
	{
		setClientANIMATION(id, 133 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Chichi" ))
	{
		setClientANIMATION(id, 126 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Black" ))
	{
		setClientANIMATION(id, 128 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Zamasu" ))
	{
		setClientANIMATION(id, 128 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Bechi" ))
	{
		setClientANIMATION(id, 165 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "B32" ))
	{
		setClientANIMATION(id, 128 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Bergamo" ))
	{
		setClientANIMATION(id, 129 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Bills" ))
	{
		setClientANIMATION(id, 130 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Buu" ))
	{
		setClientANIMATION(id, 124 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Buza" ))
	{
		setClientANIMATION(id, 124 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Zamasu-Fusion" ))
	{
		setClientANIMATION(id, 128 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Hit" ))
	{
		setClientANIMATION(id, 128 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Krillin" ))
	{
		setClientANIMATION(id, 125 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Gohan" ))
	{
		setClientANIMATION(id, 126 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Omegashenron" ))
	{
	setClientANIMATION(id, 129 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Piccolo" ))
	{
		setClientANIMATION(id, 128 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Picohan" ))
	{
		setClientANIMATION(id, 137 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Bardock" ))
	{
		setClientANIMATION(id, 127 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Muten-Roshi" ))
	{
		setClientANIMATION(id, 129 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Gogeta" ))
	{
		setClientANIMATION(id, 137 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Vegetto" ))
	{
		setClientANIMATION(id, 128 ,1.0);
	}
	else if(getClientCLASS( id ) == getCXbyName( "Jiren" ))
	{
		setClientANIMATION(id, 128 ,1.0);
	}		
	else 
	{
		setClientANIMATION(id, 128 ,1.0);
	}
}

public Mafubamackerpartcheck(id)
{
	//client_print(0, print_chat, "1: %d ", id);
	
	
	if(Mafubamaker[id-8777])
	{
	
		set_task(1.0, "Mafubamackerpartcheck",id);	
		hpweg (id-8777);
		
		
		//client_print(0, print_chat, "check");
		
	}
	else
	{
		setClientANIMATION(id-8777, -1 ,1.0);
		
		set_pdata_int(id-8777, 218, false);
		
		set_pev( id-8777, pev_maxspeed, 1000.0 )
		
		//setClientFROZEN (id-8777 , false);
	
		setClientXFROZEN (id-8777, false);
		
		
		//set_pdata_int(id-8777, 200, false);
	
		//set_pev(id-8888, pev_flags, pev(id-3, pev_flags) & ~FL_FROZEN);
		
	}
}

public teleport(ent)
{
	if(is_valid_ent(ent))
	{
		set_task(0.1, "teleport",ent);
	
		static Float:__float_Origin[3];
		entity_get_vector(ent, EV_VEC_origin, __float_Origin);
	
		entity_set_origin(entity_get_int(ent,EV_INT_iuser4), __float_Origin);
		__float_Origin[2] += 70;
	}
}

public setFree(id, ent)
{
	static Float:__float_Origin[3];
	entity_get_vector(ent, EV_VEC_origin, __float_Origin);
	
	__float_Origin[2] += 150.0;
	
	entity_set_origin(id, __float_Origin);
	
	//console_print(0, "free");
	
	
	
	//client_print(0, print_chat, "1: %d  2: %d", id,ent);
	
	//attachCam(id, id);
	
	set_task(1.0, "visi",id);
	set_task(5.0, "setFree2",id);
	
	set_task(0.5, "setFree3",id);
	
	BoomFree(id);
	

}

public setFree2(id, ent)
{
	set_pev(id, pev_flags, pev(id, pev_flags) & ~FL_FROZEN);
	
	Mafubavictim[id] = false
	
	set_user_godmode(id,0);
	
	setClientPROTECT(id, false);
	
	set_pdata_int(id, 301, 0)
	
	set_pdata_int(id, 218, false);
	
	entity_set_int(id, EV_INT_solid, SOLID_TRIGGER);
	
	//client_print(id, print_chat, "Das Opfa opft nimmer");
	
	if(is_user_bot(id))
	{
		server_cmd("observer 0")
	}
	
}

public setFree3(id, ent)
{
	@CreateMafubaSpiral2(100, id, id, 1.0, 0);
}

public attachCam(player, target)
{
	attach_view(player, target);
}

public removeEntity(ent) remove_entity(ent-9999); //Shorten  
 
public @CreateMafubaBeamEntityphase2 (__int_Entity, const __int_Owner, const __int_Victim, const Float:__float_Scale, const __int_Velocity)
{
	__int_Entity = create_entity("env_sprite");
	
	set_pev( __int_Entity, pev_animtime, 1.0);
	set_pev( __int_Entity, pev_framerate, 1.0);
	
	set_task(0.3, "AIM", __int_Entity,_,_,"b")
	
	entity_set_model(__int_Entity, "sprites/mafubaphase2.spr");
	
	
	entity_set_int(__int_Entity, EV_INT_spawnflags, SF_SPRITE_STARTON);
	
	DispatchSpawn(__int_Entity);
	
	entity_set_int(__int_Entity, EV_INT_renderfx, kRenderFxGlowShell);
	entity_set_int(__int_Entity, EV_INT_rendermode, kRenderTransAdd);
	
	entity_set_float(__int_Entity, EV_FL_animtime, get_gametime());
	entity_set_float(__int_Entity, EV_FL_framerate, float(10));
	
	entity_set_string(__int_Entity, EV_SZ_classname, "mafubaphase2");
	
	entity_set_float(__int_Entity, EV_FL_renderamt, float(254));
	
	entity_set_float(__int_Entity, EV_FL_scale, __float_Scale);
	
	entity_set_int(__int_Entity, EV_INT_movetype, MOVETYPE_TOSS);
	
	entity_set_size(__int_Entity, Float:{-4.000_000, -4.000_000, -4.000_000}, Float:{4.000_000, 4.000_000, 4.000_000});
	
	//entity_set_int(__int_Entity, EV_INT_solid, SOLID_TRIGGER);
	
	set_task(1.0, "Hartmacher",__int_Entity);
	
	//entity_set_edict(__int_Entity, EV_ENT_owner, __int_Owner);
	
	set_pev(__int_Entity,pev_owner, __int_Owner);
	entity_set_int(__int_Entity, EV_INT_iuser4, __int_Victim);
	
	entity_set_edict(__int_Entity, EV_ENT_pContainingEntity, __int_Entity);
	
	static Float:__float_Origin[3];
	entity_get_vector(__int_Victim, EV_VEC_origin, __float_Origin);
	
	entity_set_origin(__int_Entity, __float_Origin);
	
	static Float:__float_Velocity[3];
	velocity_by_aim(__int_Owner, __int_Velocity, __float_Velocity);
	
	__float_Velocity[2] += 600.0;
	
	entity_set_vector(__int_Entity, EV_VEC_velocity, __float_Velocity);
	
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY )
	write_byte( TE_BEAMFOLLOW )
	write_short( __int_Entity )
	write_short( engfunc( EngFunc_ModelIndex,"sprites/mafubaphase2trail.spr" ) )
	write_byte( 30 )// 持续时间[] life in 0.1's
	write_byte( 5 )// 宽度[] line width in 0.1's
	write_byte( 255 )// Red
	write_byte( 255 )// Green
	write_byte( 255 )// Blue
	write_byte( 255 )// Brightness
	message_end( )
	
	set_task(0.2, "teleport",__int_Entity);
	//attachCam(__int_Victim, __int_Entity);
	
	emit_sound(__int_Entity, CHAN_WEAPON, "weapons/mafuba/mafubaphase2beam.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
}

public @CreateMafubaSpiral (__int_Entity, const __int_Owner, const __int_Victim, const Float:__float_Scale, const __int_Velocity)
{
	__int_Entity = create_entity("info_target");
	
	entity_set_model(__int_Entity, "models/mafubaspiral.mdl");
	
	entity_set_int(__int_Entity, EV_INT_spawnflags, SF_SPRITE_STARTON);
	
	DispatchSpawn(__int_Entity);
	
	entity_set_int(__int_Entity, EV_INT_renderfx, kRenderFxGlowShell);
	entity_set_int(__int_Entity, EV_INT_rendermode, kRenderTransAdd);
	
	entity_set_float(__int_Entity, EV_FL_animtime, get_gametime());
	entity_set_float(__int_Entity, EV_FL_framerate, float(10));
	
	entity_set_string(__int_Entity, EV_SZ_classname, "mafubaspiral");
	
	entity_set_float(__int_Entity, EV_FL_renderamt, float(254));
	
	entity_set_float(__int_Entity, EV_FL_scale, __float_Scale);
	
	entity_set_int(__int_Entity, EV_INT_movetype, MOVETYPE_FLY);
	
	entity_set_size(__int_Entity, Float:{-7.000_000, -7.000_000, -7.000_000}, Float:{7.000_000, 7.000_000, 7.000_000});
	
	//entity_set_int(__int_Entity, EV_INT_solid, SOLID_TRIGGER);
	
	//entity_set_edict(__int_Entity, EV_ENT_owner, __int_Owner);
	
	set_pev(__int_Entity,pev_owner, __int_Owner);
	entity_set_int(__int_Entity, EV_INT_iuser4, __int_Victim);
	
	entity_set_edict(__int_Entity, EV_ENT_pContainingEntity, __int_Entity);
	
	static Float:__float_Origin[3];
	entity_get_vector(__int_Victim, EV_VEC_origin, __float_Origin);
	
	entity_set_origin(__int_Entity, __float_Origin);
	
	set_task(12.0, "removespiral",__int_Entity);
	
	emit_sound(__int_Entity, CHAN_WEAPON, "weapons/mafuba/mafubacatch.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	
}


public @CreateMafubafire (__int_Entity, const __int_Owner, const __int_Victim, const Float:__float_Scale, const __int_Velocity)
{
	__int_Entity = create_entity("info_target");
	
	entity_set_model(__int_Entity, "models/mafubafire.mdl");
	
	entity_set_int(__int_Entity, EV_INT_spawnflags, SF_SPRITE_STARTON);
	
	DispatchSpawn(__int_Entity);
	
	entity_set_int(__int_Entity, EV_INT_renderfx, kRenderFxGlowShell);
	entity_set_int(__int_Entity, EV_INT_rendermode, kRenderTransAdd);
	
	entity_set_float(__int_Entity, EV_FL_animtime, get_gametime());
	entity_set_float(__int_Entity, EV_FL_framerate, float(10));
	
	entity_set_string(__int_Entity, EV_SZ_classname, "mafubafire");
	
	entity_set_float(__int_Entity, EV_FL_renderamt, float(254));
	
	entity_set_float(__int_Entity, EV_FL_scale, __float_Scale);
	
	entity_set_int(__int_Entity, EV_INT_movetype, MOVETYPE_FLY);
	
	entity_set_size(__int_Entity, Float:{-7.000_000, -7.000_000, -7.000_000}, Float:{7.000_000, 7.000_000, 7.000_000});
	
	//entity_set_int(__int_Entity, EV_INT_solid, SOLID_TRIGGER);
	
	//entity_set_edict(__int_Entity, EV_ENT_owner, __int_Owner);
	
	set_pev(__int_Entity,pev_owner, __int_Owner);
	entity_set_int(__int_Entity, EV_INT_iuser4, __int_Victim);
	
	entity_set_edict(__int_Entity, EV_ENT_pContainingEntity, __int_Entity);
	
	static Float:__float_Origin[3];
	entity_get_vector(__int_Victim, EV_VEC_origin, __float_Origin);
	
	__float_Origin[2] += 2.0;
	
	entity_set_origin(__int_Entity, __float_Origin);
	
	set_task(6.0, "removespiral",__int_Entity);
	
	lighter3(__int_Entity);
	
	emit_sound(__int_Entity, CHAN_WEAPON, "weapons/mafuba/mafubafire.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	
}

public @CreateMafubaSpiral20 (__int_Entity, const __int_Owner, const __int_Victim, const Float:__float_Scale, const __int_Velocity)
{
	__int_Entity = create_entity("info_target");
	
	entity_set_model(__int_Entity, "models/mafubaspiral2.mdl");
	
	entity_set_int(__int_Entity, EV_INT_spawnflags, SF_SPRITE_STARTON);
	
	DispatchSpawn(__int_Entity);
	
	entity_set_int(__int_Entity, EV_INT_renderfx, kRenderFxGlowShell);
	entity_set_int(__int_Entity, EV_INT_rendermode, kRenderTransAdd);
	
	entity_set_float(__int_Entity, EV_FL_animtime, get_gametime());
	entity_set_float(__int_Entity, EV_FL_framerate, float(10));
	
	entity_set_string(__int_Entity, EV_SZ_classname, "mafubaspiral20");
	
	entity_set_float(__int_Entity, EV_FL_renderamt, float(254));
	
	entity_set_float(__int_Entity, EV_FL_scale, __float_Scale);
	
	entity_set_int(__int_Entity, EV_INT_movetype, MOVETYPE_FLY);
	
	entity_set_size(__int_Entity, Float:{-7.000_000, -7.000_000, -7.000_000}, Float:{7.000_000, 7.000_000, 7.000_000});
	
	//entity_set_int(__int_Entity, EV_INT_solid, SOLID_TRIGGER);
	
	//entity_set_edict(__int_Entity, EV_ENT_owner, __int_Owner);
	
	set_pev(__int_Entity,pev_owner, __int_Owner);
	entity_set_int(__int_Entity, EV_INT_iuser4, __int_Victim);
	
	entity_set_edict(__int_Entity, EV_ENT_pContainingEntity, __int_Entity);
	
	static Float:__float_Origin[3];
	entity_get_vector(__int_Victim, EV_VEC_origin, __float_Origin);
	
	entity_set_origin(__int_Entity, __float_Origin);
	
	set_task(12.0, "removespiral",__int_Entity);
	
}

public @CreateMafubaSpiral2 (__int_Entity, const __int_Owner, const __int_Victim, const Float:__float_Scale, const __int_Velocity)
{
	__int_Entity = create_entity("info_target");
	
	entity_set_model(__int_Entity, "models/mafubaspiral.mdl");
	
	
	entity_set_int(__int_Entity, EV_INT_spawnflags, SF_SPRITE_STARTON);
	
	DispatchSpawn(__int_Entity);
	
	entity_set_int(__int_Entity, EV_INT_renderfx, kRenderFxGlowShell);
	entity_set_int(__int_Entity, EV_INT_rendermode, kRenderTransAdd);
	
	entity_set_float(__int_Entity, EV_FL_animtime, get_gametime());
	entity_set_float(__int_Entity, EV_FL_framerate, float(10));
	
	entity_set_string(__int_Entity, EV_SZ_classname, "mafubaspiral2");
	
	entity_set_float(__int_Entity, EV_FL_renderamt, float(254));
	
	entity_set_float(__int_Entity, EV_FL_scale, __float_Scale);
	
	entity_set_int(__int_Entity, EV_INT_movetype, MOVETYPE_FLY);
	
	entity_set_size(__int_Entity, Float:{-7.000_000, -7.000_000, -7.000_000}, Float:{7.000_000, 7.000_000, 7.000_000});
	
	//entity_set_int(__int_Entity, EV_INT_solid, SOLID_TRIGGER);
	
	//entity_set_edict(__int_Entity, EV_ENT_owner, __int_Owner);
	
	set_pev(__int_Entity,pev_owner, __int_Owner);
	entity_set_int(__int_Entity, EV_INT_iuser4, __int_Victim);
	
	entity_set_edict(__int_Entity, EV_ENT_pContainingEntity, __int_Entity);
	
	static Float:__float_Origin[3];
	entity_get_vector(__int_Victim, EV_VEC_origin, __float_Origin);
	
	entity_set_origin(__int_Entity, __float_Origin);
	
	set_task(5.0, "removespiral",__int_Entity);
}



public Hartmacher(mcore)
{
	//client_print(0, print_chat, "hart");
	entity_set_int(mcore, EV_INT_solid, SOLID_TRIGGER);
}


public @CreateMafubaBeamEntity(__int_Entity, const __int_Owner, const Float:__float_Scale, const __int_Velocity)
{
	__int_Entity = create_entity("info_target");
	
	entity_set_model(__int_Entity, "models/mafubagreenspiral.mdl");
	
	set_pev( __int_Entity, pev_scale, 4.0 )// 缩放大小[] Scale value
	
	entity_set_int(__int_Entity, EV_INT_spawnflags, SF_SPRITE_STARTON);
	
	DispatchSpawn(__int_Entity);
	
	entity_set_int(__int_Entity, EV_INT_renderfx, kRenderFxGlowShell);
	entity_set_int(__int_Entity, EV_INT_rendermode, kRenderTransAdd);
	
	entity_set_float(__int_Entity, EV_FL_animtime, get_gametime());
	entity_set_float(__int_Entity, EV_FL_framerate, float(10));
	
	entity_set_string(__int_Entity, EV_SZ_classname, "mafubamain");
	
	entity_set_float(__int_Entity, EV_FL_renderamt, float(254));
	
	entity_set_float(__int_Entity, EV_FL_scale, __float_Scale);
	
	entity_set_int(__int_Entity, EV_INT_movetype, MOVETYPE_FLY);
	
	entity_set_size(__int_Entity, Float:{-2.000_000, -2.000_000, -2.000_000}, Float:{2.000_000, 2.000_000, 2.000_000});
	
	//entity_set_int(__int_Entity, EV_INT_solid, SOLID_TRIGGER);
	
	//entity_set_edict(__int_Entity, EV_ENT_owner, __int_Owner);
	set_pev(__int_Entity,pev_owner, __int_Owner)
	entity_set_edict(__int_Entity, EV_ENT_pContainingEntity, __int_Entity);
	
	static Float:__float_Origin[3];
	entity_get_vector(__int_Owner, EV_VEC_origin, __float_Origin);
	
	entity_set_origin(__int_Entity, __float_Origin);
	
	static Float:__float_Velocity[3];
	velocity_by_aim(__int_Owner, __int_Velocity, __float_Velocity);
	
	entity_set_vector(__int_Entity, EV_VEC_velocity, __float_Velocity);
	set_task(0.5, "Think_MafubaCore", __int_Entity,_,_,"b")
	
	Mafubamaker[__int_Owner] = true
	
	Mafubamakerpart (__int_Owner);
	
	set_task(1.0, "Hartmacher",__int_Entity);
	
	//overtime(__int_Entity,__int_Owner);
	
	
	//set_task(10.0, "RemoverM",__int_Entity);
	
	
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY )
	write_byte( TE_BEAMFOLLOW )
	write_short( __int_Entity )
	write_short( engfunc( EngFunc_ModelIndex,"sprites/mafubatrail2.spr" ) )
	write_byte( 30 )// 持续时间[] life in 0.1's
	write_byte( 30 )// 宽度[] line width in 0.1's
	write_byte( 255 )// Red
	write_byte( 255 )// Green
	write_byte( 255 )// Blue
	write_byte( 255 )// Brightness
	message_end( )
	
	set_task(0.5, "Trailer",__int_Entity);
	
}

public overtime(ent,id)
{
	client_print(0, print_chat, "trigger");

	new className[32];
	entity_get_string(ent, EV_SZ_classname, className,32);
	
	if(equali(className, "mafubamain"))
	{
		if(is_valid_ent(ent) && !Mafubamaker[id])
		{
			remove_entity(ent);
			
			client_print(0, print_chat, "weg");
		}
		else
		{
			set_task(5.0, "overtime",ent);
		}
	}
}
	
	

public lighter2(id)
{
	if(is_valid_ent(id))
	{

// new variable for origin and get origin of entity
		static Float:origin[3];
		pev(id,pev_origin,origin);


		// send the light flash
		message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
		write_byte(27); // TE_DLIGHT
		write_coord(floatround(origin[0])); // x
		write_coord(floatround(origin[1])); // y
		write_coord(floatround(origin[2])); // z	
		write_byte(30); // radius
		write_byte(255);	// r
		write_byte(255); // g
		write_byte(255); // b
		write_byte(120); // life <<<<<<<<
		write_byte(10); // decay rate
		message_end();
		
		
	}
}


public Umgebungsbaumwegmacher(Client)
{
	if(!is_user_alive(Client))
	{
		new Float:origin[3];
		pev(Client,pev_origin,origin);
		new ent = -1;
	
		while((ent = find_ent_in_sphere(ent,origin,500.0)) != 0) 
		{
			//new hp;
			if(!is_user_alive(Client))
			{
				ExecuteHam(Ham_TakeDamage, ent, 0, 0, Float:11280000792064, 1);
			}
			//pev(ent,pev_health, hp);
			//client_print(0, print_chat, "%d", hp); 
		}
	}
}

public lighter3(id)
{
	if(is_valid_ent(id))
	{

// new variable for origin and get origin of entity
		static Float:origin[3];
		pev(id,pev_origin,origin);


		// send the light flash
		message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
		write_byte(27); // TE_DLIGHT
		write_coord(floatround(origin[0])); // x
		write_coord(floatround(origin[1])); // y
		write_coord(floatround(origin[2])); // z	
		write_byte(10); // radius
		write_byte(0);	// r
		write_byte(255); // g
		write_byte(0); // b
		write_byte(120); // life <<<<<<<<
		write_byte(8); // decay rate
		message_end();
		
		set_task(1.0, "lighter3",id);
	}
}


public Trailer(__int_Entity)
{
	if(is_valid_ent(__int_Entity))
	{
		set_task(0.5, "Trailer",__int_Entity);
		
		
		message_begin( MSG_BROADCAST,SVC_TEMPENTITY )
		write_byte( TE_BEAMFOLLOW )
		write_short( __int_Entity )
		write_short( engfunc( EngFunc_ModelIndex,"sprites/mafubatrail2.spr" ) )
		write_byte( 30 )// 持续时间[] life in 0.1's
		write_byte( 30 )// 宽度[] line width in 0.1's
		write_byte( 255 )// Red
		write_byte( 255 )// Green
		write_byte( 255 )// Blue
		write_byte( 255 )// Brightness
		message_end( )
	}
}

stock fm_get_aim_velocity_from_ent(index, ent, Float:origin[3]) 
{
    new Float:start[3], Float:view_ofs[3], Float:ent_origin[3];
    pev(ent, pev_origin, ent_origin);
    pev(index, pev_origin, start);
    pev(index, pev_view_ofs, view_ofs);
    xs_vec_add(start, view_ofs, start);

    new Float:dest[3];
    pev(index, pev_v_angle, dest);
    engfunc(EngFunc_MakeVectors, dest);
    global_get(glb_v_forward, dest);
    xs_vec_mul_scalar(dest, 9999.0, dest);
    xs_vec_add(start, dest, dest);

    new Float:point[3];
    engfunc(EngFunc_TraceLine, start, dest, 0, index, 0);
    get_tr2(0, TR_vecEndPos, point);

    xs_vec_sub( point, ent_origin, origin );
    xs_vec_normalize( origin, origin );

    return 1;
}

public AIM(id)
{
    if (is_valid_ent(id))
    {
		if(Mafubamaker[pev(id,pev_owner)])
		{
			new Float:origin[3];
			fm_get_aim_velocity_from_ent(pev(id,pev_owner),id,origin);
			
			static Float:__float_Velocity[3];
			__float_Velocity[2] += 650.0;
			
			
			new Float:EntityAngles[3];
			vector_to_angle( origin, EntityAngles );
			set_pev( id, pev_angles, EntityAngles );
			
			origin[0] = origin[0] * 500;
			origin[1] = origin[1] * 500;
			origin[2] = origin[2] * 500;
			
			origin[2] = origin[2] + 200;
			
			
			
			entity_set_vector(id, EV_VEC_velocity, origin);
		}
    }
}

public Boom200 (id)
{
	static Float:varOrigin[3];
	entity_get_vector(id, EV_VEC_origin, varOrigin);	
	
    // debug output
	//console_print(0, "boom");
    
	engfunc(EngFunc_MessageBegin, MSG_ALL, get_user_msgid("Explosion") , varOrigin, 0)
	{
		engfunc(EngFunc_WriteCoord, varOrigin[0]);
		engfunc(EngFunc_WriteCoord, varOrigin[1]);
		engfunc(EngFunc_WriteCoord, varOrigin[2]);
			
		write_long(3500);
			
		write_byte(1);  //Color
	}
	message_end();
}


public Boom (id)
{
	static Float:varOrigin[3];
	entity_get_vector(id, EV_VEC_origin, varOrigin);	
	
    // debug output
	//console_print(0, "boom");
    
	engfunc(EngFunc_MessageBegin, MSG_ALL, get_user_msgid("Explosion") , varOrigin, 0)
	{
		engfunc(EngFunc_WriteCoord, varOrigin[0]);
		engfunc(EngFunc_WriteCoord, varOrigin[1]);
		engfunc(EngFunc_WriteCoord, varOrigin[2]);
			
		write_long(2500);
			
		write_byte(1);  //Color
	}
	message_end();
}

public BoomFree (id)
{
	//lighter2(id);

	Umgebungsbaumwegmacher(id);
	
	static Float:varOrigin[3];
	entity_get_vector(id, EV_VEC_origin, varOrigin);	
	
    // debug output
	//console_print(0, "boom");
    
	engfunc(EngFunc_MessageBegin, MSG_ALL, get_user_msgid("Explosion") , varOrigin, 0)
	{
		engfunc(EngFunc_WriteCoord, varOrigin[0]);
		engfunc(EngFunc_WriteCoord, varOrigin[1]);
		engfunc(EngFunc_WriteCoord, varOrigin[2]);
			
		write_long(800);
			
		write_byte(4);  //Color
	}
	message_end();
}

public createThunder(vec1[3], vec2[3])
{
	message_begin(MSG_BROADCAST, SVC_TEMPENTITY); 
	write_byte(0); 
	write_coord(vec1[0]); 
	write_coord(vec1[1]); 
	write_coord(vec1[2]); 
	write_coord(vec2[0]); 
	write_coord(vec2[1]); 
	write_coord(vec2[2]); 
	write_short(sprLightning); 
	write_byte(1);
	write_byte(5);
	write_byte(2);
	write_byte(20);
	write_byte(30);
	write_byte(200); 
	write_byte(200);
	write_byte(200);
	write_byte(200);
	write_byte(200);
	message_end();

	message_begin(MSG_PVS, SVC_TEMPENTITY,vec2); 
	write_byte(TE_SPARKS); 
	write_coord(vec2[0]); 
	write_coord(vec2[1]); 
	write_coord(vec2[2]); 
	message_end();
	
	message_begin(MSG_BROADCAST, SVC_TEMPENTITY, vec2); 
	write_byte(TE_SMOKE); 
	write_coord(vec2[0]); 
	write_coord(vec2[1]); 
	write_coord(vec2[2]); 
	write_short(sprSmoke); 
	write_byte(10);  
	write_byte(10)  
	message_end();
}

public @Think_Mafuba(ent)
{
	if(!is_valid_ent(ent) || !is_valid_ent(entity_get_int(ent,EV_INT_iuser3)))
		return;
	
	static Float:origin[3];
	entity_get_vector(entity_get_int(ent,EV_INT_iuser3), EV_VEC_origin, origin);
	
	new Float:ang[3], Float:vec[3];
	pev( ent, pev_angles, ang );
	
	ang[0] += 10.0;
	ang[2] = 180.0;
	set_pev( ent, pev_angles, ang );	
	
	angle_vector( ang, 2, vec );
	
	new Float: vec2[3];
	
	vec2[0] = vec[0];
	vec2[1] = vec[1] + 1.0;
	vec2[2] = vec[2];
	
	new Float: vecForward[3];
	xs_vec_cross( vec, vec2, vecForward );
	xs_vec_normalize( vecForward, vecForward );
	
	origin[0] += (vecForward[0] * 100);
	origin[1] += (vecForward[1] * 100);
	origin[2] += (vecForward[2] * 100);
	
	entity_set_origin(ent, origin);
	
	//set_pev(ent, pev_speed, 300.0 );
	
	entity_set_float(ent, EV_FL_nextthink, (get_gametime() + 0.01));
}

//public follow_enemy(ent)
public Think_MafubaCore(ent)
{
	if(!is_valid_ent(ent))
		return;
	
	new tid, id, closest[2]
	closest[0] = 0
	closest[1]= 6000
	id = pev(ent, pev_owner)
	tid = pev(ent, pev_iuser1)
	
	
	if(!Mafubamaker[id])
	{
		new className[32];
		entity_get_string(ent, EV_SZ_classname, className,32);
	
		if(equali(className, "mafubamain"))
		{
			remove_entity(ent);
				
			Boom200(ent);
			
			//client_print(0, print_chat, "weg");
		}
	}
	

	
	if(tid == 0)
	{
		new user_team = get_user_team(id)
		new pl[32], num, Float:flAngles[3], Float:flForward[3],
		Float:vector[3], Float:fired_particle_start_origin[3], Float:flVecSrc2[3],
		Float:maxdist, Float:flVecDest[3]
		get_players(pl,num,"a")
		
		pev(id, pev_v_angle, flAngles)
		angle_vector(flAngles, ANGLEVECTOR_FORWARD, flForward)
		
		pev(id, pev_origin, fired_particle_start_origin)
		pev(id, pev_view_ofs, vector)
	
		// get the fired particle start origin
		xs_vec_add(fired_particle_start_origin, vector, fired_particle_start_origin)
		
		for(new i = 0; i<num;i++)
		{
			tid = pl[i]
			if(tid == id && get_user_team(tid) == user_team) continue
			
			pev(tid, pev_origin, flVecSrc2)
			
			maxdist = get_distance_f(fired_particle_start_origin, flVecSrc2)
			
			flVecDest[0] = fired_particle_start_origin[0] + (flForward[0] * maxdist);
			flVecDest[1] = fired_particle_start_origin[1] + (flForward[1] * maxdist);
			flVecDest[2] = fired_particle_start_origin[2] + (flForward[2] * maxdist);
			
			if(get_distance_f(flVecDest, flVecSrc2) < closest[1]*1.0)
            {
                closest[0] = tid;
				closest[1] = floatround(get_distance_f(flVecDest, flVecSrc2));
            } 
		}
    } 
	else if(!is_user_alive(tid))
    {
        new Float:orig[3], Float:Torig[3]
       
        pev(ent, pev_origin, orig)
       
        new pl[32], num
       
        get_players(pl,num,"a")
        for(new i;i<num;i++)
        {
            tid = pl[i]
           
            pev(tid, pev_origin, Torig)
           
            if(get_distance_f(orig, Torig) < closest[1]*1.0)
                closest[0] = tid
            else
                closest[1] = floatround(get_distance_f(orig, Torig))
		}
	}
	if(closest[0] != 0) tid = closest[0]
	
	if(!is_user_alive(tid))
	{
		remove_task(ent)
		engfunc(EngFunc_RemoveEntity, ent)
		return
	}

	
	
	new Float:origin[3], Float:AimVec[3], Float:speed = 1400.0
	
	pev(tid, pev_origin, AimVec)
	
	entity_get_vector(ent, EV_VEC_origin, origin)
	
	// DEBUG - remove later
	//client_print(0, print_chat, "x: %d  y: %d  z: %d", origin[0],origin[1],origin[2]);
	
	new Float:iNewVelocity[3]
	
	new Float:velocityVec[3], Float:length
	
	velocityVec[0] = AimVec[0]-origin[0]
	velocityVec[1] = AimVec[1]-origin[1]
	velocityVec[2] = AimVec[2]-origin[2]
	
	length = floatsqroot(velocityVec[0]*velocityVec[0] + velocityVec[1]*velocityVec[1] + velocityVec[2]*velocityVec[2])
	// Stupid Check but lets make sure you don't devide by 0
	if ( length < 1.0 ) length = 1.0
	
	velocityVec[0] = velocityVec[0]*speed/length
	velocityVec[1] = velocityVec[1]*speed/length
	velocityVec[2] = velocityVec[2]*speed/length
	
	new Float:args[3]
	pev(ent, pev_velocity, args)
	iNewVelocity[0] = (velocityVec[0] + (args[0] * 2.0)) / 3.0
	iNewVelocity[1] = (velocityVec[1] + (args[1] * 2.0)) / 3.0
	iNewVelocity[2] = (velocityVec[2] + (args[2] * 2.0)) / 3.0
	
	set_pev(ent, pev_velocity, iNewVelocity)
	
	//set_pev(ent, pev_speed, 300.0 );
	
	//entity_set_float(ent, EV_FL_nextthink, (get_gametime() + 0.01));
}
 
public client_connect(__int_Index)
{
    @RemoveData(__int_Index);
}
 
public client_disconnect(__int_Index)
{
    @RemoveData(__int_Index);
}
 
public @ClientReSpawned(__int_Index)
{
    if(is_user_alive(__int_Index))
    {
        __int_Capsule |= (1 << __int_Index);
    }
}
 
public @SpecialCreation()
{
    beginSpecialCreation("Mafuba", "", "@CallBackMafuba", "special_mafuba");
   
    addSpecialCharge(   .ControlSequence = IN_ATTACK,
                .SecsForFullCharge = float(8),
                .KiPerStep = float(6),
                .CanMove = false);
   
    addSpecialCharge(   .ControlSequence = IN_ATTACK2,
                .SecsForFullCharge = float(1),
                .KiPerStep = float(0),
                .CanMove = true);
   
    __sx_Mafuba = endSpecialCreation();
}
 
public @CallBackMafuba(__int_Index, CSpecialState:__Status, __int_Control, Float:__float_Charge)
{
    switch(__Status)
    {
        case ssCharge:
        {
            if(__int_Control == IN_ATTACK2)
            {
                if(@IsPlayerBusy(__int_Index)
                || getClientINFREEFALL(__int_Index)
                || @ReturnAnimation(__int_Index, 1))
                {
                    return SPECIAL_NULREQSTATE;
                }
               
                if(__float_Charge == float(-1))
                {
                    set_pdata_int(__int_Index, 200, false);
                   
                    @StopAnimation(__int_Index, 2);
                }
               
                if(__float_Charge == float(0))
                {
                    set_pdata_int(__int_Index, 200, true);
                   
                    @StartAnimation(__int_Index, 0);
                }
               
                if(__float_Charge == 0.300_000 && __int_Capsule & (1 << __int_Index))
                {
                    emit_sound(__int_Index, CHAN_WEAPON, "weapons/mafuba/capsule_click.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
                }
            }
           
            else
            {
                if(getClientPOWERUP(__int_Index) && getClientXFROZEN(__int_Index))
                {
                    setClientFLY(__int_Index, false);
                }
               
                if(@IsPlayerBusy(__int_Index)
                || getClientFLY(__int_Index)
                || getClientTURBO(__int_Index)
                || ~entity_get_int(__int_Index, EV_INT_flags) & FL_ONGROUND)
                {
                    return SPECIAL_NULREQSTATE;
                }
               
                if(__float_Charge == 0.050_000)
                {
                    set_task(0.5, "@fxWorldLight", __int_Index, _, _, "b");
                   
                    message_begin(MSG_ALL, get_user_msgid("Powerup"));
                    {
                        write_byte(__int_Index);
                       
                        write_byte(0);
                        write_byte(0);
                        write_byte(0);
                    }
                    message_end();
                   
                    emit_sound(__int_Index, CHAN_WEAPON, "common/null.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
                   
                    emit_sound(__int_Index, CHAN_ITEM, "weapons/powerup.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
                }
               
                if(__float_Charge == 0.700_000)
                {
                    set_rendering(__int_Index, kRenderFxGlowShell, 0, _, 0, _, 10);
                }
               
                else if(__float_Charge == 0.325_000 || __float_Charge == 0.987_500)
                {
                    AddFx(__int_Index, "fxBlow");
                    AddFx(__int_Index, "fxScreenShake", float(5), float(1), float(5));
                }
            }
           
            entity_set_float(__int_Index, EV_FL_fuser2, __float_Charge);
           
            return SPECIAL_VALREQSTATE;
        }
       
        case ssChargeReleased:
        {
            if(__int_Control == IN_ATTACK2)
            {
                if(__float_Charge >= 0.325_000)
                {
                    @StartAnimation(__int_Index, 1);
                   
                    if(__int_Capsule & (1 << __int_Index))
                    {
                        @ThrowCapsule(__int_Index, (120 * floatround(__float_Charge * float(10))));
                    }
                   
                    else
                    {
                        client_print(__int_Index, print_center, "You don't have more capsules.");
                    }
                }
               
                else
                {
                    set_pdata_int(__int_Index, 200, false);
                   
                    @StopAnimation(__int_Index, 2);
                }
            }
           
            else
            {
                if(__float_Charge >= 0.900_000)
                {  
					@CreateMafubaBeamEntity(100, __int_Index, 1.0, 1600);
	
					emit_sound(__int_Index, CHAN_AUTO, "weapons/mafuba/player_scream.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
                }
               
                emit_sound(__int_Index, CHAN_ITEM, "common/null.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
               
                @RemoveChargeReferences(__int_Index);
            }
        }
       
        case ssChargeAborted:
        {
            if(__int_Control == IN_ATTACK2)
            {
                set_pdata_int(__int_Index, 200, false);
               
                @StopAnimation(__int_Index, 2);
            }
           
            else
            {
                emit_sound(__int_Index, CHAN_ITEM, "common/null.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
               
                @RemoveChargeReferences(__int_Index);
            }
           
            return SPECIAL_NULREQSTATE;
        }
       
        case ssForceAbort:
        {
            if(__int_Control == IN_ATTACK2)
            {
                set_pdata_int(__int_Index, 200, false);
               
                @StopAnimation(__int_Index, 2);
            }
           
            else
            {
                emit_sound(__int_Index, CHAN_ITEM, "common/null.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
               
                @RemoveChargeReferences(__int_Index);
            }
        }
    }
   
    return SPECIAL_VALREQSTATE;
}
 
public @ThrowCapsule(const __int_Index, const __int_Strengh)
{
    static __int_Entity;
    __int_Entity = create_entity("info_target");
   
    entity_set_string(__int_Entity, EV_SZ_classname, "capsule_jar");
   
    entity_set_model(__int_Entity, "models/capsule.mdl");
   
    DispatchKeyValue(__int_Entity, "health", "10");
   
    entity_set_int(__int_Entity, EV_INT_spawnflags, entity_get_int(__int_Entity, EV_INT_spawnflags) & SF_NORESPAWN);
   
    DispatchSpawn(__int_Entity);
   
    entity_set_float(__int_Entity, EV_FL_nextthink, (get_gametime() + 0.01));
   
    entity_set_float(__int_Entity, EV_FL_scale, 0.6);
   
    entity_set_int(__int_Entity, EV_INT_solid, SOLID_TRIGGER);
   
    entity_set_int(__int_Entity, EV_INT_movetype, MOVETYPE_BOUNCE);
   
    entity_set_size(__int_Entity, Float:{-0.500_000, -0.500_000, -0.500_000}, Float:{0.500_000, 0.500_000, 0.500_000});
   
    static Float:__float_Origin[3], Float:__float_Velocity[3];
    entity_get_vector(__int_Index, EV_VEC_origin, __float_Origin);
    entity_set_origin(__int_Entity, __float_Origin);
   
    velocity_by_aim(__int_Index, __int_Strengh, __float_Velocity);
   
    //__float_Velocity[2] += float(100);
   
    entity_set_vector(__int_Entity, EV_VEC_avelocity, Float:{200.0, 400.0, 600.0});
    entity_set_vector(__int_Entity, EV_VEC_velocity, __float_Velocity);
   
    message_begin(MSG_BROADCAST, SVC_TEMPENTITY);
    {
        write_byte(TE_BEAMFOLLOW);
       
        write_short(__int_Entity);
        write_short(__int_Trail);
       
        write_byte(5);
        write_byte(1);
       
        write_byte(255);
        write_byte(255);
        write_byte(255);
       
        write_byte(100);
    }
    message_end();
   
    __int_Capsule &= ~(1 << __int_Index);
}
 
public @SpawnJar(__int_Entity)
{

    if(is_valid_ent(__int_Entity))
    {
        entity_set_model(__int_Entity, "models/ricecooker.mdl");
       
        entity_set_int(__int_Entity, EV_INT_solid, SOLID_BBOX);
       
        entity_set_int(__int_Entity, EV_INT_movetype, MOVETYPE_TOSS);
       
        entity_set_size(__int_Entity, Float:{-0.500_000, -0.500_000, -0.500_000}, Float:{0.500_000, 0.500_000, 0.500_000});
       
        entity_set_float(__int_Entity, EV_FL_scale, float(1));
       
        entity_set_float(__int_Entity, EV_FL_animtime, get_gametime());
        entity_set_float(__int_Entity, EV_FL_framerate, 1.0);
       
        entity_set_int(__int_Entity, EV_INT_effects, EF_MUZZLEFLASH);
       
        entity_set_float(__int_Entity, EV_FL_takedamage, float(1));
       
        static Float:__float_Origin[3], __int_Origin[3];
        entity_get_vector(__int_Entity, EV_VEC_origin, __float_Origin);
        FVecIVec(__float_Origin, __int_Origin);
       
        entity_set_int(__int_Entity, EV_INT_sequence, 1);
       
        emit_sound(__int_Entity, CHAN_WEAPON, "weapons/mafuba/capsule_decompression.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
       
        static __int_Use;
        __int_Use = create_entity("func_button");
       
        entity_set_int(__int_Use, EV_INT_movetype, MOVETYPE_FOLLOW);
        entity_set_edict(__int_Use, EV_ENT_aiment, __int_Entity);
       
        entity_set_edict(__int_Use, EV_ENT_euser1, __int_Entity);
       
        entity_set_string(__int_Use, EV_SZ_classname, "mafuba_use");
       
        entity_set_edict(__int_Entity, EV_ENT_euser3, __int_Use);
		
		lighter2(__int_Entity);
    }
}

public @boomeffect(__int_Entity)
{
		static Float:__float_Origin[3], __int_Origin[3];
		entity_get_vector(__int_Entity, EV_VEC_origin, __float_Origin);
		FVecIVec(__float_Origin, __int_Origin);
	
	
		message_begin(MSG_BROADCAST, SVC_TEMPENTITY);
		{
			write_byte(TE_DLIGHT);
			
			write_coord(__int_Origin[0]);
			write_coord(__int_Origin[1]);
			write_coord(__int_Origin[2]);
			
			write_byte(10);
			write_byte(255);
			write_byte(255);
			write_byte(255);
			write_byte(30);
			write_byte(1);
		}
		message_end();
		
		message_begin(MSG_ALL, 98);
		{
			write_byte(2);
			write_short(__int_Entity);
			
			write_coord(__int_Origin[0]);
			write_coord(__int_Origin[1]);
			write_coord(__int_Origin[2]);
			
			write_short(200);
		}
		message_end();
		
		message_begin(MSG_ALL, 115, __int_Origin);
		{
			write_byte(3);
			write_byte(__int_Entity);
		}
		message_end();
		
		//message_begin(MSG_ALL, 106, __int_Origin);
		//{
			//write_short(__int_Entity);
			//write_byte(10);
		//}
		//message_end();
}
 

 
public @FM_AddToFullPack(__int_Handle, __int_Edict, __int_Entity, __int_Host, __int_Flags, __int_Player, __int_Set)
{
    if(__int_Player
    && __int_Entity == __int_Host
    && (is_user_alive(__int_Host) && !is_user_bot(__int_Host)))
    {
        if(__int_Sequence[0] & (1 << __int_Entity))
        {
            entity_set_float(__int_Entity, EV_FL_animtime, get_gametime());
            set_es(__int_Handle, ES_Sequence, 90);
            entity_set_float(__int_Entity, EV_FL_framerate, 0.380_000);
           
            if(entity_get_float(__int_Entity, EV_FL_fuser2) == float(1))
            {
                entity_set_float(__int_Entity, EV_FL_framerate, float(0));
            }
        }
       
        if(__int_Sequence[1] & (1 << __int_Entity))
        {
            entity_set_float(__int_Entity, EV_FL_framerate, float(2));
           
            static Float:__int_Frame[2];
           
            __int_Frame[0] = __int_Frame[1];
            __int_Frame[1] = entity_get_float(__int_Entity, EV_FL_frame);
           
            if(__int_Frame[0] > __int_Frame[1])
            {
                set_pdata_int(__int_Entity, 200, false);
               
                @StopAnimation(__int_Entity, 2);
            }
        }
    }
   
    return FMRES_IGNORED;
}
 
public @Think_Jar(__int_Entity)
{
	if(is_valid_ent(__int_Entity))
	{
		if(task_exists(__int_Entity))
		{
			remove_task(__int_Entity);
		}
		
		static Float:__float_Start[3], Float:__float_End[3];
		entity_get_vector(__int_Entity, EV_VEC_origin, __float_Start);
		
		__float_End[0] = __float_Start[0];
		__float_End[1] = __float_Start[1];
		__float_End[2] = (__float_Start[2] - float(9999));
		
		static __int_Trace;
		engfunc(EngFunc_TraceLine, __float_Start, __float_End, IGNORE_MONSTERS, 0, __int_Trace);
		
		static Float:__float_Angles[3];
		get_tr2(__int_Trace, TR_vecPlaneNormal, __float_Angles);
		
		vector_to_angle(__float_Angles, __float_Angles);
		
		__float_Angles[0] -= float(90);
		
		entity_set_vector(__int_Entity, EV_VEC_angles, __float_Angles);
		
		set_task(4.500_000, "@fxLight", __int_Entity);
		set_task(float(5), "@SpawnJar", __int_Entity);
	
		set_task(4.900_000, "@boomeffect", __int_Entity);

    }
}






public @Touch_Jar(__int_Touched, __int_Toucher)
{
    if(is_valid_ent(__int_Toucher))
    {
        static Float:__float_Velocity[3];
        entity_get_vector(__int_Toucher, EV_VEC_velocity, __float_Velocity);
       
        __float_Velocity[0] /= 2.500_000;
        __float_Velocity[1] /= 2.500_000;
        __float_Velocity[2] /= 2.500_000;
       
        entity_set_vector(__int_Toucher, EV_VEC_velocity, __float_Velocity);
       
        entity_set_float(__int_Toucher, EV_FL_nextthink, (get_gametime() + 0.01));
       
       
    }
}
 
public @Ham_Use(__int_Entity, __int_Index)
{
    if(entity_get_int(entity_get_edict(__int_Entity, EV_ENT_euser1), EV_INT_iuser3) != 1)
    {
        static __int_Classname[32];
        entity_get_string(__int_Entity, EV_SZ_classname, __int_Classname, sizeof(__int_Classname)-1);
       
        if(equal(__int_Classname, "mafuba_use"))
        {
            emit_sound(__int_Index, CHAN_ITEM, "weapons/mafuba/jar_use.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
           
            entity_set_int(entity_get_edict(__int_Entity, EV_ENT_euser1), EV_INT_sequence, entity_get_int(entity_get_edict(__int_Entity, EV_ENT_euser1), EV_INT_sequence) == 0 ? 1 : 0);
        }
    }
}
 
public @Ham_TakeDamage(__int_Victim, __int_Inflictor, __int_Attacker, Float:__float_Damage, __int_Bits)
{
    static __int_Classname[32];
    entity_get_string(__int_Victim, EV_SZ_classname, __int_Classname, sizeof(__int_Classname)-1);
   
    if(equal(__int_Classname, "capsule_jar"))
    {
        if((entity_get_float(__int_Victim, EV_FL_health) - __float_Damage) < float(0))
        {
            SetHamParamFloat(4, float(0));
           
            if(!task_exists(__int_Victim))
            {
                entity_set_int(__int_Victim, EV_INT_iuser3, 1);
               
                static __int_Data[2];
                __int_Data[0] = __int_Victim;
                __int_Data[1] = __int_Attacker;
               
                set_rendering(__int_Victim, kRenderFxGlowShell, _, _, _, _, 20);
               
                set_task(0.5, "@fxLightning", __int_Victim, _, _, "a", 8);
                set_task(float(5), "@fxKillJar", __int_Victim, __int_Data, 2);
               
                emit_sound(__int_Victim, CHAN_ITEM, "weapons/mafuba/jar_break.wav", VOL_NORM, ATTN_NORM, 0 ,PITCH_NORM);
            }
        }
    }
}
 
/*==================================================================================================
EFFECTS.
==================================================================================================*/
 
public @fxKillJar(__int_Data[])
{
    if(is_valid_ent(__int_Data[0]))
    {
		test2(__int_Data[0])
		
		test3(__int_Data[0])
	
		static Float:__float_Origin[3];
		entity_get_vector(__int_Data[0], EV_VEC_origin, __float_Origin);
       
        for(new __int_Models = 0; __int_Models < 3; __int_Models++)
        {
            message_begin(MSG_BROADCAST, SVC_TEMPENTITY);
            {
                write_byte(TE_MODEL);
                write_coord(floatround(__float_Origin[0]));
                write_coord(floatround(__float_Origin[1]));
                write_coord(floatround(__float_Origin[2]));
               
                write_coord(random_num(random_num(-200, -300), random_num(200, 300)));
                write_coord(random_num(random_num(-200, -300), random_num(200, 300)));
                write_coord(random_num(250, 300));
               
                write_angle(random_num(0, 360));
               
                write_short(__int_Gibs[__int_Models]);
                write_byte(0);
                write_byte(200);
            }
            message_end();
        }
       
        message_begin(MSG_ALL, 98);
        {
            write_byte(2);
            write_short(__int_Data[0]);
           
            write_coord(floatround(__float_Origin[0]));
            write_coord(floatround(__float_Origin[1]));
            write_coord(floatround(__float_Origin[2]));
           
            write_short(60);
        }
        message_end();
       
        if(is_valid_ent(entity_get_edict(__int_Data[0], EV_ENT_euser3)))
        {
            remove_entity(entity_get_edict(__int_Data[0], EV_ENT_euser3));
        }
       
        ExecuteHam(Ham_Killed, __int_Data[0], __int_Data[1], 0);
    }
}
 
public @fxLightning(__int_Entity)
{
    if(is_valid_ent(__int_Entity))
    {
        static Float:__float_Origin[3];
        entity_get_vector(__int_Entity, EV_VEC_origin, __float_Origin);
       
        message_begin(MSG_ALL, SVC_TEMPENTITY);
        {
            write_byte(TE_BEAMPOINTS);
            write_coord(floatround(__float_Origin[0]));
            write_coord(floatround(__float_Origin[1]));
            write_coord(floatround(__float_Origin[2]));
           
            write_coord(floatround(__float_Origin[0] + random_float(-11.0, 11.0)));
            write_coord(floatround(__float_Origin[1] + random_float(-11.0, 11.0)));
            write_coord(floatround(__float_Origin[2] + random_float(0.0, 11.0)));
           
            write_short(__int_Lightning);
           
            write_byte(1);
            write_byte(10);
            write_byte(10);
            write_byte(5);
            write_byte(125);
            write_byte(255);
           
            write_byte(255);
            write_byte(255);
            write_byte(255);
           
            write_byte(150);
        }
        message_end();
    }
}
 
public @fxLight(__int_Entity)
{
    if(is_valid_ent(__int_Entity))
    {
        static Float:__float_Origin[3];
        entity_get_vector(__int_Entity, EV_VEC_origin, __float_Origin);
       
        static __int_Players;
        __int_Players = -1;
       
        while((__int_Players = find_ent_in_sphere(__int_Players, __float_Origin, float(15))))
        {
            if(is_user_alive(__int_Players) && is_user_connected(__int_Players))
            {
                static Float:__float_Origin[3];
                entity_get_vector(__int_Players, EV_VEC_origin, __float_Origin);
               
                __float_Origin[2] += float(100);
               
                entity_set_origin(__int_Players, __float_Origin);
            }
        }
       
        entity_set_int(__int_Entity, EV_INT_effects, EF_LIGHT);
    }
}
 
public @fxWorldLight(__int_Index)
{
    if(is_user_alive(__int_Index))
    {
        static __int_Origin[3];
        get_user_origin(__int_Index, __int_Origin);
       
        message_begin(MSG_ONE_UNRELIABLE, SVC_TEMPENTITY, _, __int_Index);
        {
            write_byte(TE_DLIGHT);
           
            write_coord(__int_Origin[0]);
            write_coord(__int_Origin[1]);
            write_coord(__int_Origin[2]);
           
            write_byte(12);
           
            write_byte(entity_get_float(__int_Index, EV_FL_fuser2) < 0.699_999 ? 255 : 0);
            write_byte(255);
            write_byte(entity_get_float(__int_Index, EV_FL_fuser2) < 0.699_999 ? 255 : 0);
           
            write_byte(255);
            write_byte(floatround(2.500_000));
        }
        message_end();
       
        static Float:__float_Charge;
        __float_Charge = entity_get_float(__int_Index, EV_FL_fuser2);
       
        if(__float_Charge >= 0.325_000)
        {
            set_rendering(.index = __int_Index,
                .fx = kRenderFxGlowShell,
                .r = (__float_Charge < 0.700_000 ? 255 : 0),
                .g = _,
                .b = (__float_Charge < 0.700_000 ? 255 : 0),
                .render = kRenderNormal,
                .amount = (__float_Charge < 0.700_000 ? 6 : 8));
        }
    }
}
 
/*==================================================================================================
POST-USE.
==================================================================================================*/
 
public @RemoveData(const __int_Index)
{
    @StopAnimation(__int_Index, 2);
   
    __int_Capsule &= ~(1 << __int_Index);
   
    if(is_valid_ent(entity_get_edict(__int_Index, EV_ENT_euser1)))
    {
        remove_entity(entity_get_edict(__int_Index, EV_ENT_euser1));
    }
}
 
public @IsPlayerBusy(const __int_Index)
{
    if(getClientPOWERUP(__int_Index) && !getClientXFROZEN(__int_Index)
    || getClientSWOOPING(__int_Index)
    || getClientBLOCK(__int_Index)
    || getClientATKSHOOT(__int_Index)
    || getClientMELEE(__int_Index)
    || getClientMELEEPUSHBACK(__int_Index)
    || getClientTHROWAWAY(__int_Index)
    || getClientTHROW(__int_Index)
    || getClientWALLGND(__int_Index))
    {
        return 1;
    }
   
    return 0;
}
 
public @RemoveChargeReferences(const __int_Index)
{
    if(task_exists(__int_Index))
    {
        remove_task(__int_Index);
    }
   
    message_begin(MSG_ALL, get_user_msgid("StopPowerup"));
    {
        write_byte(__int_Index);
    }
    message_end();
   
    set_rendering(__int_Index, kRenderFxNone, _, _, _, kRenderNormal);
}
 
public @ReturnAnimation(const __int_Index, const __int_Wich)
{
    return (__int_Sequence[__int_Wich] & (1 << __int_Index)); // Handle.
}
 
public @StartAnimation(const __int_Index, const __int_Wich)
{
    if(__int_Wich == 0) // Hold.
    {
        __int_Sequence[0] |= (1 << __int_Index);
    }
   
    else // Throw.
    {
        __int_Sequence[1] |= (1 << __int_Index);
    }
}
 
public @StopAnimation(const __int_Index, const __int_Wich)
{
    if(__int_Wich == 0) // Hold.
    {
        __int_Sequence[0] &= ~(1 << __int_Index);
    }
   
    else if(__int_Wich == 1) // Throw.
    {
        __int_Sequence[1] &= ~(1 << __int_Index);
    }
   
    else // Both.
    {
        __int_Sequence[0] &= ~(1 << __int_Index);
        __int_Sequence[1] &= ~(1 << __int_Index);
    }
}
 
/*==================================================================================================
END OF THE SPECIAL.
==================================================================================================*/