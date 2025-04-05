instance  GUR_1212_MadCorKalom_Talk2SC (C_INFO)
{
	npc				= GUR_1212_MadCorKalom;
	condition		= GUR_1212_MadCorKalom_Talk2SC_Condition;
	information		= GUR_1212_MadCorKalom_Talk2SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GUR_1212_MadCorKalom_Talk2SC_Condition()
{
	return TRUE;
};

FUNC void GUR_1212_MadCorKalom_Talk2SC_Info ()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, hero);
	
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //Finalement, nous sommes encore r�unis !
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //Mon ma�tre m'a d�j� inform� de ton arriv�e !
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //Il sent que tu es tout pr�s.
	AI_Output			(hero, self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //Je serai bient�t plus proche de lui qu'il ne l'imagine !
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //Nous ne te laisserons pas contrecarrer nos plans !
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //Le monde va assister au r�veil du R�dempteur, et rien ni personne ne peut l'arr�ter.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //Tous les infid�les payeront le prix.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //Et tu auras l'honneur d'�tre le premier � payer.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //Dormeur R�VEILLE TOI !!!!!!!!!

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
	
	AI_Wait				(self, 2);
	Npc_SetTarget		(self, hero );
	AI_StartState		(self, ZS_Attack, 0, "" );
};
