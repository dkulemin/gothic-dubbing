
instance Info_GorHanis_Exit(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 999;
	condition = Info_GorHanis_Exit_Condition;
	information = Info_GorHanis_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_GorHanis_Exit_Condition()
{
	return 1;
};

func void Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_GorHanis_What(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_What_Condition;
	information = Info_GorHanis_What_Info;
	permanent = 0;
	description = "��� �� �����������?";
};


func int Info_GorHanis_What_Condition()
{
	return 1;
};

func void Info_GorHanis_What_Info()
{
	AI_Output(other,self,"Info_GorHanis_What_15_00");	//��� �� �����������?
	AI_Output(self,other,"Info_GorHanis_What_08_01");	//�? �������� �� ����� �������!
};


instance Info_GorHanis_Arena(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_Arena_Condition;
	information = Info_GorHanis_Arena_Info;
	permanent = 1;
	description = "�� �������� �� �����?";
};


func int Info_GorHanis_Arena_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Arena_Info()
{
	AI_Output(other,self,"Info_GorHanis_Arena_15_00");	//�� �������� �� �����?
	AI_Output(self,other,"Info_GorHanis_Arena_08_01");	//�������� ������ ������� ���� ���� ��������� �� ����� �������.
	AI_Output(self,other,"Info_GorHanis_Arena_08_02");	//� ������ �� ��� ������� - � �������� �����, ����� ����� �� ������� ����!
};


instance Info_GorHanis_Sleeper(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Sleeper_Condition;
	information = Info_GorHanis_Sleeper_Info;
	permanent = 0;
	description = "��� ����� ������?";
};


func int Info_GorHanis_Sleeper_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Sleeper_Info()
{
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00");	//��� ����� ������?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_01");	//����� � ����� ������ ��������� ���� � ��� ���� �����, ��� �.
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_02");	//� ������ ��� ��� ���� �����: ������ - ��� ���������. �� ������ ��� ����, �� �� � ������� ��� ������.
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_03");	//�� ���� �� �����, ���� ��� ��� ������� ��� �������?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_04");	//��! � ���� �������� ����� ���������. ��� ��������� ������� ���������.
};


instance Info_GorHanis_Summoning(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Summoning_Condition;
	information = Info_GorHanis_Summoning_Info;
	permanent = 0;
	description = "��� �� ���������?";
};


func int Info_GorHanis_Summoning_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_Sleeper))
	{
		return 1;
	};
};

func void Info_GorHanis_Summoning_Info()
{
	AI_Output(other,self,"Info_GorHanis_Summoning_15_00");	//��� �� ���������?
	AI_Output(self,other,"Info_GorHanis_Summoning_08_01");	//���� ������� �������, ��� ������� ��������� ������ ������� ������� ��� ���� � �������!
	AI_Output(self,other,"Info_GorHanis_Summoning_08_02");	//���� ������ ������ �� ���� ������, ������� � ��� ������.
};


instance Info_GorHanis_WayToST(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 0;
	condition = Info_GorHanis_WayToST_Condition;
	information = Info_GorHanis_WayToST_Info;
	permanent = 1;
	description = "��� ��������� �� ������ ������?";
};


func int Info_GorHanis_WayToST_Condition()
{
	if(Npc_KnowsInfo(hero,Info_GorHanis_Sleeper) || Npc_KnowsInfo(hero,Info_GorHanis_Summoning))
	{
		return 1;
	};
};

func void Info_GorHanis_WayToST_Info()
{
	AI_Output(other,self,"Info_GorHanis_WayToST_15_00");	//��� ��������� �� ������ ������?
	AI_Output(self,other,"Info_GorHanis_WayToST_08_01");	//�����, � ������ ������, ������ ����� ����� ����-������ �� �����������. ��� � �������� �������� ���� � ��� ������. ���� ������ ����� ���������� � ����.
};


instance Info_GorHanis_Charge(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 3;
	condition = Info_GorHanis_Charge_Condition;
	information = Info_GorHanis_Charge_Info;
	permanent = 0;
	description = "� ������� ���� �� ���!";
};


func int Info_GorHanis_Charge_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Charge_Info()
{
	AI_Output(other,self,"Info_GorHanis_Charge_15_00");	//� ������� ���� �� ���!
	AI_Output(self,other,"Info_GorHanis_Charge_08_01");	//�������� ����� ��� �������, ���� � ���� ������� ������� ����������� �� ������ � �����.
	AI_Output(self,other,"Info_GorHanis_Charge_08_02");	//� ���� ������� � ����� ������ �����, ����� �� ������� ��������� �����������.
	AI_Output(self,other,"Info_GorHanis_Charge_08_03");	//�� � �����, ��� � ������ �� ������ ������� ���� ������ ���������...
};


var int gorhanis_charged;

instance Info_GorHanis_ChargeGood(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 3;
	condition = Info_GorHanis_ChargeGood_Condition;
	information = Info_GorHanis_ChargeGood_Info;
	permanent = 1;
	description = "�� ���, ������ �� ������ ������� �� ����?";
};


func int Info_GorHanis_ChargeGood_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_Charge) && (GORHINIS_FIGHT_OK == FALSE) && (Kapitel <= 3))
	{
		return 1;
	};
};

func void Info_GorHanis_ChargeGood_Info()
{
	AI_Output(other,self,"Info_GorHanis_ChargeGood_15_00");	//�� ���, ������ �� ������ ������� �� ����?
	if(!Npc_KnowsInfo(hero,dia_fletcher_noproblem_start))
	{
		AI_Output(self,other,"Info_GorHanis_ChargeGood_08_01");	//���! �� ��� ������������ ����� ��� �����!
	}
	else if(SCATTY_OK == FALSE)
	{
		AI_Output(self,other,"Info_GorHanis_ChargeGood_08_02");	//������ �� ��� ���� ���� �������� �� ���������� ����.
	}
	else
	{
		AI_Output(self,other,"Info_GorHanis_ChargeGood_08_03");	//�� ����� ��������� �� ����?
		AI_Output(other,self,"Info_GorHanis_ChargeGood_15_01");	//��, � �����.
		SCATTY_OK = FALSE;
		Info_GorHanis_ChargeGood.permanent = 0;
		AI_StopProcessInfos(self);
		GORHANIS_CHARGED = TRUE;
		GORHINIS_FIGHT_OK = TRUE;
		Npc_ExchangeRoutine(self,"GUIDE");
	};
};


instance INFO_GORHANIS_INARENA(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = info_gorhanis_inarena_condition;
	information = info_gorhanis_inarena_info;
	permanent = 0;
	important = 1;
};


func int info_gorhanis_inarena_condition()
{
	if((GORHANIS_CHARGED == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500))
	{
		return 1;
	};
};

func void info_gorhanis_inarena_info()
{
	var C_Npc scatty;
	var C_Npc fletcher;
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"Info_GorHanis_InArena_08_00");	//��������!
		GORHANIS_OK = TRUE;
		SCATTYNUGGESTNO = TRUE;
		scatty = Hlp_GetNpc(GRD_210_Scatty);
		fletcher = Hlp_GetNpc(GRD_255_Fletcher);
		Npc_SetTrueGuild(scatty,GIL_None);
		scatty.guild = GIL_None;
		Npc_SetTrueGuild(fletcher,GIL_None);
		fletcher.guild = GIL_None;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else
	{
		AI_Output(self,other,"SVM_8_LetsForgetOurLittleFight");	//������� �� ����, �����?
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	};
};

