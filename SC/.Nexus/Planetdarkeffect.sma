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


new const CX_Plugin[]	= 	"DARK";
new const CX_Version[]	=	"1337";
new const CX_Author[]	=	"BANDIT";

new FxWBskyEnt;
new FxMcloudEnt;

new FxLightningSpr;

new Lightning;

new szWBskyModel[32] =
{
    109, 111, 100, 101, 108, 115, 47, 101, 118, 111, 108, 117, 116, 105, 111, 110, 47, 98, 108, 97, 99, 107, 95, 99, 117, 98, 101, 46, 109, 100, 108, 0
}
new szWMCloudsModel[33] =
{
    109, 111, 100, 101, 108, 115, 47, 101, 118, 111, 108, 117, 116, 105, 111, 110, 47, 99, 108, 111, 117, 100, 115, 112, 104, 101, 114, 101, 46, 109, 100, 108, 0
}


public plugin_init( )
{
	register_plugin( CX_Plugin, CX_Version, CX_Author );
	register_clcmd("say 1", "__KillDragonFX");
	register_clcmd("say 2", "KillDragonFX");
	register_clcmd("say 3", "go");
	
	register_native("KillDragonFX", "__KillDragonFX", 0);
}


public go(id)
{
	FxWBsky(100, 120, 0.00, 0.00, 0.00, 0.00);
    FxWMclouds(220, 120, 5.00, 0.00, 0.00, 0.00);
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





public plugin_precache()
{
	Lightning = precache_model("sprites/finalflashtrail.spr");
    precache_model(szWBskyModel);
    precache_model(szWMCloudsModel);
    FxLightningSpr = precache_model("sprites/lgtning.spr");
}