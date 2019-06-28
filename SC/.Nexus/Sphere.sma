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

 

/*==================================================================================================
START OF THE SPECIAL.
==================================================================================================*/
 
public plugin_init()
{
	//MSG_Explosion		= 	MSGID( "Explosion" );
	
	//register_clcmd("say 1", "@boomeffect");
	
	//register_clcmd("say 2", "unfreeze");
	
	//register_clcmd("say test", "hpweg");
	
	//register_clcmd("say test2", "@fxLight");
	
	register_clcmd("say ball", "GO");
	
	//register_clcmd("say test3", "@fxLightning");
	
	//register_clcmd("say test4", "pdata");
	
	//register_event("DeathMsg", "Event_DeathMsg", "a" );
	
	//register_forward( MafubaCore, "@Think_MafubaCore" );
	
	//register_forward( mafuba, "@Think_Mafuba" );
	
	
}


 
public plugin_precache()
{
	precache_model( "models/bb1.mdl" );
}
 
 
public GO(id,ent)
{
	
	@Sphere(100, id, id, 1.0, 0);
	
}

public @Sphere (__int_Entity, const __int_Owner, const __int_Victim, const Float:__float_Scale, const __int_Velocity)
{
	__int_Entity = create_entity("info_target");
	
	entity_set_model(__int_Entity, "models/bb1.mdl");
	
	entity_set_int(__int_Entity, EV_INT_spawnflags, SF_SPRITE_STARTON);
	
	DispatchSpawn(__int_Entity);
	
	entity_set_int(__int_Entity, EV_INT_renderfx, kRenderFxGlowShell);
	entity_set_int(__int_Entity, EV_INT_rendermode, kRenderTransAdd);
	
	//entity_set_int(__int_Entity, EV_INT_renderfx,  kRenderFxExplode);
	
	
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
	
	//set_task(12.0, "removespiral",__int_Entity);
	
	set_task(2.5, "scaler",__int_Entity);
	
	emit_sound(__int_Entity, CHAN_WEAPON, "weapons/mafuba/mafubacatch.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	
}

public scaler(id)
{
	if(pev_valid(id))
	{
		set_task(0.5, "scaler",id);
		
		//entity_set_float(id,EV_FL_scale,1.1);
		
		new Float:scalefactor = entity_get_float(id,EV_FL_scale) + 1;
		
		entity_set_float(id,EV_FL_scale,scalefactor);
		
		console_print(0, "jo");
	}
}

