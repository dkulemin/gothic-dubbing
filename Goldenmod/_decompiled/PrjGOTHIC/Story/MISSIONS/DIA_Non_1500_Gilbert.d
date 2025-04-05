
instance DIA_Gilbert_EXIT(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 999;
	condition = DIA_Gilbert_EXIT_Condition;
	information = DIA_Gilbert_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

func void DIA_Gilbert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gilbert_First(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = DIA_Gilbert_First_Condition;
	information = DIA_Gilbert_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Gilbert_First_Condition()
{
	if(Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_Gilbert_First_Info()
{
	AI_Output(self,other,"DIA_Gilbert_First_04_00");	//��� �� ����� �������? ����� �� ����� ��������� ����, ��-��!
	AI_Output(self,other,"DIA_Gilbert_First_04_01");	//�� �����, ��� �� ����� �������� ��� �������.
	B_GiveXP(XP_GilbertFound);
};


instance DIA_Gilbert_Hallo(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 2;
	condition = DIA_Gilbert_Hallo_Condition;
	information = DIA_Gilbert_Hallo_Info;
	permanent = 1;
	description = "��� �� �����������?";
};


func int DIA_Gilbert_Hallo_Condition()
{
	return 1;
};

func void DIA_Gilbert_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gilbert_Hallo_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_01");	//� ��� ��� �� ����� ������ �������. � ���� ��, � ���� �������� �������� � �������� ������. ��� ���� ��� �����.
	AI_Output(self,other,"DIA_Gilbert_Hallo_04_02");	//������ ���, ��������, ����� �� ���� � �� ������. �� � ��-�������� �����. ���� �������� ����, �� ��-�����, � ������ ������ ������� ����� ����� ��������.
	if((Kapitel <= 3) && (GILBERT_OC == FALSE))
	{
		Log_CreateTopic(CH1_GILBERT,LOG_MISSION);
		Log_SetTopicStatus(CH1_GILBERT,LOG_RUNNING);
		B_LogEntry(CH1_GILBERT,"� ����� �������� � ������ ������ ��� ������ �������. �� �������� �� ����� ������.");
		GILBERT_OC = TRUE;
	};
};


instance DIA_GILBERT_THORUS(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_thorus_condition;
	information = dia_gilbert_thorus_info;
	permanent = 0;
	description = "� ����� ��� ���� ����� �����������...";
};


func int dia_gilbert_thorus_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_gilbert) && (GILBERT_OC == TRUE))
	{
		return 1;
	};
};

func void dia_gilbert_thorus_info()
{
	AI_Output(other,self,"DIA_Gilbert_Thorus_15_00");	//� ����� ��� ���� ����� �����������. �� ������� ������ � ���� ������ ������ ��������.
	AI_Output(self,other,"DIA_Gilbert_Thorus_04_01");	//�� ����� ���� ������! ������ �� ����������� �� ���!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance DIA_GILBERT_THORUS_ABOUT(C_Info)
{
	npc = Non_1500_Gilbert;
	nr = 1;
	condition = dia_gilbert_thorus_about_condition;
	information = dia_gilbert_thorus_about_info;
	permanent = 1;
	description = "��� �� ����� � ������?";
};


func int dia_gilbert_thorus_about_condition()
{
	if(Npc_KnowsInfo(hero,dia_gilbert_thorus) && (GILBERT_OC == TRUE))
	{
		return 1;
	};
};

func void dia_gilbert_thorus_about_info()
{
	AI_Output(other,self,"DIA_Gilbert_Thorus_ABOUT_15_00");	//��� �� ����� � ������?
	AI_Output(self,other,"DIA_Gilbert_Thorus_ABOUT_04_01");	//(������) ������! � �� ����� ���� �� ����.
};

