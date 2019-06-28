#include <amxmodx>
#include <xtension/special>
#include "ipci/ascend"
#include <ipci/fxlib>
#include <ipci/Core>
#include <fun>

new SpecialActive[32] = 0
stock SpecialXtension: sxskip;
stock ChargeStateLock[33] = {0, ...}; 
new bool:Activex[33];
new VictimID;
new bool: BoxVisable[33]

new Sounds[3][]=
{
    "esforces.hit/Hit_1.wav",
    "esforces.hit/Hit_2.wav",
    "esforces.hit/Hit_3.wav"
};

entity_set_control(index)
{
    entity_set_byte(index, 0, 125);
    entity_set_byte(index, 1, 125);
    entity_set_byte(index, 2, 125);
    entity_set_byte(index, 3, 125);
    return 0;
}
remove_ent(index)
{
    if (is_valid_ent(index))
        remove_entity(index);
    return 0;
}

public plugin_init ()
{
	register_plugin( "skip", "1.0", "Vik" );
	register_forward( FM_AddToFullPack, "fw_AddToFullPack_Post", 1 )  
}
public @SpecialCreation ()
{
	beginSpecialCreation( "skip", "", "callbackskip", "special_timeskip" );
	addSpecialCharge( IN_ATTACK, 0.20, 3.0, false ); 
	sxskip = endSpecialCreation();
	
}

public plugin_precache()
{
precache_model( "sprites/640counterhit.spr" );

precache_model( "sprites/hit.spr" );
precache_model( "sprites/TimeSkip.spr" );

precache_model( "models/evolution/black_cube.mdl" );

precache_generic("sprites/special_timeskip.txt")
    
return PLUGIN_CONTINUE
}
public callbackskip(id, CSpecialState:Status, Control, Float:Charge)
{ 
	switch ( Status ) 
	{ 
		case ssCharge: // called every 0.1 secs 
		{ 
             
			// allways including isDead, inTransform 
			if ( ( getClientPOWERUP( id ) && !getClientXFROZEN( id ) ) 
				|| getClientMELEE( id ) 
				|| getClientWALLGND( id ) 
				|| getClientSWOOPING( id ) 
				|| getClientMELEEPUSHBACK( id ) 
				|| getClientATKSHOOT( id ) 
				|| getClientTHROWAWAY( id ) 
				|| getClientBLOCK( id ) 
				|| getClientTHROW( id )
				) 
			{                 
				return 0; // > ssChargeAborted if Charge > 0.0 
			} 
             
                         
			if ( Charge == 0.0 && Control == IN_ATTACK ) 
			{ 
				ChargeStateLock[ id ] = 2; 
				setClientANIMATION(id, -1, 0.50)
                 
			} 
             
			else if ( Charge == 1.0 && Control == IN_ATTACK && ChargeStateLock[ id ] < 5 ) 
			{               
				Activex[id] = true;
				setClientSPECIALSTATE( id, sxskip, true ); 
				ChargeStateLock[ id ] = 5; 
				setClientANIMATION(id, -1, 0.50)
			}             
				 
			return 1; 
		} 
         
		case ssChargeReleased: 
		{ 
			if ( Charge < 1.0 ) 
			{
			ChargeStateLock[ id ] = 0;
			setClientANIMATION(id, -1, 0.50)
			}			
		} 
		case ssChargeAborted: 
		{
			//Activex[id] = false
			stopClientSOUND( id, CHAN_WEAPON );
			setClientANIMATION(id, -1, 0.50)
			return 0;
		} 
		case ssForceAbort: 
		{
			stopClientSOUND( id, CHAN_WEAPON );
			setClientANIMATION(id, -1, 0.50)
		} 
	} 
     
	return 1; 
} 

