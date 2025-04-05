
instance SLD_704_BLADE_EXIT(C_Info)
{
	npc = SLD_704_Blade;
	nr = 999;
	condition = sld_704_blade_exit_condition;
	information = sld_704_blade_exit_info;
	important = 0;
	permanent = 1;
	description = "���������";
};


func int sld_704_blade_exit_condition()
{
	return TRUE;
};

func void sld_704_blade_exit_info()
{
	AI_StopProcessInfos(self);
};


instance SLD_704_BLADE_ABANDONEDMINE(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_abandonedmine_condition;
	information = sld_704_blade_abandonedmine_info;
	permanent = 0;
	important = 1;
};


func int sld_704_blade_abandonedmine_condition()
{
	if(Kapitel >= 4)
	{
		return 1;
	};
};

func void sld_704_blade_abandonedmine_info()
{
	var C_Npc dmt_abandobedmine;
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_00");	//(� ����) �� ������ �� �����! �� ��� ������ ������! � �� �����, ��� � ����� ����!
	AI_Output(other,self,"SLD_704_Blade_ABANDONEDMINE_15_00");	//���������. ��� ���������?
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_01");	//��������� �������� ����� � ����������� ����� � ���� ������ ������ �� ����.
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_02");	//����� �������� ��� � ���������� ������ ���������. �� ������ ���� ������ ������, ������� ������� �������� � �����.
	AI_Output(other,self,"SLD_704_Blade_ABANDONEDMINE_15_01");	//� ��� ��������� � �����?
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_03");	//������� ��� ���� ���������, ����� ���������� ��������� �������� �� �����.
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_04");	//�� ������ �� ����� ����� ���� ����, � �� ����� ������ �����.
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_05");	//��� ���� ���� ����������� �� �����, � ���� ������ ����� �� ����������� � �� ����������� �� ��� ������.
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_06");	//����� �� ��������� �� ������� ��������, �� �������� ������� �� ��� ������ ������.
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_07");	//(� ��������) ��� ��������� ������ � ������ �... � ��� �� ����� ��� ����������� �����.
	AI_Output(other,self,"SLD_704_Blade_ABANDONEDMINE_15_02");	//� ��� ��� ����, � �������� �� ����� � �����?
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_11_08");	//� �� �����. ������ ���� ��� ��� ��������� �� ������.
	Log_CreateTopic(CH4_ABANDONEDMINE,LOG_MISSION);
	Log_SetTopicStatus(CH4_ABANDONEDMINE,LOG_RUNNING);
	B_LogEntry(CH4_ABANDONEDMINE,"���������� �� ������ ������ � �������� ������, ��������. �� ������, ��� ����� � ���������� �����, ��� �� ���� ������ ������.");
	dmt_abandobedmine = Hlp_GetNpc(Grd_201_Jackal);
	dmt_abandobedmine.guild = GIL_None;
	Npc_SetTrueGuild(dmt_abandobedmine,GIL_None);
};


instance SLD_704_BLADE_MINE(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_mine_condition;
	information = sld_704_blade_mine_info;
	permanent = 0;
	description = "���� � ���-������ ������?";
};


func int sld_704_blade_mine_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_abandonedmine))
	{
		return 1;
	};
};

func void sld_704_blade_mine_info()
{
	AI_Output(other,self,"SLD_704_Blade_MINE_15_00");	//���� � ���-������ ������?
	AI_Output(self,other,"SLD_704_Blade_MINE_11_00");	//�� ������ ����� �� ���� � �����?
	AI_Output(other,self,"SLD_704_Blade_MINE_15_01");	//��, � ���� �������� ��� ��� ���������.
	AI_Output(self,other,"SLD_704_Blade_MINE_11_01");	//������, �� � ���� �������� � ����� ������ ���������� � ��������. ��� ����� ��� �����!
	AI_Output(other,self,"SLD_704_Blade_MINE_15_02");	//� ��� �� ���� �����?
	AI_Output(self,other,"SLD_704_Blade_MINE_11_02");	//� ������� ��� ���-�� �� ����, ����� ����� �� �����.
	AI_Output(other,self,"SLD_704_Blade_MINE_15_03");	//� ����� ���� �����.
	B_LogEntry(CH4_ABANDONEDMINE,"� ����� ������ ������ ����������� � ��������. �� ������� ��� ����� ����� ����� ������, ������� �� ������� �� ���� ����� �����.");
};


instance SLD_704_BLADE_AXT(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_axt_condition;
	information = sld_704_blade_axt_info;
	permanent = 0;
	description = "� ����� ���� �����.";
};


