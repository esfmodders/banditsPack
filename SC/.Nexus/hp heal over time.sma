#include <amxmodx>
#include <amxmisc>
#include <engine>
#include <fun>
#include <hamsandwich>
#include <fakemeta>
#include <ipci/fxlib>
#include <ipci/core>
#include <ipci/ascend>
#include <ipci/dragonball>
#include <xs>


new const CX_Plugin[]	= 	"Ugandan knuckles";
new const CX_Version[]	=	"1337";
new const CX_Author[]	=	"BANDIT/C4";


new bool:healmaxdetect[32];


    


public plugin_init()
{
	register_plugin( CX_Plugin, CX_Version, CX_Author );

	RegisterHam( Ham_Spawn, "player", "HPloop", 1 );
	
	register_clcmd("say test", "HPloop");
	
}

HPloop (id)
{
	if (is_user_alive(id))
	{
		set_task(15.0, "HPloop",id);
	}

    if (healmaxdetect[id])
    {
		new hpnow = get_user_hp(id)

        if (hpmax > hpnow)
        {
            new hphf = (hpmax-hpnow)

            set_user_hp(id)(hpnow+(hphf*0,5)
        }
    }
    
	else
    {
		new hpmax = get_user_hp(id)
	
		healmaxdetect[id] = true;
    }
	
	
}
 