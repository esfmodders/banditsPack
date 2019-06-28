 
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


#define FEV_RELIABLE (1<<1) 
#define FEV_GLOBAL (1<<2) 

new g_iDecalReset

public plugin_init( )
{
    register_clcmd("say weg", "Task_RemoveDecals");
	g_iDecalReset = engfunc(EngFunc_PrecacheEvent, 1, "events/decal_reset.sc");
	
	register_message( SVC_TEMPENTITY, "TempEntity" );
}

public TempEntity(id ,dest, ent)
{
    client_print(0, print_chat, "id: %d dest: %d ent: %d", id, dest, ent);
	
	set_msg_arg_int( 5, get_msg_argtype( 5 ), 124 );
}
	
public Task_RemoveDecals( iEnt ) 
{ 
        engfunc(EngFunc_PlaybackEvent, FEV_RELIABLE|FEV_GLOBAL, 0, g_iDecalReset, 0.0, Float:{0.0, 0.0, 0.0}, Float:{0.0, 0.0, 0.0}, 0.0, 0.0, 0, 0, 0, 0) 
}  