func int sld_704_blade_axt_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_mine) && (Npc_HasItems(hero,blade_axt) >= 1))
	{
		return 1;
	};
};

func void sld_704_blade_axt_info()
{
	AI_Output(other,self,"SLD_704_Blade_AXT_15_00");	//� ����� ���� �����.
	AI_Output(self,other,"SLD_704_Blade_AXT_11_00");	//�� ����� ������������.
	AI_Output(self,other,"SLD_704_Blade_AXT_11_01");	//�� �� ������ ����� �������� ��������� ����� ������� � �����.
	B_GiveXP(350);
	B_GiveInvItems(hero,self,blade_axt,1);
	EquipItem(self,blade_axt);
	B_LogEntry(CH4_ABANDONEDMINE,"� ����� ����� ������.");
	B_LogEntry(CH4_ABANDONEDMINE,"�� ����������� ��� ����� �������� ��������� ����� ���, ��� ����������� � �����.");
};


instance SLD_704_BLADE_GO(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_go_condition;
	information = sld_704_blade_go_info;
	permanent = 0;
	description = "���� � �����.";
};


func int sld_704_blade_go_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_axt))
	{
		return 1;
	};
};

func void sld_704_blade_go_info()
{
	AI_Output(other,self,"SLD_704_Blade_GO_15_00");	//���� � �����.
	AI_Output(self,other,"SLD_704_Blade_GO_11_00");	//������, �������� � ����� � �����.
	AI_StopProcessInfos(self);
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"nearmine");
};


instance SLD_704_BLADE_NEAR_MINE(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_near_mine_condition;
	information = sld_704_blade_near_mine_info;
	permanent = 0;
	important = 1;
};


func int sld_704_blade_near_mine_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_go) && (Npc_GetDistToWP(hero,"WP_BLADE_1") < 1000))
	{
		return 1;
	};
};

func void sld_704_blade_near_mine_info()
{
	AI_Output(self,other,"SLD_704_Blade_NEAR_MINE_11_00");	//��! ���-�� ��������� ���. � ���� ���� ���-������ ������?
	B_LogEntry(CH4_ABANDONEDMINE,"�� ����� �� ����������� �����.");
	Info_AddChoice(sld_704_blade_near_mine,"������, � �� ��������� � �����.",sld_704_blade_near_mine_nothing);
	if(Npc_HasItems(hero,ItFoWine) >= 1)
	{
		Info_AddChoice(sld_704_blade_near_mine,"����.",sld_704_blade_near_mine_wine);
	};
	if(Npc_HasItems(hero,ItFoBooze) >= 1)
	{
		Info_AddChoice(sld_704_blade_near_mine,"�����.",sld_704_blade_near_mine_booze);
	};
	if(Npc_HasItems(hero,ItFoBeer) >= 1)
	{
		Info_AddChoice(sld_704_blade_near_mine,"����.",sld_704_blade_near_mine_beer);
	};
};

func void sld_704_blade_near_mine_beer()
{
	AI_Output(other,self,"SLD_704_Blade_NEAR_MINE_BEER_15_00");	//����.
	AI_Output(self,other,"SLD_704_Blade_NEAR_MINE_11_01");	//����� ����.
	B_GiveXP(50);
	B_GiveInvItems(hero,self,ItFoBeer,1);
	AI_UseItem(self,ItFoBeer);
	Info_ClearChoices(sld_704_blade_near_mine);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"nearmine");
};

func void sld_704_blade_near_mine_booze()
{
	AI_Output(other,self,"SLD_704_Blade_NEAR_MINE_BOOZE_15_00");	//�����.
	AI_Output(self,other,"SLD_704_Blade_NEAR_MINE_11_01");	//����� ����.
	B_GiveXP(50);
	B_GiveInvItems(hero,self,ItFoBooze,1);
	AI_UseItem(self,ItFoBooze);
	Info_ClearChoices(sld_704_blade_near_mine);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"nearmine");
};

func void sld_704_blade_near_mine_wine()
{
	AI_Output(other,self,"SLD_704_Blade_NEAR_MINE_WINE_15_00");	//����.
	AI_Output(self,other,"SLD_704_Blade_NEAR_MINE_11_01");	//����� ����.
	B_GiveXP(50);
	B_GiveInvItems(hero,self,ItFoWine,1);
	AI_UseItem(self,ItFoWine);
	Info_ClearChoices(sld_704_blade_near_mine);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"nearmine");
};

