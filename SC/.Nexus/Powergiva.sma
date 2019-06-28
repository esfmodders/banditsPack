 
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
 

stock SpecialXtension: sxgivepower;
stock ChargeStateLock[33] = {0, ...}; 

new bool:AIM[33];
new bool:ATACANDO[33];
new bool:ATRAPADO[33];
new bool:BUSCANDO[33];
new bool:giveki[33];
new bool:givekiv[33];

new Float:original_origin[3];

new victima;


public plugin_init ()
{
	register_plugin( "givepower", "1.0", "ESFKAMI" );
	register_touch("player", "player", "touching");
}

public @SpecialCreation ()
{
	beginSpecialCreation( "givepower", "www.esfkami.net", "callbackgivepower", "special_givepower" );
	addSpecialCharge( IN_ATTACK, 1.5, 3.0, false ); 
	sxgivepower = endSpecialCreation();
}

public callbackgivepower(id, CSpecialState:Status, Control, Float:Charge)
{
    switch (Status)
    {
        case 0:
        {
            //if ((getClientPOWERUP(id) && !getClientXFROZEN(id)) || (getClientTURBO(id) || getClientMELEE(id) || getClientWALLGND(id) || getClientSWOOPING(id) || getClientTHROWAWAY(id) || getClientBLOCK(id) || getClientTHROW(id) || getClientPL(id) <= 20000000))
            //{
                //return 0;
            //}
            if (0.00 == Charge && Control == 1)
            {
            }
            if (Charge >= 1.00 && Control == 1)
            {
                client_PreThink(id)
				
				if (!BUSCANDO[id])
                {
                    BUSCANDO[id] = true;
                }
				
            }
            return 1;
        }
        case 1:
        {
            if (!ATACANDO[id])
            {
            }
        }
        case 2:
        {
        }
        case 4:
        {
        }
        default:
        {
        }
    }
    return 1;
}


public tele(id)
{
    new CORE[1];
    CORE[0] = id;
    setClientFROZEN(victima, true);
    setClientXFROZEN(victima, true);
    setClientPROTECT(victima, true);
    setClientPROTECT(id, true);
    setClientXFROZEN(id, true);
    set_entity_visibility(id, 0);
    client_cmd(id, "spk sound/weapons/teleport.wav");
    client_cmd(id, "-attack");
    if (getClientFLY(victima))
    {
	setClientANIMATION(victima, 27, 0.60);
    }
    else
    {
	setClientANIMATION(victima, 27, 0.60);
    }
    atras(victima, id, 1);
	
    return 0;
}

atras(victim, id, estado)
{
    if (!is_valid_ent(victim))
    {
        return 0;
    }
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
    new Float:org2[3];
    entity_get_vector(victim, 0, org);
    entity_get_vector(victim, 0, org2);
    org[0] = vecBackward[0] * 30.00 + org[0];
    org[1] = vecBackward[1] * 30.00 + org[1];
    org[2] = vecBackward[2] * 30.00 + org[2];
    set_pev(id, pev_origin, org);
    AIM[id] = true;
    giveki[id] = true
    givekiv[victima] = true
    if (estado == 1)
    {
        setClientANIMATION(id, 98, 0.80);
        //client_cmd(id, "+strafe");
        set_task(10.00, "unlock", id);
        client_print(id, print_chat, "You are giving your powerlevel away.");
        client_print(victima, print_chat, "You are receiving energy! Don't move!");
        set_task(1.50, "fxPower", id);
    }
    return 0;
}

public client_PreThink(id)
{
	if (giveki[id])
	{
	set_pdata_int(id, 460,get_pdata_int(id, 460, 5) - 540, 5)
	setClientADPL(victima, getClientPL(victima) + 540)
	setClientADPL(id, getClientPL(id) - 540)
	set_pdata_int(victima, 460,540 + get_pdata_int(victima, 460, 5), 5)
	}
	if (BUSCANDO[id] == true && getClientLEVEL( victima ) == 0)
	{
	entity_get_vector(id, 0, original_origin);
	new ent = -1;
	new var7 = find_ent_in_sphere(ent, original_origin, 500.00);
	ent = var7;
	
	new var8 = ent;
	if (id != var8)
	
	if (is_user_alive(ent))
	{
		victima = ent;
		BUSCANDO[id] = false;
		ATACANDO[id] = true;
		ATRAPADO[victima] = true;
		set_task(0.00, "tele", id);
	}
	}
}

public unlock(id)
{
	setClientFROZEN(victima, false);
	setClientXFROZEN(victima, false);
	setClientPROTECT(victima, false);
	setClientPROTECT(id, false);
	setClientXFROZEN(id, false);
	client_cmd(id, "-strafe");
	giveki[id] = false
	givekiv[victima] = false
	setClientANIMATION(id, -1, 0.1);
	setClientANIMATION(victima, -1, 0.1);
}

public fxPower(id)
{
    new CORE[1];
    CORE[0] = id;
    set_entity_visibility(id, 1);

    client_cmd(id, "spk sound/weapons/teleport.wav");
	
    return 0;
}
