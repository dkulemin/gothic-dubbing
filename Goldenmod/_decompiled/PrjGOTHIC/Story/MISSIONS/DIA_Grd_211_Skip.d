
instance DIA_Skip_Exit(C_Info)
{
	npc = Grd_211_Skip;
	nr = 999;
	condition = DIA_Skip_Exit_Condition;
	information = DIA_Skip_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Skip_Exit_Condition()
{
	return 1;
};

func void DIA_Skip_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int Skip_TradeFree;

instance DIA_Skip_First(C_Info)
{
	npc = Grd_211_Skip;
	nr = 1;
	condition = DIA_Skip_First_Condition;
	information = DIA_Skip_First_Info;
	permanent = 0;
	description = "��� �� �����������?";
};


func int DIA_Skip_First_Condition()
{
	if(!(Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF))
	{
		return 1;
	};
};

func void DIA_Skip_First_Info()
{
	AI_Output(other,self,"DIA_Skip_First_15_00");	//��� �� �����������?
	AI_Output(self,other,"DIA_Skip_First_12_01");	//� ��������� ������� ��� ����������.
	AI_Output(other,self,"DIA_Skip_First_15_02");	//�� �������� ������?
	AI_Output(self,other,"DIA_Skip_First_12_03");	//������ ������ � ��� �����.
	if(!Npc_KnowsInfo(other,DIA_Raven_Equipment))
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"�������� ���� �������������� ������� �� ������ �����. �� ������ ��� ����� ������.");
	};
	Info_ClearChoices(DIA_Skip_First);
	Info_AddChoice(DIA_Skip_First,"��� ����. ��������!",DIA_Skip_First_BACK);
	Info_AddChoice(DIA_Skip_First,"���� ������� �����. �� ����� ��� ��������� ������.",DIA_Skip_First_Thorus);
	Info_AddChoice(DIA_Skip_First,"���� ������� �����.",DIA_Skip_First_Gomez);
};

func void DIA_Skip_First_Gomez()
{
	AI_Output(other,self,"DIA_Skip_First_Gomez_15_00");	//���� ������� �����. �� ������, ��� �� ������ ��������� ��� ���� ����������.
	AI_Output(self,other,"DIA_Skip_First_Gomez_12_01");	//��� ������, ��? ����� ������� � ������ ������ �� ����, ��� � ���� ����.
	AI_Output(self,other,"DIA_Skip_First_Gomez_12_02");	//�������� ������, ���� � �� ����������!
	Info_ClearChoices(DIA_Skip_First);
	AI_StopProcessInfos(self);
};

func void DIA_Skip_First_Thorus()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_15_00");	//���� ������� �����. �� ����� ��� ��������� ������.
	AI_Output(self,other,"DIA_Skip_First_Thorus_12_01");	//��?
	Info_ClearChoices(DIA_Skip_First);
	Info_AddChoice(DIA_Skip_First,"������ �� ���� ������ �� �������� ���? ",DIA_Skip_First_Thorus_AskHim);
	Info_AddChoice(DIA_Skip_First,"����� ������!",DIA_Skip_First_Thorus_KickAss);
	Info_AddChoice(DIA_Skip_First,"�� �����, ����� � ���-��� ������ ��� ����...",DIA_Skip_First_Thorus_Stranger);
};

func void DIA_Skip_First_BACK()
{
	AI_Output(other,self,"DIA_Skip_First_BACK_15_00");	//��� ����. ��������!
	Info_ClearChoices(DIA_Skip_First);
	AI_StopProcessInfos(self);
};

func void DIA_Skip_First_Thorus_Stranger()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_Stranger_15_00");	//�� �����, ����� � ���-��� ������ ��� ����... ��������� �������, ������� �� �� ����� �� ������ �� ���.
	AI_Output(self,other,"DIA_Skip_First_Thorus_Stranger_12_01");	//��? � �� �� �������� ������ �����, ��� ������� ���� �� ���, �����?
	Info_ClearChoices(DIA_Skip_First);
	Info_AddChoice(DIA_Skip_First,"������ �� ���� ������ �� �������� ���? ",DIA_Skip_First_Thorus_AskHim);
	Info_AddChoice(DIA_Skip_First,"����� ������!",DIA_Skip_First_Thorus_KickAssAGAIN);
};

func void DIA_Skip_First_Thorus_KickAss()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_KickAss_15_00");	//�� ����� ������ ���� ����� ������� �� ��� ���, ���� �� �� ������ ��� ������.
	AI_Output(self,other,"DIA_Skip_First_Thorus_KickAss_12_01");	//� ����� ����? ��� �������, ���� �� �� ��������� ������ ���������� ������, ��� � ���� ������ ���� �������.
	Info_ClearChoices(DIA_Skip_First);
	AI_StopProcessInfos(self);
};

func void DIA_Skip_First_Thorus_AskHim()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_AskHim_15_00");	//������ �� ���� ������ �� �������� ���?
	AI_Output(self,other,"DIA_Skip_First_Thorus_AskHim_12_01");	//������ �� �����������, ������ ��� � � ������. �� �� ������. ������, �� ������� ��������, ��� �� ������� � ���.
	AI_Output(self,other,"DIA_Skip_First_Thorus_AskHim_12_02");	//�� ����, ��� ���� �������, �� �� ����� ����� � �� �������� ������� ������!
	Info_ClearChoices(DIA_Skip_First);
	AI_StopProcessInfos(self);
};

