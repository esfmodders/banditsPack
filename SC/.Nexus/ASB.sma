#include <amxmodx>
#include <engine>
#include <fun>
#include <hamsandwich>
#include <fakemeta>
#include <ipci/fxlib>
#include <ipci/core>
#include <ipci/ascend>

new const CX_Plugin[]   =   "Aborbation Spirit Bomb";
new const CX_Version[]  =   "1337";
new const CX_Author[]   =   "BANDIT/C4";

enum _:SpiritBombData
{
	ID,
	owner,
	Float:boost,
	Float:x,
	Float:y,
	Float:z
};

new const SBlimit = 50; // change SBs array size too if you want to adjust the limit
new const basedmg = 200;

new SBs[50][SpiritBombData];
static activeABSs[33];
static index = 0, bool:touchCD;

public plugin_init()
{
	register_plugin( CX_Plugin, CX_Version, CX_Author );
	register_event("Charge", "SB_Charge", "be");
	register_touch("Spirit Bomb", "*", "Touch_SpiritBomb");
	register_message(get_user_msgid("Explosion"), "ExplosionDetected");
	RegisterHam(Ham_TakeDamage, "player", "TakeDamage");
	
	for(new i; i < SBlimit; i++)
	{
		SBs[i][ID] = -1;
	}
	
	for(new i; i < 33; i++)
	{
		activeABSs[i] = -1;
	}
	
	set_task(2.0, "refresh_coords");
	set_task(2.0, "resetTouch");
}

public addSB(entID, playerID)
{
	new indexFound = -1;
	
	for(new i = index; i < SBlimit && indexFound < 0; i++)
	{
		if(SBs[i][ID] < 1)
		{
			indexFound = i;
		}
	}
	
	for(new i; i < index && indexFound < 0; i++)
	{
		if(SBs[i][ID] < 1)
		{
			indexFound = i;
		}
	}
	
	if(indexFound < 0)
	{
		// SB limit reaced!
		//client_print(0, print_chat, "ASB limit reached!");
	}
	else
	{
		SBs[indexFound][ID] = entID;
		SBs[indexFound][owner] = playerID;

		activeABSs[playerID] = indexFound;
		
		index = indexFound + 1;
		
		if(index >= SBlimit)
			index = 0;
	}
}

public boostSB(playerID,newBoost)
{
	if(activeABSs[playerID] > -1)
	{
		SBs[activeABSs[playerID]][boost] = newBoost;
	}
}

public removeSB(entID)
{
	SBs[entID][ID] = -1;
	SBs[entID][owner] = -1;
}

// detect spiritbomb and save entity
public SB_Charge(id)
{
	if(get_user_weapon(id) == 12 && read_data(1) >= 31)	// SB selected
	{
		if(activeABSs[id] < 0)
		{
			static ent;
			ent = -1;

			while((ent = find_ent_by_class(ent, "Spirit Bomb")))
			{
				if(is_valid_ent(ent) && entity_get_edict(ent, EV_ENT_owner) == id)
				{
					addSB(ent,id);
				}
			}		
		}

		if(activeABSs[id] > -1)
			SBs[activeABSs[id]][boost] = _:entity_get_float(SBs[activeABSs[id]][ID], EV_FL_scale);
		else
			//client_print(0, print_chat, "error: no active ASB id set!");
		
		
		
		if(read_data(1) == 101)
		{		
			client_cmd(id, "say Everyone give me your Energy");
		}
	}
	else
	{
		activeABSs[id] = -1;
	}
	if(read_data(1) == 101)
	{		
		client_cmd(id, "say Everyone give me your Energy");
	}
}

public TakeDamage(victim, inflictor, attacker, Float:fDamage, bits)
{
	if(activeABSs[victim] > -1)
	{
		if(SBs[activeABSs[victim]][boost] >= 0.9)  // boost? valid ent?
		{
			//client_print(victim, print_chat, "player: %d  activeasb: %d entid: %d", victim,activeABSs[victim],SBs[activeABSs[victim]][ID]);
			
			new params[1];
			params[0] = floatround(fDamage);
			set_task(0.2, "BoostASB", victim, params, sizeof(params), "a", 5);
			
			SetHamParamFloat(4, fDamage/10.0);
		}
	}
}

