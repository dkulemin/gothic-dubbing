
instance Nov_1371_BaalNetbek_Exit(C_Info)
{
	npc = NOV_1371_BaalNetbek;
	nr = 999;
	condition = Nov_1371_BaalNetbek_Exit_Condition;
	information = Nov_1371_BaalNetbek_Exit_Info;
	important = 0;
	permanent = 1;
	description = "���������";
};


func int Nov_1371_BaalNetbek_Exit_Condition()
{
	return TRUE;
};

func void Nov_1371_BaalNetbek_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Nov_1371_BaalNetbek_CRAZY(C_Info)
{
	npc = NOV_1371_BaalNetbek;
	nr = 1;
	condition = Nov_1371_BaalNetbek_CRAZY_Condition;
	information = Nov_1371_BaalNetbek_CRAZY_Info;
	important = 0;
	permanent = 0;
	description = "��� ���� �����?";
};


func int Nov_1371_BaalNetbek_CRAZY_Condition()
{
	return TRUE;
};

func void Nov_1371_BaalNetbek_CRAZY_Info()
{
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_01");	//��� ��?
	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_02");	//� ����, ���� ������. ��� ����� ����� ���� ���� ������.
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_03");	//�����? � �� ���� ������� ����!
	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_04");	//��� �������. �������! ��� ����� � ����, � �������...
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_05");	//... �, �������. �����, ��� ����...
	AI_Output(self,other,"Nov_1371_BaalNetbek_CRAZY_Info_03_06");	//������, �� ������ ������ ���! � ��������� ���������� ��� ������ � ���������� �������� ���!
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_07");	//�����, �� ���� ������� ��� ����, � �... � ����� �������.
	AI_TurnAway(hero,self);
	AI_Output(other,self,"Nov_1371_BaalNetbek_CRAZY_Info_15_08");	//�� �� ���������� ���� ������ �����...
	AI_StopProcessInfos(self);
};


instance Nov_1371_BaalNetbek_AGAIN(C_Info)
{
	npc = NOV_1371_BaalNetbek;
	nr = 1;
	condition = Nov_1371_BaalNetbek_AGAIN_Condition;
	information = Nov_1371_BaalNetbek_AGAIN_Info;
	important = 0;
	permanent = 1;
	description = "��, ��� ����?";
};


func int Nov_1371_BaalNetbek_AGAIN_Condition()
{
	if(Npc_KnowsInfo(hero,Nov_1371_BaalNetbek_CRAZY))
	{
		return TRUE;
	};
};

func void Nov_1371_BaalNetbek_AGAIN_Info()
{
	AI_Output(other,self,"Nov_1371_BaalNetbek_AGAIN_Info_15_01");	//��, ��� ����?
	AI_Output(self,other,"Nov_1371_BaalNetbek_AGAIN_Info_03_02");	//���������� �� ��������� ����� ���� ��������!
};


instance NOV_1371_BAALNETBEK_BLOODWOOD(C_Info)
{
	npc = NOV_1371_BaalNetbek;
	nr = 2;
	condition = nov_1371_baalnetbek_bloodwood_condition;
	information = nov_1371_baalnetbek_bloodwood_info;
	important = 0;
	permanent = 0;
	description = "� ������ ���� ���� ����...";
};


func int nov_1371_baalnetbek_bloodwood_condition()
{
	if(Npc_KnowsInfo(hero,Nov_1371_BaalNetbek_CRAZY) && (Npc_HasItems(hero,ItFo_Plants_Bloodwood_01) >= 1))
	{
		return TRUE;
	};
};

func void nov_1371_baalnetbek_bloodwood_info()
{
	AI_Output(other,self,"Nov_1371_BaalNetbek_Bloodwood_Info_15_01");	//� ������ ���� ���� ����...
	AI_Output(self,other,"Nov_1371_BaalNetbek_Bloodwood_Info_03_02");	//�������, ��������. ������ � ���� ����� ����� �����.
	AI_Output(self,other,"Nov_1371_BaalNetbek_Bloodwood_Info_03_03");	//���, ������ ��� �����.
	B_GiveXP(100);
	B_GiveInvItems(hero,self,ItFo_Plants_Bloodwood_01,1);
	B_GiveInvItems(self,hero,ItFo_Plants_Herb_03,5);
};


instance NOV_1371_BAALNETBEK_BLOODWOOD_AGAIN(C_Info)
{
	npc = NOV_1371_BaalNetbek;
	nr = 2;
	condition = nov_1371_baalnetbek_bloodwood_again_condition;
	information = nov_1371_baalnetbek_bloodwood_again_info;
	important = 0;
	permanent = 0;
	description = "� ���� ���� ��� ���� ���� ����...";
};


func int nov_1371_baalnetbek_bloodwood_again_condition()
{
	if(Npc_KnowsInfo(hero,nov_1371_baalnetbek_bloodwood) && (Npc_HasItems(hero,ItFo_Plants_Bloodwood_01) >= 1))
	{
		return TRUE;
	};
};

func void nov_1371_baalnetbek_bloodwood_again_info()
{
	AI_Output(other,self,"Nov_1371_BaalNetbek_Bloodwood_Again_Info_15_01");	//� ���� ���� ��� ���� ���� ����...
	AI_Output(self,other,"Nov_1371_BaalNetbek_Bloodwood_Again_Info_03_02");	//�, ��� �� �� ��������� ��� ���.
	AI_Output(self,other,"Nov_1371_BaalNetbek_Bloodwood_Again_Info_03_03");	//������, ��� ����.
	B_GiveXP(100);
	B_GiveInvItems(hero,self,ItFo_Plants_Bloodwood_01,1);
	B_GiveInvItems(self,hero,ItFo_Plants_Stoneroot_01,1);
};


instance NOV_1371_BAALNETBEK_TOWERWOOD(C_Info)
{
	npc = NOV_1371_BaalNetbek;
	nr = 3;
	condition = nov_1371_baalnetbek_towerwood_condition;
	information = nov_1371_baalnetbek_towerwood_info;
	important = 0;
	permanent = 0;
	description = "� ������ ���� ���� ����...";
};


func int nov_1371_baalnetbek_towerwood_condition()
{
	if(Npc_KnowsInfo(hero,Nov_1371_BaalNetbek_CRAZY) && (Npc_HasItems(hero,ItFo_Plants_Towerwood_01) >= 1))
	{
		return TRUE;
	};
};

func void nov_1371_baalnetbek_towerwood_info()
{
	AI_Output(other,self,"Nov_1371_BaalNetbek_Towerwood_Info_15_01");	//� ������ ���� ���� ����...
	AI_Output(self,other,"Nov_1371_BaalNetbek_Towerwood_Info_03_02");	//��� ������� �����. ��� ������� ����� ������������� ���� �����.
	AI_Output(self,other,"Nov_1371_BaalNetbek_Towerwood_Info_03_03");	//������, ��� ������� ���� �� ��������.
	B_GiveXP(100);
	B_GiveInvItems(hero,self,ItFo_Plants_Towerwood_01,1);
	B_GiveInvItems(self,hero,ItMiJoint_3,5);
};

