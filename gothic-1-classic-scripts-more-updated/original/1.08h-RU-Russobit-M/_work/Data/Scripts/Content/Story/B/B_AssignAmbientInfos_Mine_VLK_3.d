// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Vlk_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_3 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Vlk_3_EXIT_Condition;
	information	= Info_Mine_Vlk_3_EXIT_Info;
	permanent	= 1;
	description = "��������� ��������";
};                       

FUNC INT Info_Mine_Vlk_3_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Vlk_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Vlk_3_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Vlk_3_Mine_Condition;
	information	= Info_Mine_Vlk_3_Mine_Info;
	permanent	= 1;
	description = "�������� ��� � �����.";
};                       

FUNC INT Info_Mine_Vlk_3_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_3_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_Mine_15_00"); //�������� ��� � �����.
	AI_Output(self,other,"Info_Mine_Vlk_3_Mine_01_01"); //��� �� ������ ��������. ��� ������, ��� ������. � ��� ��� ������ ��������� ������. ������ ������ ��������� ���� �������.
	
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Vlk_3_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Vlk_3_WichtigePersonen_Condition;
	information	= Info_Mine_Vlk_3_WichtigePersonen_Info;
	permanent	= 1;
	description = "��� ����� �������?";
};                       

FUNC INT Info_Mine_Vlk_3_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_WichtigePersonen_15_00"); //��� ����� �������?
	AI_Output(self,other,"Info_Mine_Vlk_3_WichtigePersonen_01_01"); //� ����� ���� ���������� ��. �� ����� ������ ����� ������.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Vlk_3_Minecrawler(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Vlk_3_Minecrawler_Condition;
	information	= Info_Mine_Vlk_3_Minecrawler_Info;
	permanent	= 1;
	description = "��� �� ������ � ��������?";
};                       

FUNC INT Info_Mine_Vlk_3_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_3_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_Minecrawler_15_00"); //��� �� ������ � ��������?
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_01"); //��� ����� ���� ��� ������� � ���������? ������. ������ ��� ���� ���. � ����� ���� �����, �� ������� �������.
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_02"); //�� ���� �����������, ����� �� ������ � ���� �� ������, ����� � �� ������� ������ ������������.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Vlk_3_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Vlk_3_DieLage_Condition;
	information	= Info_Mine_Vlk_3_DieLage_Info;
	permanent	= 1;
	description = "��� �����?";
};                       

FUNC INT Info_Mine_Vlk_3_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_DieLage_15_00"); //��� �����?
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_01"); //��� �, � ���� ����� �����, ���� ������������, ���� ������ ����� � ������, � ���������� �����.
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_02"); //� ��� ��� ���������� ������, ������� ����� ������ ���� � ���.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Vlk_3(var c_NPC slf)
{
	Info_Mine_Vlk_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_DieLage.npc					= Hlp_GetInstanceID(slf);
};
