
instance INFO_ABANDONEDMINEDEMON_EXIT(C_Info)
{
	npc = abandonedminedemon;
	nr = 999;
	condition = info_abandonedminedemon_exit_condition;
	information = info_abandonedminedemon_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_abandonedminedemon_exit_condition()
{
	if(Npc_KnowsInfo(hero,dia_abandonedminedemon_ok) || !Npc_KnowsInfo(hero,sld_704_blade_abandonedmine))
	{
		return 1;
	};
};

func void info_abandonedminedemon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ABANDONEDMINEDEMON_MAD(C_Info)
{
	npc = abandonedminedemon;
	nr = 1;
	condition = dia_abandonedminedemon_mad_condition;
	information = dia_abandonedminedemon_mad_info;
	important = 1;
	permanent = 0;
};


func int dia_abandonedminedemon_mad_condition()
{
	if(Npc_KnowsInfo(hero,sld_704_blade_abandonedmine))
	{
		return 1;
	};
};

func void dia_abandonedminedemon_mad_info()
{
	AI_Output(self,other,"DIA_AbandonedMineDemon_MAD_02_00");	//�� �� ������ ��������. ��� �� ������� ���������� ��� �����������. ���, � ���� ������ ����!
	AI_Output(other,self,"DIA_AbandonedMineDemon_MAD_15_00");	//�-�-�! ������. � �� ������ ��� �����?
	AI_Output(self,other,"DIA_AbandonedMineDemon_MAD_02_01");	//� � �������� ������� ���� ���, � ������������ ������.
	AI_Output(self,other,"DIA_AbandonedMineDemon_MAD_02_02");	//�� ������� ���� ������ ����, ��� �������� ����, � ���� ����. � ��� ��������� �����, � �������, ��� ����� �� ��������� ��� �����. ��, � ������.
	AI_Output(self,other,"DIA_AbandonedMineDemon_MAD_02_03");	//������� ������� ������� � ��� ������ ����� ��������� ���.
	AI_Output(other,self,"DIA_AbandonedMineDemon_MAD_15_01");	//��� ���� ������? ��������?
	AI_Output(self,other,"DIA_AbandonedMineDemon_MAD_02_04");	//��-��-��. ������ ���� ����� ��� ������� ���, ��� ������ � ����� ��������� ��������. ��� ��� ���� �� �������� ���������.
	B_GiveXP(750);
	B_LogEntry(CH4_ABANDONEDMINE,"������, � ����� �������� ������.");
	ABANDONEDMINEISOK = TRUE;
};


instance DIA_ABANDONEDMINEDEMON_BLADE(C_Info)
{
	npc = abandonedminedemon;
	nr = 2;
	condition = dia_abandonedminedemon_blade_condition;
	information = dia_abandonedminedemon_blade_info;
	important = 0;
	permanent = 0;
	description = "��� �� ������ � ������ ������?";
};


func int dia_abandonedminedemon_blade_condition()
{
	if(Npc_KnowsInfo(hero,dia_abandonedminedemon_mad))
	{
		return 1;
	};
};

func void dia_abandonedminedemon_blade_info()
{
	AI_Output(other,self,"DIA_AbandonedMineDemon_BLADE_15_00");	//��� �� ������ � ������ ������?
	AI_Output(self,hero,"DIA_AbandonedMineDemon_BLADE_02_00");	//��, ��� ������� � �����, ��������� ���� ���� ������ ����.
	AI_Output(self,other,"DIA_AbandonedMineDemon_BLADE_02_01");	//�� �� �������, �� � ������.
	B_GiveXP(300);
	B_LogEntry(CH4_ABANDONEDMINE,"�� ���� ������, ������� ������� ������ ����� ������� ������.");
};


instance DIA_ABANDONEDMINEDEMON_OK(C_Info)
{
	npc = abandonedminedemon;
	nr = 2;
	condition = dia_abandonedminedemon_ok_condition;
	information = dia_abandonedminedemon_ok_info;
	important = 0;
	permanent = 0;
	description = "������� �������. ������ �� �������, ��� � �����!";
};


func int dia_abandonedminedemon_ok_condition()
{
	if(Npc_KnowsInfo(hero,dia_abandonedminedemon_blade))
	{
		return 1;
	};
};

func void dia_abandonedminedemon_ok_info()
{
	AI_Output(other,self,"DIA_AbandonedMineDemon_OK_15_00");	//������� �������. ������ �� �������, ��� � �����!
	AI_Output(self,hero,"DIA_AbandonedMineDemon_OK_02_00");	//��-��-��-��! ������� �� ������� ��� ������ ����� ����? ���� � ��� �����!
	B_LogEntry(CH4_ABANDONEDMINE,"� �� ����� ����� ������ ��������������. ���� ����������� ������!");
	AI_StopProcessInfos(self);
	self.guild = GIL_DEMON;
	Npc_SetTrueGuild(self,GIL_DEMON);
	Npc_SetPermAttitude(self,ATT_HOSTILE);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	Npc_ExchangeRoutine(sld_9704_blade,"mine");
};

