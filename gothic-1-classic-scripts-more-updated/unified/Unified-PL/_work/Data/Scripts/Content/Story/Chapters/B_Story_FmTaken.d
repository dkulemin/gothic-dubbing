//#####################################################################
//##
//##							KAPITEL 4
//##							=========
//##	S�ldner, Banditen und Sch�rfer der Freien Mine werden
//##	get�tet und beraubt.
//##	Drei Gardisten bewachen jetzt den Eingang zur Mine.						
//##
//#####################################################################
func void B_Story_FMTaken()
{
	//-------- Gorn zu Saturas schicken --------
	var C_NPC fighter;	fighter = Hlp_GetNpc(PC_FIGHTER);
	Npc_ExchangeRoutine(fighter, "NCREPORT");

	//-------- Besatzung des Kessels t�ten --------
	B_KillNpc	(SLD_750_Soeldner);
	B_KillNpc	(SLD_751_Soeldner);
	B_KillNpc	(SLD_752_Okyl);
	B_KillNpc	(SLD_753_Baloro);
	B_KillNpc	(SLD_755_Soeldner);
	B_KillNpc	(SLD_756_Soeldner);
	B_KillNpc	(SLD_757_Soeldner);
	B_KillNpc	(SLD_758_Soeldner);
	B_KillNpc	(SLD_759_Soeldner);
	B_KillNpc	(SLD_760_Soeldner);
	B_KillNpc	(SLD_761_Soeldner);
	B_KillNpc	(SLD_762_Soeldner);
	B_KillNpc	(SLD_763_Soeldner);
	B_KillNpc	(SLD_764_Soeldner);
	B_KillNpc	(SLD_765_Soeldner);

	B_KillNpc	(SFB_1030_Schuerfer);
	B_KillNpc	(SFB_1031_Schuerfer);
	B_KillNpc	(SFB_1032_Schuerfer);
	B_KillNpc	(SFB_1033_Schuerfer);
	B_KillNpc	(SFB_1034_Schuerfer);
	B_KillNpc	(SFB_1035_Schuerfer);
	B_KillNpc	(SFB_1036_Schuerfer);
	B_KillNpc	(SFB_1037_Swiney);
	B_KillNpc	(SFB_1038_Schuerfer);
	B_KillNpc	(SFB_1039_Schuerfer);
	B_KillNpc	(SFB_1040_Schuerfer);
	B_KillNpc	(SFB_1041_Schuerfer);
	B_KillNpc	(SFB_1042_Schuerfer);
	B_KillNpc	(SFB_1043_Schuerfer);
	B_KillNpc	(SFB_1044_Schuerfer);
		
	B_KillNpc	(ORG_890_Organisator);
	B_KillNpc	(ORG_891_Organisator);
	B_KillNpc	(ORG_892_Organisator);
		
	//-------- Gardisten-Eroberer einf�gen --------
	Wld_InsertNpc		(Grd_283_Gardist,	"FMC_ENTRANCE");	//FMC-Guard(Mineneingang)			
	Wld_InsertNpc		(Grd_285_Gardist,	"FMC_ENTRANCE");	//FMC-Guard(Mineneingang)	
	B_ExchangeRoutine	(Grd_201_Jackal,	"FMTaken");			//FMC-Guard(Mineneingang)

	//-------- Tor zur Alten Mine im Stundentakt auf Verschlu� checken! --------
	//B_ExchangeRoutine	(Grd_250_Gardist,	"FMTaken");
	Wld_SetObjectRoutine		(0,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(1,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(2,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(3,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(4,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(5,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(6,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(7,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(8,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(9,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(10,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(11,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(12,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(13,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(14,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(15,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(16,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(17,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(18,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(19,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(20,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(21,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(22,00,"EVT_AM_LOB_GATE_BIG",1);
	Wld_SetObjectRoutine		(23,00,"EVT_AM_LOB_GATE_BIG",1);

	//-------- Tagebucheintr�ge --------
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN))
	{
		B_LogEntry	(CH4_Firemages,"Diego opowiedzia� mi nieco wi�cej o wydarzeniach w Starym Obozie.");
	}
	else
	{
		B_LogEntry	(CH4_Firemages,"Przy tylnym wej�ciu do Starego Obozu spotka�em Diego, kt�ry opowiedzia� mi o tragicznych wydarzeniach ostatnich dni.");
	};
	B_LogEntry		(CH4_Firemages,"Po zawaleniu si� Starej Kopalni, Gomez rozkaza� swoim ludziom zaatakowa� nale��c� do Nowego Obozu Woln� Kopalni�. Wobec zdecydowanego sprzeciwu Corristo i jego Mag�w Ognia, Gomez kaza� ich wszystkich zamordowa�.");
	B_LogEntry		(CH4_Firemages,"Mam czym pr�dzej wr�ci� do Nowego Obozu i zda� Saturasowi relacj� z tych wydarze�.");
	
	if (Scorpio_Exile == FALSE)
	{
		Log_CreateTopic (GE_TraderOW,LOG_NOTE);
		B_LogEntry		(GE_TraderOW,"Skorpion porzuci� Stary Ob�z i wraz z Cavalornem zatrzyma� si� w my�liwskiej chacie na drodze pomi�dzy Starym a Nowym Obozem.");
		Scorpio_Exile = TRUE;
	};
	//-------- globale Variable setzen --------
	FMTaken = TRUE;
};
