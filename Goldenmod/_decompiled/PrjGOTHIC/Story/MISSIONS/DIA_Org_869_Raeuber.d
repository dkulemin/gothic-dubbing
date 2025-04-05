
instance INFO_ORG_869_RAEUBER_EXIT(C_Info)
{
	npc = Org_869_Raeuber;
	nr = 999;
	condition = info_org_869_raeuber_exit_condition;
	information = info_org_869_raeuber_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_org_869_raeuber_exit_condition()
{
	return 1;
};

func void info_org_869_raeuber_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ORG_869_RAEUBER_BDT(C_Info)
{
	npc = Org_869_Raeuber;
	nr = 998;
	condition = info_org_869_raeuber_bdt_condition;
	information = info_org_869_raeuber_bdt_info;
	permanent = 0;
	description = "��-�����, ������� ����� ������� ����� ������.";
};


func int info_org_869_raeuber_bdt_condition()
{
	if(BDT_QT == TRUE)
	{
		return 1;
	};
};

func void info_org_869_raeuber_bdt_info()
{
	AI_Output(other,self,"Info_Org_861_Killian_BDT_15_00");	//��-�����, ������� ����� ������� ����� ������.
	AI_Output(self,other,"Info_Org_869_Raeuber_BDT_13_00");	//� �� ��� �����? �� �� ����� �����.
};


instance INFO_ORG_865_RAEUBER_TRADE(C_Info)
{
	npc = Org_869_Raeuber;
	nr = 998;
	condition = info_org_869_raeuber_trade_condition;
	information = info_org_869_raeuber_trade_info;
	permanent = 1;
	trade = 1;
	description = "�� ���-������ ��������?";
};


func int info_org_869_raeuber_trade_condition()
{
	return 1;
};

func void info_org_869_raeuber_trade_info()
{
	AI_Output(other,self,"Info_Org_869_Raeuber_TRADE_15_00");	//�� ���-������ ��������?
	AI_Output(self,other,"Info_Org_869_Raeuber_TRADE_13_00");	//��, � ���� ���� ���� ������ � ������ ������.
	if(MIGUEL_TRADED == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"������ ���������� ��������� � ������ ��������.");
		MIGUEL_TRADED = TRUE;
	};
};

