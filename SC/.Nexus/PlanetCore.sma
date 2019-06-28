/*==================================================================================================
LIBRARIES.
==================================================================================================*/
 
#include <amxmodx>
#include <engine>
#include <hamsandwich>
#include <xs>

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

#include <amxmisc>
#include <amxx/fakemeta_util>
#include <hamsandwich>

new spr_blood_drop, spr_blood_spray, g_lightning_sprite;

new SpriteSmoke
new light

new const CX_Plugin[]	= 	"Planetcore Plugin";
new const CX_Version[]	=	"1337";
new const CX_Author[]	=	"BANDIT/C4";

new adminid[256]
new adminlist[20][256]
new nextline = 0
new txtLen = 0
new adminamount = 0
new sparks[20][7]

new sprites_number1, sprites_number2

new const z_sprites1[] = "sprites/biohazard/poison_spr.spr" 
new const z_sprites2[] = "sprites/biohazard/poison_flare.spr"

#define BladesMaxDmg (100.0)
#define BladesMaxRadius (400.0)
#define BladesMaxDmgRadius (300.0)
 
//new bool:bladecd[32];
new bool:coreappeared;
new bool:corefrei;
new bool:effectsready;

stock MSG_Explosion;
stock FxExplosionBlue;
stock SPR_Rocks;
stock SPR_Rocks2;
stock SPR_Rocks3;

new spr_Lightning;

new lightning

new SpriteLightning

new FxWBskyEnt;
new FxMcloudEnt;

new szWBskyModel[32] =
{
    109, 111, 100, 101, 108, 115, 47, 101, 118, 111, 108, 117, 116, 105, 111, 110, 47, 98, 108, 97, 99, 107, 95, 99, 117, 98, 101, 46, 109, 100, 108, 0
}
new szWMCloudsModel[33] =
{
    109, 111, 100, 101, 108, 115, 47, 101, 118, 111, 108, 117, 116, 105, 111, 110, 47, 99, 108, 111, 117, 100, 115, 112, 104, 101, 114, 101, 46, 109, 100, 108, 0
}

new SpriteLightningred

new bool:lightnings[32]; 
 
static Float:__float_PlanetHealth = 1.0;

public plugin_init( )
{
	//register_clcmd("say hp", "question");
	
	register_plugin( CX_Plugin, CX_Version, CX_Author );
	
	RegisterHam(Ham_TakeDamage, "env_model", "@TakeDamage");
	
	RegisterHam(Ham_TakeDamage, "func_breakable", "@TakeDamage");
	
	register_clcmd("destruction", "@Callback3");
	
	register_clcmd("heal", "@Callback4");
	
	
	//register_clcmd("say f", "Decaler");
	//register_clcmd("say g", "prelight");
	//register_clcmd("say X", "blades");
	//register_clcmd("say FX2", "test2");
	//register_clcmd("say FX3", "test3");
	//register_clcmd("say FX4", "test4");
	
	//register_clcmd("say reset", "@ClientCommand_Reset");
	
	register_native("KillDragonFX", "__KillDragonFX", 0);
	
	//register_clcmd("say j", "CrackTheGround");
}


public @TakeDamage(__int_Victim, __int_Inflictor, __int_Attacker, Float:__float_Damage, __int_Bits)
{
    static __int_Model[32];
    entity_get_string(__int_Victim, EV_SZ_classname, __int_Model, 31);
	
    
    //if(contain(__int_Model, "models/cell_pne") || contain(__int_Model, "models/cell_rck"))
	
	
        if(!entity_get_float(__int_Victim, EV_FL_fuser4))
        {
            entity_set_float(__int_Victim, EV_FL_fuser4, entity_get_float(__int_Victim, EV_FL_health));
        }
        
        if(__float_Damage > entity_get_float(__int_Victim, EV_FL_health))
        {
            if(~entity_get_int(__int_Victim, EV_INT_effects) & EF_NODRAW)
            {
                entity_set_int(__int_Victim, EV_INT_effects, entity_get_int(__int_Victim, EV_INT_effects) | EF_NODRAW);
            }

			if(!entity_get_int(__int_Victim,EV_INT_iuser3))
			{
				//debug
				//client_print(0, print_chat, "save id: %d hp: %f solidmode: %d +1", __int_Victim, entity_get_float(__int_Victim, EV_FL_fuser4), entity_get_int(__int_Victim, EV_INT_solid) );
				
				entity_set_int(__int_Victim, EV_INT_iuser3, entity_get_int(__int_Victim, EV_INT_solid)+1);
			
				entity_set_int(__int_Victim, EV_INT_solid, SOLID_NOT);
			}
            
            SetHamParamFloat(4, 0.0);
        }
}


public @ClientCommand_Reset(__int_Index)
{
	// debug
	//client_print(0, print_chat, "reset init form: %d to %d", get_maxplayers() + 1, entity_count());
	
    for(new __int_Victim = (get_maxplayers() + 1); __int_Victim < entity_count() + get_maxplayers(); __int_Victim++)
    {
        if(is_valid_ent(__int_Victim))
        {
            static __int_Classname[20];
            entity_get_string(__int_Victim, EV_SZ_classname, __int_Classname, 19);
            
				if(entity_get_int(__int_Victim,EV_INT_iuser3) > 0 && entity_get_int(__int_Victim, EV_INT_effects) & EF_NODRAW && entity_get_int(__int_Victim, EV_INT_solid) == SOLID_NOT)
                {
                    entity_set_int(__int_Victim, EV_INT_effects, entity_get_int(__int_Victim, EV_INT_effects) & ~EF_NODRAW);
                    
                    entity_set_float(__int_Victim, EV_FL_health, entity_get_float(__int_Victim, EV_FL_fuser4));
                    
                    //entity_set_int(__int_Victim, EV_INT_solid, SOLID_BBOX);
                    
                    entity_set_int(__int_Victim, EV_INT_renderfx, kRenderFxPulseFastWide);
                    entity_set_int(__int_Victim, EV_INT_rendermode, kRenderTransAdd);

                    entity_set_float(__int_Victim, EV_FL_renderamt, float(100));
                    
                    set_task(4.0, "RENDERFIX",__int_Victim);
				
                    //test4(__int_Victim);
                }
				
        }
    }
}

