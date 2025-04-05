
instance INFO_ORG_867_RAEUBER_EXIT(C_Info)
{
	npc = Org_867_Raeuber;
	nr = 999;
	condition = info_org_867_raeuber_exit_condition;
	information = info_org_867_raeuber_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_org_867_raeuber_exit_condition()
{
	return 1;
};

func void info_org_867_raeuber_exit_info()
{
	AI_StopProcessInfos(self);
};


instance ORG_867_RAEUBER_GOAWAY(C_Info)
{
	npc = Org_867_Raeuber;
	nr = 1;
	condition = org_867_raeuber_goaway_condition;
	information = org_867_raeuber_goaway_info;
	permanent = 0;
	important = 1;
};


func int org_867_raeuber_goaway_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_EBR))
	{
		return TRUE;
	};
};

func void org_867_raeuber_goaway_info()
{
	AI_Output(self,other,"Org_867_Raeuber_GoAway_Info_13_00");	//��� ���� �������� �� ������� ������.
	AI_StopProcessInfos(self);
	Org_867_Raeuber.npcType = Npctype_ROGUE;
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance ORG_867_RAEUBER_GUARD(C_Info)
{
	npc = Org_867_Raeuber;
	nr = 1;
	condition = org_867_raeuber_guard_condition;
	information = org_867_raeuber_guard_info;
	permanent = 0;
	important = 1;
};


func int org_867_raeuber_guard_condition()
{
	if((Npc_GetTrueGuild(hero) != GIL_GRD) && (Npc_GetTrueGuild(hero) != GIL_STT) && (Npc_GetTrueGuild(hero) != GIL_EBR))
	{
		return TRUE;
	};
};

func void org_867_raeuber_guard_info()
{
	AI_Output(self,other,"Org_867_Raeuber_GUARD_Info_13_00");	//����!
	AI_Output(other,self,"Org_867_Raeuber_GUARD_Info_15_01");	//� � ��� ��������?
	AI_Output(self,other,"Org_867_Raeuber_GUARD_Info_13_02");	//���� ����� ������ ������, ������.
};


instance ORG_867_RAEUBER_BANDITENCAMP(C_Info)
{
	npc = Org_867_Raeuber;
	nr = 1;
	condition = org_867_raeuber_banditencamp_condition;
	information = org_867_raeuber_banditencamp_info;
	permanent = 0;
	description = "� ��� ��� �� �����?";
};


func int org_867_raeuber_banditencamp_condition()
{
	if(Npc_KnowsInfo(hero,GRD_200_Thorus_GARDIST) && ((Npc_GetTrueGuild(hero) != GIL_GRD) && (Npc_GetTrueGuild(hero) != GIL_STT) && (Npc_GetTrueGuild(hero) != GIL_EBR)))
	{
		return TRUE;
	};
};

func void org_867_raeuber_banditencamp_info()
{
	AI_Output(other,self,"Org_867_Raeuber_Banditencamp_15_00");	//� ��� ��� �� �����?
	AI_Output(self,other,"Org_867_Raeuber_Banditencamp_13_01");	//��� ������ ��������, ������.
};


instance ORG_867_RAEUBER_ORGANISATORS(C_Info)
{
	npc = Org_867_Raeuber;
	nr = 2;
	condition = org_867_raeuber_organisators_condition;
	information = org_867_raeuber_organisators_info;
	permanent = 0;
	description = "�� ���� �� ������ ������?";
};


func int org_867_raeuber_organisators_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

func void org_867_raeuber_organisators_info()
{
	AI_Output(other,self,"Org_867_Raeuber_Organisators_15_00");	//�� ���� �� ������ ������?
	AI_Output(self,other,"Org_867_Raeuber_Organisators_13_01");	//������ ���.
	AI_Output(self,other,"Org_867_Raeuber_Organisators_13_02");	//����� ���� � ��������� �� ���������, ��� �� ��������� ������ �� ������ �� ������� ������.
	AI_Output(self,other,"Org_867_Raeuber_Organisators_13_03");	//����� ��������� ����� ����� ���� �� ������ ������ � �������� ���� ������ �����.
	AI_Output(self,other,"Org_867_Raeuber_Organisators_13_04");	//������� �� ������ ��� �� ���� ����� ����������.
	AI_Output(other,self,"Org_867_Raeuber_Organisators_15_01");	//� ��� ���������?
	AI_Output(self,other,"Org_867_Raeuber_Organisators_13_05");	//� ������. ������ ������ ����� ������.
	if(Stooges_Fled == FALSE)
	{
		AI_Output(self,other,"Org_867_Raeuber_Organisators_13_06");	//��� ���� ������ �������� � ������ ����� ������ ������.
	};
};


instance ORG_867_RAEUBER_ABOUT(C_Info)
{
	npc = Org_867_Raeuber;
	nr = 3;
	condition = org_867_raeuber_about_condition;
	information = org_867_raeuber_about_info;
	permanent = 1;
	description = "��� ����?";
};


func int org_867_raeuber_about_condition()
{
	if(Npc_KnowsInfo(hero,org_867_raeuber_guard) && ((Npc_GetTrueGuild(hero) != GIL_GRD) && (Npc_GetTrueGuild(hero) != GIL_STT) && (Npc_GetTrueGuild(hero) != GIL_EBR)))
	{
		return TRUE;
	};
};

func void org_867_raeuber_about_info()
{
	AI_Output(other,self,"Info_SFB_1_DieLage_15_00");	//��� ����?
	if((QUENTIN_OK == TRUE) && (Kapitel >= 4))
	{
		AI_Output(self,other,"Org_867_Raeuber_About_13_00");	//������� ����.
		AI_Output(other,self,"Org_867_Raeuber_About_15_01");	//� ��� ��� ������?
		AI_Output(self,other,"Org_867_Raeuber_About_13_01");	//������ ����� ��� ����� ��������� �� ������� ������.
		AI_Output(other,self,"Org_867_Raeuber_About_15_02");	//� ��� �� ������ ����������� ������?
		AI_Output(self,other,"Org_867_Raeuber_About_13_02");	//������ ��� ����� ������������.
		QUENTIN_OK = FALSE;
		FRANCO_OK = TRUE;
	}
	else
	{
		AI_Output(self,other,"Org_867_Raeuber_About_13_03");	//���, ��� ������.
	};
};


instance ORG_867_RAEUBER_MAIN(C_Info)
{
	npc = Org_867_Raeuber;
	nr = 4;
	condition = org_867_raeuber_main_condition;
	information = org_867_raeuber_main_info;
	permanent = 0;
	description = "��� ����� �������?";
};


func int org_867_raeuber_main_condition()
{
	if(Npc_KnowsInfo(hero,org_867_raeuber_guard) && ((Npc_GetTrueGuild(hero) != GIL_GRD) && (Npc_GetTrueGuild(hero) != GIL_STT) && (Npc_GetTrueGuild(hero) != GIL_EBR)))
	{
		return TRUE;
	};
};

func void org_867_raeuber_main_info()
{
	AI_Output(other,self,"Info_Org_6_WichtigePersonen_15_00");	//��� ����� �������?
	if(((QUENTIN_OK == TRUE) || (FRANCO_OK == TRUE)) && (Kapitel >= 4))
	{
		AI_Output(self,other,"Org_867_Raeuber_Main_13_00");	//������ ��� ����������� ������.
	}
	else
	{
		AI_Output(self,other,"Org_867_Raeuber_Main_13_01");	//������� ������� � ������.
	};
};


instance ORG_867_RAEUBER_WEREISMAIN(C_Info)
{
	npc = Org_867_Raeuber;
	nr = 4;
	condition = org_867_raeuber_wereismain_condition;
	information = org_867_raeuber_wereismain_info;
	permanent = 1;
	description = "��� ����� ����� ��������?";
};


func int org_867_raeuber_wereismain_condition()
{
	if(Npc_KnowsInfo(hero,org_867_raeuber_main) && ((Npc_GetTrueGuild(hero) != GIL_GRD) && (Npc_GetTrueGuild(hero) != GIL_STT) && (Npc_GetTrueGuild(hero) != GIL_EBR)) && !(((QUENTIN_OK == TRUE) || (FRANCO_OK == TRUE)) && (Kapitel >= 4)))
	{
		return TRUE;
	};
};

func void org_867_raeuber_wereismain_info()
{
	AI_Output(other,self,"Org_867_Raeuber_WereIsMain_15_00");	//��� ����� ����� ��������?
	if(Hlp_StrCmp(Npc_GetNearestWP(Org_858_Quentin),"LOCATION_11_13"))
	{
		AI_Output(self,other,"Org_867_Raeuber_WereIsMain_13_00");	//�� � ������. ������ ��� ������ ����� ������.
	}
	else
	{
		AI_Output(self,other,"Org_867_Raeuber_WereIsMain_13_01");	//�� ����-�� ���� �� ������ ���� ���� �����.
	};
};


instance INFO_ORG_867_RAEUBER_BDT(C_Info)
{
	npc = Org_867_Raeuber;
	nr = 998;
	condition = info_org_867_raeuber_bdt_condition;
	information = info_org_867_raeuber_bdt_info;
	permanent = 0;
	description = "��-�����, ������� ����� ������� ����� ������.";
};


func int info_org_867_raeuber_bdt_condition()
{
	if(BDT_QT == TRUE)
	{
		return 1;
	};
};

func void info_org_867_raeuber_bdt_info()
{
	AI_Output(other,self,"Info_Org_861_Killian_BDT_15_00");	//��-�����, ������� ����� ������� ����� ������.
	AI_Output(self,other,"Info_Org_867_Raeuber_BDT_13_00");	//� ������� ����������, ��� �������� ������.
};

