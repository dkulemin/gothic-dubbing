func void B_Story_GotUluMulu()
{
	//-------- Missionsgegenst�nde --------
	CreateInvItem		(hero, UluMulu);
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_UluMulu,"C'est accomplie. Tarrok a re�u les quatre parties et a fabriqu� un Ulu-Mulu avec. J'esp�re seulement que les Orcs, dans la cit� au-dessus du temple du Dormeur, le respecteront.");
	Log_SetTopicStatus	(CH4_UluMulu,	LOG_SUCCESS);
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_GotUluMulu);

	//-------- globale Variable setzen --------
	FreemineOrc_LookingUlumulu = LOG_SUCCESS;
};