public DO1(id) 
{ 
		static Float:vOrigin[3];
		pev(id,pev_origin,vOrigin);

        message_begin (MSG_BROADCAST,SVC_TEMPENTITY) 
        write_byte( TE_SPRITETRAIL ) // Throws a shower of sprites or models 
        write_coord( floatround(vOrigin[ 0 ]) ) // start pos 
        write_coord( floatround(vOrigin[ 1 ]) ) 
        write_coord( floatround(vOrigin[ 2 ]) ) 
        write_coord( floatround(vOrigin[ 0 ]) ) // velocity 
        write_coord( floatround(vOrigin[ 1 ]) ) 
        write_coord( floatround(vOrigin[ 2 ]) +20) 
        write_short(sprites_number2) // spr 
        write_byte(15) // (count) 
        write_byte(random_num(2,3)) // (life in 0.1's) 
        write_byte(2) // byte (scale in 0.1's) 
        write_byte(random_num(20,30)) // (velocity along vector in 10's) 
        write_byte(15) // (randomness of velocity in 10's) 
        message_end()
}

public RENDER2(id)
{
	entity_set_float(id, EV_FL_renderamt, float(10));
}

public RENDERFIX(id)
{
    test4(id)
	
	//DO1(id)

    entity_set_int(id, EV_INT_renderfx, kRenderFxNone);
    
    entity_set_float(id, EV_FL_renderamt, float(254));
    
    entity_set_int(id, EV_INT_rendermode, kRenderTransAlpha);
	
	// debug
    //client_print(0, print_chat, "reset id: %d hp: %f solidmode: %d -1", id, entity_get_float(id, EV_FL_fuser4), entity_get_int(id,EV_INT_iuser3) );
	
	entity_set_int(id, EV_INT_solid, entity_get_int(id,EV_INT_iuser3)-1);
	entity_set_int(id, EV_INT_iuser3, 0);
}

public go(id)
{
	FxWBsky(80, 250, 0.00, 0.00, 0.00, 0.00);
    FxWMclouds(220, 200, 5.00, 0.00, 0.00, 0.00);

}

public __KillDragonFX(id)
{
    return KillDragonFX(id);
}

public FxWBsky(size, renderamt, Float:speed, Float:xcord, Float:ycord, Float:zcord)
{
    FxWBskyEnt = engfunc(EngFunc_CreateNamedEntity, engfunc(EngFunc_AllocString, "env_model"));
    set_pev(FxWBskyEnt, pev_classname, "FxWMcloudsEnt");
    engfunc(EngFunc_SetModel, FxWBskyEnt, szWBskyModel);
    set_pev(FxWBskyEnt, pev_scale, float(size / 10));
    set_pev(FxWBskyEnt, pev_renderfx, 0);
    set_pev(FxWBskyEnt, pev_rendermode, 4);
    set_pev(FxWBskyEnt, pev_renderamt, float(renderamt));
    set_pev(FxWBskyEnt, pev_framerate, speed / 10.00);
    dllfunc(DLLFunc_Spawn, FxWBskyEnt);
    new Float:EntOrigin[3];
    EntOrigin[0] = EntOrigin[0] + xcord;
    EntOrigin[1] += ycord;
    EntOrigin[2] += zcord;
    set_pev(FxWBskyEnt, pev_origin, EntOrigin);
    return 0;
	
	set_task(2.0, "respawner",FxWBskyEnt);
}


public respawner(ent)
{
	if(is_valid_ent(ent))
	{
		set_task(2.0, "respawner",ent);
	}
	
	if(!is_valid_ent(ent) && coreappeared)
	{
		set_task(2.9, "KillDragonFX",ent);
		set_task(3.0, "go",ent);
	}
}
	
public KillDragonFX(id)
{
    if (FxMcloudEnt)
    {
        engfunc(EngFunc_RemoveEntity, FxMcloudEnt);
        FxMcloudEnt = 0;
		
		
    }
    if (FxWBskyEnt)
    {
        engfunc(EngFunc_RemoveEntity, FxWBskyEnt);
        FxWBskyEnt = 0;
		
		
    }
}

public FxWMclouds(size, renderamt, Float:speed, Float:xcord, Float:ycord, Float:zcord)
{
    FxMcloudEnt = engfunc(EngFunc_CreateNamedEntity, engfunc(EngFunc_AllocString, "env_model"));
    set_pev(FxMcloudEnt, pev_classname, "FxWMcloudsEnt");
    engfunc(EngFunc_SetModel, FxMcloudEnt, szWMCloudsModel);
    set_pev(FxMcloudEnt, pev_scale, float(size / 10));
    set_pev(FxMcloudEnt, pev_renderfx, 0);
    set_pev(FxMcloudEnt, pev_rendermode, 5);
    set_pev(FxMcloudEnt, pev_renderamt, float(renderamt));
    set_pev(FxMcloudEnt, pev_framerate, speed / 10.00);
    dllfunc(DLLFunc_Spawn, FxMcloudEnt);
    new Float:EntOrigin[3];
    EntOrigin[0] = EntOrigin[0] + xcord;
    EntOrigin[1] += ycord;
    EntOrigin[2] += zcord;
    set_pev(FxMcloudEnt, pev_origin, EntOrigin);
    return 0;
}

public @InitWishList( Client, Wishlevel )
{
		addWish( "PC: I want this Planet to die!", "@Callback3" )
		addWish( "PC: Heal this Planet!", "@Callback4" )
}

public @Callback3( Client )
{
	client_print(0, print_chat, "The Planet is now close to Destruction");
	
	corefrei = true
}

public @Callback4( Client )
{
	client_print(0, print_chat, "Planet Core is stabilized and some Damage undone");
	corefrei = false
	WorldDestructioneffectsrow2re(Client)
	
	@ClientCommand_Reset(Client);
}

public client_putinserver(id)
{
	new authid[32]
	get_user_authid(id,authid,32)
	server_print("User has connected: %s", authid)
	
	for(new i=0;i<adminamount;i++)
	{
		if(equali(authid,adminlist[i])==1)
		{
			new username[32]
			server_print("User %s is admin according to Custom Admin list", authid)
			get_user_name(id,username,32)
			client_print(0,print_chat,"Admin %s has entered the server",username)
			
			strikelightning(id)
			
			return PLUGIN_CONTINUE
		}
	}
	return PLUGIN_CONTINUE
}

public roundstart()
{
	new players[32]
	new playercount
	
	get_players(players,playercount,"a")

	for (new i=0; i<playercount; i++)
	{
		new authid[32]
		get_user_authid(players[i],authid,32)
		
		for(new k=0;k<adminamount;k++)
		{
			if(equali(authid,adminlist[k])==1)
			{
				strikelightning(players[i])
			}
		}
	}
	
	return PLUGIN_CONTINUE
}

