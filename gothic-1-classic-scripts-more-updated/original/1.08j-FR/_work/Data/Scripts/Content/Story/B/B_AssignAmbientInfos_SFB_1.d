// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_1_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_1_EXIT_Condition;
	information	= Info_SFB_1_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_SFB_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_1_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_1_EinerVonEuchWerden_Condition;
	information	= Info_SFB_1_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Comment puis-je rejoindre les membres des Gratteurs ?";
};                       

FUNC INT Info_SFB_1_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_1_EinerVonEuchWerden_15_00"); //Comment puis-je rejoindre les membres des Gratteurs ?
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_01"); //Nous rejoindre ? Ne crois surtout pas que nous ne faisons rien, c'est juste que personne ne nous force � travailler.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_02"); //Si tu penses pouvoir fain�anter, alors tu vas avoir une surprise, l'ami.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_03"); //Maintenant, si tu penses encore que cet endroit est pour toi, tu dois parler � Swiney. C'est le gratteur qui se trouve par l� � fumer toute la journ�e.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_1_WichtigePersonen_Condition;
	information	= Info_SFB_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "Qui est responsable ici ?";
};                       

FUNC INT Info_SFB_1_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_1_WichtigePersonen_15_00"); //Qui est responsable ici ?
	AI_Output(self,other,"Info_SFB_1_WichtigePersonen_01_01"); //Le chef ? Regarde autour de toi. Personne ne passe sa journ�e � remuer son cul pour ramasser du minerai, �a c'est s�r.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_1_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_1_DasLager_Condition;
	information	= Info_SFB_1_DasLager_Info;
	permanent	= 1;
	description = "Qu'est ce que c'est ?";
};                       

FUNC INT Info_SFB_1_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_1_DasLager_15_00"); //Qu'est ce que c'est ?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_01"); //A quoi �a ressemble ? Le palais royal ?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_02"); //Si tu veux vraiment travailler dans la Mine lib�r�e, tu dois travailler dans le Trou en premier pour prouver ton utilit�.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_1_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_1_DieLage_Condition;
	information	= Info_SFB_1_DieLage_Info;
	permanent	= 1;
	description = "Comment �a va ?";
};                       

FUNC INT Info_SFB_1_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_1_DieLage_15_00"); //Comment �a va ?
	AI_Output(self,other,"Info_SFB_1_DieLage_01_01"); //Qu'est ce que tu crois ? Des conneries comme d'habitude. Rien � manger, beaucoup � faire.
	AI_Output(self,other,"Info_SFB_1_DieLage_01_02"); //Le seul d'entre nous qui n'a pas les mains pleines c'est Swiney. Okyl l'a promu porte-parole des gratteurs. Maintenant il reste l� toute la journ�e � faire attention que personne ne prenne de cloques sur les mains.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_1(var c_NPC slf)
{
	
	Info_SFB_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_1_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_1_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_1_DieLage.npc				= Hlp_GetInstanceID(slf);
};
