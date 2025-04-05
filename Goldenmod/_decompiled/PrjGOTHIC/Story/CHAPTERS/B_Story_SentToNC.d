
func void B_Story_SentToNC()
{
	var C_Npc angar;
	var C_Npc gorn;
	angar = Hlp_GetNpc(GUR_1202_CorAngar);
	Npc_ExchangeRoutine(angar,"start");
	gorn = Hlp_GetNpc(PC_Fighter);
	PrintDebugNpc(PD_MISSION,gorn.name);
	Npc_ExchangeRoutine(gorn,"NCWAIT");
	AI_ContinueRoutine(gorn);
	Log_CreateTopic(CH3_EscapePlanNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_EscapePlanNC,LOG_RUNNING);
	B_LogEntry(CH3_EscapePlanNC,"Я решился. Пойду в Новый Лагерь и поддержу план магов воды. Кор Ангар отдал мне ключи от сундука в лаборатории Кор Галома. Юнитор и альманах, которые я принес ранее, должны быть там. Кор Ангар уверен, что эти артефакты пригодятся магам Нового Лагеря для завершения плана.");
	CreateInvItem(self,ItArRuneTeleport5);
	B_GiveInvItems(self,hero,ItArRuneTeleport5,1);
	CorAngar_SendToNC = TRUE;
};