public test1(id)
{
	static Float:origin[3];
	pev(id,pev_origin,origin);
	
	message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
	write_byte(TE_LAVASPLASH)
	write_coord(floatround(origin[0])); // x
	write_coord(floatround(origin[1])); // y
	write_coord(floatround(origin[2])); // z	
	message_end();
}

public test2(id)
{
	static Float:origin[3];
	pev(id,pev_origin,origin);
	
	message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
	write_byte(TE_SPARKS)
	write_coord(floatround(origin[0])); // x
	write_coord(floatround(origin[1])); // y
	write_coord(floatround(origin[2])); // z	
	message_end();
}

public test3(id)
{
	static Float:origin[3];
	pev(id,pev_origin,origin);
	
	message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
	write_byte(TE_SMOKE)
	write_coord(floatround(origin[0])); // x
	write_coord(floatround(origin[1])); // y
	write_coord(floatround(origin[2])); // z	
	write_short(spr_blood_drop); 
	write_byte(2.0)
	write_byte(5)
	message_end();
}

public test4(id)
{
	static Float:origin[3];
	pev(id,pev_origin,origin);
	
	message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
	write_byte(TE_TAREXPLOSION)
	write_coord(floatround(origin[0])); // x
	write_coord(floatround(origin[1])); // y
	write_coord(floatround(origin[2])); // z	
	message_end();
}

public smoke(id)
{
	static Float:origin[3];
	pev(id,pev_origin,origin);

	message_begin( MSG_BROADCAST, SVC_TEMPENTITY)
	write_byte(5) // TE_SMOKE
	write_coord(origin[0])
	write_coord(origin[1])
	write_coord(origin[2]) // start location
	write_short(SpriteSmoke) // spritename
	write_byte(50) // scale of sprite
	write_byte(10) // framerate of sprite
	message_end()
}

public pfn_touch(__int_Touched, __int_Toucher)
{
    if(!__int_Touched && is_valid_ent(__int_Toucher) && corefrei)
    {
        static __int_Globalname[13];
        entity_get_string(__int_Toucher, EV_SZ_globalname, __int_Globalname, 12);
        
        if(equal(__int_Globalname, "magic_attack"))
        {
			 //client_print(0, print_chat, "Planet Health: %f", __float_PlanetHealth);
		
            if(drop_to_floor(__int_Toucher))
            {
				if (__float_PlanetHealth > 0.00)
                {
					__float_PlanetHealth = __float_PlanetHealth > Float:0 ? __float_PlanetHealth - entity_get_float(__int_Toucher, EV_FL_dmg) : Float:0;
				}
				if (__float_PlanetHealth <= 0.00 && !coreappeared)
                {
					//client_print(0, print_chat, "CHECKPOINT");
					Cratermaking(__int_Toucher);
					//Umgebungsbaumwegmacher(__int_Toucher)
					//Playerkiller(__int_Toucher)
					//set_task(0.5, "Cratermaking",__int_Toucher);
					
					
					
					boomboom2(__int_Toucher);
					boomboom22(__int_Toucher);
					coreappeared = true
				}
				
            }
        }
    }
}

public HPTEST(id)
{
	set_user_health(id, get_user_health(id) - 255 )
}

public teleport2 (id)
{


	//client_print(0, print_chat, "TP");
	
	new vOldLocation[3], vNewLocation[3];

	get_user_origin( id, vOldLocation );
	get_user_origin( id, vNewLocation, 0 ); 

	new finished = 50;
	
	while(finished > 0)
	{
		vNewLocation[2] += random_num( 50, 100 ); 

		static duck;
		duck = (pev(id, pev_flags) & FL_DUCKING);
		
		engfunc(EngFunc_TraceHull, vOldLocation, vNewLocation, IGNORE_MONSTERS, duck ? HULL_HEAD : HULL_HUMAN, id, 0);
		
		//if(get_tr2(0, TR_InOpen) && !get_tr2(0, TR_AllSolid) && !get_tr2(0, TR_InWater) && !get_tr2(0, TR_StartSolid))
		if(get_tr2(0, TR_pHit) == -1)
		{
			set_user_origin( id, vNewLocation );
			finished = 0;
			
		}
		else
		{
			finished--;
		}
	}
}

public WorldDestructioneffectsrow2re(ent)
{
	if(coreappeared)
	{
		new szLights[2] 

		if(is_valid_ent(ent))
		{
			
			//client_print(0, print_chat, "Light2");
			szLights = "d" 
			set_lights(szLights) 
			set_task(random_float(1.0, 2.0), "WorldDestructioneffectsrow3re", ent);
			
			//fizzle(ent);
			
		}
	}
}

public WorldDestructioneffectsrow3re(ent)
{
	new szLights[2] 

	if(is_valid_ent(ent))
	{
		//client_print(0, print_chat, "Light3");
		szLights = "e" 
		set_lights(szLights) 
		set_task(random_float(1.0, 2.0), "WorldDestructioneffectsrow4re", ent);
		
		//fizzle(ent);
	}
}

public WorldDestructioneffectsrow4re(ent)
{
	new szLights[2] 

	if(is_valid_ent(ent))
	{
		//client_print(0, print_chat, "Light4");
		szLights = "f" 
		set_lights(szLights) 
		set_task(random_float(1.0, 2.0), "WorldDestructioneffectsrow5re", ent);
		
		//fizzle(ent);
	}
}

public WorldDestructioneffectsrow5re(ent)
{
	new szLights[2] 

	if(is_valid_ent(ent))
	{
		//client_print(0, print_chat, "Light5");
		szLights = "g" 
		set_lights(szLights) 
		set_task(random_float(1.0, 2.0), "WorldDestructioneffectsrow6re", ent);
		
		//fizzle(ent);

	}
}

public WorldDestructioneffectsrow6re(ent)
{
	new szLights[2] 

	if(is_valid_ent(ent))
	{
		//client_print(0, print_chat, "Light5");
		szLights = "m" 
		set_lights(szLights) 
		//set_task(random_float(1.0, 2.0), "WorldDestructioneffectsrow6re", ent);
		
		//fizzle(ent);
		
		coreappeared = false

	}
}

public removecore2(id)
{
	remove_entity(id);
	
	KillDragonFX(id);
}

