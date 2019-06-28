#include <amxmodx>
#include <amxmisc>
#include <engine>
#include <fun>
#include <hamsandwich>
#include <fakemeta>
#include <ipci/fxlib>
#include <ipci/core>
#include <ipci/ascend>
#include <ipci/dragonball>
#include <xs>


new const CX_Plugin[]	= 	"Ugandan knuckles";
new const CX_Version[]	=	"1337";
new const CX_Author[]	=	"BANDIT/C4";

new const Float:stuckTollerance = 7.0;
new const Float:thinkRate = 0.1;
new const bool:canFly = false; // (true) may not work atm (movement rework) 
//Boolean of when NPC spawned  
new bool: g_NpcSpawn[256];  
//Boolean to check if NPC is alive or not  
new bool: g_NpcDead[256];
// is blocked while animations f.e.
new Float:g_NpcBlocked[256];
// hp
new Float:g_NpcHP[256];
new Float:pos[256][3];
//Targetarray for NPCs
new g_NpcTarget[256];
//Classname for our NPC  
new const g_NpcClassName[] = "ent_npc";  
//Constant model for NPC  
new const g_NpcModel[] = "models/UK/knuckles/Knuckles.mdl"; 
new const g_NpcModel2[] = "models/UK/knuckles.dj/Knucklesdj.mdl";   
new const g_NpcModel3[] = "models/UK/knuckles.ssj/Knuckles.ssj.mdl";   
new const g_NpcModel4[] = "models/UK/knuckles.ssj2/Knuckles.ssj2.mdl";   
new const g_NpcModel5[] = "models/UK/knuckles.ssj3/Knuckles.ssj3.mdl";   

new bool:gerufen[32];


//Sprites for blood when our NPC is damaged 
new spr_blood_drop, spr_blood_spray;

public plugin_init()
{
	register_plugin( CX_Plugin, CX_Version, CX_Author );

	register_clcmd("say uk", "playerMenu");
	//register_clcmd("say x1", "@CreateSyntheticAura");
	register_forward(FM_Think,"npc_Think");
}

public @InitWishList( Client, Wishlevel )
{
	addWish( "Revive UK MEME", "playerMenu" )
}

public playerMenu( id )
{
	if (gerufen[id])
		{
			client_print(id, print_chat, "U will have to wait ma brudda! in 1min you can find da wae again.");
		}
		else
		{
			 //Create a variable to hold the menu
			new menu = menu_create( "\rSelect Player:", "menu_handler" );

			//We will need to create some variables so we can loop through all the players
			new players[32], pnum, tempid;

			//Some variables to hold information about the players
			new szName[32], szUserId[32];

			//Fill players with available players
			get_players( players, pnum, "a" ); // flag "a" because we are going to add health to players, but this is just for this specific case

			//Start looping through all players
			for ( new i; i<pnum; i++ )
			{
				//Save a tempid so we do not re-index
				tempid = players[i];
	
				//Get the players name and userid as strings
				get_user_name( tempid, szName, sizeof( szName )-1 );
		
				//We will use the data parameter to send the userid, so we can identify which player was selected in the handler
				formatex( szUserId, sizeof( szUserId )-1, "%d", get_user_userid( tempid ) );

				//Add the item for this player
				menu_additem( menu, szName, szUserId, 0 );
			}

		menu_setprop(menu, MPROP_EXIT, MEXIT_ALL); 
	
		//We now have all players in the menu, lets display the menu
		menu_display( id, menu, 0 );
		}
   
}

public menu_handler( id, menu, item )
{
	//Do a check to see if they exited because menu_item_getinfo ( see below ) will give an error if the item is MENU_EXIT
	if ( item == MENU_EXIT )
	{
		menu_destroy( menu );
		return PLUGIN_HANDLED;
    }

    //now lets create some variables that will give us information about the menu and the item that was pressed/chosen
	new szData[6], szName[64];
	new _access, item_callback;
    //heres the function that will give us that information ( since it doesnt magicaly appear )
	menu_item_getinfo( menu, item, _access, szData,sizeof( szData )-1, szName,sizeof( szName )-1, item_callback );

    //Get the userid of the player that was selected
	new userid = str_to_num( szData );

    //Try to retrieve player index from its userid
	new player = find_player( "k", userid ); // flag "k" : find player from userid

    //If player == 0, this means that the player's userid cannot be found
    //If the player is still alive ( we had retrieved alive players when formating the menu but some players may have died before id could select an item from the menu )
	if ( player && is_user_alive( player ) )
	{
		//Set their health to 100
		//set_user_health( player, 100 );
		Create_Npc(id,player);
	}

	menu_destroy( menu );
	return PLUGIN_HANDLED;
}

