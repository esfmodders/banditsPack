/* 
MODEL:  心魅

AMXX:   Jerry
Dc.Mit

2015-June-10

Description:
This plugin is made for ESF: EVM, it allows you to use Cell Absorption Attack to absorb another player to increase your powerlevel. PS: If you don't absorb a player, your Cell won't be able to transform.

Usage:
While you're playing the role "Cell" and aiming at the enemy, what you need to do is just to put him down first, then you press button "ALT" to absorb a player.


For more resources please to go to our website: www.esfkami.net
*/

#include <amxmodx>
#include <fakemeta>
#include <engine>
#include <fun>

new swch[33], swch2[33], ScreenShakeSwch[33]; //swch: judge if the player is playing Cell. swch2: judge if Cell has absorbed a player. ScreenShakeSwch: control if it's time for ScreenShaking 
new IsSpecialAttacking[33] //if the player is using Cell Special Attack(Absorption)
new target[33]
new atkcell[33] //it is for creating a model
new cellar[33] //for showing a bigger aura
new ctime[33] //for charging timer
new Float: vec[3]
new atkcellspr[33] //for showing a FX sprite

#define PLUGIN_NAME	"Cell Absorption Attack"
#define PLUGIN_VERSION	"1.0"
#define PLUGIN_AUTHOR	"www.esfkami.net"

public plugin_init()
{
	register_plugin(PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_AUTHOR);
	register_clcmd("Ascend", "rolecell")
	register_clcmd("change_class", "spatking")
	register_clcmd("buu", "spatking")
	register_clcmd("goku", "spatking")
	register_clcmd("gohan", "spatking")
	register_clcmd("krillin", "spatking")
	register_clcmd("frieza", "spatking")
	register_clcmd("piccolo", "spatking")
	register_clcmd("trunks", "spatking")
	register_clcmd("vegeta", "spatking")
	register_clcmd("cell", "spatking")
	register_clcmd(".Special","stcellspatk");
	register_event("ResetHUD", "getcontrol", "e")
}

public client_PostThink(id)
{
	if(ScreenShakeSwch[id] == 1)
	{
		screen_shake(id, 110, 1, 23) // it's a FX while the player is using the special attack
	}
	
	if(entity_get_int( id, EV_INT_playerclass) == 9) //if the role of the player is Cell
	{
		swch[id] = 1
	}
	else
	{
		swch[id] = 0
		swch2[id] = 0
	}
}

public spatking(id) //block those commands while using the special attack
{
	if(IsSpecialAttacking[id] == 1)
	{
		return PLUGIN_HANDLED;
	}
	else
	{
		return PLUGIN_CONTINUE;
	}
	return PLUGIN_HANDLED;
}

public rolecell(id) //block transforming when the player is playing Cell and he hasn't absorbed a player
{
	if(swch[id] != 1)
	{
		return PLUGIN_CONTINUE;
	}
	
	if(swch2[id] ==1)
	{
		return PLUGIN_CONTINUE;
	}
	else
	{
		client_print(id,print_chat,"You must absorb a player to transform")
	}
	return PLUGIN_HANDLED;
}

public getcontrol(id) //set the player is visible and free
{
	set_entity_visibility(id, 1)
	set_pev( id, pev_flags, pev( id, pev_flags ) & ~FL_FROZEN );
	set_entity_visibility(target[id], 1)
}

public lostcontrol(id) //stop the player and the target doing anything
{
	if(is_user_bot(target[id]))
	{
		client_cmd(1, "idlebots 1")
		set_pev(target[id], pev_flags, pev(target[id], pev_flags) | FL_FROZEN)
	}
	
	set_pev(target[id], pev_flags, pev(target[id], pev_flags) | FL_FROZEN)
	set_pev(id, pev_flags, pev(id, pev_flags) | FL_FROZEN)
}

stock UTIL_SetProtect( id, iStatus ) //set the player and the target can not be attacked by other players
{
	if( iStatus == 1 )
	{
		set_pdata_int( id, 301, 1, -89 );
	}
	
	else if( iStatus == 0 )
	{
		set_pdata_int( id, 301, 0, -89 );
	}
}

public plugin_precache() //precache some necessary resources
{
	precache_model("models/aura.mdl")
	precache_model("models/cellEsfkami.mdl") 
	precache_sound("weapons/teleport.wav")
	precache_sound("cell/cellspatk.wav")
	precache_sound("krillin/pscream.wav")
	precache_sound("evolution/ChargePush.wav")
	precache_sound("cell/celllaugh.wav")
	
	precache_model( "sprites/evm_taura3.spr" )
}

