func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_EnterTemple,"Xardas a �t� surpris que j'ai r�ussi � p�n�trer dans le temple souterrain. Il pense que je fais partis d'une vieille proph�tie Orc.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,"Xardas a identifi� l'�trange �p�e que j'ai trouv� dans le temple du Dormeur comme �tant URIZIEL. Cette ancienne lame a suppos� d�tenir d'immense pouvoirs fut un temps, mais dans la course du temps elle a perdu son �nergie magique. Je dois trouver un moyen de restaurer cette arme.");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};
