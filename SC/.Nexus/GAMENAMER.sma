#include <amxmodx>
#include <engine>
#include <engine_const>
#include <fun>
#include <fakemeta>

#include <fakemeta_const>
#define NAME_LENGH    64

new amx_gamename;



public plugin_init() 
{
	register_forward( FM_GetGameDescription, "GameDesc" )
}

public GameDesc( ) 
	
{ 
	new gamemode = get_cvar_num( "mp_gamemode" ) 
	
	switch( gamemode )
	
	{ 
		
		case 0: forward_return( FMV_STRING, "[BANDITs MOD]-DM" )
		case 1: forward_return( FMV_STRING, "[BANDITs MOD]-TDM" )
		case 2: forward_return( FMV_STRING, "[BANDITs MOD]-Broken" )
	} 
	
	return FMRES_SUPERCEDE
	
	
}