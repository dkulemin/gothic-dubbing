
instance SLD_9704_BLADE_EXIT(C_Info)
{
	npc = sld_9704_blade;
	nr = 999;
	condition = sld_9704_blade_exit_condition;
	information = sld_9704_blade_exit_info;
	important = 0;
	permanent = 1;
	description = "���������";
};


func int sld_9704_blade_exit_condition()
{
	return TRUE;
};

func void sld_9704_blade_exit_info()
{
	AI_StopProcessInfos(self);
};


instance SLD_9704_BLADE_INSIDE_ABANDONEDMINE(C_Info)
{
	npc = sld_9704_blade;
	nr = 1;
	condition = sld_9704_blade_inside_abandonedmine_condition;
	information = sld_9704_blade_inside_abandonedmine_info;
	permanent = 0;
	important = 1;
};


func int sld_9704_blade_inside_abandonedmine_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_to_mine))
	{
		return 1;
	};
};

func void sld_9704_blade_inside_abandonedmine_info()
{
	AI_Output(self,other,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_11_00");	//��� �� � �����. ��� ������, ��� ������� � ���, �� ��� ��� ��������� �����. ������ ���� ���� � ��������.
	AI_Output(other,self,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_15_00");	//��� � ���� ������?
	AI_Output(self,other,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_11_01");	//������, ��������� ������, ������������ �����, ������ �����... ��� ����� ����� ��� ����� ���...
	AI_Output(self,other,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_11_02");	//������������, ��� �� ����� �����, ��� ������������ ���� �����-�� ��������, ��� ������ � �������.
	AI_Output(self,other,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_11_03");	//��������, ��-�� � ��������� ���� ��������� ��������. ������ � ��� ������ �� ���� ������ � �����? ���������!
	AI_Output(other,self,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_15_01");	//���������. ��-�����, �� ������ ���� ����������� � �������� � ����� ����� ����, ���� �� ��� � �����.
	AI_Output(self,other,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_11_04");	//��� ������.
	B_GiveXP(300);
	B_LogEntry(CH4_ABANDONEDMINE,"�� ����� � �����. ���� � �� ������� ������ ����������.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(SLD_704_Blade,"atmine");
	AI_SetWalkMode(self,NPC_RUN);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"seek");
};


instance SLD_9704_BLADE_DMT_ABANDONEDMINE(C_Info)
{
	npc = sld_9704_blade;
	nr = 1;
	condition = sld_9704_blade_dmt_abandonedmine_condition;
	information = sld_9704_blade_dmt_abandonedmine_info;
	permanent = 0;
	important = 1;
};


func int sld_9704_blade_dmt_abandonedmine_condition()
{
	if(Npc_KnowsInfo(hero,sld_9704_blade_inside_abandonedmine) && (Npc_GetDistToWP(hero,"MINE_BLADE_2") <= 2000) && (ABANDONEDMINEISOK == FALSE))
	{
		return 1;
	};
};

func void sld_9704_blade_dmt_abandonedmine_info()
{
	AI_Output(self,other,"SLD_9704_Blade_DMT_ABANDONEDMINE_11_00");	//��� ��������� �����. ������ ���������� ��������� �� ������� � ������ �� ���.
	AI_Output(other,self,"SLD_9704_Blade_DMT_ABANDONEDMINE_15_00");	//��, �� ������, ����� ����� ������� ���������� ���. �������.
	B_LogEntry(CH4_ABANDONEDMINE,"����� ������ ��� �����, ��� �� ���� ������ ������.");
	AI_StopProcessInfos(self);
};


instance SLD_9704_BLADE_BEFORE_DMT_ABANDONEDMINE(C_Info)
{
	npc = sld_9704_blade;
	nr = 1;
	condition = sld_9704_blade_before_dmt_abandonedmine_condition;
	information = sld_9704_blade_before_dmt_abandonedmine_info;
	permanent = 0;
	important = 1;
};


func int sld_9704_blade_before_dmt_abandonedmine_condition()
{
	if(Npc_KnowsInfo(hero,sld_9704_blade_inside_abandonedmine) && (Npc_GetDistToWP(hero,"MINE_BLADE_3") <= 2000) && (ABANDONEDMINEISOK == FALSE))
	{
		return 1;
	};
};

func void sld_9704_blade_before_dmt_abandonedmine_info()
{
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"SLD_9704_Blade_BEFORE_DMT_ABANDONEDMINE_11_00");	//������, �� ����� ������. � �������� ����� � ������� ���.
	AI_Output(other,self,"SLD_9704_Blade_BEFORE_DMT_ABANDONEDMINE_15_00");	//� ������ ���������� � ���� ����?
	AI_Output(self,other,"SLD_9704_Blade_BEFORE_DMT_ABANDONEDMINE_11_01");	//���� � ���� ����� ��������, ������ ���� ������ ����.
	AI_Output(self,other,"SLD_9704_Blade_BEFORE_DMT_ABANDONEDMINE_11_02");	//� ������ �� ����, ����� ��� ��������� �����.
	AI_Output(other,self,"SLD_9704_Blade_BEFORE_DMT_ABANDONEDMINE_15_01");	//���������, ��� ��� �������� �������.
	B_LogEntry(CH4_ABANDONEDMINE,"������ ��� �������� ����������� ������.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"mine");
};


instance SLD_9704_BLADE_AFTER_DMT_ABANDONEDMINE(C_Info)
{
	npc = sld_9704_blade;
	nr = 1;
	condition = sld_9704_blade_after_dmt_abandonedmine_condition;
	information = sld_9704_blade_after_dmt_abandonedmine_info;
	permanent = 0;
	important = 1;
};


func int sld_9704_blade_after_dmt_abandonedmine_condition()
{
	if(Npc_KnowsInfo(hero,dia_abandonedminedemon_ok))
	{
		return 1;
	};
};

func void sld_9704_blade_after_dmt_abandonedmine_info()
{
	AI_Output(self,other,"SLD_9704_Blade_AFTER_DMT_ABANDONEDMINE_11_00");	//������ ��� �����?! �� ���� ��?!
	AI_Output(other,self,"SLD_9704_Blade_AFTER_DMT_ABANDONEDMINE_15_00");	//����� ������� ���������� ����� ������� �������.
	AI_Output(self,other,"SLD_9704_Blade_AFTER_DMT_ABANDONEDMINE_11_01");	//�����, ����� ����� ������ ���� ����. �������� �� ���� ��������.
	B_LogEntry(CH4_ABANDONEDMINE,"����� ������, ��� ���� ���� ����� ���������� ������. � ������ ���������� � ��� ��������.");
	AI_Output(other,self,"SLD_9704_Blade_AFTER_DMT_ABANDONEDMINE_15_01");	//�������� ���� ������ ������ ����� ������� �������. �� ������ ������ ���������� ������.
	AI_Output(self,other,"SLD_9704_Blade_AFTER_DMT_ABANDONEDMINE_11_02");	//���������! ����� ��!
	B_LogEntry(CH4_ABANDONEDMINE,"��� ����� �������� ����� ��� ����� �������.");
	B_GiveXP(500);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(SLD_704_Blade,"mine");
	Npc_ExchangeRoutine(self,"run");
	AI_SetWalkMode(self,NPC_RUN);
};


instance SLD_9704_BLADE_INSIDE_ABANDONEDMINE_OK(C_Info)
{
	npc = sld_9704_blade;
	nr = 1;
	condition = sld_9704_blade_inside_abandonedmine_ok_condition;
	information = sld_9704_blade_inside_abandonedmine_ok_info;
	permanent = 0;
	important = 1;
};


func int sld_9704_blade_inside_abandonedmine_ok_condition()
{
	if(Npc_KnowsInfo(hero,sld_9704_blade_after_dmt_abandonedmine) && (Npc_GetDistToWP(hero,"MINE_BLADE_1") <= 2000))
	{
		return 1;
	};
};

func void sld_9704_blade_inside_abandonedmine_ok_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_OK_11_00");	//(����������� ��������) �������, �� ����������.
	AI_Output(other,self,"SLD_9704_Blade_INSIDE_ABANDONEDMINE_OK_15_00");	//��, ���� � ������.
	AI_SetWalkMode(self,NPC_WALK);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"atmine");
};

