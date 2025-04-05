
instance DIA_Scatty_Exit(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 999;
	condition = DIA_Scatty_Exit_Condition;
	information = DIA_Scatty_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Scatty_Exit_Condition()
{
	return 1;
};

func void DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Scatty_WhatDoYouDo(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WhatDoYouDo_Condition;
	information = DIA_Scatty_WhatDoYouDo_Info;
	permanent = 0;
	description = "��� �� �����������?";
};


func int DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

func void DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output(other,self,"DIA_Scatty_WhatDoYouDo_15_00");	//� ��� ����������� ���� ������?
	AI_Output(self,other,"DIA_Scatty_WhatDoYouDo_01_01");	//� ������� �� ����� - ��������� ������, ������� ����� ������... � ��� �����.
};


var int Scatty_ChargeKirgo;
var int Scatty_ChargeKharim;
var int Scatty_ChargeGorHanis;

instance DIA_Scatty_JoinOC(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_JoinOC_Condition;
	information = DIA_Scatty_JoinOC_Info;
	permanent = 0;
	description = "� ���� �������������� � ����� ������. �� ������ ��� ������?";
};


func int DIA_Scatty_JoinOC_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void DIA_Scatty_JoinOC_Info()
{
	var C_Npc Kirgo;
	var C_Npc Kharim;
	var C_Npc GorHanis;
	AI_Output(other,self,"DIA_Scatty_JoinOC_15_00");	//� ���� �������������� � ����� ������. �� ������ ��� ������?
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_01");	//��� ��, ���� ���� ������� ���������� �� ���� �����������.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_02");	//����� ����������� ������ ����� ���� ���� �������.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_03");	//������ �� ��� ������ �� ���. ��������, ��������� �� �����, �, ����� ����, � ������� � ����� �������.
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	B_LogEntry(CH1_JoinOC,"�� ������, ������� �����, ���������� �����������, ���� � ������ �� ��� ������ �� ������.");
};


instance DIA_Scatty_KirgoSuccess(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_KirgoSuccess_Condition;
	information = DIA_Scatty_KirgoSuccess_Info;
	permanent = 0;
	description = "� ������ � �����!";
};