public checkNpc(iEnt)
{
	if(is_valid_ent(iEnt))
	{
		new Float:ori[3];
		entity_get_vector(iEnt, EV_VEC_origin, ori);
		
		// stuckcheck
		if(entity_get_int(iEnt, EV_INT_sequence) == 2 && pos[iEnt][0] - stuckTollerance < ori[0] < pos[iEnt][0] + stuckTollerance && pos[iEnt][1] - stuckTollerance < ori[1] < pos[iEnt][1] + stuckTollerance && pos[iEnt][2] - stuckTollerance < ori[2] < pos[iEnt][2] + stuckTollerance)
		{
			// teleport to chased player
			//client_print(0,print_chat,"stuck %d", iEnt);
			new Float:flOrigin[3];
			entity_get_vector(g_NpcTarget[iEnt], EV_VEC_origin, flOrigin); 
			flOrigin[2] += 50.0;	
			entity_set_origin(iEnt, flOrigin);
			drop_to_floor(iEnt);
		}
		
		pos[iEnt][0] = ori[0];
		pos[iEnt][1] = ori[1];
		pos[iEnt][2] = ori[2];
		
		set_task(1.0, "checkNpc", iEnt);
	}
	else
	{
		npc_Killed(iEnt);
	}
	
	
}

public partfemale2(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/myfavoriteebola.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(0.1, "red", iEnt);
	set_task(2.0, "maul", iEnt);
}

public maul(NPCEntID)
{
    Util_PlayAnimation(NPCEntID, 0); 
}
public red(NPCEntID)
{
    Util_PlayAnimation(NPCEntID, 1); 
}


public ebola(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/superebola.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(4.0, "ebola2", iEnt);
	entity_set_model(iEnt, g_NpcModel3); 
	set_task(0.1, "boxneu", iEnt);
	set_task(0.1, "red", iEnt);
	set_task(2.0, "maul", iEnt);
	set_task(0.1, "@CreateSyntheticAura", iEnt);
	set_task(2.0, "@RemoveSyntheticAura", iEnt);
}

public cheese(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/ebolacheese.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(0.1, "red", iEnt);
	set_task(1.0, "maul", iEnt);
}

public clucking(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(0.4, "clucking2", iEnt);
}
public clucking2(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(0.4, "clucking3", iEnt);
}
public clucking3(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(0.4, "clucking4", iEnt);
}
public clucking4(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(0.4, "clucking5", iEnt);
}
public clucking5(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(0.4, "clucking6", iEnt);
}
public clucking6(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(0.4, "clucking7", iEnt);
}
public clucking7(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(0.4, "clucking8", iEnt);
}
public clucking8(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(0.4, "clucking9", iEnt);
}
public clucking9(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(0.4, "clucking10", iEnt);
}
public clucking10(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(0.4, "clucking11", iEnt);
}
public clucking11(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(0.4, "clucking12", iEnt);
}
public clucking12(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(0.4, "clucking13", iEnt);
}
public clucking13(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	set_task(0.4, "clucking14", iEnt);
}
public clucking14(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
}