func void DIA_Skip_First_Thorus_KickAssAGAIN()
{
	AI_Output(other,self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00");	//�� ����� ������ ���� ����� ������� �� ��� ���, ���� �� �� ������ ��� ������.
	AI_Output(self,other,"DIA_Skip_First_Thorus_KickAssAGAIN_12_01");	//�����, ������, ��� ���� �����?
	Info_ClearChoices(DIA_Skip_First);
	Skip_TradeFree = TRUE;
};


instance DIA_Skip_VERPATZT(C_Info)
{
	npc = Grd_211_Skip;
	nr = 1;
	condition = DIA_Skip_VERPATZT_Condition;
	information = DIA_Skip_VERPATZT_Info;
	permanent = 1;
	description = "� �����, ��� ����� �������������� �� ������ ����������...";
};


func int DIA_Skip_VERPATZT_Condition()
{
	if(!((Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF)) && (Npc_KnowsInfo(other,DIA_Skip_First) && (Skip_TradeFree == FALSE)))
	{
		return 1;
	};
};

func void DIA_Skip_VERPATZT_Info()
{
	AI_Output(other,self,"DIA_Skip_VERPATZT_15_00");	//� �����, ��� ����� ��������� � �������������� �� ������ ����������...
	AI_Output(self,other,"DIA_Skip_VERPATZT_12_01");	//����������!
};


instance GRD_211_Skip_TRADE(C_Info)
{
	npc = Grd_211_Skip;
	condition = GRD_211_Skip_TRADE_Condition;
	information = GRD_211_Skip_TRADE_Info;
	permanent = 1;
	description = "��� ����� ����� ��������� �����.";
	trade = 1;
};


func int GRD_211_Skip_TRADE_Condition()
{
	if((Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF) || (Skip_TradeFree == TRUE))
	{
		return TRUE;
	};
};

func void GRD_211_Skip_TRADE_Info()
{
	AI_Output(other,self,"GRD_211_Skip_TRADE_Info_15_01");	//��� ����� ����� ��������� �����.
	AI_Output(self,other,"GRD_211_Skip_TRADE_Info_12_02");	//� ���� ������� ���� ��� ���.
};


instance GRD_211_Skip_WELCOME(C_Info)
{
	npc = Grd_211_Skip;
	condition = GRD_211_Skip_WELCOME_Condition;
	information = GRD_211_Skip_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int GRD_211_Skip_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_GRD)
	{
		return TRUE;
	};
};

func void GRD_211_Skip_WELCOME_Info()
{
	AI_Output(self,other,"GRD_211_Skip_WELCOME_Info_12_01");	//��, � �� ������� ����� ������������ ��� �������!
};


instance GRD_211_SKIP_GILBERT(C_Info)
{
	npc = Grd_211_Skip;
	nr = 1;
	condition = grd_211_skip_gilbert_condition;
	information = grd_211_skip_gilbert_info;
	permanent = 0;
	description = "�� ������ ��������?";
};


func int grd_211_skip_gilbert_condition()
{
	if(Npc_KnowsInfo(other,dia_gravo_gilbert_about) && (GILBERT_OC == TRUE))
	{
		return 1;
	};
};

func void grd_211_skip_gilbert_info()
{
	AI_Output(other,self,"GRD_211_Skip_Gilbert_Info_15_00");	//�� ������ ��������?
	AI_Output(self,other,"GRD_211_Skip_Gilbert_Info_12_01");	//��, �� ������� ����� ��������� �������.
	AI_Output(self,other,"GRD_211_Skip_Gilbert_Info_12_02");	//�� ��� �� ������ � ������ ��� ����� �����.
};


instance DIA_SKIP_TRADE_SWORD(C_Info)
{
	npc = Grd_211_Skip;
	nr = 600;
	condition = dia_skip_trade_sword_condition;
	information = dia_skip_trade_sword_info;
	permanent = 1;
	description = "(������� ������)";
};


func int dia_skip_trade_sword_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_KDF) || (Skip_TradeFree == TRUE))
	{
		return 1;
	};
};

func void dia_skip_trade_sword_info()
{
	AI_Output(other,self,"DIA_Skip_TRADE_SWORD_15_00");	//� ���� ������� ���������� ���� ����.
	if(SKIP_ST == FALSE)
	{
		AI_Output(self,other,"DIA_Skip_TRADE_SWORD_12_00");	//� ��� �� 100 ������ ���� �� ���� ���.
		Log_CreateTopic(GE_TRADERSWORD,LOG_NOTE);
		B_LogEntry(GE_TRADERSWORD,"� ���� ��������� ���� ���� �� 100 ������ ���� ��������� ����� � ����� ������� ������.");
		SKIP_ST = TRUE;
	};
	if(Npc_HasItems(other,ItMw_1H_Sword_01) >= 1)
	{
		Info_AddChoice(dia_skip_trade_sword,"(������� 1 ���)",dia_skip_trade_sword_b);
	};
	Info_AddChoice(dia_skip_trade_sword,"� ����� �����.",dia_skip_trade_sword_no);
};

func void dia_skip_trade_sword_no()
{
	AI_Output(other,self,"DIA_Skip_TRADE_SWORD_NO");	//� ����� �����.
	Info_ClearChoices(dia_skip_trade_sword);
};

func void dia_skip_trade_sword_b()
{
	B_GiveInvItems(other,self,ItMw_1H_Sword_01,1);
	B_GiveInvItems(self,other,ItMiNugget,100);
	Info_ClearChoices(dia_skip_trade_sword);
	if(Npc_HasItems(other,ItMw_1H_Sword_01) >= 1)
	{
		Info_AddChoice(dia_skip_trade_sword,"(������� 1 ���)",dia_skip_trade_sword_b);
	};
	Info_AddChoice(dia_skip_trade_sword,"� ����� �����.",dia_skip_trade_sword_no);
};