public WorldDestructioneffectsrandom(ent)
{
	if(is_valid_ent(ent))
	{
		set_task(random_float(2.0, 7.0), "WorldDestructioneffectsrandom", ent);
	}
	
	if(!corefrei)
	{
		removecore2(ent)
	}
	else
	{
		new random = random_num(1, 20);
		
		switch(random)
		{
			case 1:
			{
				set_task(0.5, "blades",ent);
				set_task(1.0, "blades",ent);
				set_task(1.5, "blades",ent);
				set_task(2.0, "blades",ent);
				set_task(2.5, "blades",ent);
				set_task(3.0, "blades",ent);
				set_task(3.5, "blades",ent);
				set_task(4.0, "blades",ent);
				set_task(4.5, "blades",ent);
				set_task(5.0, "blades",ent);
				set_task(5.5, "blades",ent);
				set_task(6.0, "blades",ent);
				set_task(6.5, "blades",ent);
				set_task(7.0, "blades",ent);
				set_task(7.5, "blades",ent);
				set_task(8.0, "blades",ent);
				fizzle(ent);
				set_task(8.5, "blades",ent);
				set_task(9.0, "blades",ent);
				set_task(9.5, "blades",ent);
				set_task(10.0, "blades",ent);
				set_task(10.5, "blades",ent);
				set_task(11.0, "blades",ent);
				set_task(11.5, "blades",ent);
				set_task(12.0, "blades",ent);
				strikelightning(ent);
				set_task(12.5, "blades",ent);
				set_task(13.0, "blades",ent);
				set_task(13.5, "blades",ent);
				set_task(14.0, "blades",ent);
				fizzle(ent);
				set_task(14.5, "blades",ent);
				set_task(15.0, "blades",ent);
				set_task(16.5, "blades",ent);
				set_task(17.0, "blades",ent);
				set_task(18.5, "blades",ent);
				set_task(19.0, "blades",ent);
				set_task(20.5, "blades",ent);
				set_task(21.0, "blades",ent);
				set_task(19.5, "blades",ent);
				set_task(21.5, "blades",ent);
				set_task(22.5, "blades",ent);
				set_task(23.0, "blades",ent);
				set_task(23.5, "blades",ent);
				set_task(24.0, "blades",ent);
				set_task(24.5, "blades",ent);
				set_task(25.0, "blades",ent);
			}
			case 2:
			{
				strikelightning(ent);
			
			}
			case 3:
			{
				strikelightning(ent);
				fizzle(ent);
				
			}
			case 4:
			{
				strikelightning(ent);
			
			}
			case 5:
			{
				strikelightning(ent);
			
			}
			case 6:
			{
				strikelightning(ent);
				strikelightning(ent);
			}
			case 7:
			{
				strikelightning(ent);
			
			}
			case 8:
			{
				fizzle(ent);
				
			}
			case 9:
			{
				fizzle(ent);
				set_task(0.5, "blades",ent);
				set_task(1.0, "blades",ent);
				set_task(1.5, "blades",ent);
			
			}
			case 10:
			{
				fizzle(ent);
				
			}
			case 11:
			{
				fizzle(ent);
			
			}
			case 12:
			{
				fizzle(ent);		
			}
			case 13:
			{
				strikelightning(ent);
			
			}
			case 14:
			{
				strikelightning(ent);
			
			}
			case 15:
			{
				strikelightning(ent);
			
			}
			case 16:
			{
				strikelightning(ent);
				set_task(0.5, "blades",ent);
				set_task(1.0, "blades",ent);
				set_task(1.5, "blades",ent);
				fizzle(ent);
				fizzle(ent);
			}
			case 17:
			{
				fizzle(ent);
				
			}
			case 18:
			{
				fizzle(ent);
			
			}
			case 19:
			{
				fizzle(ent);	
			}
			case 20:
			{
				strikelightning(ent);
				fizzle(ent);
				set_task(0.5, "blades",ent);
				set_task(1.0, "blades",ent);
				set_task(1.5, "blades",ent);
				set_task(2.0, "blades",ent);
				set_task(2.5, "blades",ent);
				set_task(3.0, "blades",ent);
				set_task(3.5, "blades",ent);
				set_task(4.0, "blades",ent);
				set_task(4.5, "blades",ent);
				set_task(5.0, "blades",ent);
				set_task(5.5, "blades",ent);
				set_task(6.0, "blades",ent);
				set_task(6.5, "blades",ent);
				set_task(7.0, "blades",ent);
				set_task(7.5, "blades",ent);
				set_task(8.0, "blades",ent);
				
			}
		}
	}
}

public WorldDestructioneffectsrow(ent)
{
	new szLights[2] 

	if(is_valid_ent(ent))
	{
		//client_print(0, print_chat, "Light");
		szLights = "g" 
		set_lights(szLights) 
		set_task(random_float(1.0, 10.0), "WorldDestructioneffectsrow2", ent);
		test1(ent)
		
		//fizzle(ent);
	}
}





public WorldDestructioneffectsrow2(ent)
{
	new szLights[2] 

	if(is_valid_ent(ent))
	{
		//client_print(0, print_chat, "Light2");
		szLights = "f" 
		set_lights(szLights) 
		set_task(random_float(1.0, 10.0), "WorldDestructioneffectsrow3", ent);
		
		//fizzle(ent);
	}
}

public WorldDestructioneffectsrow3(ent)
{
	new szLights[2] 

	if(is_valid_ent(ent))
	{
		//client_print(0, print_chat, "Light3");
		szLights = "e" 
		set_lights(szLights) 
		set_task(random_float(1.0, 10.0), "WorldDestructioneffectsrow4", ent);
		
		//fizzle(ent);
		
		
	}
}

public WorldDestructioneffectsrow4(ent)
{
	new szLights[2] 

	if(is_valid_ent(ent))
	{
		//client_print(0, print_chat, "Light4");
		szLights = "d" 
		set_lights(szLights) 
		set_task(random_float(1.0, 10.0), "WorldDestructioneffectsrow5", ent);
		
		//fizzle(ent);
	}
}

public WorldDestructioneffectsrow5(ent)
{
	new szLights[2] 

	if(is_valid_ent(ent))
	{
		//client_print(0, print_chat, "Light5");
		szLights = "c" 
		set_lights(szLights) 
		
		//set_task(random_float(1.0, 10.0), "WorldDestructioneffectsrow6", ent);
		
		//fizzle(ent);

		
		go(ent)
	}
}

public WorldDestructioneffectsrow6(ent)
{
	new szLights[2] 

	if(is_valid_ent(ent))
	{
		//client_print(0, print_chat, "Light5");
		szLights = "b" 
		set_lights(szLights) 
	}
}