func int DIA_Scatty_KirgoSuccess_Condition()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	if((Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ((Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void DIA_Scatty_KirgoSuccess_Info()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	AI_Output(other,self,"DIA_Scatty_KirgoSuccess_15_00");	//� ������ � �����!
	if(Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_01");	//��, � ��������!
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_02");	//�����, �� �� �������� ������� ���� ����...
		Scatty_ChargeKirgo = LOG_FAILED;
		B_LogEntry(CH1_JoinOC,"������ ����� ���� ���� ���� �� ��������� �� ������ �����������.");
	}
	else if(Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_03");	//� �� ������� ���! ������ ������� ��� �������! � �������!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		B_LogEntry(CH1_JoinOC,"��� ��� ������ ����� �������� �� ������ �����������.");
		B_GiveXP(XP_kirgovictory);
	};
};


instance DIA_Scatty_KHARIMSuccess(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_KHARIMSuccess_Condition;
	information = DIA_Scatty_KHARIMSuccess_Info;
	permanent = 0;
	description = "� �������� � �������!";
};


func int DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	if((Scatty_ChargeKharim == LOG_RUNNING) && (Kharim_Charged == TRUE) && ((Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void DIA_Scatty_KHARIMSuccess_Info()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	AI_Output(other,self,"DIA_Scatty_KHARIMSuccess_15_00");	//� �������� � �������!
	if(Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_01");	//��, � �� ������ ���� �������!
		if(Npc_GetTrueGuild(hero) == GIL_None)
		{
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_02");	//�� ��������� ������ ����������. ������ ������� ���� �������� �� ������ ������.
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_03");	//������, �� ��� ��������� - ��� ��� ����� ���� ����� ���!
		};
		Scatty_ChargeKharim = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry(CH1_JoinOC,"����� ����� ����! ��� �������� ����������� ������, �� ��� ��� ��� - ���.");
	}
	else if(Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_04");	//� �� ������� ���! ������ ��������, ��� ���� �������. ��� ������ ������� ����� �� ������ ������.
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_05");	//�� ������ ����!
		Scatty_ChargeKharim = LOG_SUCCESS;
		B_LogEntry(CH1_JoinOC,"� ������� ������! ������ ������� ��� ������������.");
		B_GiveXP(XP_kharimvictory);
	};
};


instance DIA_SCATTY_GORHANISSUCCESS(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_gorhanissuccess_condition;
	information = dia_scatty_gorhanissuccess_info;
	permanent = 0;
	description = "� ������ � ��� �������!";
};


func int dia_scatty_gorhanissuccess_condition()
{
	var C_Npc GorHanis;
	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	if((GORHANIS_OK == TRUE) && ((GorHanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (GorHanis.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_gorhanissuccess_info()
{
	var C_Npc GorHanis;
	var C_Npc fletcher;
	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	AI_Output(other,self,"DIA_Scatty_GorHanisSuccess_15_00");	//� ������ � ��� �������!
	fletcher = Hlp_GetNpc(GRD_255_Fletcher);
	Npc_SetTrueGuild(self,GIL_GRD);
	self.guild = GIL_GRD;
	Npc_SetTrueGuild(fletcher,GIL_GRD);
	fletcher.guild = GIL_GRD;
	if(GorHanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_GorHanisSuccess_01_01");	//� �� ��������!
		Log_SetTopicStatus(CH1_FLETCHER,LOG_FAILED);
		Scatty_ChargeGorHanis = LOG_FAILED;
		B_LogEntry(CH1_FLETCHER,"� �������� ��� � ��� ������. ������ ������� ������� ������ ��� ����.");
	}
	else if(GorHanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_GorHanisSuccess_01_02");	//��, � �� �������!
		B_GiveXP(500);
		B_LogEntry(CH1_FLETCHER,"� ������� ��� ������.");
		GORHANIS_SUCCESS = TRUE;
		SCATTY_OK = FALSE;
		GORHANIS_OK = FALSE;
		Scatty_ChargeGorHanis = LOG_SUCCESS;
		CreateInvItems(GRD_255_Fletcher,ItMiNugget,350);
		if(SCATTYNUGGESTOK == TRUE)
		{
			AI_Output(self,other,"DIA_Scatty_GorHanisSuccess_01_03");	//�� ������ ������. ��� ���� ����.
			if(SCATTYNUGGEST_A == TRUE)
			{
				B_GiveInvItems(self,hero,ItMiNugget,1500);
			}
			else if(SCATTYNUGGEST_B == TRUE)
			{
				B_GiveInvItems(self,hero,ItMiNugget,1000);
			}
			else
			{
				B_GiveInvItems(self,hero,ItMiNugget,500);
			};
			SCATTYNUGGESTOK = FALSE;
		};
	};
};


instance DIA_Scatty_OtherCamps(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_OtherCamps_Condition;
	information = DIA_Scatty_OtherCamps_Info;
	permanent = 0;
	description = "������ �� ���������� ������ �� ������ ������� ������� �����?";
};


func int DIA_Scatty_OtherCamps_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

func void DIA_Scatty_OtherCamps_Info()
{
	AI_Output(other,self,"DIA_Scatty_OtherCamps_15_00");	//��� ��������, ��� ����� ������ � ������ ������ �� �����-�� ����� ����� ����� - ��� ������ �� �� ���������� ���� ����� ��������� �����?
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_01");	//��� ����� ������: ��� ������� ����� ���� ��� � ������, � ��������� ����� �������� ��������, ��� ����������� �� ����� ����� �� ������ ������.
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_02");	//����� ������� ���� �� ���, ���� ������ ������ ������ - � ���, ��� �� ���������, ������ �� �����.
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_03");	//����� � ������� �� ���� ���� �������� �� ������ ������ - �� ������ ���� ������...
};


instance DIA_Scatty_WannaBet(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WannaBet_Condition;
	information = DIA_Scatty_WannaBet_Info;
	permanent = 1;
	description = "� ���� ������� ������.";
};


func int DIA_Scatty_WannaBet_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

func void DIA_Scatty_WannaBet_Info()
{
	AI_Output(other,self,"DIA_Scatty_WannaBet_15_00");	//� ���� ������� ������.
	if(SCATTY_OK == TRUE)
	{
		AI_Output(other,self,"DIA_Scatty_WannaBet_15_01");	//� ��������� ������� � ��� �������.
	};
	if(SCATTY_OK == FALSE)
	{
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_01");	//�� ������ �� ����� �� �������.
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_02");	//��������� ��� ��������� ����� ��������� ����. ����� �������������� ���������.
	}
	else if(SCATTYNUGGESTOK == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_03");	//�� �� ������ 2 ���� ��������� �� ���� � ����� ���.
	}
	else if(SCATTYNUGGESTNO == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_04");	//������ �� ���� ��� ������ �� �����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_05");	//��������� �� ������ ������� �� �����, �� ������ ��������� ������ �� ����.
		AI_Output(other,self,"DIA_Scatty_WannaBet_15_02");	//������, � ��������...
		Info_AddChoice(DIA_Scatty_WannaBet,"... � ���������.",dia_scatty_wannabet_no);
		if(Npc_HasItems(hero,ItMiNugget) >= 50)
		{
			Info_AddChoice(DIA_Scatty_WannaBet,"... 50 ������ ����.",dia_scatty_wannabet_c);
		};
		if(Npc_HasItems(hero,ItMiNugget) >= 100)
		{
			Info_AddChoice(DIA_Scatty_WannaBet,"... 100 ������ ����.",dia_scatty_wannabet_b);
		};
		if(Npc_HasItems(hero,ItMiNugget) >= 150)
		{
			Info_AddChoice(DIA_Scatty_WannaBet,"... 150 ������ ����.",dia_scatty_wannabet_a);
		};
	};
};

func void dia_scatty_wannabet_no()
{
	AI_Output(other,self,"DIA_Scatty_WannaBet_NO_15_00");	//... � ���������.
	Info_ClearChoices(DIA_Scatty_WannaBet);
};

func void dia_scatty_wannabet_c()
{
	AI_Output(other,self,"DIA_Scatty_WannaBet_C_15_00");	//... 50 ������ ����.
	AI_Output(self,other,"DIA_Scatty_WannaBet_�_01_00");	//� � ���� �� ��� ����� ����.
	SCATTYNUGGESTOK = TRUE;
	SCATTYNUGGEST_C = TRUE;
	B_GiveInvItems(hero,self,ItMiNugget,50);
	Info_ClearChoices(DIA_Scatty_WannaBet);
};

func void dia_scatty_wannabet_b()
{
	AI_Output(other,self,"DIA_Scatty_WannaBet_B_15_00");	//... 100 ������ ����.
	AI_Output(self,other,"DIA_Scatty_WannaBet_B_01_00");	//������.
	SCATTYNUGGESTOK = TRUE;
	SCATTYNUGGEST_B = TRUE;
	B_GiveInvItems(hero,self,ItMiNugget,100);
	Info_ClearChoices(DIA_Scatty_WannaBet);
};

func void dia_scatty_wannabet_a()
{
	AI_Output(other,self,"DIA_Scatty_WannaBet_A_15_00");	//... 150 ������ ����.
	AI_Output(self,other,"DIA_Scatty_WannaBet_A_01_00");	//(���������) ����������� ������.
	SCATTYNUGGESTOK = TRUE;
	SCATTYNUGGEST_A = TRUE;
	B_GiveInvItems(hero,self,ItMiNugget,150);
	Info_ClearChoices(DIA_Scatty_WannaBet);
};


instance DIA_Scatty_WannaFight(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WannaFight_Condition;
	information = DIA_Scatty_WannaFight_Info;
	permanent = 1;
	description = "� ���� ��������� �� �����!";
};


func int DIA_Scatty_WannaFight_Condition()
{
	if(Npc_KnowsInfo(hero,dia_fletcher_noproblem_start) && (GORHINIS_FIGHT_OK == FALSE) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Scatty_WannaFight_Info()
{
	var C_Npc GorHanis;
	AI_Output(other,self,"DIA_Scatty_WannaFight_15_00");	//� ���� ��������� �� �����!
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		AI_Output(self,other,"DIA_Scatty_WannaFight_01_01");	//� �� ���� ��������� ���� �����, ���� �� �� �������������� � ������ �� �������!
		AI_Output(self,other,"DIA_Scatty_WannaFight_01_02");	//������ �� ����� ����������� �����-��������!
	}
	else
	{
		AI_Output(other,self,"DIA_Scatty_WannaFight_15_01");	//������� �������� �� ���� 150 ������ ����.
		AI_Output(self,other,"DIA_Scatty_WannaFight_01_03");	//� � ��� �� ������ �������?
		AI_Output(other,self,"DIA_Scatty_WannaFight_15_02");	//� ��� �������.
		AI_Output(self,other,"DIA_Scatty_WannaFight_01_04");	//������, �� ������ �������� ���� ���.
		SCATTY_OK = TRUE;
		Npc_RemoveInvItems(GRD_255_Fletcher,ItMiNugget,150);
		Scatty_ChargeGorHanis = LOG_RUNNING;
		GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
		GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
		DIA_Scatty_WannaFight.permanent = 0;
	};
};


instance DIA_Scatty_TRAIN(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 10;
	condition = DIA_Scatty_TRAIN_Condition;
	information = DIA_Scatty_TRAIN_Info;
	permanent = 1;
	description = "� �� ������ ���������� ������?";
};


func int DIA_Scatty_TRAIN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

func void DIA_Scatty_TRAIN_Info()
{
	if(log_scattytrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"������, ������ �����, ����� ������� ���� ��������� ���������� �������.");
		log_scattytrain = TRUE;
	};
	AI_Output(other,self,"DIA_Scatty_TRAIN_15_00");	//� �� ������ ���������� ������?
	AI_Output(self,other,"DIA_Scatty_TRAIN_01_01");	//��, �� �� ���� �����������. ���� �� ������, ����� � ���� ����, ���� �������� ���������.
	Info_ClearChoices(DIA_Scatty_TRAIN);
	Info_AddChoice(DIA_Scatty_TRAIN,DIALOG_BACK,DIA_Scatty_TRAIN_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1)
	{
		Info_AddChoice(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2,LPCOST_TALENT_1H_2,150),DIA_Scatty_TRAIN_2h);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 0)
	{
		Info_AddChoice(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1,50),DIA_Scatty_TRAIN_1h);
	};
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices(DIA_Scatty_TRAIN);
};

func void DIA_Scatty_TRAIN_1h()
{
	AI_Output(other,self,"DIA_Scatty_TRAIN_1h_15_00");	//� ����� �� ��������������� � ���������� �������.
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(other,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_01");	//������� �����! �� ������ ��� ���������� ��������, ���� ����� ��������� ��������� ������� ������.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_02");	//������� ����� �������� �� ������� ����� ������. ��� �����������, � ����� ����� �� ���������.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_03");	//�������� �� ������� ����� �����. ������ �����, � �� ����� ��� ����������.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_04");	//������ ������ ����� ������������ ����� ����, ����������� � ���� ��������. ��� ������� �������� �����.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_05");	//���� ��������� ���, � ��� � ���� �������, ���� ����� ������ ����� �������� � ��������.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_06");	//��, � ��� ��� ���: ��������� ����� ���� ����������� ���������. � ������� �� ��� ����� ������ ��������� ��.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_07");	//�� ��� ������ �� ������ �������������, ��� ����� ��� � ���� ����� ����������.
			B_GiveInvItems(other,self,ItMiNugget,50);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00");	//� ���� ������������ ����!
	};
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output(other,self,"DIA_Scatty_TRAIN_2h_15_01");	//�������� ��� ��� ���-������ ��� ���������� ������.
	if(Npc_HasItems(other,ItMiNugget) >= 150)
	{
		if(B_GiveSkill(other,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_02");	//�����, �� ��� ������ �������. ���� ������� ������ ������� ����, ������ ���� ��������� ����� �������.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_03");	//������� ����, �������? �����, ������ � ���, ��� ����� ���������. ������ ��� ����� � �������������� - ���� ��������� �����������, � �� ��������� � �������� ���������.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_04");	//��� ���� ����� ������� ������ ������...
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_05");	//...� ������������� � �������� ������. �������, �� ������� �������������. ���, ����������� �������.
			B_GiveInvItems(other,self,ItMiNugget,150);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00");	//�����������, ����� �������� ���������� ����!
	};
};

