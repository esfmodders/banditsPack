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
 

 
#include <amxmisc>
#include <fun>
#include <fakemeta>
 
#include <ipci/ascend>
#include <ipci/dragonball>
#include <xs>

#include <esf_util>
#include <fun>
 
//stock MSG_Explosion;


new bool:BDRAGON

new greenfire

new ballsmoke

new pusprite

new bool:gurualive

new bool:DTHERE
new bool:PORUNGA

new float:wc

new bool: OB[32]

new bool: BIG[32]






new const CLASSNAME [] = "ECX_Dragon"
 
public plugin_init()
{
	register_plugin("Dragonballfix", "1337", "BANDIT and friends");
	
	//register_clcmd("say x", "test");
	//register_clcmd("say y", "playerfinder");
	
	register_event("DeathMsg", "Event_DeathMsg", "a" );
	
	//register_clcmd("say x2", "bounce");
	
	//register_clcmd("say fx2", "BallFX");
	
	//register_clcmd("say fx3", "dragonappear");
	
	//register_clcmd("say y", "bounce");
	
	//register_clcmd("say x1", "BallFX");
	
	//register_clcmd("say xx", "Dragondreh");
	
	//register_clcmd("say xxx", "Dragondreh2");
	
	register_think(CLASSNAME, "ThinkDragon");

	
	wc=0;
	
	new mapname[50];

    get_mapname(mapname,49)
	if(equal(mapname, "esf_namek_revival"))
    {
		PORUNGA = true
		//console_print(0, "namek");
	}
	if(equal(mapname, "esf_namek"))
    {
		PORUNGA = true
		//console_print(0, "namek");
	}
	if(equal(mapname, "esf_namek_isles"))
    {
		PORUNGA = true
		//console_print(0, "namek");
	}
	if(equal(mapname, "evo2_Gurufixed"))
    {
		PORUNGA = true
		//console_print(0, "namek");
	}
	if(equal(mapname, "esf_newguru"))
    {
		PORUNGA = true
		//console_print(0, "namek");
	}
	if(equal(mapname, "esf_guru"))
    {
		PORUNGA = true
		//console_print(0, "namek");
	}

}

#define esf_get_ki(%1)		entity_get_float( %1, EV_FL_fuser4 )
#define esf_set_ki(%1,%2)	entity_set_float( %1, EV_FL_fuser4, %2 )  


public FX11(id)	
{
	
	message_begin(MSG_ALL,get_user_msgid("TransformFX"));
	write_byte(id);
	write_byte(100);
	write_byte(1)
	message_end();
	
}

public test(id)
{
	server_cmd("destruction")
}

public @InitWishList( Client, Wishlevel )
{
        addWish( "Give me Sensu-Beans pls", "@Sensu" )
		addWish( "I want another dragon", "@Porungawish" )
		
		addWish( "Make me 5inches taller", "@BIGwish" )
		
		addWish( "FUCK YOU DRAGON", "@FUwish" )
		

		//console_print(0, "init");
}


