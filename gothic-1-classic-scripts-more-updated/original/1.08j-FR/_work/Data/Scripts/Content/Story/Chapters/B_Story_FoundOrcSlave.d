//*****************************************************************************
//***			Der Spieler hat den Freund von Ur-Shak gefunden				***
//*****************************************************************************
func void B_Story_FoundOrcSlave()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_UluMulu,"J'ai rencontr� l'ami de Ur-Shak dans une des galeries inf�rieures de la mine Libre. Il s'appelle Tarrok. Il est empoisonn�, et a rapidement besoin d'une bouteille sp�ciale de m�decine Orc qu'il a perdu dans sa fuite. Elle est quelque part dans les galeries inf�rieures de la mine. Je dois la trouver ou il est mort.");

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcSlave);
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion = LOG_RUNNING;
};