public BoostASB(data[], victim)
{
	new sbid = SBs[activeABSs[victim]][ID];
	
	//client_print(victim, print_chat, "player: %d  activeasb: %d entid: %d", victim,activeABSs[victim],sbid);
	
	if(is_valid_ent(sbid))
	{
		entity_set_float(sbid, EV_FL_scale, (entity_get_float(sbid, EV_FL_scale) + data[0]/200.0));
		entity_set_float(sbid, EV_FL_dmg, (entity_get_float(sbid, EV_FL_dmg) * 1.2));	
		entity_set_float(sbid, EV_FL_dmg_take, (entity_get_float(sbid, EV_FL_dmg_take) + data[0]/10));
		
		if(entity_get_float(sbid, EV_FL_scale) >= 6)
		{
			entity_set_float(sbid, EV_FL_scale, 6.0);
			client_cmd(victim, "say Ok thats enough! Spirit Bomb is ready"); 
			AddFx( sbid, "fxBlow" );
			AddFx( sbid, "fxVerticalSpriteField", "sprites/ecx.lightning.spr", 1.7, 12, 100, 0, 200, 180, 255, 255, 5, 150, 600 );
			AddFx( sbid, "fxSpriteEntity", "sprites/ecx.shine.spr", 0, 0, 255.0, 1.0, 1.0, 0.4 );
			AddFx( sbid, "fxLightning","sprites/lgtning.spr", 100, 50, 150, 10, 200, 10, 250, 10, 100, 0 );
			AddFx( sbid, "fxSprite", "sprites/ywaves.spr", 6, 60, 0, 0, 0 );

		}
		else if(entity_get_float(sbid, EV_FL_scale) >= 5 && SBs[activeABSs[victim]][boost] < 5)
		{
			client_print(victim, print_chat, "5 times stronger");
		}
		else if(entity_get_float(sbid, EV_FL_scale) >= 4 && SBs[activeABSs[victim]][boost] < 4)
		{
			client_print(victim, print_chat, "4 times stronger");
		}
		else if(entity_get_float(sbid, EV_FL_scale) >= 3 && SBs[activeABSs[victim]][boost] < 3)
		{
			client_print(victim, print_chat, "3 times stronger");
		}
		else if(entity_get_float(sbid, EV_FL_scale) >= 2 && SBs[activeABSs[victim]][boost] < 2)
		{
			client_print(victim, print_chat, "2 times stronger");
		}
		
		new origin[3];
		get_user_origin(victim, origin);
	
		for( new i; i < 3; i++ )// The number of the rays
		{
			message_begin( MSG_PVS, SVC_TEMPENTITY, origin ); 
			write_byte( TE_BEAMENTPOINT ); 
			write_short( sbid ); //start entity
			write_coord( origin[0] + random_num(-100, 100)); //end position X 
			write_coord( origin[1] + random_num(-100, 100)); //end position Y 
			write_coord( origin[2] + random_num(-100, 100)); //end positon Z 
			write_short( engfunc( EngFunc_ModelIndex,"sprites/bigbangb.spr" ) ); //set spr file 
			write_byte( 10 ); //starting frame 
			write_byte( 10 ); //frame rate in 0.1's 
			write_byte( 10 ); //life in 0.1's 
			write_byte( 8 ); //line width in 0.1's 
			write_byte( 0 ); //noise amplitude in 0.01's 
			write_byte( 150 ); //R 
			write_byte( 255 ); //G 
			write_byte( 255 ); //B 
			write_byte( 255 ); //Brightness 
			write_byte( random_num(10, 25) ); //scroll speed in 0.1's 
			message_end( ); 
		}
		
		SBs[activeABSs[victim]][boost] = _:entity_get_float(sbid, EV_FL_scale);
	}
}

