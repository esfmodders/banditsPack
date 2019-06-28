#include <amxmodx>
#include <fakemeta>
#include <engine>

#include <ipci/Ascend>
#include <ipci/Core>

new bool:IsPressingButton[MAX_PLAYERS + 1];

new const Class[] = { "finalflash",  "finishingbuster", "kamehameha", "masenko", "gallitgun" }

public client_PreThink(Client)
{
	if(!getClientATKSHOOT(Client) || getClientBEAMJUMP(Client))
		return PLUGIN_HANDLED;
	
	static Control, Weapon[32]; Control = get_user_button(Client);
	getClientWEAPONNAME(Client, Weapon);
	
	if(Control == IN_ATTACK && IsPressingButton[Client] == false)
	{
		IsPressingButton[Client] = true;
		
		for(new All = 0; All < sizeof Class; All++)
		{
			if(equal(Weapon, Class[All]) && getClientKI(Client) > 200.0)
			{
				set_task(0.0, "@FollowEnemy", Client, _, _, "b");
				setClientKI(Client, .Ki = getClientKI(Client) - 200.0);
				setClientMELEEPUSHBACK(Client, 1);
			}
		}
	}
	
	else if(Control != IN_ATTACK || IsPressingButton[Client] == true)
	{
		setClientMELEEPUSHBACK(Client, 0);
		IsPressingButton[Client] = false;
	}
	
	return PLUGIN_CONTINUE;
}

public @FollowEnemy(Client)
{
	if(getClientATKSHOOT(Client) || getClientBEAMJUMP(Client))
		return PLUGIN_HANDLED;
	
	new Float:MinimumDistance = 2000.0, NearestPlayer = 0, Entity = -1;
	
	for(new All = 0; All < sizeof Class; All++)
	{
		while((Entity = find_ent_by_class(Entity, Class[All])))
		{
			if(!is_valid_ent(Entity))
			{
				remove_task(Client);
				return PLUGIN_HANDLED;
			}
			
			new Owner = entity_get_edict(Entity, EV_ENT_owner);
			
			new Player[32], Players, Num;
			get_players(Player, Players, "a");
			
			for(Num = 0; Num < Players; Num++)
			{
				if(is_user_alive(Player[Num]) && Owner != Player[Num])
				{
					new Float:Distance = entity_range(Entity, Player[Num]);
					
					if(Distance <= MinimumDistance)
					{
						MinimumDistance = Distance;
						NearestPlayer = Player[Num];
					}
				}
				
				if(NearestPlayer > 0) 
				{
					entity_set_follow(Entity, NearestPlayer, 600.0)
				}
			}
		}
	}
	
	return PLUGIN_CONTINUE;
}
 // This code is old, isn't optimized, may have bugs and issues wich we don't see. mhm ok....then lets continue.
stock entity_set_follow(entity, target, Float:speed) // Good vector work, but not the best.
{
	if(!is_valid_ent(entity) || !is_valid_ent(target)) 
		return 0

	new Float:entity_origin[3], Float:target_origin[3]
	pev(entity, pev_origin, entity_origin)
	pev(target, pev_origin, target_origin)

	new Float:diff[3]
	diff[0] = target_origin[0] - entity_origin[0]
	diff[1] = target_origin[1] - entity_origin[1]
	diff[2] = target_origin[2] - entity_origin[2]
 
	new Float:length = floatsqroot(floatpower(diff[0], 2.0) + floatpower(diff[1], 2.0) + floatpower(diff[2], 2.0))
 
       	new Float:velocity[3]
	velocity[0] = diff[0] * (speed / length)
	velocity[1] = diff[1] * (speed / length)
	velocity[2] = diff[2] * (speed / length)
 
	set_pev(entity, pev_velocity, velocity)

	return 1
}
