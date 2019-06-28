#include <amxx/amxmodx>
#include <fakemeta>
#include <ipci/ascend>
#include <ipci/Fxlib>
#include <engine>
#include <esf_util>
#include <fun>




#include < amxx/engine >


#include <ipci/Core>
#include < hamsandwich >
#include <amxmodx>
#include <amxmisc>
#include <amxx/fakemeta_util>



new bool:gohanglower[32];
new bool:tie[32];
new CloudSphere;
new bool:loop[32];
new bool:TELESPAM[32];
new bool:infight[32];
new bool:SpamP[32];
new bool:GK[32];

new bool:alteration[32];

new boool:gogetakamefix[32];

new bool:ssj5[32];
new bool:muiunlocked[32];
new bool:ssj3dabest[32];

// << Implement CX Interface >>
//#include <xtension/class/main>
//#include <xs>

 new Float: Delay[ 33 ];

public plugin_init()
{
	register_plugin("AdvMeleeMod", "1337", "BANDIT / C4 ");
	
	//register_clcmd("say x", "GOka");
	
	register_clcmd("say ssj5trans", "ssj5trans");
	
	register_clcmd("say .", "alter");
	
	register_event("DeathMsg", "Event_DeathMsg", "a" );
	
	register_clcmd("say ssj3trans", "ssj3rocks");
	
	register_message(get_user_msgid("MeleeTxtHud"), "MeleeText");
	register_message(get_user_msgid("MeleeTxtHud"), "AdvMeleeStates");
	
}

public ssj5trans(id)
{
	if(ssj5[id])
	{
		
		ssj5[id] = false;
	}
	else
	{
		
		ssj5[id] = true;
	}
}

public alter(id)
{
	alteration[id] = true
}


public Event_DeathMsg()
{
	new victim = read_data( 2 ); // second parameter (the victim !)
	
	alteration[victim] = false
}

public ssj3rocks(id)
{
	if(ssj3dabest[id])
	{
		
		ssj3dabest[id] = false;
	}
	else
	{
		
		ssj3dabest[id] = true;
	}
}

