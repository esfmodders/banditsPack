#include <amxmodx>
#include <engine>

#include <ipci/Ascend>

public plugin_init()
{
    register_think("fxDescend", "@Think_fxDescend");
}

public @LevelChange(__int_Index, __int_PreLevel, __int_PostLevel)
{
    if(__int_PostLevel == 0 && __int_PreLevel > 0)
    {
        new __int_Entity = create_entity("env_model");
        
        static __int_Model[50], __int_ModelPath[184];
        
        getLevelDATAv(getClientDATAc(__int_Index, cliClass), __int_PreLevel, cxlModel, __int_Model);
        
        formatex(__int_ModelPath, ((sizeof __int_ModelPath) - 1), "models/player/%s/%s.mdl", __int_Model, __int_Model);
        
        entity_set_model(__int_Entity, __int_ModelPath);
        
        //entity_set_int(__int_Entity, EV_INT_rendermode, kRenderTransTexture);
		
		
		
		set_rendering(__int_Entity, kRenderFxGlowShell, 10, 0, 255, kRenderTransColor, 15)
        
        entity_set_edict(__int_Entity, EV_ENT_owner, __int_Index);
        
        entity_set_byte(__int_Entity, EV_BYTE_controller1, 125);
        entity_set_byte(__int_Entity, EV_BYTE_controller2, 125);
        entity_set_byte(__int_Entity, EV_BYTE_controller3, 125);
        entity_set_byte(__int_Entity, EV_BYTE_controller4, 125);
        
        entity_set_int(__int_Entity, EV_INT_fixangle, 1);
        
        entity_set_string(__int_Entity, EV_SZ_classname, "fxDescend");
        
        entity_set_float(__int_Entity, EV_FL_nextthink, (get_gametime() + 0.010_000));
    }
}
public @Think_fxDescend(__int_Entity)
{
    if(is_valid_ent(__int_Entity))
    {
        if(10.200_000 < entity_get_float(__int_Entity, EV_FL_renderamt) <= 255.000_000)
        {
			static owner, seq;

            static Float:__float_Origin[3], Float:__float_Angles[3];
            
			owner = entity_get_edict(__int_Entity, EV_ENT_owner)
			seq = entity_get_int(owner, EV_INT_sequence)

            entity_get_vector(entity_get_edict(__int_Entity, EV_ENT_owner), EV_VEC_origin, __float_Origin);
            entity_get_vector(entity_get_edict(__int_Entity, EV_ENT_owner), EV_VEC_angles, __float_Angles);
            
            entity_set_origin(__int_Entity, __float_Origin);
            entity_set_vector(__int_Entity, EV_VEC_angles, __float_Angles);
            




			
			entity_set_float(__int_Entity, EV_FL_animtime,get_gametime())
			entity_set_int(__int_Entity, EV_INT_sequence, seq)
			entity_set_float(__int_Entity, EV_FL_framerate, 1.0)
            

            entity_set_float(__int_Entity, EV_FL_renderamt, (entity_get_float(__int_Entity, EV_FL_renderamt) - 10.200_000));
        }
        
        else
        {
            entity_set_int(__int_Entity, EV_INT_flags, entity_get_int(__int_Entity, EV_INT_flags) | FL_KILLME);
        }
    }
}