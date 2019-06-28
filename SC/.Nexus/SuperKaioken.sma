/*==================================================================================================
LIBRARIES.
==================================================================================================*/


#include < amxx/amxmodx >
#include < amxx/engine >
#include <fakemeta>
#include <ipci/ascend>
#include <ipci/Fxlib>
#include <engine>
#include <ipci/Core>
#include <fun>
#include < hamsandwich >
#include <amxmodx>
#include <esf_util>

#include <amxmisc>
#include <amxx/fakemeta_util>
#include <ipci/ascend>
#include <ipci/Fxlib>
#include <xtension/Special>
 
#define esf_set_swoopspeed(%1,%2)	set_pev(%1, pev_fuser1, float(%2)) 



//stock MSG_Explosion;

new SoundK[33];
new SpecialXtension:SuperKaioken;

new bool:kaiokening[32];

public plugin_init()
{
    register_plugin("SuperKaioken", "1.0", "Matias_Esf / BANDIT");
    register_forward(FM_EmitSound, "HookSound", 0);
    register_forward(FM_PlayerPreThink, "ClientPreThink", 0);
    register_forward(FM_CmdStart, "forward_CmdStart", 0);
}

public plugin_precache()
{
    precache_model("models/evolution/Auras/shape_01.mdl");
    precache_model("sprites/mat.taura1.spr");
    precache_model("sprites/evm_wave4.spr");
    precache_sound("weapons/kaiokenswoop.wav");
	precache_sound("ecx.goku-ts/kaiokenssj.wav");
	
	precache_sound("ecx.goku-ts/t_gilissj.wav");
	
	
	
}

public @SpecialCreation()
{
    beginSpecialCreation("SuperKaioken", "", "callbackSample", "special_skaioken");
    addSpecialCharge(IN_ATTACK, 10.00/*1092616192*/, 4.00/*1082130432*/);
    addSpecialHook(sxhDeathMessage, "deathmsgSample");
    SuperKaioken = endSpecialCreation();
}

