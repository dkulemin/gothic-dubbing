
func void B_Story_FoundUrShak()
{
	var C_Npc riordian;
	B_LogEntry(CH4_FindOrcShaman,"Я спас орочьего шамана по имени Ур-Шак от его же собственного народа. В благодарность он рассказал мне оставшуюся часть истории Спящего. Теперь я могу вернуться к Ксардасу и завершить свою миссию.");
	Log_CreateTopic(CH4_UluMulu,LOG_MISSION);
	Log_SetTopicStatus(CH4_UluMulu,LOG_RUNNING);
	B_LogEntry(CH4_UluMulu,"Ур-Шак, изгнанный шаман, рассказал мне, как проникнуть в подземный храм Спящего, не ввязываясь в бой со всеми орками сразу. Мне понадобится УЛУ-МУЛУ, что-то вроде священного знака, почитаемого всеми орками. Один из соплеменников Ур-Шака может помочь в его изготовлении. Друг шамана содержится в одной из людских шахт.");
	B_GiveXP(XP_FoundOrcShaman);
	riordian = Hlp_GetNpc(KDW_605_Riordian);
	Npc_ExchangeRoutine(riordian,"FoundUrShak");
	UrShak_SpokeOfUluMulu = TRUE;
};