public ebola2(iEnt)
{
	if(is_valid_ent(iEnt))
	{
		emit_sound(iEnt, CHAN_STATIC, "UK/superebola2.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
		set_task(12.0, "ebola3", iEnt);
		set_task(0.1, "red", iEnt);
		set_task(0.1, "boxneu", iEnt);
		set_task(11.5, "maul", iEnt);
		set_task(0.1, "@CreateSyntheticAura", iEnt);
		set_task(2.0, "modelebola2", iEnt);
		set_task(11.5, "@RemoveSyntheticAura", iEnt);
	}
}

public ebola3(iEnt)
{
	if(is_valid_ent(iEnt))
	{
		emit_sound(iEnt, CHAN_STATIC, "UK/superebola3.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
		set_task(6.0, "modelebola", iEnt);
		set_task(0.1, "red", iEnt);
		set_task(6.1, "boxneu", iEnt);
		set_task(0.1, "@CreateSyntheticAura", iEnt);
		set_task(10.0, "maul", iEnt);
		set_task(10.0, "@RemoveSyntheticAura", iEnt);
	}
}
public modelebola(iEnt)
{
	entity_set_model(iEnt, g_NpcModel5); 
}
public modelebola2(iEnt)
{
	entity_set_model(iEnt, g_NpcModel4); 
}

public remfxebola(iEnt)
{
	RemFx( iEnt, "fxSpriteRays", 0 );
	RemFx( iEnt, "fxSpriteEntity", 0);
	RemFx( iEnt, "fxModelEntity", 0);
}

NPCMove(NPCEntID, Float:speed = 75.0, Float:entOrigin[3] = { 0.0, 0.0, 0.0 }, Float:playerOrigin[3] = { 0.0, 0.0, 0.0 }, Float:flAngle[3] = { 0.0, 0.0, 0.0 }, Float:movement[3] = { 0.0, 0.0, 0.0 })
{
	// get positions
	entity_get_vector(NPCEntID, EV_VEC_origin, entOrigin);
	entity_get_vector(g_NpcTarget[NPCEntID], EV_VEC_origin, playerOrigin);

	if(!canFly)
		entOrigin[2] = playerOrigin[2];
	
	// calculate new position if distance is more than 50
	if(vector_distance(entOrigin,playerOrigin) > 80 && g_NpcBlocked[NPCEntID] != -1.0)
	{
		if(entity_get_int(NPCEntID, EV_INT_sequence) != 2 )
            Util_PlayAnimation(NPCEntID, 2);
	
		// calculate and normalize movementvector
		movement[0] = playerOrigin[0] - entOrigin[0];
		movement[1] = playerOrigin[1] - entOrigin[1];
		movement[2] = 0.0;
		
		if(canFly)
			movement[2] -= entOrigin[2];
		
		xs_vec_normalize(movement,movement);
		
		// convert direction vector
		vector_to_angle(movement,flAngle);
		
		movement[0] *= speed;
		movement[1] *= speed;

		new Float:velo[3];
		pev(NPCEntID, pev_velocity, velo);
		
		entOrigin[0] += movement[0];
		entOrigin[1] += movement[1];
		
		// remove the first 2 lines to prevent megaslide and increase speed value a lot! 150-250
		movement[0] += velo[0];
		movement[1] += velo[1];
		movement[2] += velo[2];
		
		if(canFly)
		{
			movement[2] *= speed;
			entOrigin[2] += movement[2];
		}

		// move npc
		set_pev(NPCEntID, pev_velocity, movement);
		entity_set_vector(NPCEntID, EV_VEC_angles, flAngle);
	}
	else if(g_NpcBlocked[NPCEntID] == 0.0)
	{
		if(entity_get_int(NPCEntID, EV_INT_sequence) != 0 )
			Util_PlayAnimation(NPCEntID, 0);
		
		// increase the second parameter of random_num if you want to 
		// add more idle shit and add a case for the next number(s)
		new random = random_num(1, 37);
			
		switch(random)
		{
			case 1:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(0.5, "unblock", NPCEntID);
			}
			case 2:
			{
				emit_sound(NPCEntID, CHAN_STATIC, "UK/doyouknow.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(1.0, "unblock", NPCEntID);
			}
			case 3:
			{
				emit_sound(NPCEntID, CHAN_STATIC, "UK/doyouknow2.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(1.0, "unblock", NPCEntID);
			}
			case 4:
			{
				emit_sound(NPCEntID, CHAN_STATIC, "UK/hellothere.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(1.0, "unblock", NPCEntID);
			}
			case 5:
			{
				emit_sound(NPCEntID, CHAN_STATIC, "UK/singwithme.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(11.0, "unblock", NPCEntID);
			}
			case 6:
			{
				emit_sound(NPCEntID, CHAN_STATIC, "UK/doyouknow3.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(1.0, "unblock", NPCEntID);
			}
			case 7:
			{
				emit_sound(NPCEntID, CHAN_STATIC, "UK/doyouknow4.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(1.0, "unblock", NPCEntID);
			}
			case 8:
			{
				emit_sound(NPCEntID, CHAN_STATIC, "UK/doyouknow5.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(1.0, "unblock", NPCEntID);
			}
			case 9:
			{
				emit_sound(NPCEntID, CHAN_STATIC, "UK/youmustknow.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(1.0, "unblock", NPCEntID);
			}
			case 10:
			{
				emit_sound(NPCEntID, CHAN_STATIC, "UK/song1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(95.0, "unblock", NPCEntID);
				entity_set_model(NPCEntID, g_NpcModel2); 
				set_task(0.1, "boxneu", NPCEntID);
			}
			case 11:
			{
				emit_sound(NPCEntID, CHAN_STATIC, "UK/song2.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(62.0, "unblock", NPCEntID);
				entity_set_model(NPCEntID, g_NpcModel2); 
				set_task(0.1, "boxneu", NPCEntID);
			}
			case 12:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(0.5, "unblock", NPCEntID);
			}
			case 13:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(0.5, "unblock", NPCEntID);
			}
			case 14:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/cluck2.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(0.5, "unblock", NPCEntID);
			}
			case 15:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/cluck3.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(0.5, "unblock", NPCEntID);
			}
			case 16:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/cluck4.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(0.5, "unblock", NPCEntID);
			}
			case 17:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/showme.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(1.0, "unblock", NPCEntID);
			}
			case 18:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/prepareyourself.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(1.0, "unblock", NPCEntID);
			}
			case 19:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/ebolastate.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(3.0, "maul", NPCEntID);
				set_task(35.0, "unblock", NPCEntID);
				set_task(4.0, "ebola", NPCEntID);
			}
			case 20:
			{
				emit_sound(NPCEntID, CHAN_STATIC, "UK/songofmypeople.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(5.0, "unblock", NPCEntID);
			}
			case 21:
			{
				emit_sound(NPCEntID, CHAN_STATIC, "UK/suckmydick.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(13.0, "unblock", NPCEntID);
			}
			case 22:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/cluck2.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(0.5, "unblock", NPCEntID);
			}
			case 23:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/cluck3.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(0.5, "unblock", NPCEntID);
			}
			case 24:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/cluck4.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(0.5, "unblock", NPCEntID);
			}
			case 25:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/finalwords.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(4.0, "unblock", NPCEntID);
			}
			case 26:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/ihavereturned.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(2.0, "unblock", NPCEntID);
			}
			case 27:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/itisnotover.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(4.0, "unblock", NPCEntID);
			}
			case 28:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/joinme.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(4.0, "unblock", NPCEntID);
			}
			case 29:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/nightmare.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(4.0, "unblock", NPCEntID);
			}
			case 30:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/ispitonyou.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(1.0, "unblock", NPCEntID);
			}
			case 31:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/neverdestroyed.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(4.0, "unblock", NPCEntID);
			}
			case 32:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/myfavoritepart.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(5.0, "unblock", NPCEntID);
				set_task(2.0, "maul", NPCEntID);
				set_task(3.0, "partfemale2", NPCEntID);
			}
			case 33:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/neverdestroyed.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(4.0, "unblock", NPCEntID);
			}
			case 34:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/myfavoritedinner.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(5.0, "unblock", NPCEntID);
				set_task(2.0, "maul", NPCEntID);
				set_task(3.0, "cheese", NPCEntID);
			}
			case 35:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/ispitonyou.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(1.0, "unblock", NPCEntID);
			}
			case 36:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/mynameis.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(3.0, "unblock", NPCEntID);
			}
			case 37:
			{
				Util_PlayAnimation(NPCEntID, 1); // talk animation
				emit_sound(NPCEntID, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				g_NpcBlocked[NPCEntID] = -1.0;
				set_task(6.0, "unblock", NPCEntID);
				set_task(0.4, "clucking", NPCEntID);
			}
		}
	}
	else
	{
		if(entity_get_int(NPCEntID, EV_INT_sequence) != 0 && g_NpcBlocked[NPCEntID] != -1.0)
			Util_PlayAnimation(NPCEntID, 0);
		
		// reduce timer
		if(g_NpcBlocked[NPCEntID] != -1.0)
		{
			g_NpcBlocked[NPCEntID] -= thinkRate;
		
			if(g_NpcBlocked[NPCEntID] < 0.0 && g_NpcBlocked[NPCEntID] != -1.0)
				g_NpcBlocked[NPCEntID] = 0.0;

		}
		
		// look at the player while askn foa da wey
		movement[0] = playerOrigin[0] - entOrigin[0];
		movement[1] = playerOrigin[1] - entOrigin[1];
		movement[2] = playerOrigin[2] - entOrigin[2];
		
		xs_vec_normalize(movement,movement);
		vector_to_angle(movement,flAngle);
		entity_set_vector(NPCEntID, EV_VEC_angles, flAngle);
	}
	
}