public callbackSample(id, CSpecialState:Status, Control, Float:Charge, Level)
{
    switch (Status)
    {
        case 0:
        {
            if ((getClientPOWERUP(id) && !getClientXFROZEN(id)) || (getClientTURBO(id) || getClientMELEE(id) || getClientWALLGND(id) || getClientBLOCK(id) || getClientSWOOPING(id) || getClientTHROWAWAY(id) || getClientTHROW(id)))
            {
                return 0;
            }
            if (0.00 == Charge)
            {
				emit_sound(id, CHAN_ITEM, "ecx.goku-ts/t_gilissj.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
				//emit_sound(id, CHAN_ITEM, "ecx.goku-ts/superkaioken.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
                tas(id);
            }
            if (0.20 == Charge)
            {
                aura1(id);
            }
            if (1.00 == Charge)
            {
                remove_task(id, 0);
                //client_cmd(id, "stopsound");
                emit_sound(id, CHAN_ITEM, "ecx.goku-ts/kaiokenssj.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
                AddFx(id, "fxBlow");
                on(id);
                client_cmd(id, "resetview");
                //client_print(id, print_chat, "<SuperKaioken");
				set_user_rendering(id, 19, 10, 10, 0, 4, 255);
                //client_print(id, print_chat, "<Matias_Esf ECX MOD");
                FX_off(id);
                new Float:i = 0.0;
                while (i <= 999.00)
                {
                    set_task(i, "Estados", id, "", 0, "", 0);
                    i += 1.00;
                }
                //setClientPROTECT(id);
				
				setClientPROTECT(id, false);
                setClientSPECIALSTATE(id, SuperKaioken, true);
                return 0;
            }
            return 1;
        }
        case 1:
        {
            if (Control == 1)
            {
                remove_task(id, 0);
            }
            setClientANIMATION(id, -1 ,1.0);
            client_cmd(id, "resetview");
            off(id);
            FX_off(id);
            client_cmd(id, "stopsound");
            setClientPROTECT(id, false);
            setClientSPECIALSTATE(id, SuperKaioken, false);
        }
        case 2:
        {
            setClientPROTECT(id, false);
            setClientPROTECT(id, false);
            remove_task(id, 0);
            client_cmd(id, "resetview");
             setClientANIMATION(id, -1 ,1.0);
            FX_off(id);
            off(id);
            SoundK[id] = 0;
            client_cmd(id, "stopsound");
            restoreClientLEVELDATA(id);
            setClientSPECIALSTATE(id, SuperKaioken, false);
            return 0;
        }
        case 4:
        {
            if (getClientSPECIALSTATE(id, SuperKaioken) == true)
            {
                if (Control == 1)
                {
                    setClientPROTECT(id, false);
                }
                setClientPROTECT(id, false);
                remove_task(id, 0);
                off(id);
                SoundK[id] = 0;
                setClientFLY(id, false);
                setClientSWOOPTIME(id, 0.0);
                setClientSPEED(id, 400);
                client_cmd(id, "resetview");
                set_user_rendering(id, 19, 0, 0, 0, 0, 0);
                restoreClientLEVELDATA(id);
                setClientSPECIALSTATE(id, SuperKaioken, false);
                return 0;
            }
            off(id);
            SoundK[id] = 0;
        }
        default:
        {
        }
    }
    return 1;
}

public deathmsgSample(id, Killer, String:Weapon[])
{
    set_msg_arg_string(3, "Super Kaioken");
}

public ClientPreThink(id)
{
    if (getClientSPECIALSTATE(id, SuperKaioken) == true)
    {
        setClientSWOOPTIME(id, 100000000000.00);
		
		new currentPowerlevel = 0;

	
	
		currentPowerlevel = get_pdata_int(id, 460);
		
		setClientPL( id, currentPowerlevel+3000 );
		
		if(kaiokening[id])
		{
			if(!getClientSWOOPING(id))
			{
				kaiokening[id] = false;
			}
		}
			
			
	
		
        if (getClientSWOOPING(id) == 1)
        {
			if(!kaiokening[id])
			{	
				kaiokening[id] = true;
				
				
				new Float:vel[3]
			
				entity_get_vector( id, EV_VEC_velocity, vel )
			
				vel[0] *= 100.0
				vel[1] *= 100.0
				vel[2] *= 100.0
				
				entity_set_vector( id, EV_VEC_velocity, vel )
				
				//client_print(id, print_chat, "speed");
			}
		
            set_user_rendering(id, 19, 30, 30, 0, 4, 255);
        }
        if (getClientKI(id) <= 2)
        {
            setClientFLY(id, false);
            setClientSWOOPTIME(id, 0.0);
			
			client_cmd( id, "descend" );
			
        }
		else
		{
			set_user_rendering(id, 19, 10, 10, 0, 4, 255);
		}
    }
    return 0;
}

public on(id)
{
    if (!is_user_alive(id))
    {
        return 1;
    }
    SoundK[id] = 1;
    return 0;
}

public off(id)
{
    if (!is_user_alive(id))
    {
        return 1;
    }
	
	client_cmd( id, "descend" );
	
    SoundK[id] = 0;
    restoreClientLEVELDATA(id);
    remove_task(id, 0);
    return 0;
}

public tas(id)
{
    setClientPROTECT(id);
    client_cmd(id, "spk sound/mat.goku/carga_kaioken.wav");
    RemFx(id, "fxAvatar", 0);
    RemFx(id, "fxAvatar", 0);
    RemFx(id, "fxAvatar", 0);
    setClientANIMATION(id, 25, 1.0);
    set_task(0.00, "powerup", id, "", 0, "", 0);
    set_task(1.00, "lgt", id, "", 0, "", 0);
    set_task(6.00, "sprite", id, "", 0, "", 0);
    set_task(6.50, "rays1", id, "", 0, "", 0);
    set_task(6.70, "rays1", id, "", 0, "", 0);
    set_task(7.10, "rays1", id, "", 0, "", 0);
    set_task(7.50, "rays1", id, "", 0, "", 0);
    set_task(7.80, "rays1", id, "", 0, "", 0);
    set_task(8.50, "rays1", id, "", 0, "", 0);
    set_task(9.50, "rays1", id, "", 0, "", 0);
    return 0;
}

public HookSound(player, channel, sound[])
{
    if (player > 32 || player < 1)
    {
        return 1;
    }
    if (SoundK[player])
    {
        if(containi(sound, "weapons/swoop.wav") != -1)
        {
            emit_sound(player, channel, "weapons/kaiokenswoop.wav", 1.00, 0.80, 0, 100);
            return 4;
        }
        if(containi(sound, "weapons/chainswoop.wav") != -1)
        {
            emit_sound(player, channel, "weapons/kaiokenswoop.wav", 1.00, 0.80, 0, 100);
            return 4;
        }
        if(containi(sound, "weapons/aura.wav") != -1)
        {
            emit_sound(player, channel, "weapons/kaiokenswoop.wav", 1.00, 0.80, 0, 100);
            return 4;
        }
    }
    return 0;
}

public Estados(id)
{
    if (getClientPOWERUP(id) == 1)
    {
        AddFx(id, "fxBeamTorus", "sprites/lgtning.spr", 255, 255, 255, 255, 250, 8, 20, 0);
        AddFx(id, "fxLightning", "sprites/lgtning.spr", 3, 90, 150, 55, 55, 0, 250, 10, 100, 0);
        AddFx(id, "fxSprite", "sprites/evm_wave4.spr", 0, 255, 0, 0);
    }
    return 0;
}

public aura1(id)
{
    client_cmd(id, "spk sound/matias_esf/power.wav");
    AddFx(id, "fxModelEntity", "models/evolution/Auras/shape_01.mdl", 0, 0, 80.00/*1117782016*/, 0, 0, 0, 2.00/*1073741824*/, 0.20/*1045220557*/, 0, 4);
    AddFx(id, "fxScreenShake", 60.00/*1114636288*/, 0.60/*1058642330*/, 2.00/*1073741824*/);
    AddFx(id, "fxBlow");
    return 0;
}

public powerup(id)
{
    AddFx(id, "fxPowerup", 255, 255, 105);
    return 0;
}

public rays1(id)
{
    AddFx(id, "fxLightning", "sprites/lgtning.spr", 2, 50, 150, 55, 55, 0, 250, 10, 100, 0);
    return 0;
}

public blow(Client)
{
    AddFx(Client, "fxBlow");
    return 0;
}

public sprite(id)
{
    client_cmd(id, "cam_idealdist 100");
    AddFx(id, "fxSpriteEntity", "sprites/mat.taura1.spr", 0, 0, 250.00/*1132068864*/, 10.00/*1092616192*/, 0, 0.60/*1058642330*/, 0.60/*1058642330*/);
    return 0;
}

public lgt(id)
{
    AddFx(id, "fxLgtField", 0.10/*1036831949*/, 2, 255, 40, 40);
    return 0;
}

public FX_off(Client)
{
    setClientANIMATION(Client, -1 ,1.0);
    client_cmd(Client, "resetview");
    RemFx(Client, "fxLgtField", 0);
    RemFx(Client, "fxAvatar", 0);
    RemFx(Client, "fxAvatar", 0);
    RemFx(Client, "fxPowerup", 0);
    RemFx(Client, "fxModelEntity", 0);
    RemFx(Client, "fxModelEntity", 0);
    RemFx(Client, "fxSpriteEntity", 0);
    return 1;
}
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang3082\\ f0\\ fs16 \n\\ par }
*/
