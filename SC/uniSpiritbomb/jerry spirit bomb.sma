/*
Description:
	This plugin is made for ESF(ESF1.2.3, EVM, ECX), I don't know how it is gonna be in ESF1.3, I just tested it in EVM. but I think it shall work great in ECX as well. And hope someone will be interested in developing this plugin!
	1. Only can the admin use this function.
	2. One life, one chance to use the Universe SpiritBomb.
	3. This function doesn't work while your HP is greater than 30.

Usage:
	First, you must be a low health(less than 30HP), then use the item "SpiritBomb" in game and charging it, when the charging bar is full, just be cool and keep charging for a while, then the Universe SpiritBomb shows up! Have fun!


Thanks to ÐÄ÷È for modelling. (the original model bones are collected from Mati_Mod)
*/

#include <amxmodx>
#include <amxmisc>
#include <fakemeta> 
#include <engine> 
#include <fun> 

new limit
new swch //0 = off; 1 = currentWeapon12; 2 = editSpiritbombEntity; 3 = hasThrown
new weaponSwch
new charging
new Float: entspeed[3]
new goku, aura, powerLevel
new ent
new Float: touchOrg[3], Float: damageOrg[6]

public plugin_init()
{
	register_plugin("TheUniverseSpiritBomb", "1.0", "www.esfkami.net")

	register_forward(FM_SetModel, "fw_SetModel")
	register_forward(FM_EmitSound, "fw_EmitSound")
	register_forward(FM_Touch, "fw_Touch")
	
	register_event("ResetHUD", "usageFrequency", "be")
	register_event("CurWeapon","checkWeapon","be", "1=1")
	register_message(get_user_msgid("Charge"), "setSize")

	register_clcmd("buu", "characterProtect")
	register_clcmd("goku", "characterProtect")
	register_clcmd("gohan", "characterProtect")
	register_clcmd("krillin", "characterProtect")
	register_clcmd("frieza", "characterProtect")
	register_clcmd("piccolo", "characterProtect")
	register_clcmd("trunks", "characterProtect")
	register_clcmd("vegeta", "characterProtect")
	register_clcmd("cell", "characterProtect")
	register_clcmd("change_class", "characterProtect")
}

