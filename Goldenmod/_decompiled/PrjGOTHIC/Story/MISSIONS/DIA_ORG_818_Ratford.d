
instance Org_818_Ratford_Exit(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 999;
	condition = Org_818_Ratford_Exit_Condition;
	information = Org_818_Ratford_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Org_818_Ratford_Exit_Condition()
{
	return 1;
};

func void Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Org_818_Ratford_WrongWay(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WrongWay_Condition;
	information = Org_818_Ratford_WrongWay_Info;
	permanent = 0;
	important = 1;
};


func int Org_818_Ratford_WrongWay_Condition()
{
	return 1;
};

func void Org_818_Ratford_WrongWay_Info()
{
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_00");	//��, ��!
	AI_Output(other,self,"Org_818_Ratford_WrongWay_15_01");	//��� ����?
	AI_Output(self,other,"Org_818_Ratford_WrongWay_07_02");	//������ ���� ������������ ����. ������ ���������� ���� ��������� ������.
};


instance Org_818_Ratford_WhatGame(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WhatGame_Condition;
	information = Org_818_Ratford_WhatGame_Info;
	permanent = 0;
	description = "� �� ���� �� ���������?";
};


func int Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

func void Org_818_Ratford_WhatGame_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_00");	//� �� ���� �� ���������?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_01");	//� ��������, �� �����������. ����� ���� - � �� ��� �� ������ � ���� ����������. ����, �������, ������ - ���.
	AI_Output(other,self,"Org_818_Ratford_WhatGame_15_02");	//� ����� ����? � ��� ��?
	AI_Output(self,other,"Org_818_Ratford_WhatGame_07_03");	//������ � ����� �������� ������ - �� ����� �� ���� ������, ��� ��� �� �� �� ����.
};


instance Org_818_Ratford_WhyDangerous(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WhyDangerous_Condition;
	information = Org_818_Ratford_WhyDangerous_Info;
	permanent = 0;
	description = "������ ��� ����� ��������� ������?";
};


func int Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

func void Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WhyDangerous_15_00");	//������ ��� ����� ��������� ������?
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_01");	//�� ���������, ��? ������ ����� � ������� ������... ��� ��� �����.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_02");	//��������� ���� ������ ����� �������� - �� � ����� ����� �������� �� ������, ������� ��������� ���� ������ �������.
	AI_Output(self,other,"Org_818_Ratford_WhyDangerous_07_03");	//� �� ������������� �� �������, ���� �� ��������� ���� ���������� ������ � �������.
};


instance Org_818_Ratford_WoEquipment(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoEquipment_Condition;
	information = Org_818_Ratford_WoEquipment_Info;
	permanent = 0;
	description = "��� ����� ����� ������� ������?";
};


func int Org_818_Ratford_WoEquipment_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous))
	{
		return 1;
	};
};

func void Org_818_Ratford_WoEquipment_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WoEquipment_15_00");	//��� ����� ����� ������� ������?
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_01");	//��������� ����� - ������ ������. ������ ��� �� �������� - ��� �������� ���� ����.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_02");	//�� � ����� ����� ������ ����� ������� ���� ������� - ����, �������, ������ ������ �����.
	AI_Output(self,other,"Org_818_Ratford_WoEquipment_07_03");	//���� ��������� � ������ ������, ������ ��������. �� ���� �� ���. ������� ����, � �� ������� ���� ���, ��� �����.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"��� ������� � ������ ������ ������� ��������� ������ �� ���������� �����.");
};


instance Org_818_Ratford_MoreLocations(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_MoreLocations_Condition;
	information = Org_818_Ratford_MoreLocations_Info;
	permanent = 0;
	description = "�������� ��� ���-������ � �������.";
};


func int Org_818_Ratford_MoreLocations_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous))
	{
		return 1;
	};
};

func void Org_818_Ratford_MoreLocations_Info()
{
	AI_Output(other,self,"Org_818_Ratford_MoreLocations_15_00");	//�������� ��� ���-������ � �������.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_01");	//��� ���� ����� ��������� �� ������ ������ �� ������� ����� ����� - ���������� ����� � �� ������ ��� ����� ������� �� �������.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_02");	//����� ����� ��������� ������� �������, ��� ������� �����, ������� ����� �������� ��������.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_03");	//�� ����������� � ������ ����������. �� ����� ����� ������. ����������� �� ��� - ������� ���������� ������ ������ ����� � ������. ���������� � ��������� ������� ����.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_04");	//����� �������� ����� ��������� ����� - � ������ ���-���� � ������. � �������� �� ������ ����, �������� �����.
	AI_Output(self,other,"Org_818_Ratford_MoreLocations_07_05");	//� ��� ���� �����: �� ����� �������� � ���!
};


