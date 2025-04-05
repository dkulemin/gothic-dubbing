func void B_Story_GornJoins()
{
	//-------- Missionsgegenst�nde --------
	CreateInvItem		(hero, ItKe_Freemine);
	
	//-------- Monster platziern --------
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE");
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE2");
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE3");
	//Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE3");
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE4");
	//Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE4");

	//-------- Tagesabl�ufe �ndern --------
	var C_NPC gorn;	gorn = Hlp_GetNpc(PC_Fighter);	Npc_ExchangeRoutine(gorn,	"FollowToFMC");	
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_GornJoins);

	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_UluMulu,"Gorn et moi sommes suppos�s regagner la mine Libre dans une op�ration couverte. Le fait est que l'ami Orc de Ur-Shak est dedans. La chance est de mon c�t�."); 
	
	//-------- globale Variable setzen --------
	gorn.aivar[AIV_PARTYMEMBER] = TRUE;
	Gorn_JoinedForFM = TRUE;
};
