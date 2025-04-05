func void B_Story_ReturnedFromUrShak()
{
	//-------- Missionsgegenst�nde --------
	

	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_FindOrcShaman,"Xardas a sembl� content de ma rencontre avec Ur-Shak. Ma prochaine route me m�nera maintenant � la mine Libre pour trouver l'ami d'Ur-Shak.");
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_SUCCESS);

	Log_CreateTopic		(CH4_EnterTemple,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_RUNNING);
	B_LogEntry			(CH4_EnterTemple,"Je commence maintenant � comprendre le dessein de Xardas. Je lui est demand� de l'aide pour la destruction de la Barri�re Magique et actuellement il me montre un moyen, mais ce moyen n'a rien a voir avec l'amas de minerai des Magiciens de l'Eau. Il m'a demand�, � la place, de trouver un chemin vers le temple souterrain du Dormeur."); 

	//-------- Erfahrung --------
	B_GiveXP		(XP_ReturnedFromUrShak);

	//-------- Tagesabl�ufe �ndern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
