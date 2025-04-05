func void B_Story_FoundUrShak()
{
	//-------- Missionsgegenst�nde --------
	

	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_FindOrcShaman,"J'ai sauv� le shaman Orc appel� Ur-Shak de son propre peuple. Il a �t� si reconnaissant qu'il m'a racont� la partie restante de l'histoire du Dormeur. Maintenant je peux retourner chez Xardas pour compl�ter ma qu�te.");

	Log_CreateTopic		(CH4_UluMulu,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_UluMulu,		LOG_RUNNING);
	B_LogEntry			(CH4_UluMulu,"Ur-Shak, le shaman banni, m'a r�v�l� le seul moyen d'acc�der au temple souterrain du Dormeur sous la ville Orc sans avoir � combattre tous ces Orcs. J'ai besoin d'un ULU-MULU, une sorte d'objet sacr� qui est respect� comme une embl�me par tous les Orcs. Un ami de Ur-Shak qui est d�tenue dans une mine humaine peut me fabriquer cet objet."); 

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcShaman);

	//-------- Tagesabl�ufe �ndern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