instance Org_818_Ratford_WoKarte(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = Org_818_Ratford_WoKarte_Condition;
	information = Org_818_Ratford_WoKarte_Info;
	permanent = 0;
	description = "��� � ���� ��������� �����?";
};


func int Org_818_Ratford_WoKarte_Condition()
{
	if(Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous))
	{
		return 1;
	};
};

func void Org_818_Ratford_WoKarte_Info()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_15_00");	//��� � ���� ��������� �����?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_01");	//��������� ����� � ������ ������. ���-�� ��� ������ ���� ���������.
	AI_Output(self,other,"Org_818_Ratford_WoKarte_07_02");	//�����, ���� ���� ������� ������� � ���� ���� �� ����. ���� ���������, �������� ���� ��� ����, �����?
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice(Org_818_Ratford_WoKarte,"� �� ���� �������, ������� ���� ������.",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice(Org_818_Ratford_WoKarte,"�����? ��� ����� - ����� �� �� ������� ��?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	var C_Npc Lares;
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Stehlen_15_00");	//���� ������������� ����������� ����� ��, �� ��������, �� � ������ �������, ������� ����� ������.
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Stehlen_07_01");	//� �� ������. ���� ����� �������� � ���, ����� �������������� � ������ ������. ���� ����� ��������� ���, ����� ������. ������, �� ������� ���� ������.
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output(other,self,"Org_818_Ratford_WoKarte_Kaufen_15_00");	//�����? ��� ����� - ����� �� �� ������� ��?
	AI_Output(self,other,"Org_818_Ratford_WoKarte_Kaufen_07_01");	//��, ���� � ���� ���� ��� ���������...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};


instance Org_818_Ratford_Thanks(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 888;
	condition = Org_818_Ratford_Thanks_Condition;
	information = Org_818_Ratford_Thanks_Info;
	permanent = 0;
	description = "� ��������� ���� �� ������.";
};


func int Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

func void Org_818_Ratford_Thanks_Info()
{
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_00");	//��������� �� ������.
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_01");	//�� �����, ��� ��� ����� ������ �� ������������, ������.
	AI_Output(self,other,"Org_818_Ratford_Thanks_07_02");	//������� � �������� ������ �����, �� ���-��� ��� �� ����� ���� ���� ���� ������� �����.
	AI_Output(other,self,"Org_818_Ratford_Thanks_15_04");	//� ���� ����� ��� � ����.
};


instance ORG_818_RATFORD_MAP(C_Info)
{
	npc = ORG_818_Ratford;
	nr = 1;
	condition = org_818_ratford_map_condition;
	information = org_818_ratford_map_info;
	permanent = 0;
	description = "� ������ ���� �����.";
};


func int org_818_ratford_map_condition()
{
	if(Npc_HasItems(hero,ItWrWorldmap) >= 1)
	{
		return 1;
	};
};

func void org_818_ratford_map_info()
{
	AI_Output(other,self,"Org_818_Ratford_Map_15_00");	//� ������ ���� �����.
	if(Kapitel == 1)
	{
		AI_Output(self,other,"Org_818_Ratford_Map_07_01");	//���? ��� �� �� ������ �� ���� ������. ������ ��� � ����?
		Info_AddChoice(org_818_ratford_map,"� ������ �� � ����������.",org_818_ratford_map_steal);
		Info_AddChoice(org_818_ratford_map,"� ����� �� � ����������.",org_818_ratford_map_buy);
	}
	else
	{
		AI_Output(self,other,"Org_818_Ratford_Map_07_02");	//���? � ���� ��� ���� ����.
	};
};

func void org_818_ratford_map_buy()
{
	AI_Output(other,self,"Org_818_Ratford_Map_BUY_15_00");	//� ����� �� � ����������.
	AI_Output(self,other,"Org_818_Ratford_Map_BUY_07_01");	//����� ���� ���� ���� �� ��� �� � �����, ���� �� ���� ��������� ���� �����.
	AI_Output(self,other,"Org_818_Ratford_Map_BUY_07_02");	//�� �� �� �� �������, ��� � ��������� ��������� ���� �� ���. ���, ������ ����.
	B_GiveInvItems(other,self,ItWrWorldmap,1);
	B_GiveInvItems(self,other,ItFoBeer,1);
	B_GiveXP(100);
	Info_ClearChoices(org_818_ratford_map);
};

func void org_818_ratford_map_steal()
{
	AI_Output(other,self,"Org_818_Ratford_Map_STEAL_15_00");	//� ������ �� � ����������.
	AI_Output(self,other,"Org_818_Ratford_Map_STEAL_07_01");	//��-��! � �� �������! ���, ������. �����, ��� ���� ��� ����������.
	B_GiveInvItems(other,self,ItWrWorldmap,1);
	B_GiveInvItems(self,other,ItKeLockpick,5);
	B_GiveXP(100);
	Info_ClearChoices(org_818_ratford_map);
};

