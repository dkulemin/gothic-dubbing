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
	description = "� ���� ����� ����� �� ����������.";
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
	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00"); //� ���� ����� ����� �� ����������.
	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01"); //��� ����� ���� ����� ���-�� �������� ����.
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
	description = "� ��� ����� �������?";
};                       

FUNC INT Info_grd_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00"); //� ��� ����� �������?
	AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01"); //����� � �������. � �������� ����: ����� �� ���, ��� �� ��������!
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
	description = "��� ��� ����� � �����?";
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
	AI_Output(other,self,"Info_grd_13_DasLager_15_00"); //��� ��� ����� � �����?
	AI_Output(self,other,"Info_grd_13_DasLager_13_01"); //�����. � ����� ����� �������� ������ ���� ������.
	Info_ClearChoices(Info_grd_13_DasLager);
	Info_AddChoice(Info_grd_13_DasLager, "����.", Info_grd_13_DasLager_Verstehe);
	Info_AddChoice(Info_grd_13_DasLager, "� ���� ��������� ����������?", Info_grd_13_DasLager_WachenBestechen);
	Info_AddChoice(Info_grd_13_DasLager, "��� ����� ���������� � �������. ��� ��� � ��� �����������?", Info_grd_13_DasLager_GomezSprechen);
};

FUNC VOID Info_grd_13_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00"); //����.
	Info_ClearChoices(Info_grd_13_DasLager);
};

FUNC VOID Info_grd_13_DasLager_WachenBestechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00"); //� ���� ��������� ����������?
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01"); //�������� ���� �� ��������. �����, ���� �� ���������� �� ���������� ����, ��� ����� ����������� ���������.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02"); //�� ���� ����� ������ � ���, ��� ��� ���������� � ����� ������, �� ������� �� � ����������.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03"); //������� ������ ��������� ���� ����� ��������.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04"); //�� ���� �� �� �������� � �����, ���� �� ������� ������ ������ �����. ��� ������ ������.
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05"); //��, � ������ ���������������, ��� � ���.
};

FUNC VOID Info_grd_13_DasLager_GomezSprechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00"); //��� ����� ���������� � �������. ��� ��� � ��� �����������?
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01"); //������ �� ����� ����, ������� ����� ����� �� �����.
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02"); //�� ���� ��� ���� ��� ��� �����, �������� � �������.

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
	description = "��� ����?";
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
	AI_Output(other,self,"Info_grd_13_DieLage_15_00"); //��� ����?
	AI_Output(self,other,"Info_grd_13_DieLage_13_01"); //��� ��������. ����, ������, ���� �������� � ������ ������ ������, �� ��� ��� ��� �������� �������� �����������.
	AI_Output(self,other,"Info_grd_13_DieLage_13_02"); //�� ����� ��� ���������, ������� ��� ���� ��� �� ��� �����, �� ����� �� �������������� � ������ �� �������, �� �������, ��� ����������� �� ������ ������.
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
