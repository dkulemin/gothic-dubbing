// *********************** HOHER PRIESTER ***********************
INSTANCE Info_HighPriest5 (C_INFO)
{
	npc				= ORC_Priest_5;
	nr				= 1;
	condition		= Info_HighPriest5_Condition;
	information		= Info_HighPriest5_Info;
	important		= 1;
};                       

FUNC INT Info_HighPriest5_Condition()
{
	return TRUE;
};

FUNC VOID Info_HighPriest5_Info()
{
	//B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	
	if ( Npc_HasItems ( hero, Mythrilklinge02 )) || ( Npc_HasItems ( hero, UrizielRune ))
	{
		AI_Output 			(self, other,"Info_HighPriest5_17_04"); //�LLEEEEEEVAS UUUN AAAARMA PODEROOOOOOSA!
		AI_Output 			(self, other,"Info_HighPriest5_17_05"); //�YOOOO TE DETENDR�!

		AI_StopProcessInfos	(self);
		self.npctype 		= NPCTYPE_MAIN;

		Npc_SetAttitude 	(self, ATT_HOSTILE);
		Npc_SetTempAttitude (self, ATT_HOSTILE);	
	}
	else
	{
		AI_Output 			(self, other,"Info_HighPriest5_17_01"); //�DEEEBES DAAAAR LA VUEEEELTA AAAAAQU�!
		AI_Output 			(self, other,"Info_HighPriest5_17_02"); //�NAAAAADI� INTERRUUUUUMPIR� EL SUEEEEE�O DEL MAAAAESTRO!
		AI_Output 			(other, self,"Info_HighPriest5_15_03"); //�Te equivocas; tu DURMIENTE pronto estar� bien despierto!
	
		AI_StopProcessInfos	(self);
	
		B_Story_EncounteredHighPriest();
	};
};

// *********************** HOHER PRIESTER ***********************
INSTANCE Info_HighPriest5FAILED (C_INFO)
{
	npc				= ORC_Priest_5;
	nr				= 2;
	condition		= Info_HighPriest5FAILED_Condition;
	information		= Info_HighPriest5FAILED_Info;
	important		= 1;
};                       

FUNC INT Info_HighPriest5FAILED_Condition()
{
	if 	Npc_KnowsInfo(hero, Info_HighPriest5)
	&&	(self.aivar[AIV_MISSION1] >= HighPriest_MaxHit)
	&&	!Npc_HasItems(hero, Mythrilklinge02)
	&&	!Npc_HasItems(hero, UrizielRune)
	{
		return TRUE;
	};
};

FUNC VOID Info_HighPriest5FAILED_Info()
{
	AI_Output			(other, self,"Info_HighPriest5FAILED_15_01"); //�Maldici�n! �No le estoy haciendo el menor da�o! Necesito otra...
	AI_Output			(self, other,"Info_HighPriest5FAILED_17_02"); //�MOOOORIR�S AHOOOOORA!
	AI_Output			(other, self,"Info_HighPriest5FAILED_15_03"); //�Ser� mejor que me largue deprisa!
	AI_RemoveWeapon		(other);
	AI_TurnAway			(other,	self);	
	
	self.npctype 		= NPCTYPE_MAIN;
	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	

	B_LogEntry			(CH4_EnterTemple,"Al parecer, Grash-Varrag-Arushat no pertenece a los chamanes orcos no-muertos. Es mucho m�s poderoso con diferencia, y mis armas no le infligen ning�n da�o. �Necesito una m�s poderosa!");
	B_GiveXP			(XP_RetreatFromLastPriest);

	AI_StopProcessInfos	(self);
};
