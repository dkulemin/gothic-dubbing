//*****************************************************************************
//***			Diese Funktion t�tet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheintr�ge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,"Tutti i Maghi del Fuoco sono stati uccisi, tranne UNO. Saturas mi ha rivelato che la creazione della Barriera magica � stata guidata da un 13o mago.");
	B_LogEntry			(CH4_FindXardas,"Questo 13o mago, chiamato Xardas, vive isolato in una torre posta al centro della citt� degli orchi. Ho accettato di recarmi a chiedere il suo aiuto.");
	

	//-------- Missionsgegenst�nde --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};
