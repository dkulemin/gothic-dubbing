// *********************** PRIESTER 1 ***********************

INSTANCE Info_HighPriest1 (C_INFO)
{
	npc			= ORC_Priest_1;
	nr			= 1;
	condition	= Info_HighPriest1_Condition;
	information	= Info_HighPriest1_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_HighPriest1_Condition()
{
	return TRUE;
};

FUNC VOID Info_HighPriest1_Info()
{
	B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	
	AI_Output 			(self, other,"Info_HighPriest1_17_01"); //MOOOOOOORTEL !
	AI_Output 			(self, other,"Info_HighPriest1_17_02"); //TU OSES ME D�RANGER !
	AI_Output 			(self, other,"Info_HighPriest1_17_03"); //PR�PARE TOI A MOURIR !
	AI_Output 			(other, self,"Info_HighPriest1_15_04"); //Pour la mort, �a reste � voir, esp�ce de morceau de viande mang� par les vers !
	
	B_LogEntry			(CH4_EnterTemple,"Je fais face � Varrag-Hashor, un des cinq Orc des chamans, qui ont donn� le jour au Dormeur. Je mettrai fin � son existence.");

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
};

