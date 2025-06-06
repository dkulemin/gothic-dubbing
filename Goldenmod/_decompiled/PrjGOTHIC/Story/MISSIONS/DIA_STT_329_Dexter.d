
instance DIA_Dexter_Exit(C_Info)
{
	npc = STT_329_Dexter;
	nr = 999;
	condition = DIA_Dexter_Exit_Condition;
	information = DIA_Dexter_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Dexter_Exit_Condition()
{
	return 1;
};

func void DIA_Dexter_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dexter_First(C_Info)
{
	npc = STT_329_Dexter;
	nr = 1;
	condition = DIA_Dexter_First_Condition;
	information = DIA_Dexter_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Dexter_First_Condition()
{
	if(Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_Dexter_First_Info()
{
	AI_Output(self,other,"DIA_Dexter_IAmNew_10_00");	//��, ��! � ���� ���� �������� � �������� �� ������ ���������. �������������?
};


instance DIA_Dexter_Kraut(C_Info)
{
	npc = STT_329_Dexter;
	nr = 1;
	condition = DIA_Dexter_Kraut_Condition;
	information = DIA_Dexter_Kraut_Info;
	permanent = 0;
	description = "��� ����� ��������?";
};


func int DIA_Dexter_Kraut_Condition()
{
	return 1;
};

func void DIA_Dexter_Kraut_Info()
{
	AI_Output(other,self,"DIA_Dexter_Kraut_15_00");	//��� ����� ��������?
	AI_Output(self,other,"DIA_Dexter_Kraut_10_01");	//�� ���������, ��? �������� �����, ����� ����� ������� ������������.
};


instance DIA_Dexter_Trade(C_Info)
{
	npc = STT_329_Dexter;
	nr = 800;
	condition = DIA_Dexter_Trade_Condition;
	information = DIA_Dexter_Trade_Info;
	permanent = 1;
	description = "������ ���, ��� � ���� ����.";
	trade = 1;
};


func int DIA_Dexter_Trade_Condition()
{
	return 1;
};

func void DIA_Dexter_Trade_Info()
{
	AI_Output(other,self,"DIA_Dexter_Trade_15_00");	//������ ���, ��� � ���� ����.
	AI_Output(self,other,"DIA_Dexter_Trade_10_01");	//��� ����� ������...
	if(Dexter_Traded == FALSE)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"������� �� ����� ������� ������� ���������� � ���������� �� ������ ��������.");
		Dexter_Traded = TRUE;
	};
};


var int Dexter_GetKalomsRecipe;

instance DIA_Dexter_JoinOC(C_Info)
{
	npc = STT_329_Dexter;
	nr = 1;
	condition = DIA_Dexter_JoinOC_Condition;
	information = DIA_Dexter_JoinOC_Info;
	permanent = 0;
	description = "� ���� �������������� � ������ - ���� ����� ���������.";
};


func int DIA_Dexter_JoinOC_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void DIA_Dexter_JoinOC_Info()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_00");	//� ���� �������������� � ������ - ���� ����� ���������.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_01");	//��? ������ ��������, ��� �� ����-�� ������?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_02");	//������. ���� ���� ����. ���� ����������, � �������� �� ���� �������� ����� �����.
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_03");	//����� ����?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_04");	//� ������ ��������� ���� ���� ��� �� ����� �����. ������� ����� - ���� �� �� ����.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_05");	//����� - �������. � ���� ���� ������ �������� ��������� ��������.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_06");	//� ���� ������ � ���� ������, ����� ������ ������ ����� �������.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_07");	//�� ��� ����� ����� ���-�� ����������� � �������.
	AI_Output(other,self,"DIA_Dexter_JoinOC_15_08");	//��� � ������ �������?
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_09");	//�������� ��������� ��������� ����� ����� ����. �� ����� ���������. ����������, ��� ������ �������������� � ���.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_10");	//����� - ���� �� ����. �� ���������� ������� �������� �������. ����� ����������� � ���, �������� ������ ������.
	AI_Output(self,other,"DIA_Dexter_JoinOC_10_11");	//������ ������ ���, ������ ������� - ��� ��� �����, ��� �� ��� ��������.
	Info_ClearChoices(DIA_Dexter_JoinOC);
	Info_AddChoice(DIA_Dexter_JoinOC,"�����, � ��������.",DIA_Dexter_JoinOC_Ok);
	Info_AddChoice(DIA_Dexter_JoinOC,"��� ������ ���� ��������. ��� � ������ � �����?",DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_Ok_15_00");	//�����, � ��������.
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	Log_CreateTopic(CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_KalomsRecipe,"������� �� ����� �������, ��������� �� �����, ������� ��� ����������� � ����� ������ � �������� ������ � �������� ��� ������.");
	B_LogEntry(CH1_KalomsRecipe,"����� ������� ����, ��� ���� ���� ����� �� ��������� ��������� ������. ��� ������ �������.");
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_HowMuch_15_00");	//��� ������ ���� ��������. ��� � ������ � �����?
	AI_Output(self,other,"DIA_Dexter_JoinOC_HowMuch_10_01");	//������� ����� ������� ���� � ����. ������, �� ���� ����� �������� ��� �����.
	Info_AddChoice(DIA_Dexter_JoinOC,"��������, ��� �������� ��������� �� ������.",DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_Advance_15_00");	//��������, ��� �������� ��������� �� ������. ��� ������ ���������� ������? ������, 50 ������ ����?
	AI_Output(self,other,"DIA_Dexter_JoinOC_Advance_10_01");	//������ �� ����.
	Info_AddChoice(DIA_Dexter_JoinOC,"��� ���� � �� ����� ������ ���� ���� ������!",DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_Threat_15_00");	//��� ���� � �� ����� ������ ���� ���� ������!
	AI_Output(self,other,"DIA_Dexter_JoinOC_Threat_10_01");	//������! � ���� ��������� �����, ����� ������ ��� ����� � ����.
	Info_AddChoice(DIA_Dexter_JoinOC,"���!",DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00");	//���! ��� �� ����� ��� ���� ������, ��� ������ ��� ������ ���� ������!
	AI_Output(self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01");	//������, ������ ���� ����� ���� ����� ������ ��������. �������, � ������ ��� ������ ����-������ �� ���...
	Info_AddChoice(DIA_Dexter_JoinOC,"�����! ������� �� ����.",DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00");	//�����! ������� �� ����.
	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01");	//������. � ������ ����� �����, ��� ������ �� ������� �����. 50 ������ ���� - �������� ������� ����� ��� �������, �� �� ��������?
	AI_Output(other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02");	//������ ��� �����.
	AI_Output(self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03");	//�����, �����, � ���� ��� ��� ���� 50 ������ ������. �� ������� ����, �����!
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	Log_CreateTopic(CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_KalomsRecipe,"������� �� ����� �������, ��������� �� �����, ������� ��� ����������� � ����� ������ � �������� ������ � �������� ��� ������.");
	B_LogEntry(CH1_KalomsRecipe,"����� ������� ����, ��� ���� ���� ����� �� ��������� ��������� ������. ��� ������ �������.");
	DEXTER_PAYEDFIRST = TRUE;
	CreateInvItems(self,ItMiNugget,50);
	B_GiveInvItems(self,other,ItMiNugget,50);
	Info_ClearChoices(DIA_Dexter_JoinOC);
};


var int Dexter_PsiCamp;

instance DIA_Dexter_WhereST(C_Info)
{
	npc = STT_329_Dexter;
	nr = 800;
	condition = DIA_Dexter_WhereST_Condition;
	information = DIA_Dexter_WhereST_Info;
	permanent = 1;
	description = "��� ��������� ������ ���������?";
};


func int DIA_Dexter_WhereST_Condition()
{
	if(Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Dexter_WhereST_Info()
{
	AI_Output(other,self,"DIA_Dexter_WhereST_15_00");	//��� ��������� ������ ���������?
	AI_Output(self,other,"DIA_Dexter_WhereST_10_01");	//�������� �� ������ ����� ����� ������ � ����� �� ������. ���� ����������� �����.
	if(Npc_HasItems(self,ItWrWorldmap) > 0)
	{
		AI_Output(self,other,"DIA_Dexter_WhereST_10_02");	//� ���� ��� ��� ���� ���� - �� 50 ������...
	};
	AI_Output(other,self,"DIA_Dexter_WhereST_15_02");	//����� ������ - ��� ������������ �����, �����?
	AI_Output(self,other,"DIA_Dexter_WhereST_10_03");	//�����.
	if(!Dexter_PsiCamp)
	{
		B_LogEntry(CH1_KalomsRecipe,"�������� ������ ���������� � ������� �� ������� ������.");
		Dexter_PsiCamp = TRUE;
	};
};


instance DIA_Dexter_KalomsRecipeSuccess(C_Info)
{
	npc = STT_329_Dexter;
	nr = 800;
	condition = DIA_Dexter_KalomsRecipeSuccess_Condition;
	information = DIA_Dexter_KalomsRecipeSuccess_Info;
	permanent = 1;
	description = "� ����� ������!";
};


func int DIA_Dexter_KalomsRecipeSuccess_Condition()
{
	if((Dexter_GetKalomsRecipe == LOG_RUNNING) && (Npc_HasItems(other,KalomsRecipe) > 0))
	{
		return 1;
	};
};

func void DIA_Dexter_KalomsRecipeSuccess_Info()
{
	AI_Output(other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00");	//� ����� ������!
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01");	//����� ������! ������ ��� ���!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02");	//�������! ������ � ��� ����� �������� ���� �������.
	AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03");	//�� ������� ������! ����� ����� ����� �� ����!
	if(DEXTER_PAYEDFIRST != TRUE)
	{
		AI_Output(self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04");	//���, ������, ��� ���� �� ������...
		CreateInvItems(self,ItMiNugget,50);
		B_GiveInvItems(self,other,ItMiNugget,50);
	};
	B_GiveInvItems(other,self,KalomsRecipe,1);
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe,LOG_SUCCESS);
		B_LogEntry(CH1_KalomsRecipe,"������� ������� ��� ������������. ������, �� ��������� �� ���� �����.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe,LOG_SUCCESS);
		B_LogEntry(CH1_KalomsRecipe,"������� ������� ��� ������������. �� ��� ����� - � �� ���� ����� ��������� � ����� ������.");
	};
	B_GiveXP(XP_DexterKalom);
};


instance DIA_DEXTER_QUENTIN(C_Info)
{
	npc = STT_329_Dexter;
	nr = 1;
	condition = dia_dexter_quentin_condition;
	information = dia_dexter_quentin_info;
	permanent = 0;
	description = "�� ������ ���-������ ������� � �������� ������� � �����?";
};


func int dia_dexter_quentin_condition()
{
	if((GQ_OK == TRUE) && !Npc_KnowsInfo(hero,org_858_quentin_gorn_ok))
	{
		return 1;
	};
};

func void dia_dexter_quentin_info()
{
	AI_Output(other,self,"DIA_Dexter_Quentin_15_00");	//�� ������ ���-������ ������� � �������� ������� � �����?
	AI_Output(self,other,"DIA_Dexter_Quentin_10_01");	//�� ���, ��������� �� ���� �������� ���������?
};

