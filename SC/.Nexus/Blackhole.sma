/*==================================================================================================
LIBRARIES.
==================================================================================================*/
 
#include <amxmodx>
#include <engine>
#include <hamsandwich>

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


#include <amxx/fakemeta_util>

new const CX_Plugin[]	= 	"Blackhole";
new const CX_Version[]	=	"1337";
new const CX_Author[]	=	"BANDIT";


public plugin_init( )
{
	register_clcmd("say T", "Trigger");
	
	register_plugin( CX_Plugin, CX_Version, CX_Author );
	
	
}

public Trigger(id)
{
	new Float:origin[3];
	pev(Client,pev_origin,origin);
	new ent = -1;


	static __int_Globalname[13];
	entity_get_string(ent, EV_SZ_globalname, __int_Globalname, 12);
        
	while((ent = find_ent_in_sphere(ent,origin,500.0)) != 0) 
	{
		if(equal(__int_Globalname, "magic_attack"))
		{
			aim(ent)
		}
	}
}

public aim(ent)
{
	if(get_entity_flags (ent) == 5)
	{
		setAIM(ent, Float:org_player[3])
	}
}

public plugin_precache()
{
	
}