public resetTouch()
{
	touchCD = false;
	set_task(1.0, "resetTouch");
}

public refresh_coords()
{
	for(new i = 0; i < SBlimit; i++)
	{
		if(is_valid_ent(SBs[i][ID]))
		{
			static Float:coords[3];
			entity_get_vector(SBs[i][ID], EV_VEC_origin, coords);
			
			SBs[i][x] = _:coords[0]; 
			SBs[i][y] = _:coords[1];
			SBs[i][z] = _:coords[2];
		}
	}
	
	set_task(0.1, "refresh_coords");
}

public ExplosionDetected(MsgID, dest, id)
{
	set_task(0.3, "CheckSBEntities")
}

public CheckSBEntities()
{
	for(new i = 0; i < 32; i++)
	{
		if(!is_valid_ent(SBs[i][ID]) && SBs[i][ID] > 0)
		{
			SBExplosion(i);
			return;
		}
	}
}

public SBExplosion(id)
{
	static Float:SBorigin[3];
	SBorigin[0] = Float:SBs[id][x];
	SBorigin[1] = Float:SBs[id][y];
	SBorigin[2] = Float:SBs[id][z];
	
	new ownerID = SBs[id][owner];
	new Float:radius = 1000.0 * Float:SBs[id][boost];
	
	removeSB(id);
	
	engfunc(EngFunc_MessageBegin, MSG_ALL, get_user_msgid("Explosion") ,SBorigin, 0)
	{
		engfunc(EngFunc_WriteCoord, SBorigin[0]);
		engfunc(EngFunc_WriteCoord, SBorigin[1]);
		engfunc(EngFunc_WriteCoord, SBorigin[2]);
		
		write_long(floatround(radius*4));
		
		write_byte(6);
	}
	message_end();
	
	for (new i=0; i < 32; i++) 
	{    
		if(is_user_alive(i))
		{	
			new Float:damage = 0.0;
			static Float:dist;
			static Float:origin[3];

			pev(i , pev_origin, origin);
			dist = get_distance_f(origin,SBorigin);
			
			if(dist <= radius)
			{
				damage = basedmg * ((-dist/radius)+1);
			}
			
			ExecuteHam(Ham_TakeDamage, i, 0, ownerID, damage, 1); 
		}
	}
}

public Touch_SpiritBomb(toucher, touched)
{
	if(touched != entity_get_edict(toucher, EV_ENT_owner) && touched > 32 && !touchCD)
	{
		touchCD = true;
		static Float:varOrigin[3];
		new Float:scale = entity_get_float(toucher, EV_FL_scale);
		new Float:radius = 200 * scale;
		
		entity_get_vector(toucher, EV_VEC_origin, varOrigin);
		
		engfunc(EngFunc_MessageBegin, MSG_ALL, get_user_msgid("Explosion") , varOrigin, 0)
		{
			engfunc(EngFunc_WriteCoord, varOrigin[0]);
			engfunc(EngFunc_WriteCoord, varOrigin[1]);
			engfunc(EngFunc_WriteCoord, varOrigin[2]);
			
			write_long(floatround(radius)*4);
			
			write_byte(6);
		}
		message_end();
		
		for (new i=0; i < 32; i++) 
		{    
			if(is_user_alive(i))
			{	
				new Float:damage = 0.0;
				new Float:dist;
				new Float:origin[3];
				pev(i , pev_origin, origin);
				dist = get_distance_f(origin,varOrigin);
				
				if(dist <= radius)
				{
					damage = basedmg * ((-dist/radius)+1);
				}

				ExecuteHam(Ham_TakeDamage, i, toucher, entity_get_edict(toucher, EV_ENT_owner), damage, 1); 
			}
        } 
	}
}

public plugin_precache() 
{
	precache_model( "sprites/white.spr" ); 
	precache_model( "sprites/ecx.lightning.spr" );
	precache_model( "sprites/lgtning.spr" );
	precache_model( "sprites/ywaves.spr" );
}  