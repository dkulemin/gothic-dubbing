
instance INFO_ORG_863_RAEUBER_EXIT(C_Info)
{
	npc = Org_863_Raeuber;
	nr = 999;
	condition = info_org_863_raeuber_exit_condition;
	information = info_org_863_raeuber_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_org_863_raeuber_exit_condition()
{
	return 1;
};

func void info_org_863_raeuber_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ORG_863_RAEUBER_BDT(C_Info)
{
	npc = Org_863_Raeuber;
	nr = 998;
	condition = info_org_863_raeuber_bdt_condition;
	information = info_org_863_raeuber_bdt_info;
	permanent = 0;
	description = "��-�����, ������� ����� ������� ����� ������.";
};


func int info_org_863_raeuber_bdt_condition()
{
	if(BDT_QT == TRUE)
	{
		return 1;
	};
};

func void info_org_863_raeuber_bdt_info()
{
	AI_Output(other,self,"Info_Org_861_Killian_BDT_15_00");	//��-�����, ������� ����� ������� ����� ������.
	AI_Output(self,other,"Info_Org_863_Raeuber_BDT_07_00");	//� ���� ��� �����.
	QUENTIN_COUNT = QUENTIN_COUNT + 1;
	B_LogEntry(CH1_BDT,"������, ��� ������� ��������� ��� ������ �������.");
	if(QUENTIN_COUNT >= 4)
	{
		B_LogEntry(CH1_BDT,"�����, ������ ��� ������������ ���������� �����.");
	};
};


instance ORG_863_RAEUBER_BDT_OK(C_Info)
{
	npc = Org_863_Raeuber;
	nr = 2;
	condition = org_863_raeuber_bdt_ok_condition;
	information = org_863_raeuber_bdt_ok_info;
	permanent = 0;
	description = "������� ����� ������ ��� ������ �����.";
};


func int org_863_raeuber_bdt_ok_condition()
{
	if(Npc_KnowsInfo(hero,org_858_quentin_qt_ok))
	{
		return TRUE;
	};
};

func void org_863_raeuber_bdt_ok_info()
{
	AI_Output(other,self,"Org_863_Raeuber_BDT_OK_15_00");	//������� ����� ������ ��� ������ �����.
	AI_Output(self,other,"Org_863_Raeuber_BDT_OK_07_00");	//�������! ������ � ����� ������� �� ������ �������� ���������.
	AI_Output(self,other,"Org_863_Raeuber_BDT_OK_07_01");	//� �� ������ ����� ��� ���������.
	B_GiveXP(50);
	B_GiveInvItems(self,hero,ItMw_1H_Mace_War_03,1);
};