public boxneu(id)
{
	entity_set_int(id, EV_INT_movetype, MOVETYPE_PUSHSTEP); 
	entity_set_int(id, EV_INT_solid, SOLID_BBOX); 
	new Float: mins[3] = {-4.0, -4.0, 1.0 };
	new Float: maxs[3] = { 4.0, 4.0, 10.0 };
	entity_set_size(id, mins, maxs); 
}
public boxneu2(id)
{
	entity_set_int(id, EV_INT_movetype, MOVETYPE_PUSHSTEP); 
	entity_set_int(id, EV_INT_solid, SOLID_BBOX); 
	new Float: mins[3] = {-2.0, -2.0, 1.0 };
	new Float: maxs[3] = { 2.0, 2.0, 10.0 };
	entity_set_size(id, mins, maxs); 
}

public unblock(id)
{
	if(!is_valid_ent(id))
        return;
	
	g_NpcBlocked[id] = random_float(2.0,7.5);
	entity_set_model(id, g_NpcModel);
	Util_PlayAnimation(id, 0)

	entity_set_int(id, EV_INT_movetype, MOVETYPE_PUSHSTEP); 
	entity_set_int(id, EV_INT_solid, SOLID_BBOX); 
	new Float: mins[3] = {-4.0, -4.0, 1.0 };
	new Float: maxs[3] = { 4.0, 4.0, 10.0 };
	entity_set_size(id, mins, maxs); 
}


