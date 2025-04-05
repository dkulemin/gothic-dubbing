// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_grd_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_grd_13_EXIT_Condition;
	information	= Info_grd_13_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_grd_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_grd_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_grd_13_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_13_EinerVonEuchWerden_Condition;
	information	= Info_grd_13_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Je veux rejoindre les gardes.";
};                       

FUNC INT Info_grd_13_EinerVonEuchWerden_Condition()
{
	if	(Npc_GetTrueGuild(other) != GIL_GRD)
	&&	(Npc_GetTrueGuild(other) != GIL_KDF)
	&&  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_grd_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00"); //Je veux rejoindre les gardes.
	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01"); //Alors tu as du chemin � faire, mon gar�on !
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_grd_13_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_13_WichtigePersonen_Condition;
	information	= Info_grd_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "Qui dirige par ici ?";
};                       

FUNC INT Info_grd_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00"); //Qui dirige par ici ?
	AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01"); //Oui. Et je te le dis : tu ferais mieux de faire attention � ce que tu dis, mon gar�on !
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_grd_13_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_13_DasLager_Condition;
	information	= Info_grd_13_DasLager_Info;
	permanent	= 1;
	description = "Comment puis-je entrer dans le ch�teau ?";
};                       

FUNC INT Info_grd_13_DasLager_Condition()
{
	if (Kapitel == 1) 
	{
	return 1;
	};
};

FUNC VOID Info_grd_13_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_13_DasLager_15_00"); //Comment puis-je entrer dans le ch�teau ?
	AI_Output(self,other,"Info_grd_13_DasLager_13_01"); //Non. Seuls les gens de Gomez ont le droit d'entrer.
	Info_ClearChoices(Info_grd_13_DasLager);
	Info_AddChoice(Info_grd_13_DasLager,"Je vois.", Info_grd_13_DasLager_Verstehe);
	Info_AddChoice(Info_grd_13_DasLager,"Et si je corromps les gardes ?", Info_grd_13_DasLager_WachenBestechen);
	Info_AddChoice(Info_grd_13_DasLager,"Comment je peux parler � Gomez ?", Info_grd_13_DasLager_GomezSprechen);
};

FUNC VOID Info_grd_13_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00"); //Je vois.
	Info_ClearChoices(Info_grd_13_DasLager);
};

FUNC VOID Info_grd_13_DasLager_WachenBestechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00"); //Et si je corromps les gardes ?
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01"); //Tu as du culot, petit. J'imagine que tu pourrais les persuader de regarder ailleurs pendant une minute - si tu leur donne assez de minerai.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02"); //Mais si Gomez entends qu'ils envoient de la viande fra�che comme toi dans son ch�teau, il en enverra pas mal dans les donjons.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03"); //Bien sur, that risk will make it all the dearer to get in.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04"); //Mais m�me si tu arrives � rentrer, que feras-tu ? Tous les b�timents sont gard�s.
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05"); //J'�tais juste curieux, c'est tout.
};

FUNC VOID Info_grd_13_DasLager_GomezSprechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00"); //Comment je peux parler � Gomez ?
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01"); //Gomez n'est pas int�ress� pas les petits jeunes qui n'ont pas fait leur preuve.
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02"); //Si tu es s�rieux, parle avec Thorus.

	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_grd_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_13_DieLage_Condition;
	information	= Info_grd_13_DieLage_Info;
	permanent	= 1;
	description = "Comment va ?";
};                       

FUNC INT Info_grd_13_DieLage_Condition()
{	
	if  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_grd_13_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_13_DieLage_15_00"); //Comment va ?
	AI_Output(self,other,"Info_grd_13_DieLage_13_01"); //C'est calme. Tu te querelles avec le Nouveau Camp ou un couple de cingl� de la secte.
	AI_Output(self,other,"Info_grd_13_DieLage_13_02"); //Aussi longtemps que tu seras nouveau, �a ne fait rien. Mais d�s que tu d�cides quel camp rejoindre tu es li� � lui.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_grd_13(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_grd_13_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_grd_13_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_grd_13_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_grd_13_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_grd_13_DieLage.npc				= Hlp_GetInstanceID(slf);
};
