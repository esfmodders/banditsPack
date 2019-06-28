#include < amxx/amxmodx >
#include < amxx/engine >
#include <fakemeta>
#include <ipci/ascend>
#include <ipci/Fxlib>
#include <engine>
#include <ipci/Core>
#include <fun>
#include < hamsandwich >

#define CHECK_TIME 		0.5

#define esf_get_ki(%1)		entity_get_float( %1, EV_FL_fuser4 )
#define esf_set_ki(%1,%2)	entity_set_float( %1, EV_FL_fuser4, %2 )  

new gCvar;

public plugin_init( )
{
	register_plugin( "ESF Admin Unlimited KI", "3.0.0", "tuty" );
	
	RegisterHam( Ham_Spawn, "player", "bacon_SpawnPost", 1 );
	
	register_clcmd("Ultra-Instinct-side-effect", "TEST");
	
	
}

public client_disconnect( id )
{
	remove_task( id );
}

public bacon_SpawnPost( iPlayer )
{
	if( get_pcvar_num( gCvar ) == 1 )
	{
		if( is_user_alive( iPlayer )) 
		{
			set_task( CHECK_TIME, "Task_checkAdminKi", iPlayer , "", 0, "b" );
		}
	}
}

public Task_checkAdminKi( iPlayer )
{
	if( !is_user_alive( iPlayer ) )
	{
		remove_task( iPlayer );
		
		return PLUGIN_HANDLED;
	}
	
	esf_set_ki( iPlayer, ( -1000) );
	
	return PLUGIN_CONTINUE;
}

public TEST( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	//setClientANIMATION(iPlayer,79,1.0);
	set_task(1.0, "Test2",iPlayer);
}
public Test2( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test3",iPlayer);
}
public Test3( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test4",iPlayer);
}
public Test4( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test5",iPlayer);
}
public Test5( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test6",iPlayer);
}
public Test6( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test7",iPlayer);
}
public Test7( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test8",iPlayer);
}
public Test8( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test9",iPlayer);
}
public Test9( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test10",iPlayer);
}
public Test10( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test11",iPlayer);
}
public Test11( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test12",iPlayer);
}
public Test12( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test13",iPlayer);
}
public Test13( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test14",iPlayer);
}
public Test14( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test15",iPlayer);
}
public Test15( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test16",iPlayer);
}
public Test16( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test17",iPlayer);
}
public Test17( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test18",iPlayer);
}
public Test18( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test19",iPlayer);
}
public Test19( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test20",iPlayer);
}
public Test20( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test21",iPlayer);
}
public Test21( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test22",iPlayer);
}
public Test22( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test23",iPlayer);
}
public Test23( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test24",iPlayer);
}
public Test24( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test25",iPlayer);
}
public Test25( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test26",iPlayer);
}
public Test26( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test27",iPlayer);
}
public Test27( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test28",iPlayer);
}
public Test28( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test29",iPlayer);
}
public Test29( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test30",iPlayer);
}
public Test30( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test31",iPlayer);
}
public Test31( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test32",iPlayer);
}
public Test32( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test33",iPlayer);
}
public Test33( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test34",iPlayer);
}
public Test34( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test35",iPlayer);
}
public Test35( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test36",iPlayer);
}
public Test36( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test37",iPlayer);
}
public Test37( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test38",iPlayer);
}
public Test38( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test39",iPlayer);
}
public Test39( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test40",iPlayer);
}
public Test40( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
	set_task(1.0, "Test41",iPlayer);
}
public Test41( iPlayer )
{
	drop_to_floor(iPlayer);
	esf_set_ki( iPlayer,  (-1) );
}

