//*****************************************************************************
//***		Initialisiert die Ork-Schamanen-Szene am Kastell				***
//*****************************************************************************
func void B_Story_FindOrcShaman()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_FindXardas,"J'ai enfin rencontr� Xardas. Mais la rencontre ne fut pas comme je mis attendais. Il n'a pas �t� int�ress� du tout par l'amas de minerai mais il m'a racont� la premi�re partie de l'histoire du Dormeur. Je ne sais pas quoi dire � Saturas � propos de cette conversation.");

	Log_CreateTopic		(CH4_FindOrcShaman,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_RUNNING);
	B_LogEntry			(CH4_FindOrcShaman,"Xardas veut encore me tester. Pour entendre la seconde partie de l'histoire du Dormeur, je dois rendre visite � un shaman Orc banni dans les ruines d'un ch�teau. C'est apr�s le pic d'une montagne � l'est de la tour de Xardas. Je ne suis pas vraiment s�r de savoir comment le convaincre de ne pas me lancer de boule de feu. Mais bon, on verra.");
	
		
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(ORC_2200_Shaman,	"CASTLE_06");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(StoneGolem,		"CASTLE_04");
	
	//-------- globale Variable setzen --------
	FindOrcShaman = LOG_RUNNING;
};