public Ksrt(id)
{
	gerufen[id] = false;
}

public npc_TakeDamage(iEnt) 
{
    //Make sure we only catch our NPC by checking the classname 
    new className[32]; 
    entity_get_string(iEnt, EV_SZ_classname, className, sizeof(className)-1) 
     
    if(!is_valid_ent(iEnt) || !equali(className, g_NpcClassName)) 
        return;
	
	new Float:tar[3];
	tar[2] += 20;
	entity_get_vector(iEnt, EV_VEC_origin, tar);
	
    //This message will draw blood sprites
	message_begin(MSG_BROADCAST,SVC_TEMPENTITY); 
    write_byte(TE_BLOODSPRITE);
    engfunc(EngFunc_WriteCoord, tar[0]); 
    engfunc(EngFunc_WriteCoord, tar[1]); 
    engfunc(EngFunc_WriteCoord, tar[2]); 
    write_short(spr_blood_spray); 
    write_short(spr_blood_drop); 
    write_byte(247); // color index 
    write_byte(random_num(1, 5)); // size 
    message_end();
} 

npc_Killed(iEnt, Float:flOrigin[3]= { 0.0, 0.0, 0.0 }, Float:flAngle[3]= { 0.0, 0.0, 0.0 } ) 
{ 
    //Our death boolean should now be true!! 
    g_NpcDead[iEnt] = true; 
    
	
	
	new Float:tar[3];
	tar[2] += 20;
	
	bloodbloodblood(iEnt);
	
	new body = create_entity("info_target");
	entity_set_string(body, EV_SZ_classname, g_NpcClassName);  
	entity_set_float(body, EV_FL_takedamage, 0.0);
	entity_set_model(body, g_NpcModel);
	
	set_task(0.0, "boxneu2", body);
	
	
	flOrigin[0] = pos[iEnt][0];
	flOrigin[1] = pos[iEnt][1];
	flOrigin[2] = pos[iEnt][2] + 5.0; 	

	entity_set_origin(body, flOrigin); 
	
	flOrigin[0] = 0.0;
	flOrigin[1] = 0.0;
    flOrigin[2] = 1000.0;
    
	vector_to_angle(flOrigin,flAngle);
	entity_set_vector(body, EV_VEC_angles, flAngle); 
	drop_to_floor(body);
	
	set_task(20.0, "removeEntity", body);
	set_task(17.0, "deathsentence", body);
	
    return;
}

public bloodbloodblood(iEnt)
{
	set_task(0.0, "blood" , iEnt ,"" ,0,"a", 80);
	set_task(0.0, "blood" , iEnt ,"" ,0,"a", 80);
	set_task(0.0, "blood" , iEnt ,"" ,0,"a", 80);
	set_task(0.0, "blood" , iEnt ,"" ,0,"a", 80);
	set_task(0.0, "blood" , iEnt ,"" ,0,"a", 80);
	set_task(0.0, "blood" , iEnt ,"" ,0,"a", 80);
	set_task(0.0, "blood" , iEnt ,"" ,0,"a", 80);
	set_task(0.0, "blood" , iEnt ,"" ,0,"a", 80);
	set_task(0.0, "blood" , iEnt ,"" ,0,"a", 80);
	set_task(0.0, "blood" , iEnt ,"" ,0,"a", 80);
	
}

public blood(iEnt)
{
    message_begin(MSG_BROADCAST,SVC_TEMPENTITY) 
    write_byte(TE_BLOODSPRITE) 
    engfunc(EngFunc_WriteCoord, pos[iEnt][0] + random_float(-35.0, 35.0)); 
    engfunc(EngFunc_WriteCoord, pos[iEnt][1] + random_float(-35.0, 35.0)); 
    engfunc(EngFunc_WriteCoord, pos[iEnt][2] + random_float(-35.0, 35.0)); 
    write_short(spr_blood_spray); 
    write_short(spr_blood_drop); 
    write_byte(247); // color index 
    write_byte(random_num(5, 25)); // size 
    message_end();
}


