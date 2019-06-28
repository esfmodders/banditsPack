#include < xtension/special >
#include "ipci/ascend"
#include <ipci/fxlib>
#include <amxmodx>
#include <ipci/Core>
#include <fun>
#include < hamsandwich >

stock SpecialXtension: sxhakai;
stock ChargeStateLock[33] = {0, ...}; 

new bool:isvalid[33];
new VictimID;
new transparance = 255
new temp1

new SpecialActive[32] = 0

new mdla1[33][33]
new mdla2[90][33]

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

Float:xs_rsqrt(Float:x)
    return 1.00 / floatsqroot(x);

xs_vec_normalize(Float:vec[], Float:out[])
{
    new Float:invlen = xs_rsqrt(vec[0] * vec[0] + vec[1] * vec[1] + vec[2] * vec[2]);
    out[0] = vec[0] * invlen;
    out[1] = vec[1] * invlen;
    out[2] = vec[2] * invlen;
    return 0;
}

xs_vec_cross(Float:vec1[], Float:vec2[], Float:out[])
{
    out[0] = vec1[1] * vec2[2] - vec1[2] * vec2[1];
    out[1] = vec1[2] * vec2[0] - vec1[0] * vec2[2];
    out[2] = vec1[0] * vec2[1] - vec1[1] * vec2[0];
    return 0;
}

public plugin_init ()
{
	register_plugin( "hakai", "1.0", "Vik" );
}
public @SpecialCreation ()
{
	beginSpecialCreation( "hakai", "esforces.eu", "callbackhakai", "special_hakai" );
	addSpecialCharge( IN_ATTACK, 1.5, 3.0, false ); 
	sxhakai = endSpecialCreation();
}

public plugin_precache()
{
precache_model( "sprites/esforces.hakai.spr" );
precache_generic("sprites/special_hakai.txt")
precache_sound( "esforces.beerus/hakai.wav" );
    
return PLUGIN_CONTINUE
}
public callbackhakai(id, CSpecialState:Status, Control, Float:Charge)
{ 
	switch ( Status ) 
	{ 
		case ssCharge: // called every 0.1 secs 
		{ 
             
			// allways including isDead, inTransform 
			if ( ( getClientPOWERUP( id ) && !getClientXFROZEN( id ) ) 
				|| getClientTURBO( id ) 
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
				client_print( id, print_chat, "You can't use hakai at the moment." );                 
				return 0; // > ssChargeAborted if Charge > 0.0 
			} 
             
                         
			if ( Charge == 0.0 && Control == IN_ATTACK ) 
			{ 
				ChargeStateLock[ id ] = 2; 
				setClientANIMATION(id,2,0.1);
                 
			} 
             
			else if ( Charge == 1.0 && Control == IN_ATTACK && ChargeStateLock[ id ] < 5 ) 
				ChargeStateLock[ id ] = 5;  
			return 1; 
		} 
         
		case ssChargeReleased: 
		{ 
			if ( Charge < 0.30 ) 
			{
				ChargeStateLock[ id ] = 0;
				setClientANIMATION(id, -1, 0.50)
			}
			if ( Charge > 0.30 )
			{
				isvalid[id] = true;
				setClientANIMATION(id, -1, 0.50)
				//setClientSPECIALSTATE( id, sxhakai, true );
				set_task(0.10, "sphere", id);
			}
		} 
         
		// Called when Charge > 0.0 by Death, Disconnect, IconSwitch to another Weapon, Out of Ki 
		case ssChargeAborted: 
		{
			//isvalid[id] = false
			stopClientSOUND( id, CHAN_WEAPON );
			setClientANIMATION(id, -1, 0.50)
			client_cmd(id, "-strafe");
			client_cmd(id, "hud_draw 1");
			return 0;
		} 
         
                 
		// Called when Specialstate = true by Death, Disconnect, IconSwitch to another Weapon 
		case ssForceAbort: 
		{
			stopClientSOUND( id, CHAN_WEAPON );
			setClientANIMATION(id, -1, 0.50)
			client_cmd(id, "hud_draw 1");
			client_cmd(id, "-strafe");
		} 
	} 
     
	return 1; 
} 

