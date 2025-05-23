
instance DIA_Shrat_Exit(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 999;
	condition = DIA_Shrat_Exit_Condition;
	information = DIA_Shrat_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Shrat_Exit_Condition()
{
	return 1;
};

func void DIA_Shrat_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Shrat_WhyHere(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_WhyHere_Condition;
	information = DIA_Shrat_WhyHere_Info;
	permanent = 0;
	description = "��� �� �����������?";
};


func int DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

func void DIA_Shrat_WhyHere_Info()
{
	AI_Output(other,self,"DIA_Shrat_WhyHere_15_00");	//��� �� �����������?
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_01");	//����� � �������� ���� ���������� �� ���?
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_02");	//����! � �����, ������ ��� ��� ������� �������� ��������� ��� �� �����!
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_03");	//�� ���� ���������� �� ���!' - '���� ������� � ��������!' - '��� ������� ����������� ��������!'
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_04");	//����� ������ ���� ������� ������, ����� ����������, ����� ������ �������� � ���.
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_05");	//� ����, ������ ������� �����, �� �� � � ��������!
};


instance DIA_Shrat_JoinPSI(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_JoinPSI_Condition;
	information = DIA_Shrat_JoinPSI_Info;
	permanent = 0;
	description = "� ���� ����� ����� �� ������ ��������. �� ������ ��� ������?";
};


func int DIA_Shrat_JoinPSI_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Shrat_WhyHere))
	{
		return 1;
	};
};

func void DIA_Shrat_JoinPSI_Info()
{
	AI_Output(other,self,"DIA_Shrat_JoinPSI_15_00");	//� ���� ����� ����� �� ������ ��������. �� ������ ��� ������?
	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_01");	//�� ������������� ����������� �������������� � ���� �����? � � ������ � ����� � ���, ��� ������� ������.
	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_02");	//�� ����� �� ������ ������������� �� �������. �������� �������� ������� �����������, ���������� ���� - ��� �������?
};


instance DIA_Shrat_ComeWithMe(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_ComeWithMe_Condition;
	information = DIA_Shrat_ComeWithMe_Info;
	permanent = 1;
	description = "�������, ����! ������ �������!";
};


func int DIA_Shrat_ComeWithMe_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Shrat_JoinPSI) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return 1;
	};
};

func void DIA_Shrat_ComeWithMe_Info()
{
	AI_Output(other,self,"DIA_Shrat_ComeWithMe_15_00");	//�������, ����! ������ �������!
	AI_Output(self,other,"DIA_Shrat_ComeWithMe_02_01");	//��, ��� � ����� ��������! ������!
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_Shrat_LeaveMe(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 700;
	condition = DIA_Shrat_LeaveMe_Condition;
	information = DIA_Shrat_LeaveMe_Info;
	permanent = 1;
	description = "���� ���� ���������� - � ����� ����.";
};


func int DIA_Shrat_LeaveMe_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return 1;
	};
};

func void DIA_Shrat_LeaveMe_Info()
{
	AI_Output(other,self,"DIA_Shrat_LeaveMe_15_00");	//���� ���� ���������� - � ����� ����.
	AI_Output(self,other,"DIA_Shrat_LeaveMe_02_01");	//�����. � � ������� � ���� ������� �� �������. ������ ����!
	Npc_ExchangeRoutine(self,"START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};