public question(id)
{
	client_print(id, print_chat, "Planet Health: %f", __float_PlanetHealth);
}


public damager(__int_Entities)
{
	//client_print(0, print_chat, "damage");

	for(new __int_Entities = (get_maxplayers() + 1); __int_Entities < entity_count(); __int_Entities++)
	{
	if(is_valid_ent(__int_Entities))
		{
			ExecuteHam(Ham_TakeDamage, __int_Entities, 0, 0, Float:11280000792064, 1);
		}
	}
}

public lighter(id)
{
	
	new vec1[3]
	get_user_origin(id, vec1, 0)
	new vec2[3]
	get_user_origin(id, vec2)
	
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
	write_byte( 0 );
	write_coord(vec1[0]);
	write_coord(vec1[1]);
	write_coord(vec1[2]);
	write_coord(vec2[0]);
	write_coord(vec2[1]);
	write_coord(vec2[2]);
	write_short( light );
	write_byte( 1 ); // framestart 
	write_byte( 5 ); // framerate 
	write_byte( 5 ); // life 
	write_byte( 20000 ); // width 
	write_byte( 30000 ); // noise 
	write_byte(30);
	write_byte( 200 ); // r, g, b 
	write_byte( 200 ); // r, g, b 
	write_byte( 200 ); // r, g, b 
	write_byte( 200 ); // brightness 
	write_byte( 20 ); // speed 
	message_end();
	
	message_begin( MSG_PVS, SVC_TEMPENTITY,vec2) 
	write_byte( 9 ) 
	write_coord( vec2[0] ) 
	write_coord( vec2[1] ) 
	write_coord( vec2[2] ) 
	message_end() 
}