public tele(id)
{
	if (!getClientPROTECT(VictimID) || !getClientGOD(VictimID) || !getClientPREPUNCH(VictimID) || !getClientBASICMELEE(VictimID) || !getClientMELEEPUSHBACK(VictimID))
	{
		if(isvalid[id] == false)
		{
			if (!getClientXFROZEN(VictimID) || !getClientFROZEN(VictimID) || !getClientBLOCK(VictimID) || !getClientGOD(VictimID) || !getClientPROTECT(VictimID))
			{
				new CORE[1];
				CORE[0] = id;
				setClientFROZEN(VictimID, true);
				setClientXFROZEN(VictimID, true);
				setClientPROTECT(VictimID, true);
				setClientPROTECT(id, true);
				setClientXFROZEN(id, true);
				set_entity_visibility(id, 0);
				client_cmd(id, "spk sound/weapons/teleport.wav");
				
				set_task(7.9, "anim", id)
				
				aimatme(id, VictimID)
				aimatme(VictimID, id)
				
				getClientLEVELDATAv(VictimID, cxlModel, mdla1[VictimID], 32 )
				format(mdla2[VictimID],89, "models/player/%s/%s.mdl", mdla1[VictimID], mdla1[VictimID])
				
				setClientANIMATION(VictimID, 28, 0.60);

				start123(VictimID, id);
			}
		}
	}
	return 0;
	
}
start123(victim, id)
{
	if (!is_valid_ent(victim))
		return 0;
		
	new Float:vAng[3];
	new Float:vec[3];
	pev(victim, pev_v_angle, vAng);
	angle_vector(vAng, 2, vec);
	new Float:vec2[3];
	vec2[0] = vec[0];
	vec2[1] = vec[1];
	vec2[2] = vec[2] + 1.00;
	new Float:vecBackward[3];
	xs_vec_cross(vec, vec2, vecBackward);
	xs_vec_normalize(vecBackward, vecBackward);
	new Float:org[3];
	pev(id, pev_origin, org);
	org[0] = vecBackward[0] * 27.00 + org[0];
	org[1] = vecBackward[1] * 27.00 + org[1];
	org[2] = vecBackward[2] * 27.00 + org[2];
	set_pev(VictimID, pev_origin, org);
	
	set_task( 18.4, "destroy",id);
	
	aimatme(id, VictimID)
	aimatme(VictimID, id)
	
	client_cmd(id, "+strafe");
	client_cmd(id, "hud_draw 0");
		
	set_task(18.5, "unlock", id);
	
	set_task(1.50, "fxSND", id);
	return 0;
}

public destroy(id)
{
	transparance = 255
	temp1 = 0
	if (is_user_alive(VictimID))
	{
		static Float:HP;
		
		if (getClientPL(id) < getClientPL(VictimID))
			HP = getClientHP( VictimID )-100.0;
		if (getClientPL(id) > getClientPL(VictimID))
			HP = getClientHP( VictimID )-300.0;
		
		if( floatround(HP) <= 0 ) 
		{ 
			silentClientKILL( VictimID ); 
			message_begin( MSG_ALL, get_user_msgid("DeathMsg") ); 
			write_byte( id );
			write_byte( VictimID );
			write_string( "Hakai" );
			message_end();
			set_user_frags(id, get_user_frags(id) + 1);
		} 
		else 
			setClientHP( VictimID, floatround(HP));
	}
	return 0;
}

public sphere(id)
{
	if(!checkifnobshooman(id))
	{
		if (isvalid[id] == true)
		{
            setClientSPECIALCOOLDOWN( id, sxhakai, 0.5 );
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
							if(!is_user_alive(owner))
								return 0;
							
							SpecialActive[id] = 1
							VictimID = owner;
							isvalid[id] = false;
							
							part1(id)

					}
				}
			}
		}
	}
	return 0;
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
	
	aimatme(id, VictimID)
	aimatme(VictimID, id)
	
	tele(id);
	emit_sound(id, CHAN_ITEM, "esforces.beerus/hakai.wav", 1.00, 0.80, 0, 100);
	
	return 0;
}
public client_PostThink( id )
	if(temp1 == 1)
		set_rendering( VictimID, kRenderFxNone, 0, 0, 0, kRenderTransAlpha, transparance );// Render settings


public checkifnobshooman(id)
{
	if (getClientXFROZEN(id) || getClientFROZEN(id) || getClientBLOCK(id) || getClientATKSHOOT(id) || getClientMELEE(id) || getClientMELEEPUSHBACK(id) || getClientTHROWAWAY(id) || getClientTHROW(id) || getClientWALLGND(id))
    {
		return 1;
	}
	return 0;
}

public unlock(id)
{
	setClientFROZEN(VictimID, false);
	setClientXFROZEN(VictimID, false);
	setClientPROTECT(VictimID, false);
	setClientPROTECT(id, false);
	setClientXFROZEN(id, false);
	
	SpecialActive[id] = 0
	
	client_cmd(id, "hud_draw 1");
	RemFx( id, "fxAvatar", 0);
	client_cmd(id, "-strafe");
	setClientANIMATION(id, -1, 0.1);
	setClientANIMATION(VictimID, -1, 0.1);
}

