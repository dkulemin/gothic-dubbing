//*****************************************************************************
//***			Diese Funktion t�tet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheintr�ge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,"apr�s les Magiciens du Feu assassin�s, il ne reste qu'UNE personne pour pouvoir faire exploser l'amas de minerai. Saturas m'a dit que la cr�ation de la Barri�re Magique a �t� dirig� par un 13eme magicien.");
	B_LogEntry			(CH4_FindXardas,"Ce 13eme magicien, appel� Xardas, vit reclus dans une tour au beau milieu de la terre des Orcs. J'ai accept� d'y aller et de demander de l'aide.");
	

	//-------- Missionsgegenst�nde --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};