public strikelightning(id)
{
	emit_sound(id,CHAN_WEAPON, "ambience/port_suckin1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);

	new Float:playerlocation[3];
	//pev(id,pev_origin,playerlocation);
	entity_get_vector(id, EV_VEC_origin, playerlocation);  
		
		for (new i = 0; i<20; i++) // goes through lightning spawn 7 times
		{
				new randomlocation[3] // random location for lightning placement
				new higherlocation[3] // location higher up in the sky
				randomlocation[2] = playerlocation[2]+(random_num(-100,300)) 
				randomlocation[0] = playerlocation[0]+(random_num(-5000,5000)) // sets random location for lightning spawn
				randomlocation[1] = playerlocation[1]+(random_num(-5000,5000)) // similiar
						
				higherlocation[0] = randomlocation[0]+(random_num(-200,200))
				higherlocation[1] = randomlocation[1]+(random_num(-200,200))
				higherlocation[2] = randomlocation[2]+(random_num(4000,6000))
								
				beampoints1(randomlocation, higherlocation, SpriteLightning, 1, 6, 20, 120, 60, 0, 0, 255, 200, 100) // creates lightning bolt
				
				beampoints(randomlocation, higherlocation, SpriteLightning, 1, 6, 20, 110, 50, 0, 0, 255, 200, 100) // creates lightning bolt
				
				emit_sound(0,CHAN_WEAPON, "ambience/thunderclap.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
							
				
		}	
		
	
}


public fizzle(id)
{
	new Float:playerlocation[3];
	//pev(id,pev_origin,playerlocation);
	entity_get_vector(id, EV_VEC_origin, playerlocation);  
		
		for (new i = 0; i<15; i++) // goes through lightning spawn 7 times
		{
				new randomlocation[3] // random location for lightning placement
				new higherlocation[3] // location higher up in the sky
				randomlocation[2] = playerlocation[2]+(random_num(-100,300)) 
				randomlocation[0] = playerlocation[0]+(random_num(-6000,6000)) // sets random location for lightning spawn
				randomlocation[1] = playerlocation[1]+(random_num(-6000,6000)) // similiar
						
				higherlocation[0] = randomlocation[0]+(random_num(-3000,3000))
				higherlocation[1] = randomlocation[1]+(random_num(-3000,3000))
				higherlocation[2] = randomlocation[2]+(random_num(100,5800)) // sets height
								
				
				beampoints1(randomlocation, higherlocation, SpriteLightning, 1, 6, 20, 100, 60, 0, 0, 255, 200, 100) // creates lightning bolt
				
				
				beampoints(randomlocation, higherlocation, SpriteLightningred, 1, 6, 20, 130, 50, 255, 0, 0, 200, 100) // creates lightning bolt
							
				//emit_sound(0,CHAN_WEAPON, "ambience/thunderclap.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				
				emit_sound(0,CHAN_WEAPON, "ambience/thunder.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
		}	
		
	
}


/* SVC_TEMPENTITY Effect using TE_BEAMPOINTS
   INPUT: below for description
   OUTPUT: Beam between two points
*/
public beampoints(startloc[3], endloc[3], spritename, startframe, framerate, life, width, amplitude, r, g, b, brightness, speed)
{
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY)
	write_byte(0) // TE_BEAMPOINTS
	write_coord(startloc[0])
	write_coord(startloc[1])
	write_coord(startloc[2]+4000) // start location
	write_coord(endloc[0])
	write_coord(endloc[1])
	write_coord(endloc[2]) // end location
	write_short(spritename) // spritename
	write_byte(startframe) // start frame
	write_byte(framerate) // framerate
	write_byte(life) // life
	write_byte(width) // line width
	write_byte(amplitude) // amplitude
	write_byte(r)
	write_byte(g)
	write_byte(b) // color
	write_byte(brightness) // brightness
	write_byte(speed) // speed
	message_end()
}

public beampoints1(startloc[3], endloc[3], spritename, startframe, framerate, life, width, amplitude, r, g, b, brightness, speed)
{
	message_begin( MSG_BROADCAST, SVC_TEMPENTITY)
	write_byte(0) // TE_BEAMPOINTS
	write_coord(startloc[0])
	write_coord(startloc[1])
	write_coord(startloc[2]+8000) // start location
	write_coord(endloc[0])
	write_coord(endloc[1])
	write_coord(endloc[2]) // end location
	write_short(spritename) // spritename
	write_byte(startframe) // start frame
	write_byte(framerate) // framerate
	write_byte(life) // life
	write_byte(width) // line width
	write_byte(amplitude) // amplitude
	write_byte(r)
	write_byte(g)
	write_byte(b) // color
	write_byte(brightness) // brightness
	write_byte(speed) // speed
	message_end()
}

public lighter2(id)
{
	if(is_valid_ent(id))
	{

// new variable for origin and get origin of entity
		static Float:origin[3];
		pev(id,pev_origin,origin);


		// send the light flash
		message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
		write_byte(27); // TE_DLIGHT
		write_coord(floatround(origin[0])); // x
		write_coord(floatround(origin[1])); // y
		write_coord(floatround(origin[2])); // z	
		write_byte(20); // radius
		write_byte(255);	// r
		write_byte(255); // g
		write_byte(255); // b
		write_byte(160); // life <<<<<<<<
		write_byte(1); // decay rate
		message_end();
		
		//set_task(1.0, "lighter2",id);
	}
}

public lighter200(id)
{
	if(is_valid_ent(id))
	{

// new variable for origin and get origin of entity
		static Float:origin[3];
		pev(id,pev_origin,origin);


		// send the light flash
		message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
		write_byte(27); // TE_DLIGHT
		write_coord(floatround(origin[0])); // x
		write_coord(floatround(origin[1])); // y
		write_coord(floatround(origin[2])); // z	
		write_byte(350); // radius
		write_byte(255);	// r
		write_byte(255); // g
		write_byte(255); // b
		write_byte(220); // life <<<<<<<<
		write_byte(10); // decay rate
		message_end();
		
		
	}
}



public Umgebungsbaumwegmacher(Client)
{
	if(!is_user_alive(Client))
	{
		new Float:origin[3];
		pev(Client,pev_origin,origin);
		new ent = -1;
	
		while((ent = find_ent_in_sphere(ent,origin,500.0)) != 0) 
		{
			ExecuteHam(Ham_TakeDamage, ent, 0, 0, Float:112800007920, 1);
		}
	}
}


public Cratermaking(id)
{
	//client_print(id, print_chat, "3");
		
	new Float: org[3]
	pev( id, pev_origin, org ) // 获取烟花起始位置[] Get the Start Origin
	new ent = engfunc( EngFunc_CreateNamedEntity,engfunc( EngFunc_AllocString,"info_target" ) )
	engfunc( EngFunc_SetModel, ent, "models/evolution/black.mdl" )// 设置SPR文件[] Set Sprite file
	
	
	//set_pev( ent, pev_solid, SOLID_TRIGGER )// 设置固体类型[] Set solid type
	//set_pev( ent, pev_solid, SOLID_SLIDEBOX )// 设置固体类型[] Set solid type
	set_pev( ent, pev_movetype, MOVETYPE_TOSS )// 设置移动方式[] Set move type
	//set_pev( ent, pev_rendermode, 5 )// 设置渲染方案[] Set render mode
	//set_pev( ent, pev_renderamt, 200.0 )// 设置透明度[] Alpha
	set_pev( ent, pev_scale, 2.0 )// 缩放大小[] Scale value
	set_pev( ent, pev_owner, id )// 设置实体的拥有者[] Set owner for the entity
	set_pev( ent, pev_classname, "Crater" )// 设置实体类名[] Set classname
	set_pev( ent, pev_origin, org )// 设置实体位置[] Set entity origin
	
	org[2] += 600.0;
	
	set_pev( ent, pev_animtime, 1.0);
	set_pev( ent, pev_framerate, 1.0);
	
	new Float: ang[3], Float:vec[3]
	/* 烟花向上的角度偏移量[] The offset of upward fireworks */
	ang[0] = random_float( -90.0, -89.0 )
	ang[1] = random_float( -180.0, 180.0 )
	
	/* 设置烟花速率[] Set Velocity */
	angle_vector( ang, 1, vec )
	xs_vec_mul_scalar(vec, random_float( 1600.0, 1700.0), vec )
	set_pev( ent, pev_velocity, vec )
	
	set_task(5.0, "hartmacher",ent);
	//set_task(2.0, "hartmacherpre",ent);
   
	//set_task( random_float( 30.0, 40.0 ), "boomboompre",ent);
	
	set_task(30.0, "WorldDestructioneffectsrandom",ent);
	//set_task(30.0, "WorldDlightning",ent);
	set_task(2.0, "WorldDestructioneffectsrow",ent);
	
	
	
	set_task(4.0, "smoke",ent);
	
	//Umgebungsbaumwegmacher(ent);
	
	lighter200(ent);
	
	//set_task(4.0, "Umgebungsbaumwegmacher",ent);
	
	//set_task(5.0, "Umgebungsbaumwegmacher",ent);
	
	//set_task(20.0, "teleport2",ent);
	
	
}
 
public boomboom(ent)
{
	boomboom2(ent);
	@ExplodeEntity(ent);
	remove_entity(ent); //Shorten           
}

public boomboompre(ent)
{
	//CrackTheGround(ent);
	set_task(0.5, "boomboom",ent);      
}
 
 
public hartmacher(ent)
{
	set_pev( ent, pev_solid, SOLID_BBOX )// 设置固体类型[] Set solid type
	engfunc( EngFunc_SetModel, ent, "models/rockcrater.mdl" )// 设置SPR文件[] Set Sprite file
	engfunc( EngFunc_SetSize, ent, {-320.0,-320.0,-110.0}, {320.0,320.0,30.0} )// 设置实体大小[] Set entity size
}

 
public hartmacherpre(ent)
{
	set_pev( ent, pev_solid, SOLID_TRIGGER )// 设置固体类型[] Set solid type
	set_pev( ent, pev_solid, SOLID_SLIDEBOX )// 设置固体类型[] Set solid type
}
 
public boomboom2(ent)
{
	static Float:varOrigin[3];
	entity_get_vector(ent, EV_VEC_origin, varOrigin);  
	
	engfunc(EngFunc_MessageBegin, MSG_ALL, get_user_msgid("Explosion") , varOrigin, 0)
	{
		engfunc(EngFunc_WriteCoord, varOrigin[0]);
		engfunc(EngFunc_WriteCoord, varOrigin[1]);
		engfunc(EngFunc_WriteCoord, varOrigin[2]);
			
		write_long(36200);
			
		write_byte(2);  //Color
	}
	message_end();
	
	
	new Float:a[3], Float:b[3];
	entity_get_vector(ent, EV_VEC_origin, a);

	b[0] = a[0];
	b[1] = a[1];
	b[2] = -9999.0;
	
	trace_line(0, a, b, b);
	
	message_begin(MSG_BROADCAST, 23);
	{
		write_byte(116);
		
		write_coord(floatround(b[0]));
		write_coord(floatround(b[1]));
		write_coord(floatround(b[2]));
		
		write_byte(engfunc(EngFunc_DecalIndex, "{scorch3"));
	}
	message_end();
}

public boomboom22(ent)
{
	static Float:varOrigin[3];
	entity_get_vector(ent, EV_VEC_origin, varOrigin);  
	
	engfunc(EngFunc_MessageBegin, MSG_ALL, get_user_msgid("Explosion") , varOrigin, 0)
	{
		engfunc(EngFunc_WriteCoord, varOrigin[0]);
		engfunc(EngFunc_WriteCoord, varOrigin[1]);
		engfunc(EngFunc_WriteCoord, varOrigin[2]);
			
		write_long(6200);
			
		write_byte(2);  //Color
	}
	message_end();
	
	new Float:a[3], Float:b[3];
	entity_get_vector(ent, EV_VEC_origin, a);

	b[0] = a[0];
	b[1] = a[1];
	b[2] = -9999.0;
	
	trace_line(0, a, b, b);
	
	message_begin(MSG_BROADCAST, 23);
	{
		write_byte(116);
		
		write_coord(floatround(b[0]));
		write_coord(floatround(b[1]));
		write_coord(floatround(b[2]));
		
		write_byte(engfunc(EngFunc_DecalIndex, "{scorch3"));
	}
	message_end();
}

public Decaler(ent)
{
	
	for(new i = 0; i < 64; i++)
    {
        new Float:a[3], Float:b[3];
        
        a[0] = random_float(-3000.0, 3000.0);
        a[1] = random_float(-3000.0, 3000.0);
        a[2] = random_float(0.0, 2000.0);
        
        b[0] = a[0];
        b[1] = a[1];
        b[2] = -9999.0;
        
        trace_line(0, a, b, b);
        
        message_begin(MSG_BROADCAST, 23);
        {
            write_byte(116);
            
            write_coord(floatround(b[0]));
            write_coord(floatround(b[1]));
            write_coord(floatround(b[2]));
            
            write_byte(engfunc(EngFunc_DecalIndex, "{bigshot3"));
        }
        message_end();
    }
}

public blades(id)
{
	//client_print(id, print_chat, "3");
		
	//client_print(id, print_chat, "3");
		
	new Float: org[3]
	pev( id, pev_origin, org ) // 获取烟花起始位置[] Get the Start Origin
	new ent = engfunc( EngFunc_CreateNamedEntity,engfunc( EngFunc_AllocString,"env_sprite" ) )
	engfunc( EngFunc_SetModel, ent, "sprites/w_karmaball.spr" )// 设置SPR文件[] Set Sprite file
	engfunc( EngFunc_SetSize, ent, {-0.1,-0.1,-0.1}, {0.1,0.1,0.1} )// 设置实体大小[] Set entity size
	
	set_pev( ent, pev_solid, SOLID_TRIGGER )// 设置固体类型[] Set solid type
	set_pev( ent, pev_solid, SOLID_BBOX )// 设置固体类型[] Set solid type
	set_pev( ent, pev_movetype, MOVETYPE_TOSS )// 设置移动方式[] Set move type
	set_pev( ent, pev_rendermode, 5 )// 设置渲染方案[] Set render mode
	set_pev( ent, pev_renderamt, 200.0 )// 设置透明度[] Alpha
	set_pev( ent, pev_scale, 0.1 )// 缩放大小[] Scale value
	set_pev( ent, pev_owner, id )// 设置实体的拥有者[] Set owner for the entity
	set_pev( ent, pev_classname, "Fireworks" )// 设置实体类名[] Set classname
	set_pev( ent, pev_origin, org )// 设置实体位置[] Set entity origin
	
	set_pev( ent, pev_animtime, 1.0);
	set_pev( ent, pev_framerate, 1.0);
	
	new Float: ang[3], Float:vec[3]
	/* 烟花向上的角度偏移量[] The offset of upward fireworks */
	ang[0] = random_float( -90.0, -60.0 )
	ang[1] = random_float( -180.0, 180.0 )
	
	/* 设置烟花速率[] Set Velocity */
	angle_vector( ang, 1, vec )
	xs_vec_mul_scalar(vec, random_float( 1000.0, 3000.0), vec )
	set_pev( ent, pev_velocity, vec )
	
	/* 托尾特效[] Trail FX */
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY )
	write_byte( TE_BEAMFOLLOW )
	write_short( ent )
	write_short( engfunc( EngFunc_ModelIndex,"sprites/jubeikametrail.spr" ) )
	write_byte( 30 )// 持续时间[] life in 0.1's
	write_byte( 20 )// 宽度[] line width in 0.1's
	write_byte( 255 )// Red
	write_byte( 255 )// Green
	write_byte( 255 )// Blue
	write_byte( 255 )// Brightness
	message_end( )
	

	//set_task(2.0, "retrail",ent);
	
	set_task(2.0, "lighter2",ent);
	//set_task(2.0, "lighter3",ent);
   
	set_task( random_float( 30.0, 40.0 ), "boomboomX",ent);
}
 
public retrail(ent)
{
	/* 托尾特效[] Trail FX */
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY )
	write_byte( TE_BEAMFOLLOW )
	write_short( ent )
	write_short( engfunc( EngFunc_ModelIndex,"sprites/jubeikametrail.spr" ) )
	write_byte( 30 )// 持续时间[] life in 0.1's
	write_byte( 20 )// 宽度[] line width in 0.1's
	write_byte( 255 )// Red
	write_byte( 255 )// Green
	write_byte( 255 )// Blue
	write_byte( 255 )// Brightness
	message_end( )
}
 