public stcellspatk( id ) //start to use the special attack
{
	new body;
	get_user_aiming(id, target[id], body);
	
	if(swch[id] == 1 && swch2[id] == 0) //if the player's role is Cell and he has not absorbed another player yet
	{
		pev(target[id], pev_origin, vec) //get the target's position
		new Float: tvec[3]
		tvec[0] = vec[0]
		tvec[1] = vec[1]
		tvec[2] = vec[2]
		vec[0] = vec[0] - 33 //set a new position
		
		if(pev(target[id], pev_sequence) == 74 || pev(target[id], pev_sequence) == 75 || pev(target[id], pev_sequence) == 72 || pev(target[id], pev_sequence) == 73 )
		{ //if the animation of the target is correct
			if (is_user_alive(id))
			{
				swch2[id] = 1 //set the player has already absorbed a player
				IsSpecialAttacking[id] = 1 //set the player is using the special attack
				
				UTIL_SetProtect(id, 1)
				UTIL_SetProtect(target[id], 1) //protect the player and the target from being attacked
				
				set_pev(id, pev_flags, pev(id, pev_flags) | FL_FROZEN) //make the player be not able to move 
				emit_sound(id,CHAN_STATIC, "weapons/teleport.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
				set_pev(id, pev_origin, vec) //set player a new position
				entity_set_aim(id, tvec) //make the player to aim at the designated target
				
				atkcell[id] = create_entity( "env_model" );
				
				engfunc( EngFunc_SetModel, atkcell[id], "models/cellEsfkami.mdl" ); //set the entity's model
				entity_set_float(atkcell[id], EV_FL_animtime, get_gametime()) //set the entity's animation time
				entity_set_float(atkcell[id], EV_FL_framerate, 1.5) //set the entity's animation rate
				set_pev( atkcell[id], pev_origin, vec ); //set the entity's position
				emit_sound(id,CHAN_STATIC, "cell/cellspatk.wav", 1.0, ATTN_NORM, 0, PITCH_NORM) //play the sound
				
				
				
				set_entity_visibility(id, 0) //make player be not able to be seen
				entity_set_int(atkcell[id], EV_INT_sequence, 0 ) //set the entity's animation sequence
				entity_set_int(atkcell[id], EV_INT_gaitsequence, 0 ) //maybe this line is not necessary..
				
				set_pev( atkcell[id], pev_controller, 125 )	
				set_pev( atkcell[id], pev_controller_0, 125 )
				set_pev( atkcell[id], pev_controller_1, 125 )
				set_pev( atkcell[id], pev_controller_2, 125 )
				set_pev( atkcell[id], pev_controller_3, 125 ) //make the animation correct(if you don't want these five lines, the animation will be warped)
				
				set_task(0.1, "timer",id,_,_,"a",1)
				lostcontrol(id)
			}
		}
		else
		{
			client_print(id,print_chat,"You need to put the enemy down so that you can absorb him")
		}
	}
	
	if(swch2[id] == 1)
	{
		client_print(id,print_chat,"Friendly reminder: You can only absorb one time")
	}
	return PLUGIN_HANDLED;
}

public timer(id) //0.34 = 11.38 sec it's FX, when the player is using the special attack, it shows up
{
	if (ctime[id] == 2)
	{
		set_entity_visibility(target[id], 0)
	}
	if (ctime[id] == 6)
	{
		cellaura(id)
		emit_sound(id,CHAN_STATIC, "krillin/pscream.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
	}
	if(ctime[id] == 12)
	{
		client_cmd(id, "cam_idealdist 150") //Camera distance
		atkcellspr[id] = create_entity( "env_sprite" ); //a spr entity
		engfunc( EngFunc_SetModel, atkcellspr[id], "sprites/evm_taura3.spr" ); //set spr file
		entity_set_float( atkcellspr[id], EV_FL_scale, 1.0 ); //set spr size
		entity_set_int( atkcellspr[id], EV_INT_renderfx, kRenderFxNone );
		entity_set_int( atkcellspr[id], EV_INT_rendermode, kRenderTransAdd );
		entity_set_float( atkcellspr[id], EV_FL_renderamt, 255.0 ); //I don't know how to explain these three lines in English...
		entity_set_float( atkcellspr[id], EV_FL_framerate, 1.0 ); //set spr rate (but it seems to be no use, don't ask me why, I don't know..really...)
		set_pev( atkcellspr[id], pev_origin, vec ); //set spr position
	}
	if (ctime[id] < 100)
	{
		message_begin(MSG_ONE, get_user_msgid("Charge"), {0,0,0}, id) //just a charger
		write_byte(ctime[id])
		message_end()
		ctime[id] += 1 //set how big value the charger once increases
		set_task(0.308,"timer",id) //charging speed
	}
	else if (ctime[id] >= 100)
	{
		ctime[id] = 0
		set_entity_visibility(id, 1)
		removebar(id) //remove the charger
		remove_entity(atkcell[id]) //remove the model
		
		ScreenShakeSwch[id] = 0 //stop shaking the screen
		
		message_begin( MSG_ALL, get_user_msgid("DeathMsg") ); //send a death message for the target
		write_byte	( target[id] );
		write_byte	( target[id] );
		write_string("Cell Absorption Attack"); //Message content
		message_end	();
		
		new msgid = get_user_msgid("DeathMsg")
		new msgblock = get_msg_block(msgid) 
		set_msg_block(msgid,BLOCK_ONCE) //prevent repeated death message from the game
		set_user_frags(target[id], get_user_frags(target[id]) + 1)
		UTIL_SetProtect(id, 0)
		UTIL_SetProtect(target[id], 0)
		user_kill(target[id],0) 
		if(is_user_bot(target[id]))
		{
			client_cmd(1, "idlebots 0")
		}
		set_msg_block(msgid,msgblock) 
		set_user_frags(id, get_user_frags(id) + 1)
		
		emit_sound(id,CHAN_STATIC, "cell/celllaugh.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
		emit_sound(id,CHAN_STATIC, "evolution/ChargePush.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
		set_pdata_int(id, 460, get_pdata_int(id, 460) + 3000000) //set the player's powerlevel
		removeaura(id) //remove that bigger aura
		client_cmd(id, "cam_idealdist 40") //Recover the player's camera distance
		IsSpecialAttacking[id] = 0
	}
	else
	{
		client_print(id,print_chat,"Failed, the enemy has avoided your assault")
	}
}

public cellaura(id) //set the bigger aura
{
	new vec3[3];
	ScreenShakeSwch[id] = 1
	cellar[id] = create_entity( "env_model" )
	engfunc( EngFunc_SetModel, cellar[id], "models/aura.mdl" )
	entity_set_float(cellar[id], EV_FL_framerate, 1.0);
	entity_set_int(cellar[id], EV_INT_sequence, 2);
	
	pev(id, pev_origin, vec3)
	set_pev( cellar[id], pev_origin , vec3)
	set_pev( cellar[id], pev_skin, 1) //set the aura's skin
	set_pev( cellar[id], pev_scale, 1.0)
	set_rendering( cellar[id], kRenderFxNone, 55, 10, 10, kRenderTransAdd, 10 ); //set the transparency
}

public removeaura(id) //remove the bigger aura
{
	remove_entity(cellar[id])
	remove_entity(atkcellspr[id])
	set_pev(id,pev_fixangle,0)
	set_pev( id, pev_flags, pev( id, pev_flags ) & ~FL_FROZEN );
}

public removebar(id) //remove the charger
{
	message_begin(MSG_ONE, get_user_msgid("Charge"), {0,0,0}, id)
	write_byte(0)
	message_end()
}

stock entity_set_aim(id,const Float:target_origin[3]) //set who you want to aim at
{
	if(!is_valid_ent(id)) return 0
	
	static Float:start[3], Float:end[3]
	pev(id,pev_origin,start)
	pev(id,pev_view_ofs,end)
	start[0] += end[0], start[1] += end[1], start[2] += end[2]
	
	static Float:aim_vector[3],Float:new_angles[3]
	aim_vector[0] = target_origin[0] - start[0]
	aim_vector[1] = target_origin[1] - start[1]
	aim_vector[2] = target_origin[2] - start[2]
	vector_to_angle(aim_vector,new_angles)
	
	while(new_angles[0]>360.0) new_angles[0] -= 360.0
	while(new_angles[0]<0.0) new_angles[0] += 360.0
	new_angles[0] *= -1
	while(new_angles[1]>360.0) new_angles[1] -= 360.0
	while(new_angles[1]<0.0) new_angles[1] += 360.0
	
	set_pev(id,pev_angles,new_angles)
	set_pev(id,pev_fixangle,1)
	
	return 1;
}

stock screen_shake(id, amplitude = 4, duration = 2, frequency = 10) 
{ 
	message_begin(MSG_ONE_UNRELIABLE, get_user_msgid("ScreenShake"), _, id) 
	write_short((1<<12)*amplitude) // amplitude
	write_short((1<<12)*duration) // duration 
	write_short((1<<12)*frequency) // frequency
	message_end() 
} 
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang2052\\ f0\\ fs16 \n\\ par }
*/