public deathsentence(iEnt)
{
	emit_sound(iEnt, CHAN_STATIC, "UK/nowyouknow.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
}

public removeEntity(iEnt)
{
	remove_entity(iEnt);
}

public npc_Think(iEnt) 
{
	if(!is_valid_ent(iEnt))
		return;

	static className[32]; 
	entity_get_string(iEnt, EV_SZ_classname, className, sizeof(className)-1) 
	
	if(!equali(className, g_NpcClassName)) 
		return; 

	//We can remove our NPC here if we wanted to but I left this blank as I personally like it when there is a NPC coprse laying around 
	if(g_NpcDead[iEnt]) 
    { 
		remove_entity(iEnt);
		//client_print(0, print_chat, "rem");
		return; 
    }
	
    //Our NPC just spawned 
	if(g_NpcSpawn[iEnt]) 
	{ 
		static Float: mins[3], Float: maxs[3]; 
		pev(iEnt, pev_absmin, mins); 
		pev(iEnt, pev_absmax, maxs); 
		
		//Draw a box which is the size of the bounding NPC 
		//message_begin(MSG_BROADCAST, SVC_TEMPENTITY);
		//write_byte(TE_BOX); 
		//engfunc(EngFunc_WriteCoord, mins[0]); 
		//engfunc(EngFunc_WriteCoord, mins[1]); 
		//engfunc(EngFunc_WriteCoord, mins[2]); 
		//engfunc(EngFunc_WriteCoord, maxs[0]); 
		//engfunc(EngFunc_WriteCoord, maxs[1]); 
		//engfunc(EngFunc_WriteCoord, maxs[2]); 
		//write_short(100); 
		//write_byte(random_num(25, 255)); 
		//write_byte(random_num(25, 255)); 
		//write_byte(random_num(25, 255)); 
		//message_end();
		
		Util_PlayAnimation(iEnt, 0);
        //Our NPC spawn boolean is now set to false 
		g_NpcSpawn[iEnt] = false; 
    }
	
	new Float:hp;
	pev(iEnt, pev_health, hp);
	
	if(g_NpcHP[iEnt] != hp)
	{
		npc_TakeDamage(iEnt);
		g_NpcHP[iEnt] = hp;
	}
	
	NPCMove(iEnt);
	
	entity_set_float(iEnt, EV_FL_nextthink, get_gametime() + thinkRate); 
}

Create_Npc(id, target = 0, Float:flOrigin[3]= { 0.0, 0.0, 0.0 }, Float:flAngle[3]= { 0.0, 0.0, 0.0 } ) 
{ 

	gerufen[id] = true;
	set_task(60.0, "Ksrt", id);
	
    //Create an entity using type 'info_target' 
	new iEnt = create_entity("info_target");
	
    //Set our entity to have a classname so we can filter it out later 
	entity_set_string(iEnt, EV_SZ_classname, g_NpcClassName);  
	
	new random = random_num(1, 12);
		
	switch(random)
	{
		case 1:
		{
			Util_PlayAnimation(iEnt, 1); // talk animation
			emit_sound(iEnt, CHAN_STATIC, "UK/hellothere.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
			g_NpcBlocked[iEnt] = -1.0;
			set_task(1.0, "unblock", iEnt);
		}
		case 2:
		{
			Util_PlayAnimation(iEnt, 1); // talk animation
			emit_sound(iEnt, CHAN_STATIC, "UK/dawayofuganda.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
			g_NpcBlocked[iEnt] = -1.0;
			set_task(3.0, "unblock", iEnt);
		}
		case 3:
		{
			Util_PlayAnimation(iEnt, 1); // talk animation
			emit_sound(iEnt, CHAN_STATIC, "UK/cluck1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
			g_NpcBlocked[iEnt] = -1.0;
			set_task(0.5, "unblock", iEnt);
		}
		case 4:
		{
			Util_PlayAnimation(iEnt, 1); // talk animation
			emit_sound(iEnt, CHAN_STATIC, "UK/cluck2.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
			g_NpcBlocked[iEnt] = -1.0;
			set_task(0.5, "unblock", iEnt);
		}
		case 5:
		{
			Util_PlayAnimation(iEnt, 1); // talk animation
			emit_sound(iEnt, CHAN_STATIC, "UK/cluck3.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
			g_NpcBlocked[iEnt] = -1.0;
			set_task(0.5, "unblock", iEnt);
			
		}
		case 6:
		{
			Util_PlayAnimation(iEnt, 1); // talk animation
			emit_sound(iEnt, CHAN_STATIC, "UK/cluck4.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
			g_NpcBlocked[iEnt] = -1.0;
			set_task(0.5, "unblock", iEnt);
			
		}
		case 7:
		{
			Util_PlayAnimation(iEnt, 1); // talk animation
			emit_sound(iEnt, CHAN_STATIC, "UK/mynameis.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
			g_NpcBlocked[iEnt] = -1.0;
			set_task(3.0, "unblock", iEnt);
		}
		case 8:
		{
			Util_PlayAnimation(iEnt, 1); // talk animation
			emit_sound(iEnt, CHAN_STATIC, "UK/takehimmyself.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
			g_NpcBlocked[iEnt] = -1.0;
			set_task(2.0, "unblock", iEnt);
		}
		case 9:
		{
			Util_PlayAnimation(iEnt, 1); // talk animation
			emit_sound(iEnt, CHAN_STATIC, "UK/youmustknow.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
			g_NpcBlocked[iEnt] = -1.0;
			set_task(1.0, "unblock", iEnt);
		}
		case 10:
		{
			Util_PlayAnimation(iEnt, 1); // talk animation
			emit_sound(iEnt, CHAN_STATIC, "UK/neverdestroyed.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
			g_NpcBlocked[iEnt] = -1.0;
			set_task(4.0, "unblock", iEnt);
		}
		case 11:
		{
			Util_PlayAnimation(iEnt, 1); // talk animation
			emit_sound(iEnt, CHAN_STATIC, "UK/aaa.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
			g_NpcBlocked[iEnt] = -1.0;
			set_task(1.0, "unblock", iEnt);
		}
		case 12:
		{
			Util_PlayAnimation(iEnt, 1); // talk animation
			emit_sound(iEnt, CHAN_STATIC, "UK/youmustknow.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
			g_NpcBlocked[iEnt] = -1.0;
			set_task(1.0, "unblock", iEnt);
		}
	}
	
    //If a player called this function 
	if(id) 
    { 
		//Retrieve the player's origin 
		entity_get_vector(id, EV_VEC_origin, flOrigin); 
		flOrigin[2] += 220.0;
		flOrigin[1] += 60.0; 	
		
		//Set the origin of the NPC to the current players location 
		entity_set_origin(iEnt, flOrigin); 
        //Retrieve the player's  angle 
		entity_get_vector(id, EV_VEC_angles, flAngle); 
        //Make sure the pitch is zeroed out 
		flAngle[0] = 0.0; 
        //Set our NPC angle based on the player's angle 
		entity_set_vector(iEnt, EV_VEC_angles, flAngle); 
    }
	
	//Set our NPC to take damange and how much health it has
	entity_set_float(iEnt, EV_FL_takedamage, 1.0);
	entity_set_float(iEnt, EV_FL_health, 50.0);

    //Set a model for our NPC 
	entity_set_model(iEnt, g_NpcModel); 
    //Set a movetype for our NPC 
	entity_set_int(iEnt, EV_INT_movetype, MOVETYPE_PUSHSTEP); 

	set_pev(iEnt, pev_solid, SOLID_SLIDEBOX)
	set_pev(iEnt, pev_gravity, 1.0);
	
    //Create a bounding box for oru NPC 
	new Float: mins[3] = {-4.0, -4.0, 1.0 } 
	new Float: maxs[3] = { 4.0, 4.0, 10.0 } 

	entity_set_size(iEnt, mins, maxs); 
     
    //Controllers for our NPC. First controller is head. Set it so it looks infront of itself 
	entity_set_byte(iEnt,EV_BYTE_controller1,125); 
    // entity_set_byte(ent,EV_BYTE_controller2,125); 
    // entity_set_byte(ent,EV_BYTE_controller3,125); 
    // entity_set_byte(ent,EV_BYTE_controller4,125); 
	
	//Drop our NPC to the floor 
	drop_to_floor(iEnt);
    // set_rendering( ent, kRenderFxDistort, 0, 0, 0, kRenderTransAdd, 127 );
     
    //We just spawned our NPC so it should not be dead 
	g_NpcSpawn[iEnt] = true; 
	g_NpcDead[iEnt] = false;
	g_NpcBlocked[iEnt] = -1.0;
	set_task(4.0, "unblock", iEnt);
	g_NpcTarget[iEnt] = target;
	g_NpcHP[iEnt] = 50.0;
	
	set_task(0.5, "checkNpc", iEnt);
	
    //Make it instantly think 
	entity_set_float(iEnt, EV_FL_nextthink, get_gametime() + 0.01);
}


//#define __BASEDON_ENTITY

public @CreateSyntheticAura(const __int_Index, __int_Entity)
{
	__int_Entity = create_entity("env_model");
	
	entity_set_model(__int_Entity, "models/evolution/Auras/shape_01.mdl");
	
	entity_set_int(__int_Entity, EV_INT_renderfx, kRenderFxGlowShell);
	entity_set_int(__int_Entity, EV_INT_rendermode, kRenderTransAdd);
	entity_set_float(__int_Entity, EV_FL_renderamt, float(25));
	
	entity_set_float(__int_Entity, EV_FL_animtime, get_gametime());
	entity_set_float(__int_Entity, EV_FL_framerate, float(1));
	
	DispatchSpawn(__int_Entity);
	
	message_begin(MSG_ALL, get_user_msgid("ManipModel"));
	{
		write_byte(10);
		write_short(__int_Entity);
	}
	message_end();
	
	entity_set_float(__int_Entity, EV_FL_scale, 0.254_000);
	
	entity_set_int(__int_Entity, EV_INT_skin, 4);
	
#if defined __BASEDON_ENTITY
	entity_set_int(__int_Entity, EV_INT_movetype, MOVETYPE_FOLLOW);
	
	entity_set_edict(__int_Entity, EV_ENT_aiment, __int_Index);
	entity_set_edict(__int_Entity, EV_ENT_owner, __int_Index);
#else
	static Float:__float_Origin[3];
	entity_get_vector(__int_Index, EV_VEC_origin, __float_Origin);
	
	entity_set_origin(__int_Entity, __float_Origin);
#endif
	
	entity_set_edict(__int_Entity, EV_ENT_pContainingEntity, __int_Entity);
}

public @RemoveSyntheticAura(const __int_Index, const __int_Entity)
{
	if(is_valid_ent(__int_Entity))
	{
		message_begin(MSG_ALL, get_user_msgid("ManipModel"));
		{
			write_byte(0);
			write_short(__int_Entity);
		}
		message_end();
		
		remove_entity(__int_Entity);
	}
}


stock Util_PlayAnimation(index, sequence, Float:framerate = 1.0) 
{ 
    entity_set_float(index, EV_FL_animtime, get_gametime()); 
    entity_set_float(index, EV_FL_framerate,  framerate); 
    entity_set_float(index, EV_FL_frame, 0.0); 
    entity_set_int(index, EV_INT_sequence, sequence); 
}  


public plugin_precache()
{
	spr_blood_drop = precache_model("sprites/blood.spr") 
    spr_blood_spray = precache_model("sprites/bloodspray.spr") 
	
	precache_sound( "UK/hellothere.wav" );
	precache_sound( "UK/dawayofuganda.wav" );
	precache_sound( "UK/cluck1.wav" );
	precache_sound( "UK/cluck3.wav" );
	precache_sound( "UK/cluck2.wav" );
	precache_sound( "UK/cluck4.wav" );
	precache_sound( "UK/doyouknow.wav" );
	precache_sound( "UK/doyouknow2.wav" );
	precache_sound( "UK/doyouknow3.wav" );
	precache_sound( "UK/doyouknow4.wav" );
	precache_sound( "UK/doyouknow5.wav" );
	precache_sound( "UK/youmustknow.wav" );
	precache_sound( "UK/song2.wav" );
	precache_sound( "UK/song1.wav" );
	precache_sound( "UK/singwithme.wav" );
	precache_sound( "UK/aaa.wav" );
	precache_sound( "UK/ebolaaaa.wav" );
	precache_sound( "UK/ebolaaaa2.wav" );
	precache_sound( "UK/ebolacheese.wav" );
	precache_sound( "UK/ebolastate.wav" );
	precache_sound( "UK/ihavereturned.wav" );
	precache_sound( "UK/ispitonyou.wav" );
	precache_sound( "UK/itisnotover.wav" );
	precache_sound( "UK/joinme.wav" );
	precache_sound( "UK/myfavoriteebola.wav" );
	precache_sound( "UK/myfavoritepart.wav" );
	precache_sound( "UK/myfavoritedinner.wav" );
	precache_sound( "UK/mynameis.wav" );
	precache_sound( "UK/neverdestroyed.wav" );
	precache_sound( "UK/nightmare.wav" );
	precache_sound( "UK/nowyouknow.wav" );
	precache_sound( "UK/prepareyourself.wav" );
	precache_sound( "UK/showme.wav" );
	precache_sound( "UK/songofmypeople.wav" );
	precache_sound( "UK/finalwords.wav" );
	precache_sound( "UK/suckmydick.wav" );
	precache_sound( "UK/superebola.wav" );
	precache_sound( "UK/superebola2.wav" );
	precache_sound( "UK/superebola3.wav" );
	precache_sound( "UK/takehimmyself.wav" );

	precache_model( "sprites/lightninghit.spr" );
	precache_model( "sprites/ecx.aura.ssj3.spr" );
	precache_model( "sprites/ecx.lightning.spr" );
	
	precache_model( "models/evolution/Auras/shape_01.mdl" );
	
	precache_model( "models/UK/knuckles.ssj3/Knuckles.ssj3.mdl" );
	precache_model( "models/UK/knuckles.ssj2/Knuckles.ssj2.mdl" );
	precache_model( "models/UK/knuckles.ssj/Knuckles.ssj.mdl" );
	precache_model( "models/UK/knuckles/Knuckles.mdl" );
	precache_model( "models/UK/knuckles.dj/Knucklesdj.mdl" );
}