public boomboomX(ent)
{
	boomboom2X(ent);
	@ExplodeEntity(ent);
	remove_entity(ent); //Shorten           
}
 
public boomboom2X(ent)
{
	static Float:varOrigin[3];
	entity_get_vector(ent, EV_VEC_origin, varOrigin);  
	
	

    // debug output
    //console_print(0, "boom");
   
	engfunc(EngFunc_MessageBegin, MSG_ALL, get_user_msgid("Explosion") , varOrigin, 0)
	{
		engfunc(EngFunc_WriteCoord, varOrigin[0]);
		engfunc(EngFunc_WriteCoord, varOrigin[1]);
		engfunc(EngFunc_WriteCoord, varOrigin[2]);
           
		write_long(1600);
           
		write_byte(2);  //Color
	}
	message_end();
	
	
	new Float:a[3], Float:b[3];
	entity_get_vector(ent, EV_VEC_origin, a);

	b[0] = a[0];
	b[1] = a[1];
	b[2] = -9999.0;
	
	trace_line(0, a, b, b);
	
	message_begin(MSG_BROADCAST, 23);
	{
		write_byte(116);
		
		write_coord(floatround(b[0]));
		write_coord(floatround(b[1]));
		write_coord(floatround(b[2]));
		
		write_byte(engfunc(EngFunc_DecalIndex, "{scorch3"));
	}
	message_end();
}