public client_PostThink(id)
{
	if(swch == 2 && is_valid_ent(ent))
	{
		swch = 3
		throwsb(id)
	}
	
	if(!is_valid_ent(ent) && swch == 1) 
	{
		if(!(pev(1, pev_button) & IN_ATTACK) || pev(1, pev_button) & IN_ATTACK2)
		{
			emit_sound(1, 3, "goku/invalid.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
		}
	}
	
	if(swch == 3 && !is_valid_ent(ent))
	{
		swch = 0
		ent = 0
		remove_entity(goku)
		remove_entity(aura)
		set_entity_visibility(1, 1)
		client_cmd(1, "resetview")
		set_pdata_int(id, 460, powerLevel)
		emit_sound(1, 3, "goku/sb_explosion.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
		set_pev(1, pev_takedamage, 1)
		set_pev( 1, pev_flags, pev( 1, pev_flags ) & ~FL_FROZEN )
		
		damageOrg[0] = touchOrg[0] - 1500.0
		damageOrg[1] = touchOrg[0] + 1500.0
		damageOrg[2] = touchOrg[1] - 1500.0
		damageOrg[3] = touchOrg[1] + 1500.0
		damageOrg[4] = touchOrg[2] - 1500.0
		damageOrg[5] = touchOrg[2] + 1500.0
		
		for(new i; i<=32; i++)
		{
			new Float: playerOrgs[3]
			pev(i, pev_origin, playerOrgs)
			
			if( playerOrgs[0] > damageOrg[0]
			&& playerOrgs[0] < damageOrg[1]
			&& playerOrgs[1] > damageOrg[2]
			&& playerOrgs[1] < damageOrg[3]
			&& playerOrgs[2] > damageOrg[4]
			&& playerOrgs[2] < damageOrg[5])
		{
			if(pev(i, pev_takedamage) && get_pdata_int(i, 298) == 0 && get_pdata_int( i, 301, -89) == 0)
			{
				new gmsgDeathMsg	= get_user_msgid( "DeathMsg"	);
				new gmsgScoreInfo	= get_user_msgid( "ScoreInfo"	);
				set_msg_block( gmsgDeathMsg, BLOCK_ONCE );
				set_msg_block( gmsgScoreInfo, BLOCK_ONCE );
				
				set_pdata_int( i , 301, 0, -89 );
				entity_set_float( i, EV_FL_takedamage, 2.0 );
				
				// hack for the blood in evm
				entity_set_float( i, EV_FL_health, 1.0 );
				message_begin( MSG_ONE, get_user_msgid("Health"), {0,0,0} , i );
				write_byte( 1 );
				message_end( );
				// hack end
				
				user_kill( i, 1 );
				emit_sound(i, 3, "goku/sb_explosion.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
				
				message_begin( MSG_ALL, get_user_msgid("DeathMsg") );
				write_byte	( 1 );
				write_byte	( i );
				write_string( "the Universe SpiritBomb" );
				message_end	();
				
				entity_set_float( 1, EV_FL_frags, entity_get_float( 1, EV_FL_frags ) + 1 );
				entity_set_float( i, EV_FL_frags, entity_get_float( i, EV_FL_frags ) );
				
			}
		}
	}
}

	return PLUGIN_CONTINUE;
}

public usageFrequency(id)
{
	limit = 1
}

public characterProtect(id)
{
	if(is_valid_ent(ent))
	{
	client_print(id, print_chat, "[EN] You can't change your character while using the Universe SpiritBomb.")
	return PLUGIN_HANDLED;
	}

	return PLUGIN_CONTINUE;
}

public fw_SetModel(entity, model[])
{
new getName[33]
entity_get_string(entity, EV_SZ_globalname, getName, 32)

if(equal(getName, "magic_attack") && swch == 1 && pev(1, pev_health) <= 30.0)
{
	ent = entity
	weaponSwch = 1
}

return FMRES_IGNORED
}

public fw_EmitSound(id, channel, const szSample[ ])
{
new Float: getSize

if(equal(szSample, "goku/spiritbomb_charge.wav"))
{
	if(pev(1, pev_health) <= 30.0)
	{
		client_cmd(1, "stopsound goku/spiritbomb.wav")
		set_task(4.0, "playsound", 1)
	}
}

if(equal(szSample, "goku/spiritbomb_shoot.wav"))
{
	
	charging = 2
	set_rendering( 1, 0, 255, 255, 255, 0, 10 );
	strip_user_weapons(1)
	give_item(1, "weapon_melee")
	give_item(1, "weapon_kiblast")
	give_item(1, "weapon_genericbeam")
	give_item(1, "weapon_kamehameha")
	give_item(1, "weapon_solarflare")
	give_item(1, "weapon_kametorpedo")
	give_item(1, "weapon_sensu")
	emit_sound(1, 3, "goku/invalid.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
	
	set_task(0.03, "checkent", 1)
}

if(equal(szSample, "weapons/spiritbomb_fire.wav"))
{
	pev(ent, pev_scale, getSize)
	if(getSize < 5.9)
	{
		emit_sound(1, 1, "weapons/sb_fire.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
	}
}
return PLUGIN_HANDLED;
}

public checkent(id)
{
new Float: getSize
if(is_valid_ent(ent))
{
	pev(ent, pev_scale, getSize)
	if(getSize > 5.9)
	{
		new Float: org[3], Float: angles[3]
		pev(1, pev_origin, org)
		pev(1, pev_angles, angles)
		goku = create_entity( "env_model" );
		engfunc( EngFunc_SetModel, goku, "models/player/goku/sb_goku.mdl" );
		set_pev(1, pev_flags, FL_FROZEN)
		set_pev(1, pev_takedamage, 0)
		set_entity_visibility(1, 0)
		set_pev(goku, pev_angles, angles)
		set_pev( goku, pev_origin, org ); 
		entity_set_float(goku, EV_FL_animtime, get_gametime())
		entity_set_float(goku, EV_FL_framerate, 0.6)
		entity_set_int(goku, EV_INT_sequence, 113 )
		set_pev( goku, pev_controller, 125 )	
		set_pev( goku, pev_controller_0, 125 )
		set_pev( goku, pev_controller_1, 125 )
		set_pev( goku, pev_controller_2, 125 )
		set_pev( goku, pev_controller_3, 125 )
		
		screen_shake(1)
		emit_sound(1, 3, "goku/sb_pushing.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
		swch = 2
	}
	else if(getSize < 5.9)
	{
		emit_sound(1, 3, "goku/sb_shoot.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
	}
}
else
{
	emit_sound(1, 3, "goku/sb_shoot.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
}
}

public playsound(id)
{
if(is_valid_ent(ent))
{
	emit_sound(1, 3, "goku/sb_charging.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
}
}

public fw_Touch(entity, id)
{
new class[33]
pev(entity, pev_classname, class, 32) 
if(equal(class, "Spirit Bomb"))
{
	new Float: getSize
	pev(ent, pev_scale, getSize)
	if(getSize > 5.9 && is_valid_ent(ent))
	{
		pev(ent, pev_origin, touchOrg)  
	}
}
}

public throwsb(id)
{
pev(ent, pev_velocity, entspeed)
entspeed[0] = entspeed[0] * 0.04
entspeed[1] = entspeed[1] * 0.04
entspeed[2] = entspeed[2] * 0.04
set_pev(ent, pev_velocity, entspeed)
client_cmd(1, "cam_idealdist 100")

set_task(0.5, "kiDecrease", 1)
set_task(20.5, "sbstopmoving", 1)
set_task(25.6, "trans", 1)
}

public kiDecrease(id)
{
if(swch == 3 && is_valid_ent(ent))
{
	if(pev(goku, pev_sequence) == 113)
	{
	new Float: curKI
	curKI = entity_get_float(id, EV_FL_fuser4)
	if(curKI > 25.0)
	{
		entity_set_float( id, EV_FL_fuser4, curKI - 10.0)
	}
	else
	{
		entity_set_float( id, EV_FL_fuser4, 20.0)
	}
	
	set_task(0.1, "kiDecrease", id)
	}
	
	if(pev(goku, pev_sequence) == 27)
	{
	entity_set_float( id, EV_FL_fuser4, 300.0)
	}
}
}

public sbstopmoving(id)
{
set_pev(ent, pev_velocity, {0.0, 0.0, 0.0})
}

public trans(id)
{
new Float: org2[3]
pev(id, pev_origin, org2)
aura = create_entity( "env_model" );
engfunc( EngFunc_SetModel, aura, "models/aura.mdl" );
set_rendering( aura, kRenderFxNone, 255, 255, 255, kRenderTransAdd, 40 )
set_pev( aura, pev_skin, 0)
set_pev( aura, pev_scale, 0.3)
set_pev( aura, pev_origin, org2 ); 
set_pdata_int(1, 460, powerLevel * 2)
entity_set_float(aura, EV_FL_animtime, get_gametime())
entity_set_float(aura, EV_FL_framerate, 1.0)
entity_set_int(aura, EV_INT_sequence, 0 )
entity_set_int(goku, EV_INT_sequence, 27 )
set_pev( aura, pev_controller, 125 )	
set_pev( aura, pev_controller_0, 125 )
set_pev( aura, pev_controller_1, 125 )
set_pev( aura, pev_controller_2, 125 )
set_pev( aura, pev_controller_3, 125 )

set_task(0.9, "trans2", id)
}

public trans2(id)
{
set_pev( aura, pev_skin, 4)
set_pev( aura, pev_scale, 0.43)
engfunc( EngFunc_SetModel, goku, "models/player/goku/sb_gokussj.mdl" );
set_pdata_int(1, 460, powerLevel * 10)
set_task(4.0, "againPush", 1)
set_task(6.5, "sbmoving", 1)
}

public againPush(id)
{
entity_set_float(goku, EV_FL_animtime, get_gametime())
entity_set_float(goku, EV_FL_framerate, 0.9)
entity_set_int(goku, EV_INT_sequence, 113 )
}

public sbmoving(id)
{
entspeed[0] = entspeed[0] * 8
entspeed[1] = entspeed[1] * 8
entspeed[2] = entspeed[2] * 8
set_pev(ent, pev_velocity, entspeed)
}

public setSize(id)
{
if(swch == 1 && limit == 1)
{
	new Float: getSize
	pev(ent, pev_scale, getSize)
	if(getSize > 0.9 && getSize < 1.0)
	{
		charging = 1
		set_pev(ent, pev_scale, 1.0)
		set_rendering( 1, kRenderFxGlowShell, 255, 255, 255, kRenderNormal, 10 );
		emit_sound(1, 3, "goku/sb_finishcharging.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
		set_task(11.0, "setSize2", 1)
	}
}
}

public setSize2(id)
{
if(get_user_button(id) & IN_ATTACK && charging == 1)
{
	new Float: vec[3]
	pev(id, pev_origin, vec)
	vec[2] += 750.0
	
	ScreenFade(1, 14, {255, 255, 255}, 255)
	client_cmd(1, "cam_idealdist 666")
	powerLevel = get_pdata_int(1, 460)
	set_pev(ent, pev_origin, vec)
	set_pev(ent, pev_scale, 6.0)
	limit = 0
	
	set_task(10.0, "setSize3", 1)
}
}

public setSize3(id)
{
client_cmd(1, "cam_idealdist 100")
}

public checkWeapon(id)
{
	new weaponID
	weaponID = read_data(2)
	if(weaponID == 12)
	{
		swch = 1
	}
	
	if(weaponID != 12 && swch < 2 )
	{
		swch = 0
		if(weaponSwch == 1)
		{
			weaponSwch = 0
			strip_user_weapons(1)
			give_item(1, "weapon_melee")
			give_item(1, "weapon_kiblast")
			give_item(1, "weapon_genericbeam")
			give_item(1, "weapon_kamehameha")
			give_item(1, "weapon_solarflare")
			give_item(1, "weapon_kametorpedo")
			give_item(1, "weapon_sensu")
			set_rendering( 1, 0, 255, 255, 255, 0, 10 );
		}
	}
}

stock ScreenFade(id, Timer, Colors[3], Alpha) 
{
message_begin(MSG_ONE_UNRELIABLE, get_user_msgid("ScreenFade"), _, id);
write_short((1<<12) * Timer)
write_short(1<<12)
write_short(0)
write_byte(Colors[0])
write_byte(Colors[1])
write_byte(Colors[2])
write_byte(Alpha)
message_end()
}

public screen_shake(id) 
{ 
	if(pev(goku, pev_sequence) == 113)
	{
	message_begin(MSG_ONE_UNRELIABLE, get_user_msgid("ScreenShake"), _, id) 
	write_short((1<<12)*2) // amplitude
	write_short((1<<12)*1) // duration 
	write_short((1<<12)*4) // frequency
	message_end() 
	
	set_task(0.1, "screen_shake", 1)
	}
} 

public plugin_precache()
{
precache_model("models/player/goku/sb_goku.mdl");
precache_model("models/player/goku/sb_gokussj.mdl");
precache_model("models/sb_sphere.mdl");

precache_sound("goku/invalid.wav");
precache_sound("goku/sb_charging.wav");
precache_sound("goku/sb_finishcharging.wav");
precache_sound("goku/sb_pushing.wav");
precache_sound("goku/sb_explosion.wav");
precache_sound("goku/sb_shoot.wav");
precache_sound("weapons/sb_fire.wav");
}
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang2052\\ f0\\ fs16 \n\\ par }
*/
