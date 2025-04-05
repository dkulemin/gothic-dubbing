
instance DIA_Jeremiah_EXIT(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 999;
	condition = DIA_Jeremiah_EXIT_Condition;
	information = DIA_Jeremiah_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

func void DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jeremiah_Hallo(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = DIA_Jeremiah_Hallo_Condition;
	information = DIA_Jeremiah_Hallo_Info;
	permanent = 0;
	description = "��� �� �����������?";
};


func int DIA_Jeremiah_Hallo_Condition()
{
	if(!Npc_KnowsInfo(hero,dia_jeremiah_spirit_ok))
	{
		return 1;
	};
};

func void DIA_Jeremiah_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_Hallo_15_00");	//��� �� �������?
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_01");	//������� ������� �����, ������.
	AI_Output(self,other,"DIA_Jeremiah_Hallo_04_02");	//���, ������ ������. ������ �� ������ ������.
	CreateInvItems(self,ItFoBooze,1);
	B_GiveInvItems(self,other,ItFoBooze,1);
};


var int Jeremiah_Bauer;

instance DIA_Jeremiah_PERM(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 1;
	condition = DIA_Jeremiah_PERM_Condition;
	information = DIA_Jeremiah_PERM_Info;
	permanent = 1;
	description = "��� ���� ����?";
};


func int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

func void DIA_Jeremiah_PERM_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_PERM_15_00");	//��� ���� ����?
	if(!Npc_KnowsInfo(hero,dia_jeremiah_spirit_ok))
	{
		AI_Output(self,other,"DIA_Jeremiah_PERM_04_01");	//� ���� �������� � ����� ������. ����, ������� �� ��� ����!
		AI_Output(self,other,"DIA_Jeremiah_PERM_04_02");	//�� ��� � �������. ���� � ����� �����, ������ ������ ����� ��������� ��� �� ������.
		Jeremiah_Bauer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jeremiah_PERM_04_03");	//������ � ���� ������� ���������.
		AI_Output(self,other,"DIA_Jeremiah_PERM_04_04");	//�� ����� ���� ������, ��� � ����� �� �����, �� ������� ���� �������� � ����.
	};
};


instance DIA_Jeremiah_Horatio(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 2;
	condition = DIA_Jeremiah_Horatio_Condition;
	information = DIA_Jeremiah_Horatio_Info;
	permanent = 0;
	description = "�������� ��� � �����.";
};


func int DIA_Jeremiah_Horatio_Condition()
{
	if(Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

func void DIA_Jeremiah_Horatio_Info()
{
	AI_Output(other,self,"DIA_Jeremiah_Horatio_15_00");	//�������� ��� � �����.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_01");	//��������� ������! ��� ���������� �������� ���, ��� ��������, � ���������� �� �������� �� �����.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_02");	//������������, ��� ��� �� ������������� ���, - ��� �������.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_03");	//� ������ �������, ��� �� �������, ��� � ������������� ���� �� ����� ������ ������ ����� � ����� �� ����� ���... �� �� ������� ����� �� �������.
	AI_Output(self,other,"DIA_Jeremiah_Horatio_04_04");	//��� ������ ��� ���������.
};


instance DIA_JEREMIAH_SPIRIT(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 2;
	condition = dia_jeremiah_spirit_condition;
	information = dia_jeremiah_spirit_info;
	permanent = 0;
	description = "�� ������ ���� ��� �����?";
};


func int dia_jeremiah_spirit_condition()
{
	if(Npc_KnowsInfo(hero,info_yberion_innos_work))
	{
		return 1;
	};
};

func void dia_jeremiah_spirit_info()
{
	AI_Output(other,self,"DIA_Jeremiah_SPIRIT_15_00");	//�� ������ ���� ��� �����?
	AI_Output(self,other,"DIA_Jeremiah_SPIRIT_04_01");	//������� ���� �����?
	AI_Output(other,self,"DIA_Jeremiah_SPIRIT_15_01");	//�����, ������ 10 ��������.
	AI_Output(self,other,"DIA_Jeremiah_SPIRIT_04_02");	//������. ����� ��� ������, ����� � ��� ���� �����.
	B_LogEntry(CH4_YBERION_INNOS,"������� ���� ��� �����, ���� � ����� ��� ������.");
};


instance DIA_JEREMIAH_SPIRIT_OK(C_Info)
{
	npc = BAU_912_Jeremiah;
	nr = 2;
	condition = dia_jeremiah_spirit_ok_condition;
	information = dia_jeremiah_spirit_ok_info;
	permanent = 0;
	description = "������ ���������� �������� ����.";
};


func int dia_jeremiah_spirit_ok_condition()
{
	if(Npc_KnowsInfo(hero,dia_senyan_spirit_ok) || Npc_KnowsInfo(hero,dia_silas_spirit_ok))
	{
		return 1;
	};
};

func void dia_jeremiah_spirit_ok_info()
{
	AI_Output(other,self,"DIA_Jeremiah_SPIRIT_OK_15_00");	//������ ���������� �������� ����.
	AI_Output(self,other,"DIA_Jeremiah_SPIRIT_OK_04_01");	//������ � ����� ������� ���������.
	AI_Output(self,other,"DIA_Jeremiah_SPIRIT_OK_04_02");	//��� 10 �������� ������, ��� �� � ������.
	B_GiveXP(150);
	B_GiveInvItems(self,hero,ItMi_Alchemy_Alcohol_01,10);
	B_LogEntry(CH4_YBERION_INNOS,"� ������� ����� � �������.");
};

