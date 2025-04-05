
instance DIA_Huno_Exit(C_Info)
{
	npc = VLK_538_Huno;
	nr = 999;
	condition = DIA_Huno_Exit_Condition;
	information = DIA_Huno_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Huno_Exit_Condition()
{
	return 1;
};

func void DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Huno_YouKnowYourJob(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_YouKnowYourJob_Condition;
	information = DIA_Huno_YouKnowYourJob_Info;
	permanent = 0;
	important = 0;
	description = "������, �� ������ ������ ���� ����.";
};


func int DIA_Huno_YouKnowYourJob_Condition()
{
	return TRUE;
};

func void DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output(other,self,"DIA_Huno_YouKnowYourJob_15_00");	//������, �� ������ ������ ���� ����.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_01");	//���� ��� ����� �� ���������.
	AI_Output(self,other,"DIA_Huno_YouKnowYourJob_09_02");	//�� � ��� ����� ����������? ����� ������� ������ ����� ���� ���, � ������� ���� ����� ������ �.
};


instance DIA_Huno_HowLong(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_HowLong_Condition;
	information = DIA_Huno_HowLong_Info;
	permanent = 0;
	important = 0;
	description = "������� ������� ������ �� ������������ ������ ����?";
};


func int DIA_Huno_HowLong_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_HowLong_Info()
{
	AI_Output(other,self,"DIA_Huno_HowLong_15_00");	//������� ������� ������ �� ������������ ������ ����?
	AI_Output(self,other,"DIA_Huno_HowLong_09_01");	//������ ����� ����� ���. ������� � ����� ����������� �����������.
	AI_Output(self,other,"DIA_Huno_HowLong_09_02");	//��, ����������, ���� ���� ���� ����������.
	AI_Output(self,other,"DIA_Huno_HowLong_09_03");	//�� � ������, ����� ��������, ���������� ����� ������, ��� ���� ���������.
	AI_Output(other,self,"DIA_Huno_HowLong_15_04");	//������? �� ���� ������?
	AI_Output(self,other,"DIA_Huno_HowLong_09_05");	//��� ��� ��������. �� ��������� ��� �� �������� ��� 150 ������ ����.
	AI_Output(self,other,"DIA_Huno_HowLong_09_06");	//����� �������� ��������� � ������ ����� ������, � ��� ����� ��������.
	AI_Output(self,other,"DIA_Huno_HowLong_09_07");	//��, �� �� ���� ������ �� ��������!
};


instance DIA_Huno_HowsYourBusiness(C_Info)
{
	npc = VLK_538_Huno;
	nr = 1;
	condition = DIA_Huno_HowsYourBusiness_Condition;
	information = DIA_Huno_HowsYourBusiness_Info;
	permanent = 0;
	important = 0;
	description = "��� ����, ������?";
};


func int DIA_Huno_HowsYourBusiness_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_00");	//��� ����, ������?
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_01");	//���������, ������ �� �����������...
	AI_Output(other,self,"DIA_Huno_HowsYourBusiness_15_02");	//�����, � ���� ���� ��� ���� ������.
	AI_Output(self,other,"DIA_Huno_HowsYourBusiness_09_04");	//����� �� ��� ���-������ ������!
};


var int Huno_LearnSmith;

instance DIA_Huno_LEARNSMITH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_LEARNSMITH_Condition;
	information = DIA_Huno_LEARNSMITH_Info;
	permanent = 1;
	important = 0;
	description = "� �� ���� ����� ����� ����������.";
};


func int DIA_Huno_LEARNSMITH_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Huno_YouKnowYourJob))
	{
		return TRUE;
	};
};