public @ExplodeEntity( buudeathball )
{
	static Float:origin[3],Origin[3];
	pev(buudeathball, pev_origin, origin );
	FVecIVec(origin, Origin );
	new dist = floatround(BladesMaxRadius);

	new Client;
	Client = pev(buudeathball, pev_owner);
	//client_print(Client,print_chat,"Touch2 %d",Client);
	
	//setClientSPECIALSTATE( Client, sxBlades, false );
	//setClientXFROZEN( Client, false );
	//remBeamStart( Client );
	//emit_sound(buudeathball, CHAN_WEAPON, "evolution/null.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );
	
	new CORE[ 1 ];
	CORE[ 0 ] = Client;
	//set_task( 0.0, "AnimationCancel", uniqueTaskID( Client,100 ), CORE, 1, "a",1 );
	//set_task( 0.0, "fxCamFix", uniqueTaskID( Client,100 ), CORE, 1, "a",1 );

	radiusDamage ( buudeathball, "World Destruction", BladesMaxDmg
								  , BladesMaxRadius
								  , BladesMaxDmgRadius
				 );
				 
	
	fm_remove_entity( buudeathball );
	

	//remfxBlades( buudeathball );
	
	
	message_begin   ( MSG_ALL, get_user_msgid("Explosion") );
	write_coord		( Origin[0] );
	write_coord		( Origin[1] );
	write_coord		( Origin[2]  );
	write_long		( 200 );
	write_byte		( 0 );
	message_end		();
	
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
	write_byte( TE_EXPLOSION );
	write_coord(Origin[0]);
	write_coord(Origin[1]);
	write_coord(Origin[2] +100);
	write_short( FxExplosionBlue );
	write_byte( 80 ); // scale
	write_byte( 0 ); // framerate
	write_byte( 4 ); // flags
	message_end();
	
	
	for (new i=0; i<=dist ; i+=500 )
	{

		message_begin (MSG_BROADCAST,SVC_TEMPENTITY); 
		write_byte( TE_SPRITETRAIL ); 
		write_coord(Origin[0]+random_num(0, dist /10)); 
		write_coord(Origin[1]+random_num(0, dist /10)); 
		write_coord(Origin[2]+random_num(0, dist /10)); 
		write_coord(Origin[0] + i /10); 
		write_coord(Origin[1] + i /10); 
		write_coord(Origin[2] + i /10); 
		write_short( SPR_Rocks );
		write_byte( 5 ); 				//count
		write_byte( 8 ); 				//life
		write_byte( 1 ); 				//scale
		write_byte( 50 ); 				//velocity
		write_byte( 0 ); 				//randomness
		message_end();
	}
	
	for (new i=0; i<=dist ; i+=500 )
	{
		message_begin (MSG_BROADCAST,SVC_TEMPENTITY); 
		write_byte( TE_SPRITETRAIL ); 
		write_coord(Origin[0]+random_num(0, dist /10)); 
		write_coord(Origin[1]+random_num(0, dist /10)); 
		write_coord(Origin[2]+random_num(0, dist /10)); 
		write_coord(Origin[0] + i /10); 
		write_coord(Origin[1] + i /10); 
		write_coord(Origin[2] + i /10); 
		write_short( SPR_Rocks2 );
		write_byte( 10 ); 				//count
		write_byte( 10 ); 				//life
		write_byte( 1 ); 				//scale
		write_byte( 80 ); 				//velocity
		write_byte( 0 ); 				//randomness
		message_end();
	}
	
	for (new i=0; i<=dist ; i+=500 )
	{

		message_begin (MSG_BROADCAST,SVC_TEMPENTITY); 
		write_byte( TE_SPRITETRAIL ); 
		write_coord(Origin[0]+random_num(0, dist /10)); 
		write_coord(Origin[1]+random_num(0, dist /10)); 
		write_coord(Origin[2]+random_num(0, dist /10)); 
		write_coord(Origin[0] + i /10); 
		write_coord(Origin[1] + i /10); 
		write_coord(Origin[2] + i /10); 
		write_short( SPR_Rocks3 );
		write_byte( 5 ); 				//count
		write_byte( 8 ); 				//life
		write_byte( 1 ); 				//scale
		write_byte( 40 ); 				//velocity
		write_byte( 0 ); 				//randomness
		message_end();
	}
	
}

public BallFX()
{
	new origin[3]
	get_user_origin(id, origin)
	
	message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
	write_byte( 14 )
	write_coord( origin[0] )
	write_coord( origin[1] )
	write_coord( origin[2] )
	write_byte( 100 )
	write_byte( 255 )
	write_byte( 1 )
	message_end()

}

public plugin_precache()
{
	spr_blood_drop = precache_model("sprites/blood.spr") 
	g_lightning_sprite = precache_model("sprites/lightning.spr") 
	

	precache_model("models/evolution/black.mdl");
	precache_model("models/rockcrater.mdl");
	
	precache_model("sprites/lgtning.spr");
	precache_model("sprites/ecx.wave.1.spr");
	precache_model("sprites/w_jubeikame_c.spr");
	SpriteSmoke = precache_model("sprites/steam1.spr") // Smoke sprite
	precache_model("sprites/xsmoke1.spr");
	
	precache_sound("ambience/port_suckin1.wav") // Thunder
	
	precache_sound("ambience/thunderclap.wav") // Thunder
	precache_sound("ambience/thunder.wav") // Thunder
	
	SpriteLightning = precache_model("sprites/lgtning.spr") // Lightning sprite
	
	SpriteLightningred = precache_model("sprites/evossj4/redstrike.spr") // Lightning sprite
	
	lightning = precache_model("sprites/lgtning.spr")
	
	spr_Lightning = precache_model( "sprites/lgtning.spr" )
	
	precache_model("sprites/jubeikametrail.spr");
	light = precache_model("sprites/lgtning.spr")
	precache_model("sprites/w_karmaball.spr");
	
	precache_model(szWBskyModel);
	precache_model(szWMCloudsModel);
	
}