public @BIGwish( Client )
{
	if(!BIG[Client])
	{
		client_print( Client, print_chat, "you are bigger now" )
		//set_pev(Client, pev_scale, 1.2)
		
		set_task(1.0, "BIGwish2", Client);
		
		BIG[Client] = true
		
		set_rendering(Client, kRenderFxGlowShell, 255, 0, 0, kRenderTransColor, 15)
		emit_sound(Client, CHAN_WEAPON, "weapons/swoop4.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	}
	else
	{
		client_print( Client, print_chat, "i cant stack shit that high" )
	}
}

public BIGwish2( Client )
{
	set_pev(Client, pev_scale, 1.2)
	
	set_rendering(Client,kRenderFxGlowShell,0,0,0,kRenderNormal,45)
	
}

public @FUwish( Client )
{
	wc=wc+2
	
	set_task(400.0, "Counterdown", Client);
	set_task(420.0, "Counterdown", Client);
	
	
	client_print( Client, print_chat, "asshole....." )
}

public @Sensu( Client )
{
	if(BDRAGON)
	{
		//Add your code here...
        
		client_print( Client, print_chat, "HAHAHA" )
	}
	else
	{
		//Add your code here...
        
		client_print( Client, print_chat, "you received sensu beans" )
		
		give_item(Client, "item_sensubeanbag" );
	}
}

public @Porungawish( Client )
{
	if(!PORUNGA)
	{
        //Add your code here...
        client_print( Client, print_chat, "Next time Porunga" )
		set_task(5.0, "PA",Client);
		
	}
	else
	{
		client_print( Client, print_chat, "No more Porunga" )
		set_task(5.0, "PA",Client);
	}
}

public PA( Client )
{
	if(!PORUNGA)
	{
		PORUNGA = true
	}
	else
	{
		PORUNGA = false
	}
}


public CORRUPT()
{
	BDRAGON = true
	
	//client_print(0, print_chat, "NEGGA ENERGY TO MUCH");
}



public playerfinder(Client)
{
	//alterballsrow(Client)

	//client_print(0, print_chat, "Balls");
	
	
	static Float:origin[3];
	pev(Client,pev_origin,origin);
	new ent = -1;
		
	static Float:__float_clientOrigin[3], Float:__float_targetOrigin[3];
	entity_get_vector(Client, EV_VEC_origin, __float_clientOrigin);
	entity_get_vector(Client, EV_VEC_origin, __float_targetOrigin);
						
	static __int_ValidPoint;
			
	while((ent = find_ent_in_sphere(ent,origin,25800.0)) != 0) 
	{
		static className[250];
		entity_get_string(ent, EV_SZ_classname, className,250);
		new owner = entity_get_edict(ent, EV_ENT_owner);
					
		//"SwoopShineFx"
		//bodyque

		if(is_user_alive(ent))
		{
			teleportdb(ent);
			
			set_rendering(ent, kRenderFxGlowShell, 10, 0, 255, kRenderTransColor, 15)
			
			freezePlayer(ent);
			
			
			client_cmd( ent, "slot5" );
			
			set_task(5.5, "actionthing",ent);
			
			@CreateKILLBALL(100, ent, ent, 1.0, 0);
			
			@Createballs(100, ent, ent, 1.0, 0);
			
			
			
			AddFx( ent, "fxPowerup", 0, 0, 0 );
			AddFx( ent, "fxBlow" );
		}
	}
}

public @CreateKILLBALL (__int_Entity, const __int_Owner, const __int_Victim, const Float:__float_Scale, const __int_Velocity)
{
	__int_Entity = create_entity("info_target");
	
	entity_set_model(__int_Entity, "models/effects/DW.mdl");
	
	entity_set_int(__int_Entity, EV_INT_spawnflags, SF_SPRITE_STARTON);
	
	DispatchSpawn(__int_Entity);
	
	entity_set_int(__int_Entity, EV_INT_renderfx, kRenderFxGlowShell);
	entity_set_int(__int_Entity, EV_INT_rendermode, kRenderTransAdd);
	
	entity_set_float(__int_Entity, EV_FL_animtime, get_gametime());
	entity_set_float(__int_Entity, EV_FL_framerate, float(10));
	
	entity_set_string(__int_Entity, EV_SZ_classname, "killball");
	
	entity_set_float(__int_Entity, EV_FL_renderamt, float(254));
	
	entity_set_float(__int_Entity, EV_FL_scale, __float_Scale);
	
	entity_set_int(__int_Entity, EV_INT_movetype, MOVETYPE_FLY);
	
	entity_set_size(__int_Entity, Float:{-7.000_000, -7.000_000, -7.000_000}, Float:{7.000_000, 7.000_000, 7.000_000});
	
	//entity_set_int(__int_Entity, EV_INT_solid, SOLID_TRIGGER);
	
	//entity_set_edict(__int_Entity, EV_ENT_owner, __int_Owner);
	
	set_pev(__int_Entity,pev_owner, __int_Owner);
	entity_set_int(__int_Entity, EV_INT_iuser4, __int_Victim);
	
	entity_set_edict(__int_Entity, EV_ENT_pContainingEntity, __int_Entity);
	
	static Float:__float_Origin[3];
	entity_get_vector(__int_Victim, EV_VEC_origin, __float_Origin);
	
	//__float_Origin[2] += 2.0;
	
	entity_set_origin(__int_Entity, __float_Origin);
	
	set_task(6.0, "removespiral22",__int_Entity);
	
	
	
	emit_sound(__int_Entity, CHAN_WEAPON, "weapons/kamecharge3.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	
}

public @Createballs (__int_Entity, const __int_Owner, const __int_Victim, const Float:__float_Scale, const __int_Velocity)
{
	__int_Entity = create_entity("info_target");
	
	entity_set_model(__int_Entity, "models/effects/DW2.mdl");
	
	entity_set_int(__int_Entity, EV_INT_spawnflags, SF_SPRITE_STARTON);
	
	DispatchSpawn(__int_Entity);
	
	//entity_set_int(__int_Entity, EV_INT_renderfx, kRenderFxGlowShell);
	//entity_set_int(__int_Entity, EV_INT_rendermode, kRenderTransAdd);
	
	entity_set_float(__int_Entity, EV_FL_animtime, get_gametime());
	entity_set_float(__int_Entity, EV_FL_framerate, float(1));
	
	entity_set_string(__int_Entity, EV_SZ_classname, "killball2");
	
	entity_set_float(__int_Entity, EV_FL_renderamt, float(254));
	
	entity_set_float(__int_Entity, EV_FL_scale, __float_Scale);
	
	entity_set_int(__int_Entity, EV_INT_movetype, MOVETYPE_FLY);
	
	entity_set_size(__int_Entity, Float:{-7.000_000, -7.000_000, -7.000_000}, Float:{7.000_000, 7.000_000, 7.000_000});
	
	//entity_set_int(__int_Entity, EV_INT_solid, SOLID_TRIGGER);
	
	//entity_set_edict(__int_Entity, EV_ENT_owner, __int_Owner);
	
	set_pev(__int_Entity,pev_owner, __int_Owner);
	entity_set_int(__int_Entity, EV_INT_iuser4, __int_Victim);
	
	entity_set_edict(__int_Entity, EV_ENT_pContainingEntity, __int_Entity);
	
	static Float:__float_Origin[3];
	entity_get_vector(__int_Victim, EV_VEC_origin, __float_Origin);
	
	__float_Origin[2] -= 30.0;
	
	entity_set_origin(__int_Entity, __float_Origin);
	
	set_task(6.0, "removespiral22",__int_Entity);
	
	
	
	//emit_sound(__int_Entity, CHAN_WEAPON, "weapons/mafuba/mafubafire.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
	
}

public removespiral22(id)
{
	remove_entity(id);
}

public removeEntity(ent) remove_entity(ent-9999); //Shorten  

public bounce(Client)
{
	//alterballsrow(Client)

	//client_print(0, print_chat, "Balls");
	
	
	static Float:origin[3];
	pev(Client,pev_origin,origin);
	new ent = -1;
		
	static Float:__float_clientOrigin[3], Float:__float_targetOrigin[3];
	entity_get_vector(Client, EV_VEC_origin, __float_clientOrigin);
	entity_get_vector(Client, EV_VEC_origin, __float_targetOrigin);
						
	static __int_ValidPoint;
			
	while((ent = find_ent_in_sphere(ent,origin,25800.0)) != 0) 
	{
		static className[250];
		entity_get_string(ent, EV_SZ_classname, className,250);
		new owner = entity_get_edict(ent, EV_ENT_owner);
					
		//"SwoopShineFx"
		//bodyque
		
		static __sz_model[ 640 ]

		entity_get_string(ent, EV_SZ_model, __sz_model, 640)

		
		
		if(equali(className, "ECX_Dragonball"))
		{
			//client_print(0, print_chat, "ecx Ball gefunden");
			

			new Float: ang[3], Float:vec[3]
			/* 烟花向上的角度偏移量[] The offset of upward fireworks */
			ang[0] = random_float( -80.0, -70.0 )
			ang[1] = random_float( -180.0, 180.0 )
	
			/* 设置烟花速率[] Set Velocity */
			angle_vector( ang, 1, vec )
			xs_vec_mul_scalar(vec, random_float( 350.0, 400.0), vec )
			set_pev( ent, pev_velocity, vec )
				
			
				
		}
		
		
		if(equal(__sz_model, "models/gurudude.mdl"))
		{
			set_pev( ent, pev_animtime, 1.0);
			set_pev( ent, pev_framerate, 1.0);
			//client_print(0, print_chat, "guru da");
			
		}
	
	}
}
	
public bounce2(Client)
{
	//alterballsrow(Client)

	//client_print(0, print_chat, "Balls");
	
	
	static Float:origin[3];
	pev(Client,pev_origin,origin);
	new ent = -1;
		
	static Float:__float_clientOrigin[3], Float:__float_targetOrigin[3];
	entity_get_vector(Client, EV_VEC_origin, __float_clientOrigin);
	entity_get_vector(Client, EV_VEC_origin, __float_targetOrigin);
						
	static __int_ValidPoint;
			
	while((ent = find_ent_in_sphere(ent,origin,25800.0)) != 0) 
	{
		static className[250];
		entity_get_string(ent, EV_SZ_classname, className,250);
		new owner = entity_get_edict(ent, EV_ENT_owner);
					
		//"SwoopShineFx"
		//bodyque
		
		static __sz_model[ 640 ]

		entity_get_string(ent, EV_SZ_model, __sz_model, 640)

		
		
		if(equali(className, "ECX_Dragonball"))
		{
			//client_print(0, print_chat, "ecx Ball gefunden");
			
			if(pev(ent, pev_skin) == 1)
			{

				new Float: ang[3], Float:vec[3]
				/* 烟花向上的角度偏移量[] The offset of upward fireworks */
				ang[0] = random_float( -73.0, -70.0 )
				ang[1] = random_float( -180.0, 180.0 )
	
				/* 设置烟花速率[] Set Velocity */
				angle_vector( ang, 1, vec )
				xs_vec_mul_scalar(vec, random_float( 3500.0, 4000.0), vec )
				set_pev( ent, pev_velocity, vec )
			}
			
				
		}
		
		
	}
}



public ThinkDragon(ent)
{
	if(!DTHERE)
	{
		
	
		static id, Float:dist;


		if (!id)
		{
			id = get_closest_player(ent, dist);
		}
	
	
		else
		{
			static Float:originT[3], Float:__fl_position[3];
			entity_get_vector(id, EV_VEC_origin, originT);
			entity_get_vector(ent, EV_VEC_origin, __fl_position);
			
			xs_vec_sub(originT, __fl_position, originT);
			xs_vec_normalize(originT, originT);
			entity_set_vector(ent, EV_VEC_velocity, originT);
			originT[2] = 0.0;
			vector_to_angle(originT, originT);
			entity_set_vector(ent, EV_VEC_angles, originT);
		}
			
		entity_set_float(ent, EV_FL_nextthink, halflife_time()+0.08);
	}
}
stock get_closest_player(ent, &Float:distance)
{
	static players[32], num;
	get_players(players, num, "a");

	new player = 0;
	static id, Float:dist, Float:mindist;
	mindist = 7000.0;

	for (new i = 0; i < num; i++)
	{
		if(~entity_get_int(i, EV_INT_flags) & FL_FROZEN)
		{

			player = players[i];

			dist = entity_range(player, ent);

			if (dist <= mindist)
			{
				id = player;
				mindist = dist;
			}
		}
	}

	distance = mindist;
	return id;
}




public dragonfix(Client)
{
	

	//client_print(0, print_chat, "Dragon");
	
	static Float:origin[3];
	pev(Client,pev_origin,origin);
	new ent = -1;
		
	static Float:__float_clientOrigin[3], Float:__float_targetOrigin[3];
	entity_get_vector(Client, EV_VEC_origin, __float_clientOrigin);
	entity_get_vector(Client, EV_VEC_origin, __float_targetOrigin);
						
	static __int_ValidPoint;
			
	while((ent = find_ent_in_sphere(ent,origin,25800.0)) != 0) 
	{
		static className[250];
		entity_get_string(ent, EV_SZ_classname, className,250);
		new owner = entity_get_edict(ent, EV_ENT_owner);
					
		//"SwoopShineFx"
		//bodyque

		if(equali(className, "ECX_Dragon"))
		{
			//DTHERE = true
			
			//ThinkDragon(ent)
			
			set_task(30.0, "dragonbored",ent);
			
			entity_set_float(ent, EV_FL_nextthink, halflife_time()+0.01);
		
			if(BDRAGON)
			{
				//client_print(0, print_chat, "Drache gefunden3");
				entity_set_model(ent, "models/evo/bshenlong.mdl");
				set_pev( ent, pev_animtime, 0.6);
				set_pev( ent, pev_framerate, 0.6);
				
				set_rendering(ent, kRenderFxGlowShell, 10, 0, 255, kRenderTransColor, 15)
				
				set_task(0.7, "renderdn",ent);
				
				emit_sound(ent, CHAN_VOICE, "evolution/null.wav", 1.00, 0.80, 0, 100);
				set_task(0.15, "talkdragon",ent);
				
				
				
			}
			else
			{
				
				if(PORUNGA)
				{
					entity_set_model(ent, "models/evo/porunga.mdl");
					
					set_pev( ent, pev_animtime, 0.8);
					set_pev( ent, pev_framerate, 0.8);
					
					set_rendering(ent, kRenderFxGlowShell, 255, 155, 0, kRenderTransColor, 15)
					set_task(0.7, "renderdn",ent);
				
					emit_sound(ent, CHAN_VOICE, "evolution/null.wav", 1.00, 0.80, 0, 100);
					set_task(0.15, "talkdragon",ent);
					
				}
				else
				{
			
					set_pev( ent, pev_animtime, 0.6);
					set_pev( ent, pev_framerate, 0.6);
				
					set_rendering(ent, kRenderFxGlowShell, 255, 155, 0, kRenderTransColor, 15)
					set_task(0.7, "renderdn",ent);
				
					emit_sound(ent, CHAN_VOICE, "evolution/null.wav", 1.00, 0.80, 0, 100);
					set_task(0.15, "talkdragon",ent);
					
					//emit_sound(ent, CHAN_VOICE, "dragon/shadow/ohyeah.wav", 1.00, 0.80, 0, 100);
				}
				
			}
		
		} 

	}
}

public talkdragon(ent)
{
	if(BDRAGON)
	{
		emit_sound(ent, CHAN_VOICE, "dragon/shadow/ohyeah.wav", 1.00, 0.30, 0, 100);
		
		DTHERE = true
	}
	else
	{
		DTHERE = true
	
		if(PORUNGA)
		{
			emit_sound(ent, CHAN_VOICE, "dragon/porunga/appear.wav", 1.00, 0.30, 0, 100);
		}
		else
		{
			emit_sound(ent, CHAN_VOICE, "dragon/makewish1.wav", 1.00, 0.30, 0, 100);
		}
	}
}

public renderdn(ent)
{
	set_rendering(ent,kRenderFxGlowShell,0,0,0,kRenderNormal,45)
}



public FX2(id)
{

static Float:origin[3];
pev(id,pev_origin,origin);

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( floatround(origin[0]) )
write_coord( floatround(origin[1]) )
write_coord( floatround(origin[2]) )
write_byte( 300 )
write_byte( 500 )
write_byte( 7 )
message_end()

}
public FX22(id)
{

static Float:origin[3];
pev(id,pev_origin,origin);

message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
write_byte( 14 )
write_coord( floatround(origin[0]) )
write_coord( floatround(origin[1]) )
write_coord( floatround(origin[2]) )
write_byte( 400 )
write_byte( 500 )
write_byte( 3 )
message_end()

}



public FX1(id)
{

static Float:origin[3];
pev(id,pev_origin,origin);

//new origin[3];
//entity_get_vector(id, EV_VEC_origin,origin)


message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(floatround(origin[0]));
case 1: write_coord(floatround(origin[0] -= 25));
case 2: write_coord(floatround(origin[0] += 20));
case 3: write_coord(floatround(origin[0] -= 21));
case 4: write_coord(floatround(origin[0] += 22));
case 5: write_coord(floatround(origin[0] -= 23));

}

switch(random_num(0,5))

{

case 0: write_coord(floatround(origin[1]));
case 1: write_coord(floatround(origin[1] += 10));
case 2: write_coord(floatround(origin[1] -= 12));
case 3: write_coord(floatround(origin[1] += 13));
case 4: write_coord(floatround(origin[1] -= 15));
case 5: write_coord(floatround(origin[1] += 16));

}

write_coord(floatround(origin[2] += 107));

write_short(greenfire); // short (sprite index)
write_byte(75); // byte (scale in 0.1's)  
write_byte(30); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(floatround(origin[0]));
case 1: write_coord(floatround(origin[0] -= 15));
case 2: write_coord(floatround(origin[0] += 11));
case 3: write_coord(floatround(origin[0] -= 10));
case 4: write_coord(floatround(origin[0] += 12));
case 5: write_coord(floatround(origin[0] -= 13));

}

switch(random_num(0,5))

{

case 0: write_coord(floatround(origin[1]));
case 1: write_coord(floatround(origin[1] += 9));
case 2: write_coord(floatround(origin[1] -= 7));
case 3: write_coord(floatround(origin[1] += 8));
case 4: write_coord(floatround(origin[1] -= 10));
case 5: write_coord(floatround(origin[1] += 9));

}

write_coord(floatround(origin[2] += 147));

write_short(greenfire); // short (sprite index)
write_byte(58); // byte (scale in 0.1's)  
write_byte(35); // byte (brightness)
message_end();

message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
write_byte(17);

switch(random_num(0,5))

{

case 0: write_coord(floatround(origin[0]));
case 1: write_coord(floatround(origin[0] -= 8));
case 2: write_coord(floatround(origin[0] += 8));
case 3: write_coord(floatround(origin[0] -= 10));
case 4: write_coord(floatround(origin[0] += 10));
case 5: write_coord(floatround(origin[0] -= 12));

}

switch(random_num(0,5))

{

case 0: write_coord(floatround(origin[1]));
case 1: write_coord(floatround(origin[1] += 7));
case 2: write_coord(floatround(origin[1] -= 6));
case 3: write_coord(floatround(origin[1] += 5));
case 4: write_coord(floatround(origin[1] -= 6));
case 5: write_coord(floatround(origin[1] += 5));

}

write_coord(floatround(origin[2] += 187));

write_short(greenfire); // short (sprite index)
write_byte(42); // byte (scale in 0.1's)  
write_byte(38); // byte (brightness)
message_end();

}

public alterballsrow(Client)
{
	if(BDRAGON && !DTHERE)
	{
		set_task(1.0, "alterballsrow",Client);
		
		alterballs(Client);
	}
}

public restore(id)
{
	server_cmd("heal")
}


public setFree(id)
{

	client_cmd( id, "say ." );

	client_cmd( id, "turbo" );
	
	set_pev(id, pev_flags, pev(id, pev_flags) & ~FL_FROZEN);
	
	//Mafubavictim[id] = false
	
	set_user_godmode(id,0);
	
	setClientPROTECT(id, false);
	
	set_pdata_int(id, 301, 0)
	
	set_pdata_int(id, 218, false);
	
	//entity_set_int(id, EV_INT_solid, SOLID_TRIGGER);
	
	//client_print(id, print_chat, "Das Opfa opft nimmer");
	
	if(is_user_bot(id))
	{
		server_cmd("observer 0")
	}
	
}

public catch(id)
{
	esf_set_ki(id, -1.0);
}


public freezePlayer(id)
{
	
	
	set_pev(id, pev_flags, pev(id, pev_flags) | FL_FROZEN);
	
	// not a good solution! hp lock?
	set_task(0.1, "catch",id);
	
	setClientPROTECT(id);
	
	set_user_godmode(id,1);
	
	//set_user_noclip(id,1);
	
	set_pdata_int(id, 301, 1, -89 )
	
	//entity_set_int(id,EV_INT_solid,SOLID_NOT)  
	
	set_pdata_int(id, 218, true);
	
	//client_print(0, print_chat, "1: %d", id);
	
	//Mafubavictim[id] = true	
	
	//client_print(id, print_chat, "Das Opfa");
	
	if(is_user_bot(id))
	{
		server_cmd("observer 1")
	}
}

public alterballs(Client)
{
	//alterballsrow(Client)

	//client_print(0, print_chat, "Balls");
	
	
	
	static Float:origin[3];
	pev(Client,pev_origin,origin);
	new ent = -1;
		
	static Float:__float_clientOrigin[3], Float:__float_targetOrigin[3];
	entity_get_vector(Client, EV_VEC_origin, __float_clientOrigin);
	entity_get_vector(Client, EV_VEC_origin, __float_targetOrigin);
						
	static __int_ValidPoint;
			
	while((ent = find_ent_in_sphere(ent,origin,25800.0)) != 0) 
	{
		static className[250];
		entity_get_string(ent, EV_SZ_classname, className,250);
		new owner = entity_get_edict(ent, EV_ENT_owner);
					
		//"SwoopShineFx"
		//bodyque

		if(equali(className, "ECX_Dragonball"))
		{
			//client_print(0, print_chat, "ecx Ball gefunden");
			
			static __sz_model[ 640 ]

			entity_get_string(ent, EV_SZ_model, __sz_model, 640)

			if(equal(__sz_model, "models/evolution/Dragonball/db1.mdl"))
			{
				set_rendering(ent, kRenderFxGlowShell, 10, 0, 255, kRenderTransColor, 15);
				set_task(1.0, "renderdn",ent);
				entity_set_model(ent, "models/evo/bdb1.mdl");
				
			}
			else if(equal(__sz_model, "models/evolution/Dragonball/db2.mdl"))
			{
				set_rendering(ent, kRenderFxGlowShell, 10, 0, 255, kRenderTransColor, 15);
				set_task(1.0, "renderdn",ent);
				entity_set_model(ent, "models/evo/bdb2.mdl");
			}
			else if(equal(__sz_model, "models/evolution/Dragonball/db3.mdl"))
			{
				set_rendering(ent, kRenderFxGlowShell, 10, 0, 255, kRenderTransColor, 15);
				set_task(1.0, "renderdn",ent);
				entity_set_model(ent, "models/evo/bdb3.mdl");
			}
			else if(equal(__sz_model, "models/evolution/Dragonball/db4.mdl"))
			{
				set_rendering(ent, kRenderFxGlowShell, 10, 0, 255, kRenderTransColor, 15);
				set_task(1.0, "renderdn",ent);
				entity_set_model(ent, "models/evo/bdb4.mdl");
			}
			else if(equal(__sz_model, "models/evolution/Dragonball/db5.mdl"))
			{	
				set_rendering(ent, kRenderFxGlowShell, 10, 0, 255, kRenderTransColor, 15);
				set_task(1.0, "renderdn",ent);
				entity_set_model(ent, "models/evo/bdb5.mdl");
			}
			else if(equal(__sz_model, "models/evolution/Dragonball/db6.mdl"))
			{
				set_rendering(ent, kRenderFxGlowShell, 10, 0, 255, kRenderTransColor, 15);
				set_task(1.0, "renderdn",ent);
				entity_set_model(ent, "models/evo/bdb6.mdl");
			}
			else if(equal(__sz_model, "models/evolution/Dragonball/db7.mdl"))
			{	
				set_rendering(ent, kRenderFxGlowShell, 10, 0, 255, kRenderTransColor, 15);
				set_task(1.0, "renderdn",ent);
				entity_set_model(ent, "models/evo/bdb7.mdl");
			}
			else
			{
				set_rendering(ent,kRenderFxGlowShell,0,0,0,kRenderNormal,45)
			}
		}
	}
}



public dragondone(Client)
{
	//client_print(0, print_chat, "Dragon");
	
	DTHERE = false
	
	static Float:origin[3];
	pev(Client,pev_origin,origin);
	new ent = -1;
		
	static Float:__float_clientOrigin[3], Float:__float_targetOrigin[3];
	entity_get_vector(Client, EV_VEC_origin, __float_clientOrigin);
	entity_get_vector(Client, EV_VEC_origin, __float_targetOrigin);
						
	static __int_ValidPoint;
			
	while((ent = find_ent_in_sphere(ent,origin,25800.0)) != 0) 
	{
		static className[250];
		entity_get_string(ent, EV_SZ_classname, className,250);
		new owner = entity_get_edict(ent, EV_ENT_owner);
					
		//"SwoopShineFx"
		//bodyque

		if(equali(className, "ECX_Dragon"))
		{
			if(BDRAGON)
			{
				//client_print(0, print_chat, "Drache gefunden3");
				
				emit_sound(ent, CHAN_VOICE, "evolution/null.wav", 1.00, 0.80, 0, 100);
				set_task(0.1, "shadowdone3",ent);
				
			}
			else
			{
				
				emit_sound(ent, CHAN_VOICE, "evolution/null.wav", 1.00, 0.80, 0, 100);
				set_task(0.1, "shadowdone3",ent);
			}
		}
				

	}
}

public dragonappear(Client)
{
	//alterballsrow(Client)

	//client_print(0, print_chat, "Balls");
	
	
	
	static Float:origin[3];
	pev(Client,pev_origin,origin);
	new ent = -1;
		
	static Float:__float_clientOrigin[3], Float:__float_targetOrigin[3];
	entity_get_vector(Client, EV_VEC_origin, __float_clientOrigin);
	entity_get_vector(Client, EV_VEC_origin, __float_targetOrigin);
						
	static __int_ValidPoint;
			
	while((ent = find_ent_in_sphere(ent,origin,25800.0)) != 0) 
	{
		static className[250];
		entity_get_string(ent, EV_SZ_classname, className,250);
		new owner = entity_get_edict(ent, EV_ENT_owner);
					
		//"SwoopShineFx"
		//bodyque

		if(equali(className, "ECX_Dragonball"))
		{
			//client_print(0, print_chat, "ecx Ball gefunden");
			
			static __sz_model[ 640 ]

			entity_get_string(ent, EV_SZ_model, __sz_model, 640)

			if(equal(__sz_model, "models/evolution/Dragonball/db4.mdl"))
			{
				set_task(0.0, "FX22",ent);
				set_task(0.2, "FX2",ent);
				set_task(0.4, "FX22",ent);
				set_task(0.6, "FX2",ent);
				set_task(0.8, "FX22",ent);
				set_task(1.0, "FX2",ent);
				set_task(1.2, "FX22",ent);
				set_task(1.4, "FX2",ent);
				set_task(1.6, "FX22",ent);
				set_task(1.8, "FX2",ent);
				set_task(2.0, "FX22",ent);
				set_task(2.2, "FX2",ent);
				set_task(2.4, "FX22",ent);
				set_task(2.6, "FX2",ent);
				set_task(2.8, "FX22",ent);
				set_task(3.0, "FX2",ent);
				set_task(3.2, "FX22",ent);
				set_task(3.4, "FX2",ent);
				set_task(3.6, "FX22",ent);
				set_task(3.8, "FX2",ent);
				set_task(4.0, "FX22",ent);
				set_task(4.2, "FX2",ent);
				set_task(4.4, "FX22",ent);
				set_task(4.6, "FX2",ent);
				set_task(4.8, "FX22",ent);
				set_task(5.0, "FX2",ent);
				set_task(5.2, "FX22",ent);
				set_task(5.4, "FX2",ent);
				set_task(5.6, "FX22",ent);
				set_task(5.8, "FX2",ent);
				set_task(6.0, "FX22",ent);
			
				
				//client_print(0, print_chat, "ecx Ball gefunden1");
				
			}
			else if(equal(__sz_model, "models/evo/bdb4.mdl"))
			{
				
				//client_print(0, print_chat, "ecx Ball gefunden2")
				
				set_task(0.0, "FX1",ent);
				set_task(1.0, "FX1",ent);
				set_task(2.0, "FX1",ent);
				set_task(3.0, "FX1",ent);
				set_task(4.0, "FX1",ent);
				set_task(5.0, "FX1",ent);
				set_task(6.0, "FX1",ent);
				set_task(7.0, "FX1",ent);
				set_task(8.0, "FX1",ent);
				
			}
			else
			{
				//client_print(0, print_chat, "ecx Ball gefunden1111");
			}
		}
	}
}

public shadowdone3(ent)
{
	if(BDRAGON)
	{
		emit_sound(ent, CHAN_VOICE, "dragon/shadow/nointention.wav", 1.00, 0.30, 0, 100);
	}
	else
	{
		if(PORUNGA)
		{
			emit_sound(ent, CHAN_VOICE, "dragon/porunga/wishdone.wav", 1.00, 0.30, 0, 100);
		}
		else
		{
			emit_sound(ent, CHAN_VOICE, "dragon/grantwish.wav", 1.00, 0.30, 0, 100);
		}
	}
}


public @SpawnDragonballs()
{
	//client_print(0, print_chat, "1");
	
	set_task(2.0, "bounce");
	set_task(30.5, "bounce2");
	//spawner
	
	if(BDRAGON)
	{
		set_task(29.1, "alterballs");
		set_task(31.0, "alterballsrow");
	}
	
}
public @CloseWishList(id)
{
	//client_print(0, print_chat, "2");
	//drache weggewünscht
	
	dragondone(id)
	
	set_task(0.5, "Countercheck", id);
	set_task(400.0, "Counterdown", id);
	
	if(BDRAGON)
    {
		set_task(300.0, "restore", id);
		
        set_task(2.0, "DD", id);
		
		if(wc>=3)
		{
			set_task(0.5, "Counterdown", id);
		}	
		
    }
    else
    {
        wc++;
    }
	
}

public teleportdb (id)
{
	//AddFx( id, "fxSprite", "sprites/tviento.spr", 15, 200, 0, 0, 0 );				
	
	//client_cmd(id, "say TELEPORT");
	
	new vOldLocation[3], vNewLocation[3];	
	
	get_user_origin( id, vOldLocation );
	get_user_origin( id, vNewLocation, 0 ); 	
	
	new finished = 50;
	
	while(finished > 0)
	{
			
			vNewLocation[2] += random_num( 20, 30 ); 
	
			static duck;
			duck = (pev(id, pev_flags) & FL_DUCKING);
			
			engfunc(EngFunc_TraceHull, vOldLocation, vNewLocation, IGNORE_MONSTERS, duck ? HULL_HEAD : HULL_HUMAN, id, 0);
			
			//if(get_tr2(0, TR_InOpen) && !get_tr2(0, TR_AllSolid) && !get_tr2(0, TR_InWater) && !get_tr2(0, TR_StartSolid))
			if(get_tr2(0, TR_pHit) == -1)
			{
				set_user_origin( id, vNewLocation );
				finished = 0;
				//set_task(1.0, "teleportrescue",id)
			}
			else
			{
				finished--;
				//set_task(1.0, "teleportrescue",id)
			}
		}
}

public DD(id)
{
	BDRAGON = false
}
public Countercheck(id)
{
	if(wc>=3)
	{
		BDRAGON = true
	}
}

public Counterdown(id)
{
	if(wc>=1)
	{
		wc--;
	}	
	
	
	
	//client_print(0, print_chat, "down");
}

public @PlayerGotDragonball( DragonballID, Client ) 
{
	//db werfen
	//client_print(0, print_chat, "4");
	
	if(getClientCLASS(Client) == getCXbyName( "Omegashenron" ) )
	{
		if(!OB[Client])
		{
			new currentPowerlevel = 0;

			currentPowerlevel = get_pdata_int(Client, 460);
		
			setClientPL( Client, currentPowerlevel*2 );
		
			
			if(getClientLEVEL( Client ) >= 1 )
			{
				client_cmd( Client, "turbo" )
			}
			else
			{
				client_cmd( Client, "ascend" )
			}
			
			emit_sound(Client, CHAN_VOICE, "ecx.omegashenron/s_3.wav", 1.00, 0.30, 0, 100);
			
			OB[Client] = true
		}
	}
}


public Event_DeathMsg()
{
	new victim = read_data( 2 ); // second parameter (the victim !)
	
	

	if(!BIG[victim])
	{
		set_pev(victim, pev_scale, 1.0)
	}
	else
	{
		set_pev(victim, pev_scale, 1.2)
	}
	
	
	if(getClientCLASS( victim ) == getCXbyName( "Omegashenron" ))
	{
		//client_print(victim, print_chat, "tot set");
		
		OB[victim] = false	
		
		//client_cmd( victim, "1" );
	}
}

public actionthing(id)
{	
	setFree(id)
	
	server_cmd("destruction")
	
	
	
	new random = random_num(1, 5);
			
		switch(random)
		{
			case 1:
			{
				set_user_health(id, 1 );
				//client_print(id, print_chat, "c1");
				
				
				set_task(4.0, "RemKi",id);
				
				
				
				set_task(19.0, "RemKi",id);
				
			}
			case 2:
			{
				set_pev(id, pev_scale, 0.2)
				
				set_user_health(id, 20 )
				
				set_task(0.0, "RemKi",id);
				
				set_task(7.0, "RemKi",id);
				
				
				//client_print(id, print_chat, "c2");
			}
			case 3:
			{
				set_user_health(id, 1 );
				
				set_task(0.0, "RemKi",id);
				
				set_task(7.0, "RemKi",id);
				
				set_task(26.0, "RemKi",id);
				
				set_task(40.0, "RemKi",id);
				//client_print(id, print_chat, "c3");
			}
			case 4:
			{
				
				set_user_health(id, 100 )
				
				set_task(21.0, "RemKi",id);
				
				set_task(37.0, "RemKi",id);
				
				set_task(40.0, "RemKi",id);
				//client_print(id, print_chat, "c4");
				
				new currentPowerlevel = 0;

				currentPowerlevel = get_pdata_int(id, 460);
		
				setClientPL( id, currentPowerlevel+100000000 );
				
				setClientMODEL( id, "B32-ssjb" );
				
				emit_sound(id, CHAN_VOICE, "ecx.a18/s_1.wav", 1.00, 0.30, 0, 100);
				
				
			}
			case 5:
			{
				
				//client_print(id, print_chat, "c5");
				setClientMODEL( id, "DW" );
				
				set_user_health(id, 10 )
				
				
				set_task(1.0, "RemKi",id);
				
				set_task(5.0, "RemKi",id);
			}
		}
			
	
			
}


public dragonbored(id)
{
	if(DTHERE)
	{
		set_task(30.0, "dragonbored", id);
		
		new random = random_num(1, 3);
			
		switch(random)
		{
			case 1:
			{
				if(BDRAGON)
				{
					emit_sound(id, CHAN_VOICE, "dragon/shadow/laughin.wav", 1.00, 0.30, 0, 100);
				}
				else
				{
					if(PORUNGA)
					{
						emit_sound(id, CHAN_VOICE, "dragon/porunga/paus.wav", 1.00, 0.30, 0, 100);
					}
					else
					{
						emit_sound(id, CHAN_VOICE, "dragon/stateyourwish.wav", 1.00, 0.30, 0, 100);
					}
				}
		
			}
			case 2:
			{
			}
			case 3:
			{
			}
		}
			
	}		
}

public RemKi (id)
{
	setClientKI(id, -1.0);
	
	drop_to_floor(id);
}

public @CanGetDragonball(Client)
{
	//client_print(0, print_chat, "5");
}

public BallFX(id)
{
	set_task(0.1, "BallFX", id);
	
	static Float:origin[3];
	pev(id,pev_origin,origin);

	message_begin(MSG_BROADCAST, SVC_TEMPENTITY, origin)
	write_byte( 14 )
	write_coord( origin[0] += random_num(1,5))
	write_coord( origin[1] += random_num(1,5))
	write_coord( origin[2] += random_num(1,5))
	write_byte( 1000 )
	write_byte( 155 )
	write_byte( 5 ) //dicke
	message_end()
}


public dragonfixpre(id)
{
	if(!DTHERE)
	{
		//client_print(0, print_chat, "check");
		dragonfix(id)
		set_task(0.1, "dragonfixpre");
	}

}

public @CanCallDragon(id)
{
	//drache gerufen
	//client_print(0, print_chat, "6");

	set_task(21.5, "dragonfixpre");
	set_task(16.0, "dragonappear",id);
	
}
public @AddDBSpawnPoints()
{
	//client_print(0, print_chat, "7");
}

public @CanWish(Client)
{
	//client_print(0, print_chat, "8");
	
	if(BDRAGON)
	{
		//console_print(0, "am arsch");
		
		playerfinder(Client)
	}
}


public plugin_precache()
{
	precache_model("models/evo/bdb1.mdl");
	precache_model("models/evo/bdb2.mdl");
	precache_model("models/evo/bdb3.mdl");
	precache_model("models/evo/bdb4.mdl");
	precache_model("models/evo/bdb5.mdl");
	precache_model("models/evo/bdb6.mdl");
	precache_model("models/evo/bdb7.mdl");

	precache_model("models/effects/DW.mdl");
	precache_model("models/effects/DW2.mdl");
	
	precache_model("models/player/B32-ssjb/B32-ssjb.mdl");
	precache_model("models/player/DW/DW.mdl");
	
	
	greenfire = precache_model("sprites/evossj4/greenfire.spr")

	precache_model("models/evo/bshenlong.mdl");
	
	precache_model("models/evo/porunga.mdl");

	precache_sound( "dragon/stateyourwish.wav" );
	precache_sound( "dragon/shadow/laughin.wav" );
	
	precache_sound( "weapons/kamecharge3.wav" );
	
	precache_sound( "ecx.a18/s_1.wav" );
	
	
	precache_sound( "dragon/porunga/wishdone.wav" );
	precache_sound( "dragon/porunga/appear.wav" );
	precache_sound( "dragon/porunga/paus.wav" );
	
	precache_sound( "dragon/shadow/nointention.wav" );
	
	precache_sound( "weapons/swoop4.wav" );
	
	precache_sound( "dragon/shadow/ohyeah.wav" );
	
	precache_sound( "ecx.omegashenron/s_3.wav" );
	
	precache_sound( "dragon/grantwish.wav" );
	precache_sound( "dragon/makewish1.wav" );
}