func void DIA_Huno_LEARNSMITH_Info()
{
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_00");	//� �� ���� ����� ����� ����������.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_01");	//�� �� ������� �� ��, ��� �������� ������ ������� ������?
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_02");	//��� � ������ ������?
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_03");	//���, ���� ��������� � ��� �� � �����.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_04");	//����� ������ ���������� ��������, ����� ��� �� ����������.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_05");	//������� ��� ����� �������� � ����� � �����, ����� �������� ������.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_06");	//�� � ����� �� ����������� ��� �� ��������� �����.
	AI_Output(other,self,"DIA_Huno_LEARNSMITH_15_07");	//�������.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_08");	//��� ����� ����� ����������� ����������� - � � ���� ������� �� ����.
	AI_Output(self,other,"DIA_Huno_LEARNSMITH_09_09");	//� �� ������ ��������� ��� ���� ����.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"������ ���� ����� ������� ��� �������� ���������. ����� �� ����� �������� ���������� ���� ����.");
	Huno_LearnSmith = TRUE;
};


instance DIA_Huno_BUYSMITH(C_Info)
{
	npc = VLK_538_Huno;
	nr = 2;
	condition = DIA_Huno_BUYSMITH_Condition;
	information = DIA_Huno_BUYSMITH_Info;
	permanent = 1;
	important = 0;
	description = "��� ����� �����������!";
	trade = 1;
};


func int DIA_Huno_BUYSMITH_Condition()
{
	if(Huno_LearnSmith == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Huno_BUYSMITH_Info()
{
	AI_Output(other,self,"DIA_Huno_BUYSMITH_15_00");	//��� ����� �����������!
	if(Npc_HasItems(self,ItMiSwordraw) < 5)
	{
		CreateInvItems(self,ItMiSwordraw,5);
	};
	if(Npc_HasItems(self,ItMiSwordrawhot) < 5)
	{
		CreateInvItems(self,ItMiSwordrawhot,5);
	};
	if(Npc_HasItems(self,ItMiSwordbladehot) < 5)
	{
		CreateInvItems(self,ItMiSwordbladehot,5);
	};
	if(Npc_HasItems(self,ItMiSwordblade) < 5)
	{
		CreateInvItems(self,ItMiSwordblade,5);
	};
};


instance DIA_HUNO_TRADE_SWORD(C_Info)
{
	npc = VLK_538_Huno;
	nr = 600;
	condition = dia_huno_trade_sword_condition;
	information = dia_huno_trade_sword_info;
	permanent = 1;
	description = "(������� ������)";
};


func int dia_huno_trade_sword_condition()
{
	if(Huno_LearnSmith == TRUE)
	{
		return 1;
	};
};

func void dia_huno_trade_sword_info()
{
	AI_Output(other,self,"DIA_Huno_TRADE_SWORD_15_00");	//� ���� ������� ���������� ���� ����.
	if(HUNO_ST == FALSE)
	{
		AI_Output(self,other,"DIA_Huno_TRADE_SWORD_09_00");	//� ������� ���� 70 ������ ���� �� ������ ���.
		Log_CreateTopic(GE_TRADERSWORD,LOG_NOTE);
		B_LogEntry(GE_TRADERSWORD,"������ ���� � ������ ������ ����� �������� ��� ���� �� 70 ������ ����.");
		HUNO_ST = TRUE;
	};
	if(Npc_HasItems(other,ItMw_1H_Sword_01) >= 1)
	{
		Info_AddChoice(dia_huno_trade_sword,"(������� 1 ���)",dia_huno_trade_sword_b);
	};
	Info_AddChoice(dia_huno_trade_sword,"� ����� �����.",dia_huno_trade_sword_no);
};

func void dia_huno_trade_sword_no()
{
	AI_Output(other,self,"DIA_Huno_TRADE_SWORD_NO");	//� ����� �����.
	Info_ClearChoices(dia_huno_trade_sword);
};

func void dia_huno_trade_sword_b()
{
	B_GiveInvItems(other,self,ItMw_1H_Sword_01,1);
	B_GiveInvItems(self,other,ItMiNugget,70);
	Info_ClearChoices(dia_huno_trade_sword);
	if(Npc_HasItems(other,ItMw_1H_Sword_01) >= 1)
	{
		Info_AddChoice(dia_huno_trade_sword,"(������� 1 ���)",dia_huno_trade_sword_b);
	};
	Info_AddChoice(dia_huno_trade_sword,"� ����� �����.",dia_huno_trade_sword_no);
};

