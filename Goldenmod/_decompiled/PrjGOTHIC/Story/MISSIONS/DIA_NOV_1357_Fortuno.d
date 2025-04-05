
instance DIA_Fortuno_EXIT(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 999;
	condition = DIA_Fortuno_EXIT_Condition;
	information = DIA_Fortuno_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Fortuno_EXIT_Condition()
{
	return 1;
};

func void DIA_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fortuno_Greet(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 1;
	condition = DIA_Fortuno_Greet_Condition;
	information = DIA_Fortuno_Greet_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Fortuno_Greet_Condition()
{
	if(Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_Fortuno_Greet_Info()
{
	AI_Output(self,other,"DIA_Fortuno_Greet_05_00");	//������� �������! ����� ������ ������� �������� �� ���� �������.
};


var int Fortuno_RationDay;

instance DIA_Fortuno_GetGeschenk(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 1;
	condition = DIA_Fortuno_GetGeschenk_Condition;
	information = DIA_Fortuno_GetGeschenk_Info;
	permanent = 0;
	description = "����� �������?";
};


func int DIA_Fortuno_GetGeschenk_Condition()
{
	return 1;
};

func void DIA_Fortuno_GetGeschenk_Info()
{
	AI_Output(other,self,"DIA_Fortuno_GetGeschenk_15_00");	//����� �������?
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_01");	//����� ��� �������� � ����������. '�������� ������'. ������� ����!
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_02");	//�� ������� ����� � ���� �������� ������ ����, �� ���� �������� �������� ������ ������� ������� ������, �������� ���������.
	AI_Output(self,other,"DIA_Fortuno_GetGeschenk_05_03");	//���� �� ������ ����� �������� ���� ��������� �����-������ ����� ��� �����, ������� �� ����. � �������.
	CreateInvItems(self,ItMiJoint_2,3);
	B_GiveInvItems(self,other,ItMiJoint_2,3);
	Fortuno_RationDay = Wld_GetDay();
	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
	B_LogEntry(GE_TraderPSI,"������� ���������� ������� ��� ������������ ������������.");
};


instance DIA_Fortuno_DailyRation(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 3;
	condition = DIA_Fortuno_DailyRation_Condition;
	information = DIA_Fortuno_DailyRation_Info;
	permanent = 1;
	description = "� ������ �� ����� ������� ������� ���������.";
};


func int DIA_Fortuno_DailyRation_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk))
	{
		return 1;
	};
};

func void DIA_Fortuno_DailyRation_Info()
{
	AI_Output(other,self,"DIA_Fortuno_DailyRation_15_00");	//� ������ �� ����� ������� ������� ���������.
	if(Fortuno_RationDay != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_01");	//���, ������. ��� '�������� ������' - �� �� ���� �� ��� �����!
		CreateInvItems(self,ItMiJoint_2,3);
		B_GiveInvItems(self,other,ItMiJoint_2,3);
		Fortuno_RationDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Fortuno_DailyRation_05_02");	//������� �� ��� ������� ���� ������. ���� ������ ���, ������� ������ ��� ���� ���-������.
	};
};


instance DIA_Fortuno_BuyJoints(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 4;
	condition = DIA_Fortuno_BuyJoints_Condition;
	information = DIA_Fortuno_BuyJoints_Info;
	permanent = 1;
	description = "����� ��������.";
	trade = 1;
};


func int DIA_Fortuno_BuyJoints_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk))
	{
		return 1;
	};
};

func void DIA_Fortuno_BuyJoints_Info()
{
	AI_Output(other,self,"DIA_Fortuno_BuyJoints_15_00");	//����� ��������.
	AI_Output(self,other,"DIA_Fortuno_BuyJoints_05_01");	//��� ���� �� ���� �����? ��� �� ������ ��� ���-�� �������?
};


instance DIA_FORTUNO_NOV_AWAY(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 4;
	condition = dia_fortuno_nov_away_condition;
	information = dia_fortuno_nov_away_info;
	permanent = 0;
	description = "(�������� ��� ���������� ���������)";
};


func int dia_fortuno_nov_away_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_nov_away) && !Npc_KnowsInfo(hero,nov_9000_escaped_amulette))
	{
		return 1;
	};
};

func void dia_fortuno_nov_away_info()
{
	AI_Output(other,self,"DIA_Fortuno_NOV_AWAY_15_00");	//���� ����������� ������ ��������� ��������� � ������� �� ������. �� ���-������ ������ �� ����?
	AI_Output(self,other,"DIA_Fortuno_NOV_AWAY_05_00");	//��������� ���� ����� � ������, ��� ���������� �������� ���-�� � ������.
	AI_Output(self,other,"DIA_Fortuno_NOV_AWAY_05_01");	//��� ������ ���������� � ����� ������.
	B_GiveXP(100);
	B_LogEntry(CH4_YBERION_AMULETTE,"�������� ���������� ���������� � ������ ������ ������.");
};


instance DIA_FORTUNO_HEALTHWATER(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 1;
	condition = dia_fortuno_healthwater_condition;
	information = dia_fortuno_healthwater_info;
	permanent = 0;
	description = "�� ������ ������� �������� ������� ��� �'�������.";
};


func int dia_fortuno_healthwater_condition()
{
	if(POTION_FOR_YBERION == 2)
	{
		return 1;
	};
};

func void dia_fortuno_healthwater_info()
{
	AI_Output(other,self,"DIA_Fortuno_HealthWater_15_00");	//�� ������ ������� �������� ������� ��� �'�������.
	AI_Output(self,other,"DIA_Fortuno_HealthWater_05_00");	//������. �� ������ �����?
	if(Npc_KnowsInfo(hero,info_corangar_healthwater_running))
	{
		AI_Output(other,self,"DIA_Fortuno_HealthWater_15_01");	//��, ��� ���.
		B_GiveInvItems(other,self,ItFo_Plants_Herb_03,5);
	}
	else
	{
		AI_Output(other,self,"GUR_1201_CorKalom_SACHE_NEIN_15_01");	//���.
		AI_Output(self,other,"DIA_Fortuno_HealthWater_05_01");	//�����, � ���� ���� ������ �����.
	};
	AI_Output(self,other,"DIA_Fortuno_HealthWater_05_02");	//��� ���� �����.
	POTION_FOR_YBERION = 0;
	AI_StopProcessInfos(self);
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoWP(self,"PSI_LABOR_EX");
	AI_GotoWP(self,"PSI_HERB_SHOP");
	AI_SetWalkMode(self,NPC_WALK);
	Npc_SetRefuseTalk(self,10);
};


instance DIA_FORTUNO_COMESBACK(C_Info)
{
	npc = NOV_1357_Fortuno;
	nr = 1;
	condition = dia_fortuno_comesback_condition;
	information = dia_fortuno_comesback_info;
	permanent = 0;
	important = 1;
};


func int dia_fortuno_comesback_condition()
{
	if(Npc_KnowsInfo(hero,dia_fortuno_healthwater) && (Npc_RefuseTalk(self) == FALSE))
	{
		return 1;
	};
};

func void dia_fortuno_comesback_info()
{
	AI_Output(self,other,"DIA_Fortuno_ComesBack_05_00");	//��� �������. ������ ��� ��� ������.
	B_GiveInvItems(self,other,HealthWater,1);
	AI_StopProcessInfos(self);
	B_ExchangeRoutine(self,"afterstart");
};

