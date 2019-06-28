#include < amxx\amxmodx >
#include < amxx\engine >
#include <fakemeta>
#include <ipci\ascend>
#include <ipci\Fxlib>
#include <engine>
#include <ipci\Core>
#include <fun>
#include < hamsandwich >
#include <amxmodx>
#include <esf_util>
#include <amxmisc>
#include <amxx\fakemeta_util>
#include <ipci\ascend>
#include <ipci\Fxlib>

#include <xs>

new const CX_Plugin[]	= 	"Model changer";
new const CX_Version[]	=	"";
new const CX_Author[]	=	"Filip"; 
new float:lik
new float:lvl
new float:skinbr

// lik:
// 0=goku xeno
//skinbr:
// 0=obican,1=normal,2=gt



public plugin_init()
{
	register_plugin( CX_Plugin, CX_Version, CX_Author );

	register_clcmd("say /modelc", "playerMenu");
	
	RegisterHam(Ham_Spawn,"player","fwPlayerSpawn",1);
	
	register_event("DeathMsg", "Event_DeathMsg", "a" );
}

public playerMenu( id )
{
		//Create a variable to hold the menu
		new menu = menu_create( "\rSelect Model:", "menu_handler" );
		
		if(getClientCLASS( id ) == getCXbyName( "Goku-Xeno" ))
		{
		lik=0;
		lvl=getClientLEVEL(id);
		menu_additem( menu, "Goku Normal", "", 0 );
		menu_additem( menu, "Goku Xeno", "", 0 );
		menu_additem( menu, "Goku GT", "", 0 );

		menu_setprop(menu, MPROP_EXIT, MEXIT_ALL); 
	
		menu_display( id, menu, 0 );
		}
		else
		{
			client_print(id, print_chat, "This character doesnt have alternative models right now.");
		}
}
public menu_handler(id,menu,item)
{
	if(lik==0)
	{
		if(lvl==0)
		{
			switch(item)
			{
				
					case 0:
					{	
						setClientMODEL( id, "ecx.goku-ts" );
						menu_destroy( menu );
						return PLUGIN_HANDLED;
						skinbr=1;
					}
					case 1:
					{	
						setClientMODEL(id, "GokuX");
						menu_destroy( menu );
						return PLUGIN_HANDLED;
						skinbr=0;
					}
					case 2:
					{	
						client_print(id, print_chat, "This models is not avaliable yet.");
						//setClientMODEL( id, "ecx.goku-ts" );
						menu_destroy( menu );
						return PLUGIN_HANDLED;
					}
			}
		}
		else if(lvl==1)
		{
			switch(item)
			{
				case 0:
				{	
					setClientMODEL( id, "ecx.goku-ts.ssj" );
					menu_destroy( menu );
					return PLUGIN_HANDLED;
					skinbr=1;
				}
				case 1:
				{	
					setClientMODEL(id, "GokuXSSJ");
					menu_destroy( menu );
					return PLUGIN_HANDLED;
					skinbr=0;
				}
				case 2:
				{	
					client_print(id, print_chat, "This models is not avaliable yet.");
					menu_destroy( menu );
					return PLUGIN_HANDLED;
				}
			}
		}
		else if(lvl==2)
		{
			switch(item)
			{
				case 0:
				{	
					setClientMODEL( id, "ecx.goku-ts.ssj2" );
					menu_destroy( menu );
					return PLUGIN_HANDLED;
					skinbr=1;
				}
				case 1:
				{	
					setClientMODEL(id, "GokuXSSJ2");
					menu_destroy( menu );
					return PLUGIN_HANDLED;
					skinbr=0;
				}
				case 2:
				{	
					client_print(id, print_chat, "This models is not avaliable yet.");
					menu_destroy( menu );
					return PLUGIN_HANDLED;
				}
			}
		}
		else if(lvl==3)
		{
			switch(item)
			{
				case 0:
				{	
					setClientMODEL( id, "ecx.goku-ts.ssj3" );
					menu_destroy( menu );
					return PLUGIN_HANDLED;
					skinbr=1;
				}
				case 1:
				{	
					setClientMODEL(id, "GokuXSSJ3");
					menu_destroy( menu );
					return PLUGIN_HANDLED;
					skinbr=0;
				}
				case 2:
				{	
					client_print(id, print_chat, "This models is not avaliable yet.");
					menu_destroy( menu );
					return PLUGIN_HANDLED;
				}
			}
		}
		else if(lvl==4)
		{
			switch(item)
			{
				case 0:
				{	
					setClientMODEL( id, "gokuSSJ4new" );
					menu_destroy( menu );
					return PLUGIN_HANDLED;
					skinbr=1;
				}
				case 1:
				{	
					setClientMODEL(id, "GokuXSSJ4");
					menu_destroy( menu );
					return PLUGIN_HANDLED;
					skinbr=0;
				}
				case 2:
				{	
					client_print(id, print_chat, "This models is not avaliable yet.");
					menu_destroy( menu );
					return PLUGIN_HANDLED;
				}
			}
		}
	}
	menu_destroy( menu );
    return PLUGIN_HANDLED;
}

public fwplayerspawn(id)
{
	new victim = read_data( 2 );
	console_print(0,"1");
	if(skinbr==1 && getClientCLASS( victim ) == getCXbyName( "Goku-Xeno" ))
	{
		set_task(0.2, "setClientMODEL",id,"ecx.goku-ts");
		console_print(0,"2");
	}
}

public Event_DeathMsg()
{
	new victim = read_data( 2 );
	console_print(0,"1");
	if(skinbr==1 && getClientCLASS( victim ) == getCXbyName( "Goku-Xeno" ))
	{
		set_task(0.2, "setClientMODEL",victim,"ecx.goku-ts");
		console_print(0,"2");
	}
}


public plugin_precache()
{
	precache_model("models/player/ecx.goku-ts/ecx.goku-ts.mdl");
	precache_model("models/player/ecx.goku-ts.ssj/ecx.goku-ts.ssj.mdl");
	precache_model("models/player/ecx.goku-ts.ssj2/ecx.goku-ts.ssj2.mdl");
	precache_model("models/player/ecx.goku-ts.ssj3/ecx.goku-ts.ssj3.mdl");
	precache_model("models/player/gokuSSJ4new/gokuSSJ4new.mdl");
	precache_model("models/player/GokuX/GokuX.mdl");
	precache_model("models/player/GokuXSSJ/GokuXSSJ.mdl");
	precache_model("models/player/GokuXSSJ2/GokuXSSJ2.mdl");
	precache_model("models/player/GokuXSSJ3/GokuXSSJ3.mdl");
	precache_model("models/player/GokuXSSJ4/GokuXSSJ4.mdl");
}