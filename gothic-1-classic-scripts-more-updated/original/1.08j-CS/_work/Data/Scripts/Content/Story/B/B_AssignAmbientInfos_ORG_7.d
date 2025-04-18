// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Org_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Org_7_EXIT_Condition;
	information	= Info_Org_7_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Org_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Org_7_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Org_7_EinerVonEuchWerden_Condition;
	information	= Info_Org_7_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Co mus�m ud�lat, abych se mohl p�idat k t�boru?";
};                       

FUNC INT Info_Org_7_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_7_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_00"); //Co mus�m ud�lat, abych se mohl p�idat k t�boru?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_01"); //M��e� se d�t k na�� tlup�. Ale nejd��v se mus� postavit Gomezovi.
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_02"); //Jak to m�m ud�lat?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_03"); //B�t tebou, vzal bych n�co d�le�it�ho z Star�ho t�bora nebo ze Star�ho dolu a dal to Laresovi.
	var C_NPC Lares;		Lares	= Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Org_7_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Org_7_WichtigePersonen_Condition;
	information	= Info_Org_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo je v� v�dce?";
};                       

FUNC INT Info_Org_7_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Org_7_WichtigePersonen_15_00"); //Kdo je v� v�dce?
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_01"); //Lares je hlava tlupy. V�t�ina lid� ho uzn�v�.
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_02"); //Ten n�m ale ne��k�, co d�lat.
	var C_NPC Lares;		Lares	= Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Org_7_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Org_7_DasLager_Condition;
	information	= Info_Org_7_DasLager_Info;
	permanent	= 1;
	description = "Co mi m��e� ��ci o t�bo�e?";
};                       

FUNC INT Info_Org_7_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_7_DasLager_15_00"); //Co mi m��e� ��ci o t�boru?
	AI_Output(self,other,"Info_Org_7_DasLager_07_01"); //Je to jak�si komunita pro komunitu, jestli mi rozum�. V�ichni si d�l�me, co chceme, ale je n�s tu tolik, �e n�s Gomez jentak nevyhlad�.
	AI_Output(self,other,"Info_Org_7_DasLager_07_02"); //A�koli je to p�esn� to, co by nejrad�ji ud�lal.
	AI_Output(other,self,"Info_Org_7_DasLager_15_03"); //Co vlastn� m�te s Gomezem?
	AI_Output(self,other,"Info_Org_7_DasLager_07_04"); //Okrademe ho!
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Org_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Org_7_DieLage_Condition;
	information	= Info_Org_7_DieLage_Info;
	permanent	= 1;
	description = "Co se tu d�je?";
};                       

FUNC INT Info_Org_7_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_7_DieLage_15_00"); //Co se tu d�je?
	AI_Output(self,other,"Info_Org_7_DieLage_07_01"); //Tys tady asi je�t� nebyl, vi�?
	AI_Output(self,other,"Info_Org_7_DieLage_07_02"); //M�gov� se u� l�ta chystaj� k odst�elen� rudn� haldy. ��kaj�, �e u� to nebude dlouho trvat.
	AI_Output(self,other,"Info_Org_7_DieLage_07_03"); //Tak se aspo� uk�e cesta. Kdy� se vezme v �vahu to mno�stv� rudonosn� horniny, kterou ruda�i tak dlouho shroma��ovali.
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

INSTANCE Info_Org_7_Krautprobe (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_Org_7_Krautprobe_Condition;
	information	= Info_Org_7_Krautprobe_Info;
	permanent	= 1;
	description = "Chce� trochu drogy z ba�in?";
};                       

FUNC INT Info_Org_7_Krautprobe_Condition()
{
	if	((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_7_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_7_Krautprobe_15_00"); //Chce� trochu drogy z ba�in?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_01"); //D�m ti za n� 10 nuget�, tady jsou.
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_02"); //A� se j� zase bude� pot�ebovat zbavit, p�ij� za mnou.
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output (self, other,"Info_Org_7_Krautprobe_No_Joint_07_00"); //Kde? ��dnou drogu tu nevid�m.
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Org_7(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);
	
	Info_Org_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Org_7_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Org_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Org_7_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Org_7_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Org_7_Krautprobe.npc			= Hlp_GetInstanceID(slf);
};