public tele(id)
{
	
	setClientFROZEN(VictimID, true);
	setClientXFROZEN(VictimID, true);
	setClientANIMATION(VictimID, random_num(53, 55), 0.1);
	
	setClientPROTECT(VictimID, true);
	setClientPROTECT(id, true);
	setClientXFROZEN(id, true);
	
	setClientKI(id, getClientKI(id)-30.00);
	setClientKI(VictimID, getClientKI(VictimID)-30.00);
	
	setClientANIMATION(id, random_num(217, 218), 0.3);
	
	AddFx(id, "fxScreenShake", 50.00, 1.00, 5.00);
	
	AddFx(VictimID, "fxScreenShake", 50.00, 1.00, 5.00);
	AddFx(id, "fxSprite", "sprites/hit.spr", 4, 200, 0, 0, 3);
	AddFx(id, "fxSprite", "sprites/TimeSkip.spr", 4, 245, 0, 0, 8);
	
	emit_sound(id, CHAN_ITEM, "esforces.hit/golpehit.wav", 1.00, 0.80, 0, 100);
	
	set_task(1.50, "unlock", id);
	set_task(0.20, "playsnd", id);
	
	if (is_user_alive(VictimID))
	{
		static Float:HP;
		if (getClientLEVEL( id ) == 1)
			HP = getClientHP( VictimID )-3.0;
		if (getClientLEVEL( id ) == 2)
			HP = getClientHP( VictimID )-5.0;
		if (getClientLEVEL( id ) == 3)
			HP = getClientHP( VictimID )-7.0;
		if (getClientLEVEL( id ) == 4)
			HP = getClientHP( VictimID )-10.0;
		
		if( floatround(HP) <= 0 ) 
		{ 
			silentClientKILL( VictimID ); 
			message_begin( MSG_ALL, get_user_msgid("DeathMsg") ); 
			write_byte( id );
			write_byte( VictimID );
			write_string( "Time Skip" );
			message_end();
			set_user_frags(id, get_user_frags(id) + 1);
		} 
		else 
			setClientHP( VictimID, floatround(HP));
	}
	return 0;
	
}

public client_PreThink(id)
{
	if (!is_user_connected(id))
		return;
			
	if (!is_user_alive(id))
		return;
		
	if( getClientSPECIALSTATE( id, sxskip ) )
	{
	if(!checkifnobshooman(id))
	{
	if (getClientLEVEL( id ) >= 1 && getClientCLASS( id ) == getCXbyName( "Hit" ))
	{
		if (Activex[id] == true)
		{
			setClientSPECIALCOOLDOWN( id, sxskip, 0.5 );
			Activex[id] = false;
			setClientSPECIALSTATE( id, sxskip, false );
			
			new Float:origin[3];
			pev(id,pev_origin,origin);
			new ent = -1;
            
			while((ent = find_ent_in_sphere(ent,origin,150.0)) != 0) 
            {
				new className[32];
				entity_get_string(ent, EV_SZ_classname, className,32);
				new owner = entity_get_edict(ent, EV_ENT_owner);
				
				if(!equali(className, "bodyque") && owner < 150 && owner > 0 && owner != id)
				{
					if (SpecialActive[id] == 0)
					{
						SpecialActive[id] = 1
						VictimID = owner;
							
						part1(id)
					}
				}
			}
		}
	}
	}
	}
	return;
}
part1(id)
{
	if ( ( getClientPOWERUP(VictimID) || getClientXFROZEN(VictimID) ) 
	|| getClientMELEE(VictimID) 
	|| getClientWALLGND(VictimID) 
	|| getClientMELEEPUSHBACK(VictimID) 
	|| getClientATKSHOOT(VictimID) 
	|| getClientTHROWAWAY(VictimID) 
	|| getClientBLOCK(VictimID) 
	|| getClientTHROW(VictimID)
	|| getClientGOD(VictimID)
	|| getClientFROZEN(VictimID)
	) 
	{ 
		SpecialActive[id] = 0
		VictimID = 0
		return 0;
	} 
	new Float:org2[3];
	entity_get_vector(VictimID, 0, org2);
	setAIM(id, org2);
							
	kame(id)
	kame(VictimID)
	tele(id);
	return 0;
}