public fxSND(id)
{
	new CORE[1];
	CORE[0] = id;
	set_entity_visibility(id, 1);
	client_cmd(id, "spk sound/weapons/teleport.wav");
	aimatme(id, VictimID)
	aimatme(VictimID, id)
	
	RemFx( id, "fxAvatar", 0);
	
	if (getClientCLASS(id) == getCXbyName( "Zamasu" ))
		AddFx( id, "fxAvatar", "create", 216, 1.0 );
	if (getClientCLASS(id) == getCXbyName( "Beerus" ))
		AddFx( id, "fxAvatar", "create", 217, 1.0 );
	
	setClientSPECIALCOOLDOWN( id, sxhakai, 130.0 );
	
	return 0;
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
public aimatme(plr1, plr2)
{
	new Float:vAng[3];
	new Float:vec[3];
	pev(plr2, pev_v_angle, vAng);
	angle_vector(vAng, 2, vec);
	new Float:vec2[3];
	vec2[0] = vec[0];
	vec2[1] = vec[1];
	vec2[2] = vec[2] + 1.00;
	new Float:vecBackward[3];
	xs_vec_cross(vec, vec2, vecBackward);
	xs_vec_normalize(vecBackward, vecBackward);
	new Float:org[3];
	new Float:org2[3];
	entity_get_vector(plr2, 0, org);
	entity_get_vector(plr2, 0, org2);
	org[0] = vecBackward[0] * 30.00 + org[0];
	org[1] = vecBackward[1] * 30.00 + org[1];
	org[2] = vecBackward[2] * 30.00 + org[2];
	setAIM(plr1, org2);
}

public anim(id)
{
	temp1 = 1
	
	kame(VictimID)
	
	AddFx(id, "fxBlow");
	AddFx(VictimID, "fxBlow");
	AddFx(VictimID, "fxSprite", "sprites/onda.spr", 15, 255, 0, 0, 0);
	AddFx(id, "fxScreenShake", 500.00, 1.00, 500.00);
	AddFx(VictimID, "fxScreenShake", 500.00, 1.00, 500.00);
	set_task(1.00, "anim2", id) 

	set_task(2.00, "anim3", id) 
	set_task(3.00, "anim4", id) 
	set_task(4.00, "anim5", id) 
	set_task(5.00, "anim6", id) 
	set_task(6.00, "anim7", id) 
	return 0;
}
public anim2(id)
{
setClientANIMATION(VictimID, 52, 0.60);
set_task(0.5, "anim3", id)
}

public anim3(id)
{
	if (temp1 == 1)
	{
		if (transparance >= 1)
		{
			transparance -= 1
			set_task(0.30, "anim3", id)
		}
	}
}

public kame(Client)
{
	new Float: org[ 3 ];
	pev( Client, pev_origin, org );		
	new Float:ang[3];
	new Float:zona[3];
	entity_get_vector(Client, 6, ang);
	entity_get_vector(Client, 0, zona);
	zona[0] = zona[0] + random_float(0.00, 0.00);
	zona[1] += random_float(0.00, 0.00);
	new num = 28;
	new Entid = create_entity("env_model");
	
	entity_set_model(Entid, mdla2[VictimID]);
	
	entity_set_int(Entid, EV_INT_sequence, num);
	entity_set_float(Entid, EV_FL_animtime, get_gametime());
	entity_set_float(Entid, EV_FL_framerate, 0.80);
	entity_set_int(Entid, EV_INT_rendermode, 2);
	entity_set_float(Entid, EV_FL_renderamt, 40.00);
	entity_set_origin(Entid, zona);
	entity_set_control(Entid);
	entity_set_float(Entid, EV_FL_scale, 1.00);
	entity_set_vector(Entid, 6, ang);
	
	makebigger(Entid)
}

public makebigger(ent)
{
    if (is_valid_ent(ent))
    {
        entity_set_float(ent, EV_FL_scale, entity_get_float(ent, EV_FL_scale) + 0.20);
        if (entity_get_float(ent, EV_FL_scale) >= 2.00)
        {
            set_task(0.02, "makesmaller", ent)
            return 0;
        }
        set_task(0.02, "makebigger", ent);
    }
    return 0;
}
public makesmaller(ent)
{
    if (is_valid_ent(ent))
    {
        entity_set_float(ent, EV_FL_scale, entity_get_float(ent, EV_FL_scale) - 0.20);
        if (entity_get_float(ent, EV_FL_scale) <= 1.00)
        {
            remove_ent(ent);
            return 0;
        }
        set_task(0.02, "makesmaller", ent);
    }
    return 0;
}