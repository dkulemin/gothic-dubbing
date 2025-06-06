// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_GorNaDrak_EXIT (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 999;
	condition	= DIA_GorNaDrak_EXIT_Condition;
	information	= DIA_GorNaDrak_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_GorNaDrak_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  DIA_GorNaDrak_Greet (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Greet_Condition;
	information	= DIA_GorNaDrak_Greet_Info;
	permanent	= 0;
	description  = "������! ���� �� �����?";
};                       

FUNC int  DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_Greet_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Greet_15_00"); //������! ���� �� �����?
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_01"); //�� ����� ��� ������ ����� ��������, ������ ������ �������� � ������ �����.
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_02"); //��� � ���� �� �������� � ��� � �������� �� ������.
};

// **************************************************
//					Was ist Sekret
// **************************************************

instance  DIA_GorNaDrak_WasSekret (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WasSekret_Condition;
	information	= DIA_GorNaDrak_WasSekret_Info;
	permanent	= 0;
	description  = "� ����� ����� �� ��������?";
};                       

FUNC int  DIA_GorNaDrak_WasSekret_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_WasSekret_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_WasSekret_15_00"); //� ����� ����� �� ��������?
	AI_Output (self, other,"DIA_GorNaDrak_WasSekret_09_01"); //�� ���������� ������ ������ � ����� ��������. �� ����� �� ������, ����� ����� ��������� ������ �������.
};

// **************************************************
//			 	LERNE: Zangen Nehmen
// **************************************************

instance  DIA_GorNaDrak_TeachMandibles (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_TeachMandibles_Condition;
	information	= DIA_GorNaDrak_TeachMandibles_Info;
	permanent	= 0;
	description  = "�� ������ ���������� ���, ��� �������� �����?";
};                       

FUNC int  DIA_GorNaDrak_TeachMandibles_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WasSekret) && (Knows_GetMCMandibles == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_TeachMandibles_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_TeachMandibles_15_00"); //�� ������ ���������� ���, ��� �������� �����?
	AI_Output (self, other,"DIA_GorNaDrak_TeachMandibles_09_01"); //�������. ���� �������, �������� �������� �� ����� � ������ �� �� ����. ��� �� ������� ������� ������ � ��������, ������� ��� ���� ��������� ������.
	
	PrintScreen	("�����: ������ �������� ��������", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Knows_GetMCMandibles = TRUE;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"����� ������ ��������: �������.");
};

// **************************************************
//			 	Wof�r ist Sekret da?
// **************************************************

instance  DIA_GorNaDrak_WhatFor (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WhatFor_Condition;
	information	= DIA_GorNaDrak_WhatFor_Info;
	permanent	= 0;
	description  = "� ����� ��� ������ ����� ��� �����?";
};                       

FUNC int  DIA_GorNaDrak_WhatFor_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WasSekret))
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_WhatFor_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_WhatFor_15_00"); //� ����� ��� ������ ����� ��� �����?
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_01"); //��������� � ����, �� ������� �� ��� �����, ���������� ���������� ���� ����� �����������.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_02"); //�� ���� ��������� � ������� ���������, � � ���� ������� � ��� ������ ���� ������� �����, ����� ��� ������� �� ����.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_03"); //� ��� ������� ��� ����� ������ ����������� ���� ����������� � ����� �������� ���.
};

// **************************************************
//			 	Kap 1 Permanent
// **************************************************

instance  DIA_GorNaDrak_Permanent (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Permanent_Condition;
	information	= DIA_GorNaDrak_Permanent_Info;
	permanent	= 1;
	description  = "� ��� ��� ���������� ����� ��� ������� ���������?";
};                       

FUNC int  DIA_GorNaDrak_Permanent_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WhatFor) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_Permanent_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Permanent_15_00"); //� ��� ��� ���������� ����� ��� ������� ���������?
	AI_Output (self, other,"DIA_GorNaDrak_Permanent_09_01"); //���. ��� ����� ��� ����� ����� �����. ����� ������� ���������� ��������� �� �������� � ������ ����� � ����, � �����.
};




