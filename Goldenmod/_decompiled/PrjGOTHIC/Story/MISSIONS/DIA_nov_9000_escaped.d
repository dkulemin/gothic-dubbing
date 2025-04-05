
instance NOV_9000_ESCAPED_EXIT(C_Info)
{
	npc = nov_9000_escaped;
	nr = 1;
	condition = nov_9000_escaped_exit_condition;
	information = nov_9000_escaped_exit_info;
	important = 1;
	permanent = 1;
};


func int nov_9000_escaped_exit_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_KnowsInfo(hero,nov_9000_escaped_amulette) || !Npc_KnowsInfo(hero,info_yberion_nov_away)))
	{
		return 1;
	};
};

func void nov_9000_escaped_exit_info()
{
	AI_Output(other,self,"Nov_9000_Escaped_Exit_Info_15_00");	//������!
	AI_Output(self,other,"Nov_9000_Escaped_Exit_Info_03_00");	//� �������� �����! � ������ �� ���� ������� �������� ���� ����.
	AI_StopProcessInfos(self);
};


instance DIA_NOV_9000_ESCAPED_EXIT(C_Info)
{
	npc = nov_9000_escaped;
	nr = 999;
	condition = dia_nov_9000_escaped_exit_condition;
	information = dia_nov_9000_escaped_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_nov_9000_escaped_exit_condition()
{
	if(!Npc_KnowsInfo(hero,nov_9000_escaped_amulette))
	{
		return 1;
	};
};

func void dia_nov_9000_escaped_exit_info()
{
	AI_StopProcessInfos(self);
};


instance NOV_9000_ESCAPED_AMULETTE(C_Info)
{
	npc = nov_9000_escaped;
	nr = 1;
	condition = nov_9000_escaped_amulette_condition;
	information = nov_9000_escaped_amulette_info;
	permanent = 0;
	description = "�� ������� �� ������!";
};


func int nov_9000_escaped_amulette_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(hero,info_yberion_nov_away))
	{
		return 1;
	};
};

func void nov_9000_escaped_amulette_info()
{
	AI_Output(other,self,"Nov_9000_Escaped_Amulette_Info_15_00");	//�� ������� �� ������!
	AI_Output(self,other,"Nov_9000_Escaped_Amulette_Info_03_00");	//�� ������ �� ������ �������. �� ���� �� ��������.
	AI_Output(self,other,"Nov_9000_Escaped_Amulette_Info_03_01");	//���� ������ ����� ������!
	AI_Output(other,self,"Nov_9000_Escaped_Amulette_Info_15_01");	//� ������ ���� ������� ������, ������� �� ������ � ��������� �'�������.
	AI_Output(self,other,"Nov_9000_Escaped_Amulette_Info_03_02");	//�� ��� �� ��������!
	Info_AddChoice(nov_9000_escaped_amulette,"����� � ������ ������ �����!",nov_9000_escaped_amulette_c);
	Info_AddChoice(nov_9000_escaped_amulette,"��� �������� ������� ����, ��� �� ����������.",nov_9000_escaped_amulette_b);
	Info_AddChoice(nov_9000_escaped_amulette,"� ����� ������.",nov_9000_escaped_amulette_a);
};

func void nov_9000_escaped_amulette_a()
{
	AI_Output(other,self,"Nov_9000_Escaped_Amulette_A_15_00");	//� ����� ������.
	AI_Output(self,other,"Nov_9000_Escaped_Amulette_A_03_00");	//�� ����� 600 ������ ����.
	if(Npc_HasItems(hero,ItMiNugget) >= 600)
	{
		AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00");	//����.
		AI_Output(self,other,"Nov_9000_Escaped_Amulette_A_03_01");	//������ �� ������ �'�������, ��� �� ���������.
		B_GiveXP(200);
		B_LogEntry(CH4_YBERION_AMULETTE,"� ����� ��������� �����������. �� ������ �������� �������� ���� ����.");
		B_GiveInvItems(hero,self,ItMiNugget,600);
		B_GiveInvItems(self,hero,yberion_magic_amulette,1);
		self.flags = 0;
		Info_ClearChoices(nov_9000_escaped_amulette);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"Nov_9000_Escaped_Amulette_A_15_02");	//� ���� �� ������� ����, �� �� ������ ������� ����?
		AI_Output(self,other,"Nov_9000_Escaped_Amulette_A_03_02");	//���, ������ ��������� � ����.
	};
};

func void nov_9000_escaped_amulette_b()
{
	AI_Output(other,self,"Nov_9000_Escaped_Amulette_B_15_00");	//��� �������� ������� ����, ��� �� ����������.
	AI_Output(self,other,"Nov_9000_Escaped_Amulette_B_03_00");	//(���������) ���, �� ����! ������ �� ������ ����.
	AI_Output(self,other,"Nov_9000_Escaped_Amulette_B_03_01");	//��� ������ � ��� 2 ������, ������� �� ����� �� �������.
	B_GiveXP(300);
	B_LogEntry(CH4_YBERION_AMULETTE,"� ����� ��������� �����������. ��� ���� ������ ��� ������, �� ������� �� �������� ����, ��� ��� ����������.");
	B_GiveInvItems(self,hero,yberion_magic_amulette,1);
	B_GiveInvItems(self,hero,Ring_der_Magie,1);
	B_GiveInvItems(self,hero,Machtring,1);
	self.flags = 0;
	Info_ClearChoices(nov_9000_escaped_amulette);
	AI_StopProcessInfos(self);
};

func void nov_9000_escaped_amulette_c()
{
	var C_Npc escapednov;
	AI_Output(other,self,"Nov_9000_Escaped_Amulette_C_15_00");	//����� � ������ ������ �����!
	AI_Output(self,other,"Nov_9000_Escaped_Amulette_C_03_00");	//(������������) ��������!
	B_GiveXP(100);
	B_LogEntry(CH4_YBERION_AMULETTE,"� ����� ��������� �����������, �� ������ ��� ��� ������� ������ �� ��������.");
	self.flags = 0;
	Info_ClearChoices(nov_9000_escaped_amulette);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	escapednov = Hlp_GetNpc(nov_9001_escaped);
	Npc_SetTarget(escapednov,other);
	AI_StartState(escapednov,ZS_Attack,1,"");
	AI_StartState(self,ZS_Attack,1,"");
};

