
instance Info_Kirgo_Exit(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 999;
	condition = Info_Kirgo_Exit_Condition;
	information = Info_Kirgo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Kirgo_Exit_Condition()
{
	return 1;
};

func void Info_Kirgo_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Kirgo_What(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_What_Condition;
	information = Info_Kirgo_What_Info;
	permanent = 0;
	description = "������! � ����� ���������.";
};


func int Info_Kirgo_What_Condition()
{
	if(Kapitel <= 2)
	{
		return 1;
	};
};

func void Info_Kirgo_What_Info()
{
	AI_Output(other,self,"Info_Kirgo_What_15_00");	//������! � ����� ���������.
	AI_Output(self,other,"Info_Kirgo_What_05_01");	//��� �� � �� ��������! �������� ���, ��� �������� �� ������� ����. ��� ������ ������ ��� ������� �������� ������.
	AI_Output(self,other,"Info_Kirgo_What_05_02");	//���� ����� �����. � ������ �� �����.
};


instance Info_Kirgo_Good(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_Good_Condition;
	information = Info_Kirgo_Good_Info;
	permanent = 0;
	description = "� ��������� �� �����? � ���� ����� - � ���.";
};


func int Info_Kirgo_Good_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Kirgo_What))
	{
		return 1;
	};
};

func void Info_Kirgo_Good_Info()
{
	AI_Output(other,self,"Info_Kirgo_Good_15_00");	//� ���, �������?
	AI_Output(self,other,"Info_Kirgo_Good_05_01");	//������-��? � ��� ����� ���� �� ���������, �� ������� � �������!
};


instance Info_Kirgo_Charge(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_Charge_Condition;
	information = Info_Kirgo_Charge_Info;
	permanent = 0;
	description = "� ���� ������� ���� �� ���!";
};


func int Info_Kirgo_Charge_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kirgo_What) && (Kapitel <= 1))
	{
		return 1;
	};
};

func void Info_Kirgo_Charge_Info()
{
	AI_Output(other,self,"Info_Kirgo_Charge_15_00");	//� ���� ������� ���� �� ���!
	AI_Output(self,other,"Info_Kirgo_Charge_05_01");	//���? �� � �� ���� �������. �����, ������ ������ �� ���� � ��������� � ������� ����?
	Info_ClearChoices(Info_Kirgo_Charge);
	Info_AddChoice(Info_Kirgo_Charge,"���! � ���� �������. ������!",Info_Kirgo_Charge_NOW);
	Info_AddChoice(Info_Kirgo_Charge,"�����, ����� ���� ����!",Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output(other,self,"Info_Kirgo_Charge_NOW_15_00");	//���! � ���� �������. ������!
	AI_Output(self,other,"Info_Kirgo_Charge_NOW_05_01");	//��� ���... � �����.
	Info_ClearChoices(Info_Kirgo_Charge);
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_00");	//�����, ����� ���� ����!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_01");	//�����!
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_02");	//�������! �����, � �� ����� ����� ���������� � ������� ���� - ���� ��� ������ ������� � ������� ���, ������ ��� ������� ����.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_03");	//�����... �� �����, ������... ��� �����, �������� ��� ������ ���������� � ���, �� ��������� ����� ���� ������.
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_04");	//�������� �� � ������ ����� ����������.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_05");	//������ �� ������ ������� � ����� �� ���?
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_06");	//� ����, ����� ��� ��� ������ � ������!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_07");	//�� ������ ��� ��? �-�, �� ���� �� ����� ����������� ����� �� ������� ������... ������� ����, �� ��� �� ���������� �� ���� �����������...
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_08");	//�� ���� �� �� ����� ���� ������ ������� ���, ���� ����� ������ ������. �� �����, ���� �� �� �� �����!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_09");	//���� ��� ��� ������ �������, ��� ��� �����. �� ������, ��� ������ �� ������� �������� �� ���� ���.
	CreateInvItem(other,ItFoBeer);
	B_GiveInvItems(other,self,ItFoBeer,1);
	self.npcType = npctype_friend;
	Info_ClearChoices(Info_Kirgo_Charge);
};


var int Kirgo_Charged;

instance Info_Kirgo_ChargeREAL(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_ChargeREAL_Condition;
	information = Info_Kirgo_ChargeREAL_Info;
	permanent = 0;
	description = "�� ����� ������� - �� �����?";
};


func int Info_Kirgo_ChargeREAL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Kirgo_Charge) && (Kapitel <= 1))
	{
		return 1;
	};
};

func void Info_Kirgo_ChargeREAL_Info()
{
	AI_Output(other,self,"Info_Kirgo_ChargeREAL_15_00");	//�� ����� ������� - �� �����?
	AI_Output(self,other,"Info_Kirgo_ChargeREAL_05_01");	//��� �� ����!
	AI_StopProcessInfos(self);
	Kirgo_Charged = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance Info_Kirgo_InArena(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_InArena_Condition;
	information = Info_Kirgo_InArena_Info;
	permanent = 0;
	important = 1;
};


func int Info_Kirgo_InArena_Condition()
{
	if((Kirgo_Charged == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500))
	{
		return 1;
	};
};

func void Info_Kirgo_InArena_Info()
{
	if(Kapitel <= 1)
	{
		AI_Output(self,other,"Info_Kirgo_InArena_05_00");	//�����, �������. ����� ������� ����������!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else
	{
		AI_Output(self,other,"SVM_5_LetsForgetOurLittleFight");	//������� �� ����, �����?
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	};
};


instance INFO_KIRGO_QUENTIN(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 998;
	condition = info_kirgo_quentin_condition;
	information = info_kirgo_quentin_info;
	permanent = 0;
	description = "�� ���-������ ������ � �������� ������� � �����?";
};


func int info_kirgo_quentin_condition()
{
	if(GQ_OK == TRUE)
	{
		return 1;
	};
};

func void info_kirgo_quentin_info()
{
	AI_Output(other,self,"Info_Kirgo_Quentin_15_00");	//�� ���-������ ������ � �������� ������� � �����?
	AI_Output(self,other,"Info_Kirgo_Quentin_05_01");	//��, ��� ���� �����?
	AI_Output(other,self,"Info_Kirgo_Quentin_15_01");	//������� ���������� ����� ������������ �������� �������� �����?
	AI_Output(self,other,"Info_Kirgo_Quentin_05_02");	//����� ������ 5, ��� 7 �������, ��� ������.
	B_LogEntry(CH1_GQW,"� ����� ���������� 5, ��� 7 ����������.");
};