public client_PostThink( Client )
{
	if(!is_user_bot(Client) && !alteration[Client])
	{
		
	
	// Stance
	// Stun
	// wurf slow
	// wurf loslassen
		if( pev( Client, pev_sequence ) ==  126 && getClientCLASS( Client ) == getCXbyName( "Goku:Training Suit" ) && ( getClientLEVEL( Client ) <= 6 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			////set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  127 && getClientCLASS( Client ) == getCXbyName( "Goku:Training Suit" ) && ( getClientLEVEL( Client ) <= 6 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "Goku:Training Suit" ) && ( getClientLEVEL( Client ) <= 6 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  205 && getClientCLASS( Client ) == getCXbyName( "Goku:Training Suit" ) && ( getClientLEVEL( Client ) <= 6 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if(getClientCLASS( Client ) == getCXbyName( "Goku:Training Suit" ) && ( getClientLEVEL( Client ) == 7 ) )
		{	
			if(ssj5[Client])
			{
				if(pev( Client, pev_sequence ) ==  126)
				{
					//client_cmd(Client, "say Adv Meele!");
					////set_task(0.2,"teleport",Client);
					set_task(0.0,"Fastfight",Client);
					//set_task(2.0,"Teleport",Client);
					set_task(2.1,"REMADVM",Client);
				}
				else if(pev( Client, pev_sequence ) ==  127)
				{
					//client_cmd(Client, "say Adv Meele!");
					set_task(0.0,"Fastfight",Client);
					//set_task(2.0,"Teleport",Client);
					set_task(2.1,"REMADVM",Client);
				}
				else if(pev( Client, pev_sequence ) ==  203)
				{
					AddFx( Client, "fxPowerup", 0, 0, 0 );
					AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
					set_task(8.0,"Remtornado",Client);
				}
				else if(pev( Client, pev_sequence ) ==  205)
				{
					RemFx( Client, "fxPowerup");
					RemFx( Client, "fxModelEntity", 0);
				}
			}
			else
			{
				if(pev( Client, pev_sequence ) ==  137)
				{
					//client_cmd(Client, "say Adv Meele!");
					////set_task(0.2,"teleport",Client);
					set_task(0.0,"Fastfightui",Client);
					//set_task(2.0,"Teleport",Client);
					set_task(2.1,"REMADVM",Client);
				}
				else if(pev( Client, pev_sequence ) ==  138)
				{
					//client_cmd(Client, "say Adv Meele!");
					set_task(0.0,"Fastfightuievade",Client);
					//set_task(2.0,"Teleport",Client);
					set_task(2.1,"REMADVM",Client);
				}
				else if(pev( Client, pev_sequence ) ==  214)
				{
					AddFx( Client, "fxPowerup", 0, 0, 0 );
					AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
					set_task(8.0,"Remtornado",Client);
				}
				else if(pev( Client, pev_sequence ) ==  216)
				{
					RemFx( Client, "fxPowerup");
					RemFx( Client, "fxModelEntity", 0);
				}
			}
		}
		else if( pev( Client, pev_sequence ) ==  124 && getClientCLASS( Client ) == getCXbyName( "Vegeta:Training Suit" ) && ( getClientLEVEL( Client ) <= 1 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			////set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  125 && getClientCLASS( Client ) == getCXbyName( "Vegeta:Training Suit" ) && ( getClientLEVEL( Client ) <= 1 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  201 && getClientCLASS( Client ) == getCXbyName( "Vegeta:Training Suit" ) && ( getClientLEVEL( Client ) <= 1 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "Vegeta:Training Suit" ) && ( getClientLEVEL( Client ) <= 1 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}	
		else if(getClientCLASS( Client ) == getCXbyName( "Vegeta:Training Suit" ) && ( getClientLEVEL( Client ) >= 2 ) )
		{	
			if(ssj3dabest[Client])
			{
				if(pev( Client, pev_sequence ) ==  124)
				{	
					//client_cmd(Client, "say Adv Meele!");
					////set_task(0.2,"teleport",Client);
					set_task(0.0,"Fastfight",Client);
					//set_task(2.0,"Teleport",Client);
					set_task(2.1,"REMADVM",Client);
				}
				else if(pev( Client, pev_sequence ) ==  125)
				{	
					//client_cmd(Client, "say Adv Meele2!");
					set_task(0.0,"Fastfight",Client);
					//set_task(2.0,"Teleport",Client);
					set_task(2.1,"REMADVM",Client);
				}
				else if(pev( Client, pev_sequence ) ==  201)
				{	
					//client_cmd(Client, "say ssj wurf");
					AddFx( Client, "fxPowerup", 0, 0, 0 );
					AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
					set_task(8.0,"Remtornado",Client);
				}
				else if(pev( Client, pev_sequence ) ==  203)
				{
					//client_cmd(Client, "say ssj letgo");
					RemFx( Client, "fxPowerup");
					RemFx( Client, "fxModelEntity", 0);
				}
			}
			else
			{
				if(pev( Client, pev_sequence ) ==  123)
				{	
					//client_cmd(Client, "say ssj3Adv Meele!");
					////set_task(0.2,"teleport",Client);
					set_task(0.0,"Fastfight",Client);
					//set_task(2.0,"Teleport",Client);
					set_task(2.1,"REMADVM",Client);
				}
				else if(pev( Client, pev_sequence ) ==  124)
				{	
					//client_cmd(Client, "say ssj3 mele2");
					//client_cmd(Client, "say Adv Meele!");
					set_task(0.0,"Fastfight",Client);
					//set_task(2.0,"Teleport",Client);
					set_task(2.1,"REMADVM",Client);
				}
				else if(pev( Client, pev_sequence ) ==  200)
				{	
					//client_cmd(Client, "say ssj3 wurf");
					AddFx( Client, "fxPowerup", 0, 0, 0 );
					AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
					set_task(8.0,"Remtornado",Client);
				}
				else if(pev( Client, pev_sequence ) ==  201)
				{
					//client_cmd(Client, "say ssj3 letgo");
					RemFx( Client, "fxPowerup");
					RemFx( Client, "fxModelEntity", 0);
				}
			}
			
		}
		else if( pev( Client, pev_sequence ) ==  126 && getClientCLASS( Client ) == getCXbyName( "Vegetto" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  127 && getClientCLASS( Client ) == getCXbyName( "Vegetto" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "Vegetto" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  205 && getClientCLASS( Client ) == getCXbyName( "Vegetto" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  135 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) <= 3 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  136 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) <= 3 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  212 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) <= 3 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  214 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) <= 3 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  135 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) == 5 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  136 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) == 5 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  212 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) == 5 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  214 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) == 5 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  135 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) == 6 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  136 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) == 6 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  110 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) == 6 ) )
		{	
			set_task(0.3, "Gogetakame",Client);	         
			
		}
		else if( pev( Client, pev_sequence ) ==  136 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) == 6 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  212 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) == 6 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  214 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) == 6 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  117 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) == 4 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  118 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) == 4 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  194 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) == 4 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  195 && getClientCLASS( Client ) == getCXbyName( "Gogeta" ) && ( getClientLEVEL( Client ) == 4 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}		
		else if( pev( Client, pev_sequence ) ==  124 && getClientCLASS( Client ) == getCXbyName( "Frieza" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  125 && getClientCLASS( Client ) == getCXbyName( "Frieza" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  201 && getClientCLASS( Client ) == getCXbyName( "Frieza" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "Frieza" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}	
		else if( pev( Client, pev_sequence ) ==  133 && getClientCLASS( Client ) == getCXbyName( "Future Gohan DBZ" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  134 && getClientCLASS( Client ) == getCXbyName( "Future Gohan DBZ" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  210 && getClientCLASS( Client ) == getCXbyName( "Future Gohan DBZ" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  212 && getClientCLASS( Client ) == getCXbyName( "Future Gohan DBZ" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}	
		else if( pev( Client, pev_sequence ) ==  119 && getClientCLASS( Client ) == getCXbyName( "Trunks-AF" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  120 && getClientCLASS( Client ) == getCXbyName( "Trunks-AF" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  196 && getClientCLASS( Client ) == getCXbyName( "Trunks-AF" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  198 && getClientCLASS( Client ) == getCXbyName( "Trunks-AF" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  128 && getClientCLASS( Client ) == getCXbyName( "Cell" ) && ( getClientLEVEL( Client ) < 4 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  129 && getClientCLASS( Client ) == getCXbyName( "Cell" ) && ( getClientLEVEL( Client ) < 4 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  205 && getClientCLASS( Client ) == getCXbyName( "Cell" ) && ( getClientLEVEL( Client ) < 4 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  207 && getClientCLASS( Client ) == getCXbyName( "Cell" ) && ( getClientLEVEL( Client ) < 4 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  127 && getClientCLASS( Client ) == getCXbyName( "Broly" ) && ( getClientLEVEL( Client ) < 6 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  128 && getClientCLASS( Client ) == getCXbyName( "Broly" ) && ( getClientLEVEL( Client ) < 6 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  204 && getClientCLASS( Client ) == getCXbyName( "Broly" ) && ( getClientLEVEL( Client ) < 6 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  206 && getClientCLASS( Client ) == getCXbyName( "Broly" ) && ( getClientLEVEL( Client ) < 6 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  131 && getClientCLASS( Client ) == getCXbyName( "A18" ) && ( getClientLEVEL( Client ) < 2 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  132 && getClientCLASS( Client ) == getCXbyName( "A18" ) && ( getClientLEVEL( Client ) < 2 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  208 && getClientCLASS( Client ) == getCXbyName( "A18" ) && ( getClientLEVEL( Client ) < 2 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  210 && getClientCLASS( Client ) == getCXbyName( "A18" ) && ( getClientLEVEL( Client ) < 2 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  124 && getClientCLASS( Client ) == getCXbyName( "Chichi" ) && ( getClientLEVEL( Client ) < 2 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  125 && getClientCLASS( Client ) == getCXbyName( "Chichi" ) && ( getClientLEVEL( Client ) < 2 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  201 && getClientCLASS( Client ) == getCXbyName( "Chichi" ) && ( getClientLEVEL( Client ) < 2 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "Chichi" ) && ( getClientLEVEL( Client ) < 2 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  126 && getClientCLASS( Client ) == getCXbyName( "Black" ) && ( getClientLEVEL( Client ) < 1 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  127 && getClientCLASS( Client ) == getCXbyName( "Black" ) && ( getClientLEVEL( Client ) < 1 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "Black" ) && ( getClientLEVEL( Client ) < 1 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  205 && getClientCLASS( Client ) == getCXbyName( "Black" ) && ( getClientLEVEL( Client ) < 1 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  128 && getClientCLASS( Client ) == getCXbyName( "Black" ) && ( getClientLEVEL( Client ) >= 1 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  129 && getClientCLASS( Client ) == getCXbyName( "Black" ) && ( getClientLEVEL( Client ) >= 1 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  205 && getClientCLASS( Client ) == getCXbyName( "Black" ) && ( getClientLEVEL( Client ) >= 1 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  207 && getClientCLASS( Client ) == getCXbyName( "Black" ) && ( getClientLEVEL( Client ) >= 1 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  126 && getClientCLASS( Client ) == getCXbyName( "Zamasu" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  127 && getClientCLASS( Client ) == getCXbyName( "Zamasu" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "Zamasu" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  205 && getClientCLASS( Client ) == getCXbyName( "Zamasu" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  126 && getClientCLASS( Client ) == getCXbyName( "Zamasu-Fusion" ) && ( getClientLEVEL( Client ) < 3 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  127 && getClientCLASS( Client ) == getCXbyName( "Zamasu-Fusion" ) && ( getClientLEVEL( Client ) < 3 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "Zamasu-Fusion" ) && ( getClientLEVEL( Client ) < 3 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  205 && getClientCLASS( Client ) == getCXbyName( "Zamasu-Fusion" ) && ( getClientLEVEL( Client ) < 3 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  126 && getClientCLASS( Client ) == getCXbyName( "Zamasu-Fusion" ) && ( getClientLEVEL( Client ) >= 3 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  127 && getClientCLASS( Client ) == getCXbyName( "Zamasu-Fusion" ) && ( getClientLEVEL( Client ) >= 3 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "Zamasu-Fusion" ) && ( getClientLEVEL( Client ) >= 3 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  205 && getClientCLASS( Client ) == getCXbyName( "Zamasu-Fusion" ) && ( getClientLEVEL( Client ) >= 3 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  163 && getClientCLASS( Client ) == getCXbyName( "Bechi" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"FastfightB",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  164 && getClientCLASS( Client ) == getCXbyName( "Bechi" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"FastfightB",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  240 && getClientCLASS( Client ) == getCXbyName( "Bechi" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  242 && getClientCLASS( Client ) == getCXbyName( "Bechi" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}	
		else if( pev( Client, pev_sequence ) ==  126 && getClientCLASS( Client ) == getCXbyName( "B32" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  127 && getClientCLASS( Client ) == getCXbyName( "B32" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "B32" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  205 && getClientCLASS( Client ) == getCXbyName( "B32" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  127 && getClientCLASS( Client ) == getCXbyName( "Bergamo" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  128 && getClientCLASS( Client ) == getCXbyName( "Bergamo" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  204 && getClientCLASS( Client ) == getCXbyName( "Bergamo" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  206 && getClientCLASS( Client ) == getCXbyName( "Bergamo" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  128 && getClientCLASS( Client ) == getCXbyName( "Bills" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  129 && getClientCLASS( Client ) == getCXbyName( "Bills" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  205 && getClientCLASS( Client ) == getCXbyName( "Bills" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  207 && getClientCLASS( Client ) == getCXbyName( "Bills" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  122 && getClientCLASS( Client ) == getCXbyName( "Buu" ) && ( getClientLEVEL( Client ) <= 2 ) ) 
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  123 && getClientCLASS( Client ) == getCXbyName( "Buu" ) && ( getClientLEVEL( Client ) <= 2 ) ) 
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  199 && getClientCLASS( Client ) == getCXbyName( "Buu" ) && ( getClientLEVEL( Client ) <= 2 ) ) 
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  201 && getClientCLASS( Client ) == getCXbyName( "Buu" ) && ( getClientLEVEL( Client ) <= 2 ) ) 
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  124 && getClientCLASS( Client ) == getCXbyName( "Buu" ) && ( getClientLEVEL( Client ) == 3 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  125 && getClientCLASS( Client ) == getCXbyName( "Buu" ) && ( getClientLEVEL( Client ) == 3 ) ) 
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  201 && getClientCLASS( Client ) == getCXbyName( "Buu" ) && ( getClientLEVEL( Client ) == 3 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "Buu" ) && ( getClientLEVEL( Client ) == 3 ) ) 
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  122 && getClientCLASS( Client ) == getCXbyName( "Buza" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  123 && getClientCLASS( Client ) == getCXbyName( "Buza" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  199 && getClientCLASS( Client ) == getCXbyName( "Buza" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  201 && getClientCLASS( Client ) == getCXbyName( "Buza" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  126 && getClientCLASS( Client ) == getCXbyName( "Hit" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  127 && getClientCLASS( Client ) == getCXbyName( "Hit" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "Hit" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  205 && getClientCLASS( Client ) == getCXbyName( "Hit" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  123 && getClientCLASS( Client ) == getCXbyName( "Krillin" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  124 && getClientCLASS( Client ) == getCXbyName( "Krillin" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  200 && getClientCLASS( Client ) == getCXbyName( "Krillin" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  202 && getClientCLASS( Client ) == getCXbyName( "Krillin" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  124 && getClientCLASS( Client ) == getCXbyName( "Gohan" ) && ( getClientLEVEL( Client ) <= 1 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  125 && getClientCLASS( Client ) == getCXbyName( "Gohan" ) && ( getClientLEVEL( Client ) <= 1 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  201 && getClientCLASS( Client ) == getCXbyName( "Gohan" ) && ( getClientLEVEL( Client ) <= 1 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "Gohan" ) && ( getClientLEVEL( Client ) <= 1 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  126 && getClientCLASS( Client ) == getCXbyName( "Gohan" ) && ( getClientLEVEL( Client ) == 2 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  127 && getClientCLASS( Client ) == getCXbyName( "Gohan" ) && ( getClientLEVEL( Client ) == 2 ))
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "Gohan" ) && ( getClientLEVEL( Client ) == 2 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  205 && getClientCLASS( Client ) == getCXbyName( "Gohan" ) && ( getClientLEVEL( Client ) == 2 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  111 && getClientCLASS( Client ) == getCXbyName( "Gohan" ) && ( getClientLEVEL( Client ) == 2 ))
		{	
			if (!gohanglower[Client] && !esf_get_fly(Client))
			{
				gohanglow(Client)
				gohanglower[Client] = true;
			}
			
		}
		else if( pev( Client, pev_sequence ) ==  127 && getClientCLASS( Client ) == getCXbyName( "Omegashenron" ) && ( getClientLEVEL( Client ) == 0 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  128 && getClientCLASS( Client ) == getCXbyName( "Omegashenron" ) && ( getClientLEVEL( Client ) == 0 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  204 && getClientCLASS( Client ) == getCXbyName( "Omegashenron" ) && ( getClientLEVEL( Client ) == 0 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  206 && getClientCLASS( Client ) == getCXbyName( "Omegashenron" ) && ( getClientLEVEL( Client ) == 0 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  124 && getClientCLASS( Client ) == getCXbyName( "Omegashenron" ) && ( getClientLEVEL( Client ) == 1 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  125 && getClientCLASS( Client ) == getCXbyName( "Omegashenron" ) && ( getClientLEVEL( Client ) == 1 ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  201 && getClientCLASS( Client ) == getCXbyName( "Omegashenron" ) && ( getClientLEVEL( Client ) == 1 ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "Omegashenron" ) && ( getClientLEVEL( Client ) == 1 ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  126 && getClientCLASS( Client ) == getCXbyName( "Piccolo" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  127 && getClientCLASS( Client ) == getCXbyName( "Piccolo" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  203 && getClientCLASS( Client ) == getCXbyName( "Piccolo" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  205 && getClientCLASS( Client ) == getCXbyName( "Piccolo" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  135 && getClientCLASS( Client ) == getCXbyName( "Picohan" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			//set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfightp",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  136 && getClientCLASS( Client ) == getCXbyName( "Picohan" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfightp",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  212 && getClientCLASS( Client ) == getCXbyName( "Picohan" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  214 && getClientCLASS( Client ) == getCXbyName( "Picohan" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  125 && getClientCLASS( Client ) == getCXbyName( "Bardock" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			////set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  126 && getClientCLASS( Client ) == getCXbyName( "Bardock" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  202 && getClientCLASS( Client ) == getCXbyName( "Bardock" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  204 && getClientCLASS( Client ) == getCXbyName( "Bardock" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  127 && getClientCLASS( Client ) == getCXbyName( "Muten-Roshi" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			////set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  128 && getClientCLASS( Client ) == getCXbyName( "Muten-Roshi" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  204 && getClientCLASS( Client ) == getCXbyName( "Muten-Roshi" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  206 && getClientCLASS( Client ) == getCXbyName( "Muten-Roshi" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
		else if( pev( Client, pev_sequence ) ==  127 && getClientCLASS( Client ) == getCXbyName( "Jiren" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			////set_task(0.2,"teleport",Client);
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  128 && getClientCLASS( Client ) == getCXbyName( "Jiren" ) )
		{	
			//client_cmd(Client, "say Adv Meele!");
			set_task(0.0,"Fastfight",Client);
			//set_task(2.0,"Teleport",Client);
			set_task(2.1,"REMADVM",Client);
		}
		else if( pev( Client, pev_sequence ) ==  204 && getClientCLASS( Client ) == getCXbyName( "Jiren" ) )
		{	
			AddFx( Client, "fxPowerup", 0, 0, 0 );
			AddFx( Client, "fxModelEntity", "models/evolution/Auras/sv_trans.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 1.5, 0, 4 );
			set_task(8.0,"Remtornado",Client);
		}	
		else if( pev( Client, pev_sequence ) ==  206 && getClientCLASS( Client ) == getCXbyName( "Jiren" ) )
		{	
			RemFx( Client, "fxPowerup");
			RemFx( Client, "fxModelEntity", 0);
		}
	}
}

public gohanglow(id)
{
	
		emit_sound( id, CHAN_ITEM, "oozaru/oozaruscream.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );
		setClientMODEL( id, "GGKHH" );
		//setClientANIMATION(id, 111, 1.0);
		
		set_task(0.5, "gohanglow2",id);
}

public gohanglow2(id)
{
	if( pev( id, pev_sequence ) ==  111 && getClientCLASS( id ) == getCXbyName( "Gohan" ) && ( getClientLEVEL( id ) == 2 ))
	{
		set_task(0.5, "gohanglow2",id);
	}
	else
	{	
		
	
		// instblue setClientDATAc( Client, cliLevel, __int_Level );
		setClientMODEL( id, "ecx.gohan.ssj2" );
	
		setClientANIMATION(id, -1 ,1.0);
	
		gohanglower[id] = false;
	}
	
}

public GOka(id)
{
	@Createkameaura(100, id, id, 1.0, 0);
}


public @Createkameaura (__int_Entity, const __int_Owner, const __int_Victim, const Float:__float_Scale, const __int_Velocity)
{
	__int_Entity = create_entity("info_target");
	
	entity_set_model(__int_Entity, "models/evo/auraG.mdl");
	
	entity_set_int(__int_Entity, EV_INT_spawnflags, SF_SPRITE_STARTON);
	
	DispatchSpawn(__int_Entity);
	
	entity_set_int(__int_Entity, EV_INT_renderfx, kRenderFxGlowShell);
	entity_set_int(__int_Entity, EV_INT_rendermode, kRenderTransAdd);
	
	entity_set_float(__int_Entity, EV_FL_animtime, get_gametime());
	entity_set_float(__int_Entity, EV_FL_framerate, float(10));
	
	entity_set_string(__int_Entity, EV_SZ_classname, "gogetaaura");
	
	entity_set_float(__int_Entity, EV_FL_renderamt, float(254));
	
	entity_set_float(__int_Entity, EV_FL_scale, __float_Scale);
	
	entity_set_int(__int_Entity, EV_INT_movetype, MOVETYPE_FOLLOW);
	
	entity_set_edict( __int_Entity, EV_ENT_aiment, pev_owner );
	
	entity_set_size(__int_Entity, Float:{-7.000_000, -7.000_000, -7.000_000}, Float:{7.000_000, 7.000_000, 7.000_000});
	
	//entity_set_int(__int_Entity, EV_INT_solid, SOLID_TRIGGER);
	
	entity_set_edict(__int_Entity, EV_ENT_owner, __int_Owner);
	
	set_pev(__int_Entity,pev_owner, __int_Owner);
	entity_set_int(__int_Entity, EV_INT_iuser4, __int_Victim);
	
	entity_set_edict(__int_Entity, EV_ENT_pContainingEntity, __int_Entity);
	
	static Float:__float_Origin[3];
	entity_get_vector(__int_Victim, EV_VEC_origin, __float_Origin);
	
	entity_set_origin(__int_Entity, __float_Origin);
	
	//set_task(12.0, "removespiral",__int_Entity);
	
}


public Gogetakame(id)
{
	//client_cmd(id, "say loop");
	
	

	AddFx( id, "fxModelEntity", "models/evo/auraG.mdl", 0, 0, 50.0, 0, 0, 0, 4.0, 0.2, 0, 1 );
		

	set_task(0.3, "Gogetakame2",id);	                    
		
		
	
}





public Gogetakame2(id)
{

	RemFx( id, "fxModelEntity", 0);
}

public Fastfight (Client)
{
	if(loop[Client])
		set_task(1.0,"Fastfight",Client);
		
		
	//infight[Client] = true
	
	setClientANIMATION(Client,random_num(130,150) ,2.0);
	set_task(0.2,"teleport",Client);
}
public Fastfightui (Client)
{
	if(loop[Client])
		set_task(1.0,"Fastfightui",Client);
		
	//infight[Client] = true	
	
	setClientANIMATION(Client,random_num(140,163) ,2.0);
	set_task(0.2,"teleport",Client);
}
public Fastfightuievade (Client)
{
	if(loop[Client])
		set_task(1.0,"Fastfightuievade",Client);
		
	//infight[Client] = true
	
	setClientANIMATION(Client,random_num(140,163) ,2.0);
	set_task(0.2,"teleport",Client);
}

public Fastfightgok (Client)
{
	if(loop[Client])
		set_task(1.0,"Fastfight",Client);
		
	//infight[Client] = true
	
	setClientANIMATION(Client,random_num(140,187) ,2.0);
	set_task(0.2,"teleport",Client);
}

public FastfightB (Client)
{
	if(loop[Client])
		set_task(1.0,"FastfightB",Client);
		
	//infight[Client] = true
	
	setClientANIMATION(Client,random_num(166,213) ,2.0);
	set_task(0.2,"teleport",Client);
}

public Fastfightp (Client)
{
	if(loop[Client])
		set_task(1.0,"Fastfightp",Client);
		
	//infight[Client] = true	
	
	setClientANIMATION(Client,random_num(138,185) ,2.0);
	set_task(0.2,"teleport",Client);
}

public teleport (id)
{
	if (SpamP[id])
	{		
	}
	else
	{
		AddFx( id, "fxSprite", "sprites/onda.spr", 15, 200, 0, 0, 0 );
		set_task(0.2,"teleport2",id);
		SpamP[id] = true;	
		emit_sound( id, CHAN_BODY, "weapons/meleeflash.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );
	}
}

public teleport2 (id)
{
	set_task(0.2,"teleport3",id);

	//client_cmd(id, "say TELEPORT");
	
	new vOldLocation[3], vNewLocation[3];

	get_user_origin( id, vOldLocation );
	get_user_origin( id, vNewLocation, 0 ); 

	new finished = 50;
	
		while(finished > 0)
		{
			vNewLocation[0] += random_num( -200, 200 );		
			vNewLocation[1] += random_num( -200, 200 );
			vNewLocation[1] += random_num( 50, 100 );
			
	
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


public teleportX2(Client)
{
	new vOldLocation[3], vNewLocation[3];
	get_user_origin( Client, vOldLocation );
	get_user_origin( Client, vNewLocation, 0 ); 
	
	new Float: start5[ 3 ], Float: end5[ 3 ] = { 0.0, 0.0, -9000.0 };
	pev( Client, pev_origin, start5 );

	xs_vec_add(start5, end5, end5)
	engfunc(EngFunc_TraceLine, start5, end5, 0, Client, 0)
	get_tr2(0, TR_vecEndPos, end5)

	new Float: origin5[ 3 ];
	origin5[ 0 ] = end5[ 0 ];
	origin5[ 1 ] = end5[ 1 ];
	origin5[ 2 ] = end5[ 2 ];
	
	new Float: start6[ 3 ], Float: end6[ 3 ] = { 0.0, 0.0, 9000.0 };
	pev( Client, pev_origin, start6 );

	xs_vec_add(start6, end6, end6)
	engfunc(EngFunc_TraceLine, start6, end6, 0, Client, 0)
	get_tr2(0, TR_vecEndPos, end6)

	new Float: origin6[ 3 ];
	origin6[ 0 ] = end6[ 0 ];
	origin6[ 1 ] = end6[ 1 ];
	origin6[ 2 ] = end6[ 2 ];

	new finished = 50;
    
	while(finished > 0)
	{
				
			vNewLocation[2] += random_num( -1500, 1500 ); 
    
			static duck;
			duck = (pev(Client, pev_flags) & FL_DUCKING);
            
			engfunc(EngFunc_TraceHull, vOldLocation, vNewLocation, IGNORE_MONSTERS, duck ? HULL_HEAD : HULL_HUMAN, Client, 0);
            
			if(get_tr2(0, TR_pHit) == -1)
            {

				set_user_origin( Client, vNewLocation );
                
				if(vNewLocation[2] < origin5[2])
				{
					origin5[ 2 ] += 80.0
					set_pev( Client, pev_origin, origin5 );
				}
				if(vNewLocation[2] > origin6[2])
				{
					origin6[ 2 ] -= 80.0
					set_pev( Client, pev_origin, origin6 );
				}
				
				teleport26(Client)
				
				finished = 0
                
			}
			else
			{
                finished--;
                
			}
	}
    
}
public teleport26(Client)
{
	new vOldLocation[3], vNewLocation[3];
	get_user_origin( Client, vOldLocation );
	get_user_origin( Client, vNewLocation, 0 ); 
	
	new Float: start[ 3 ], Float: end[ 3 ] = { -9000.0, 0.0, 0.0 };
	pev( Client, pev_origin, start );

	xs_vec_add(start, end, end)
	engfunc(EngFunc_TraceLine, start, end, 0, Client, 0)
	get_tr2(0, TR_vecEndPos, end)

	new Float: origin[ 3 ];
	origin[ 0 ] = end[ 0 ];
	origin[ 1 ] = end[ 1 ];
	origin[ 2 ] = end[ 2 ];
	
	
	new Float: start2[ 3 ], Float: end2[ 3 ] = { 9000.0, 0.0, 0.0 };
	pev( Client, pev_origin, start2 );

	xs_vec_add(start2, end2, end2)
	engfunc(EngFunc_TraceLine, start2, end2, 0, Client, 0)
	get_tr2(0, TR_vecEndPos, end2)

	new Float: origin2[ 3 ];
	origin2[ 0 ] = end2[ 0 ];
	origin2[ 1 ] = end2[ 1 ];
	origin2[ 2 ] = end2[ 2 ];
	

	new finished = 50;
    
	while(finished > 0)
	{
				
			vNewLocation[0] += random_num( -1500, 1500 );
    
			static duck;
			duck = (pev(Client, pev_flags) & FL_DUCKING);
            
			engfunc(EngFunc_TraceHull, vOldLocation, vNewLocation, IGNORE_MONSTERS, duck ? HULL_HEAD : HULL_HUMAN, Client, 0);
            
			if(get_tr2(0, TR_pHit) == -1)
            {

				set_user_origin( Client, vNewLocation );
                
				if(vNewLocation[0] < origin[0])
				{
					origin[ 0 ] += 50.0
					set_pev( Client, pev_origin, origin );
				}
				if(vNewLocation[0] > origin2[0])
				{
					origin2[ 0 ] -= 50.0
					set_pev( Client, pev_origin, origin2 );
				}
				
				teleport27(Client)
				
				finished = 0
                
			}
			else
			{
                finished--;
                
			}
	}
    
}
public teleport27(Client)
{
	new vOldLocation[3], vNewLocation[3];
	get_user_origin( Client, vOldLocation );
	get_user_origin( Client, vNewLocation, 0 ); 
	
	new Float: start3[ 3 ], Float: end3[ 3 ] = { 0.0, -9000.0, 0.0 };
	pev( Client, pev_origin, start3 );

	xs_vec_add(start3, end3, end3)
	engfunc(EngFunc_TraceLine, start3, end3, 0, Client, 0)
	get_tr2(0, TR_vecEndPos, end3)

	new Float: origin3[ 3 ];
	origin3[ 0 ] = end3[ 0 ];
	origin3[ 1 ] = end3[ 1 ];
	origin3[ 2 ] = end3[ 2 ];
	
	new Float: start4[ 3 ], Float: end4[ 3 ] = { 0.0, 9000.0, 0.0 };
	pev( Client, pev_origin, start4 );

	xs_vec_add(start4, end4, end4)
	engfunc(EngFunc_TraceLine, start4, end4, 0, Client, 0)
	get_tr2(0, TR_vecEndPos, end4)

	new Float: origin4[ 3 ];
	origin4[ 0 ] = end4[ 0 ];
	origin4[ 1 ] = end4[ 1 ];
	origin4[ 2 ] = end4[ 2 ];

	new finished = 50;
    
	while(finished > 0)
	{    
			vNewLocation[1] += random_num( -1500, 1500 );
    
			static duck;
			duck = (pev(Client, pev_flags) & FL_DUCKING);
            
			engfunc(EngFunc_TraceHull, vOldLocation, vNewLocation, IGNORE_MONSTERS, duck ? HULL_HEAD : HULL_HUMAN, Client, 0);
            
			if(get_tr2(0, TR_pHit) == -1)
            {

				set_user_origin( Client, vNewLocation );
                
				if(vNewLocation[1] < origin3[1])
				{
					origin3[ 1 ] += 50.0
					set_pev( Client, pev_origin, origin3 );
				}
				if(vNewLocation[1] > origin4[1])
				{
					origin4[ 1 ] -= 50.0
					set_pev( Client, pev_origin, origin4 );
				}
				
				finished = 0
                
			}
			else
			{
                finished--;
                
			}
	}
    
}


public teleport1337(Client)
{
	set_task(1.0,"teleport1337", Client);

	client_cmd(Client, "say TELEPORT");
	
	new vOldLocation[3], vNewLocation[3];

	get_user_origin( Client, vOldLocation );
	get_user_origin( Client, vNewLocation, 0 ); 
	
	//START
	
	new Float: start[ 3 ], Float: end[ 3 ] = { -9000.0, 0.0, 0.0 };
	pev( Client, pev_origin, start );

	xs_vec_add(start, end, end)
	engfunc(EngFunc_TraceLine, start, end, 0, Client, 0)
	get_tr2(0, TR_vecEndPos, end)

	new Float: origin[ 3 ];
	origin[ 0 ] = end[ 0 ];
	origin[ 1 ] = end[ 1 ];
	origin[ 2 ] = end[ 2 ];
	
	
	new Float: start2[ 3 ], Float: end2[ 3 ] = { 9000.0, 0.0, 0.0 };
	pev( Client, pev_origin, start2 );

	xs_vec_add(start2, end2, end2)
	engfunc(EngFunc_TraceLine, start2, end2, 0, Client, 0)
	get_tr2(0, TR_vecEndPos, end2)

	new Float: origin2[ 3 ];
	origin2[ 0 ] = end2[ 0 ];
	origin2[ 1 ] = end2[ 1 ];
	origin2[ 2 ] = end2[ 2 ];
	
	new Float: start3[ 3 ], Float: end3[ 3 ] = { 0.0, -9000.0, 0.0 };
	pev( Client, pev_origin, start3 );

	xs_vec_add(start3, end3, end3)
	engfunc(EngFunc_TraceLine, start3, end3, 0, Client, 0)
	get_tr2(0, TR_vecEndPos, end3)

	new Float: origin3[ 3 ];
	origin3[ 0 ] = end3[ 0 ];
	origin3[ 1 ] = end3[ 1 ];
	origin3[ 2 ] = end3[ 2 ];
	
	new Float: start4[ 3 ], Float: end4[ 3 ] = { 0.0, 9000.0, 0.0 };
	pev( Client, pev_origin, start4 );

	xs_vec_add(start4, end4, end4)
	engfunc(EngFunc_TraceLine, start4, end4, 0, Client, 0)
	get_tr2(0, TR_vecEndPos, end4)

	new Float: origin4[ 3 ];
	origin4[ 0 ] = end4[ 0 ];
	origin4[ 1 ] = end4[ 1 ];
	origin4[ 2 ] = end4[ 2 ];
	
	new Float: start5[ 3 ], Float: end5[ 3 ] = { 0.0, 0.0, -9000.0 };
	pev( Client, pev_origin, start5 );

	xs_vec_add(start5, end5, end5)
	engfunc(EngFunc_TraceLine, start5, end5, 0, Client, 0)
	get_tr2(0, TR_vecEndPos, end5)

	new Float: origin5[ 3 ];
	origin5[ 0 ] = end5[ 0 ];
	origin5[ 1 ] = end5[ 1 ];
	origin5[ 2 ] = end5[ 2 ];
	
	new Float: start6[ 3 ], Float: end6[ 3 ] = { 0.0, 0.0, 9000.0 };
	pev( Client, pev_origin, start6 );

	xs_vec_add(start6, end6, end6)
	engfunc(EngFunc_TraceLine, start6, end6, 0, Client, 0)
	get_tr2(0, TR_vecEndPos, end6)

	new Float: origin6[ 3 ];
	origin6[ 0 ] = end6[ 0 ];
	origin6[ 1 ] = end6[ 1 ];
	origin6[ 2 ] = end6[ 2 ];
	
	
	//END

	new finished = 50;
    
	while(finished > 0)
	{
				
			vNewLocation[0] += random_num( -1500, 1500 );        
			vNewLocation[1] += random_num( -1500, 1500 );
			vNewLocation[2] += random_num( -1500, 1500 ); 
    
			static duck;
			duck = (pev(Client, pev_flags) & FL_DUCKING);
            
			engfunc(EngFunc_TraceHull, vOldLocation, vNewLocation, IGNORE_MONSTERS, duck ? HULL_HEAD : HULL_HUMAN, Client, 0);
            
			if(get_tr2(0, TR_pHit) == -1)
            {

				set_user_origin( Client, vNewLocation );
                
				if(vNewLocation[0] < origin[0])
				{
					origin[ 0 ] += 50.0
					set_pev( Client, pev_origin, origin );
				}
				if(vNewLocation[0] > origin2[0])
				{
					origin2[ 0 ] -= 50.0
					set_pev( Client, pev_origin, origin2 );
				}
				if(vNewLocation[1] < origin3[1])
				{
					origin3[ 1 ] += 50.0
					set_pev( Client, pev_origin, origin3 );
				}
				if(vNewLocation[1] > origin4[1])
				{
					origin4[ 1 ] -= 50.0
					set_pev( Client, pev_origin, origin4 );
				}
				if(vNewLocation[2] < origin5[2])
				{
					origin5[ 2 ] += 50.0
					set_pev( Client, pev_origin, origin5 );
				}
				if(vNewLocation[2] > origin6[2])
				{
					origin6[ 2 ] -= 50.0
					set_pev( Client, pev_origin, origin6 );
				}
				
				finished = 0
                
			}
			else
			{
                finished--;
                
			}
	}
    
}




public teleport3 (id)
{
	emit_sound( id, CHAN_BODY, "weapons/meleeflash.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );
	AddFx( id, "fxSprite", "sprites/onda.spr", 15, 200, 0, 0, 0 );
	set_task( random_float( 0.5, 1.5 ),"teleR", id);
}



public teleR (id)
{
	SpamP[id] = false;	
	//set_task(0.5,"teleport2", id);
}

public Remtornado (Client)
{
	RemFx( Client, "fxModelEntity", 0);
}



// client command function just for testing. remove if no longer needed.
public NewFX(id)
{
	//client_print(id, print_console, "NewFX on id %d", id);
	
	set_task(1.0,"Effects",id);
	
	return 1;
}

// client command function just for testing. remove if no longer needed.
public RemoveFX(id)
{
	//client_print(id, print_console, "RemoveFX");
	
	set_task(1.0,"RemoveAll",id);
	
	return 1;
}

public MeleeText(MsgID, dest, id)
{
	// output just for testing. remove if no longer needed.
	//client_print(id, print_chat, "variable: %d",get_msg_arg_int(1))

	if(get_msg_arg_int(1) == 11 )		// Blockbreaker
	{
		Rays(id);
		//set_task(0.1,"Effects2",id);
		AddFx( id, "fxSprite", "sprites/onda.spr", 15, 200, 0, 0, 0 );
		emit_sound( id, CHAN_BODY, "weapons/meleeflash.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );
		//set_task(2.0,"RemoveAll",id);
		
		//tie[id] = false;
	}
	if(get_msg_arg_int(1) == 12 )	// Win
	{
		set_task(2.0,"RemoveAll",id);
		AddFx( id, "fxSprite", "sprites/onda.spr", 15, 200, 0, 0, 0 );
		emit_sound( id, CHAN_BODY, "weapons/meleeflash.wav", 1.0, ATTN_NORM, 0, PITCH_NORM );
		
		tie[id] = false;
	}
	if(get_msg_arg_int(1) == 13 )	// Loser
	{
		set_task(2.0,"RemoveAll",id);
		
		tie[id] = false;
	}
	if(get_msg_arg_int(1) == 14 )	// Tie
	{
		if(tie[id])
		{
			set_task(2.0,"RemoveAll",id);
			
			tie[id] = false;
		}
		else
		{
			Rays(id);
			set_task(0.1,"Effects2",id);
			AddFx( id, "fxScreenShake", 50.0, 5.0, 5.0 );
			AddFx( id, "fxBlow" );
			
			tie[id] = true;			
		}
	}
	if(get_msg_arg_int(1) == 15 )	// Headon
	{
		Rays(id);
		CloudSphereFX(id);
		set_task(0.1,"Effects",id);
		//set_task(4.8,"RemoveAll",id);
		AddFx( id, "fxScreenShake", 50.0, 5.0, 5.0 ); 	// Effects already got a screenshake!
		AddFx( id, "fxBlow" );							// Effects already got multiple blows!
		AddFx( id, "fxSprite", "sprites/onda.spr", 15, 200, 0, 0, 0 );
	}
	if(get_msg_arg_int(1) == 16 )	// Powerhit
	{
		Rays(id);
		set_task(0.1,"Effects2",id);
		set_task(0.8,"RemoveAll",id);
		set_task(1.0,"RT",id);
		//remove_task(id)
		
		tie[id] = false;
	}
}


public RT(id)
{
	remove_task(id)
}


public Rays(id)
{
	static Float:Origin[3];
	entity_get_vector(id, EV_VEC_origin, Origin);
	
	message_begin(MSG_BROADCAST, SVC_TEMPENTITY)
	{
		write_byte(TE_BEAMENTPOINT);
		write_short(id | 0x1000);
		write_coord(floatround(Origin[0])+ random_num(-10, 10));
		write_coord(floatround(Origin[1])+ random_num(-10, 10));
		write_coord(floatround(Origin[2])+ random_num(-10, 10));
		write_short( engfunc( EngFunc_ModelIndex,"sprites/lgtning.spr" ) );
		write_byte(2); // Starting Frame
		write_byte(3); // Framerate
		write_byte(15); // Life
		write_byte(10); // Width
		write_byte(50); // Noise
		write_byte(255); // Red
		write_byte(255); // Green
		write_byte(255); // Blue
		write_byte(138); // Brightness
		write_byte(55); // Speed
	}
	message_end();
}

public CloudSphereFX( id ) 
{
	new org[3];
	get_user_origin(id, org);
	
	for(new i; i < 30; i++) 
    { 
		message_begin( MSG_PVS, SVC_TEMPENTITY, org ); 
		{
			write_byte( TE_BEAMENTPOINT ); 
			write_short( id ); //start entity 
			write_coord( org[0] + random_num(-200, 200)); //end position X 
			write_coord( org[1] + random_num(-200, 200)); //end position Y 
			write_coord( org[2] + random_num(-200, 200)); //end positon Z 
			write_short( CloudSphere ); //set spr file 
			write_byte( 3 ); //starting frame 
			write_byte( 5 ); //frame rate in 0.1's 
			write_byte( 90 ); //life in 0.1's 
			write_byte( 255 ); //line width in 0.1's 
			write_byte( 0 ); //noise amplitude in 0.01's 
			write_byte( 10 ); //R 
			write_byte( 10 ); //G 
			write_byte( 10 ); //B 
			write_byte( 250 ); //Brightness 
			write_byte( 20 ); //scroll speed in 0.1's 
		}
		message_end( ); 
	}
} 

public Effects(id)
{
	AddFx( id, "fxLgtField", 0.2, 3, 255, 100);
	AddFx( id, "fxWorldLight", 90, 255, 255, 255, 200.1, 0.5);
	AddFx( id, "fxPowerup", 0, 0, 0 );
	AddFx( id, "fxBlow" );
	AddFx( id, "fxScreenShake", 50.0, 3.0, 4.0 );
	AddFx( id, "fxPowerWave", "sprites/white.spr", 180, 145, 120, 30, 250 );
	AddFx( id, "fxBlow" );
	AddFx( id, "fxPowerWave", "sprites/white.spr", 180, 145, 120, 30, 250 );
	AddFx( id, "fxBlow" );
	AddFx( id, "fxPowerWave", "sprites/white.spr", 180, 145, 120, 30, 250 );
	AddFx( id, "fxSprite", "sprites/ecx.cooler.spr", 120, 70, 0, 0, 0 );
	AddFx( id, "fxSprite", "sprites/ywaves.spr", 10, 60, 0, 0, 0 );
	AddFx( id, "fxPowerWave", "sprites/white.spr", 180, 145, 120, 90, 250);
	set_task(2.0,"Rays",id);
	set_task(2.0,"Extra",id);
}

public Effects2(id)
{
	AddFx( id, "fxSprite", "sprites/ecx.cooler.spr", 180, 100, 0, 0, 0 );
	//AddFx( id, "fxPowerup", 0, 0, 0 );
	AddFx( id, "fxBlow" );
	AddFx( id, "fxScreenShake", 50.0, 3.0, 4.0 );
	AddFx( id, "fxPowerWave", "sprites/white.spr", 180, 145, 120, 30, 250 );
	AddFx( id, "fxBlow" );
	AddFx( id, "fxPowerWave", "sprites/white.spr", 180, 145, 120, 30, 250 );
	AddFx( id, "fxBlow" );
}

public Extra(id)
{
	AddFx( id, "fxPowerWave", "sprites/white.spr", 180, 145, 120, 30, 250 );
	AddFx( id, "fxBlow" );
	AddFx( id, "fxPowerWave", "sprites/white.spr", 180, 145, 120, 30, 250 );
	AddFx( id, "fxBlow" );
	AddFx( id, "fxSprite", "sprites/ecx.cooler.spr", 180, 100, 0, 0, 0 );
	AddFx( id, "fxSprite", "sprites/ywaves.spr", 6, 60, 0, 0, 0 );
	AddFx( id, "fxPowerWave", "sprites/white.spr", 180, 145, 120, 90, 250);
}

public RemoveAll(id)
{
	// output just for testing. remove if no longer needed.
	//client_print(id, print_chat, "removeAll");
	
	RemFx( id, "fxLgtField");
	RemFx( id, "fxPowerup");
}

public REMADVM(id)
{
	// output just for testing. remove if no longer needed.
	//client_print(id, print_chat, "removeAll");
	setClientANIMATION(id,-1);
}

public plugin_precache()
{ 
	precache_model( "models/player/ecx.goku-ts.ssj/ecx.goku-ts.ssj.mdl" );
	precache_model( "models/player/GGKHH/GGKHH.mdl" );
	precache_model( "models/player/ecx.gohan.ssj2/ecx.gohan.ssj2.mdl" );
	precache_model( "models/evo/auraG.mdl" );
	precache_model( "sprites/stmbal1.spr" ); 
	precache_model( "sprites/white.spr" ); 
	precache_model( "sprites/ecx.lightning.spr" ); 
	precache_model( "sprites/lightning.spr" ); 
	precache_model( "sprites/ywaves.spr" ); 
	precache_model( "models/evolution/Auras/shape_C.mdl" ); 
	precache_model( "models/evolution/Auras/sv_trans.mdl" ); 
	precache_model( "sprites/rcharge.spr" );
	precache_model( "sprites/ecx.cooler.spr" );
	precache_model( "sprites/ecx.lightning.spr" ); 
	precache_model( "sprites/onda.spr" );
	precache_sound("weapons/meleeflash.wav");
}