#include <amxmodx>
#include <engine>
#include <hamsandwich>
#include <xs>

#include <ipci/Ascend>
#include <ipci/Core>
#include <ipci/FXLib>
#include <esf_util>
 
#include <xtension/Special>
 
#include <amxmisc>
#include <fun>
#include <fakemeta>
 
#include <ipci/ascend>
#include <ipci/dragonball>
#include <xs>



new const CX_Plugin[]	= 	"Absorbing2";
new const CX_Version[]	=	"1337";
new const CX_Author[]	=	"BANDIT/Jerry";

#define MOD_SOUND 	0
#define MOD_CHARGE 	0
#define MOD_WEAPON	0

// << Implement CX Interface >>
#include <xtension/class/main>

PluginInit ()
{ 
	register_plugin( CX_Plugin, CX_Version, CX_Author );
	RegisterHam(Ham_Spawn,"player","fwPlayerSpawn",1)
	
	//register_clcmd("say h", "test");
} 

	
public fwPlayerSpawn(id)
{
	set_task(0.2, "spawn2",id);
	
	set_task(0.1, "spawn2pre",id);
	
	set_task(1.2, "spawn2",id);
	
	set_task(1.1, "spawn2pre",id);
	
	set_task(2.2, "spawn2",id);
	
	set_task(2.1, "spawn2pre",id);
	
	set_task(3.2, "spawn2",id);
	
	set_task(3.1, "spawn2pre",id);
	
	set_task(4.2, "spawn2",id);
	
	set_task(4.1, "spawn2pre",id);
	
	
}

public test(Client)
{
	addClassSpecial( Client, "hakai" );
}

public spawn2pre(Client)
{
	if( getClientTURBO( Client ) )
	{
		client_cmd( Client, "turbo" );
	}
}

public spawn2(id)
{
	//console_print(0, "free");
	
	
	
	client_cmd( id, "descend" );

	if(getClientLEVEL( id ) == 0 && getClientCLASS( id ) == getCXbyName( "Cell" ))
	{	
		addClassSpecial( id, "Absorbation" );
	}
}

PluginPreCache ()
{
}