public checkifnobshooman(id)
{
	if (getClientXFROZEN(id) || getClientFROZEN(id) || getClientBLOCK(id) || getClientATKSHOOT(id) || getClientMELEE(id) || getClientMELEEPUSHBACK(id) || getClientTHROWAWAY(id) || getClientTHROW(id) || getClientWALLGND(id))
    {
		return 1;
	}
	return 0;
}
public playsnd(id)
{
	new i = 0;
	i = random_num(0, 2);
	emit_sound(id, CHAN_BODY, Sounds[i], 1.00, 0.80, 0, 100);
}
public unlock(id)
{
	SpecialActive[id] = 0
	
	setClientFROZEN(VictimID, false);
	setClientXFROZEN(VictimID, false);
	setClientPROTECT(VictimID, false);
	
	setClientANIMATION(VictimID, -1, 0.1);
	
	setClientPROTECT(id, false);
	setClientXFROZEN(id, false);
	
	VictimID = 0
	
	setClientANIMATION(id, -1, 0.1);
	
	if (getClientLEVEL( id ) == 1)
		setClientSPECIALCOOLDOWN( id, sxskip, 10.0 );
	if (getClientLEVEL( id ) == 2)
		setClientSPECIALCOOLDOWN( id, sxskip, 7.0 );
	if (getClientLEVEL( id ) == 3)
		setClientSPECIALCOOLDOWN( id, sxskip, 5.0 );
	if (getClientLEVEL( id ) == 4)
		setClientSPECIALCOOLDOWN( id, sxskip, 3.0 );
}

setAIM(id, Float:target_origin[3])
{
    static Float:end[3];
    static Float:start[3];
    entity_get_vector(id, 0, start);
    entity_get_vector(id, 18, end);

    static Float:new_angles[3];
    static Float:aim_vector[3];
    aim_vector[0] = target_origin[0] - start[0];
    aim_vector[1] = target_origin[1] - start[1];
    aim_vector[2] = target_origin[2] - start[2];
    vector_to_angle(aim_vector, new_angles);
    while (new_angles[0] > 360.00)
    {
        new_angles[0] = new_angles[0] - 360.00;
    }
    while (new_angles[0] < 0.00)
    {
        new_angles[0] = new_angles[0] + 360.00;
    }
    new_angles[0] = new_angles[0] * -1;
    while (new_angles[1] > 360.00)
    {
        new_angles[0] = new_angles[0] - 360.00;
    }
    while (new_angles[1] < 0.00)
    {
        new_angles[0] = new_angles[0] + 360.00;
    }
    entity_set_vector(id, 6, new_angles);
    entity_set_int(id, EV_INT_fixangle, 1);
    return 1;
}

public fw_AddToFullPack_Post(ES_Handle, e, iEntity, iHost, iHostFlags, iPlayer, iSet)
{
		if(pev_valid(iEntity))
		{
                new szClassName[32]
                pev(iEntity, pev_classname, szClassName, 31)

                if(equal(szClassName, "BoxEnt"))
						if(BoxVisable[iHost] == false)
							set_es(ES_Handle, ES_Effects, EF_NODRAW)
		}
		return FMRES_IGNORED
}

public kame(Client)
{
	BoxVisable[Client] = true

	new Float: org[ 3 ];
	pev( Client, pev_origin, org );
				
	new Float:ang[3];
	new Float:zona[3];
	entity_get_vector(Client, 6, ang);
	entity_get_vector(Client, 0, zona);
	zona[0] = zona[0] + random_float(-0.00, 0.00);
	zona[1] += random_float(0.00, 0.00);

	new num = 221;
	new GokuEnt = create_entity("env_model");

	entity_set_model(GokuEnt, "models/evolution/black_cube.mdl");

	entity_set_int(GokuEnt, EV_INT_sequence, num);
	entity_set_float(GokuEnt, EV_FL_animtime, get_gametime());
	entity_set_float(GokuEnt, EV_FL_framerate, 0.80);
	entity_set_int(GokuEnt, EV_INT_rendermode, 2);
	
	entity_set_float(GokuEnt, EV_FL_renderamt, 250.00);

	entity_set_origin(GokuEnt, zona);
	entity_set_control(GokuEnt);
	entity_set_float(GokuEnt, EV_FL_scale, 0.40);
	entity_set_vector(GokuEnt, 6, ang);
	
	set_pev( GokuEnt, pev_classname, "BoxEnt")
	
	set_task(1.6, "remsmth", Client)
	set_task(1.6, "RemEnt", GokuEnt)
}

public remsmth(Client)
{
	BoxVisable[VictimID] = false
	BoxVisable[Client] = false
}
				

public RemEnt(ent)
{
    if (is_valid_ent(ent))
    {
        entity_set_float(ent, EV_FL_renderamt, entity_get_float(ent, EV_FL_renderamt) - 15.00);
        if (entity_get_float(ent, EV_FL_renderamt) <= 5.00)
        {
            remove_ent(ent);
            return 0;
        }
        set_task(0.10, "RemEnt", ent);
    }
    return 0;
}	