func void sld_704_blade_near_mine_nothing()
{
	AI_Output(other,self,"SLD_704_Blade_NEAR_MINE_NOTHING_15_00");	//������, � �� ��������� � �����.
	AI_Output(self,other,"SLD_704_Blade_NEAR_MINE_NOTHING_11_00");	//�� ���, ��� ���.
	Info_ClearChoices(sld_704_blade_near_mine);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"nearmine");
};


instance SLD_704_BLADE_TO_MINE(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_to_mine_condition;
	information = sld_704_blade_to_mine_info;
	permanent = 0;
	description = "��� �� ����, ��� ���?";
};


func int sld_704_blade_to_mine_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_near_mine))
	{
		return 1;
	};
};

func void sld_704_blade_to_mine_info()
{
	AI_Output(other,self,"SLD_704_Blade_TO_MINE_15_00");	//��� �� ����, ��� ���?
	AI_Output(self,other,"SLD_704_Blade_TO_MINE_11_00");	//(����������) �����, ��� ���� ��������� ������ �����...
	AI_Output(other,self,"SLD_704_Blade_TO_MINE_15_01");	//������ ����! �� ��� � ������� ��� ����?
	AI_Output(self,other,"SLD_704_Blade_TO_MINE_11_01");	//�� ����! � ������ �� �����!
	AI_Output(self,other,"SLD_704_Blade_TO_MINE_11_02");	//���� ������!
	ABANDONEDMINE_WHEEL = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"mine");
};


instance SLD_704_BLADE_AFTER_ABANDONEDMINE(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_after_abandonedmine_condition;
	information = sld_704_blade_after_abandonedmine_info;
	permanent = 0;
	important = 1;
};


func int sld_704_blade_after_abandonedmine_condition()
{
	if(Npc_KnowsInfo(hero,sld_9704_blade_after_dmt_abandonedmine))
	{
		return 1;
	};
};

func void sld_704_blade_after_abandonedmine_info()
{
	AI_Output(self,other,"SLD_704_Blade_AFTER_ABANDONEDMINE_11_00");	//��� �� ����������. � ������ ����� ����� ����!
	AI_Output(other,self,"SLD_704_Blade_AFTER_ABANDONEDMINE_15_00");	//���?!
	AI_Output(self,other,"SLD_704_Blade_AFTER_ABANDONEDMINE_11_01");	//� �� �������. ��� ������! ��� ����� ��������.
	B_LogEntry(CH4_ABANDONEDMINE,"����� ����, ��� �� ����� �� �����, � ������� ���������� ���-�� ��������.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"aftermine");
};


instance SLD_704_BLADE_ABANDONEDMINE_WHAT(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_abandonedmine_what_condition;
	information = sld_704_blade_abandonedmine_what_info;
	permanent = 0;
	description = "�� � �������?";
};


func int sld_704_blade_abandonedmine_what_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_after_abandonedmine))
	{
		return 1;
	};
};

func void sld_704_blade_abandonedmine_what_info()
{
	AI_Output(other,self,"Info_Sld_11_DieLage_15_00");	//�� � �������?
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_WHAT_11_00");	//� ��� �� ����. ������, ��� ����� ����������� ����.
	AI_Output(other,self,"SLD_704_Blade_ABANDONEDMINE_WHAT_15_01");	//� ��� �� �? � ������� � ���!
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_WHAT_11_01");	//�� ��... �� � �����?
	AI_Output(other,self,"SLD_704_Blade_ABANDONEDMINE_WHAT_15_02");	//����� �� ��.
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_WHAT_11_02");	//��, �������� ������ ����������� ���� �� ��������.
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_WHAT_11_03");	//���� � �����. �������� ��, ��� ����� ���������!
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_WHAT_11_04");	//� � ��������� �� ������.
	B_GiveXP(500);
	B_LogEntry(CH4_ABANDONEDMINE,"����� ��������� � ����� ��������� �� ������. � � ������ ���������� ��� ���� ����� ����.");
	B_ClearImmortal(self);
};


instance SLD_704_BLADE_ABANDONEDMINE_ABOUT(C_Info)
{
	npc = SLD_704_Blade;
	nr = 1;
	condition = sld_704_blade_abandonedmine_about_condition;
	information = sld_704_blade_abandonedmine_about_info;
	permanent = 1;
	description = "����� ��� ��������?";
};


func int sld_704_blade_abandonedmine_about_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_abandonedmine_what))
	{
		return 1;
	};
};

func void sld_704_blade_abandonedmine_about_info()
{
	AI_Output(other,self,"SLD_704_Blade_ABANDONEDMINE_ABOUT_15_00");	//����� ��� ��������?
	AI_Output(self,other,"SLD_704_Blade_ABANDONEDMINE_ABOUT_11_00");	//��, �� ����� ����� �� �������.
};

