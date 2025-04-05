
instance DIA_Kyle_Exit(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 999;
	condition = DIA_Kyle_Exit_Condition;
	information = DIA_Kyle_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Kyle_Exit_Condition()
{
	return 1;
};

func void DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self,120);
	AI_StopProcessInfos(self);
};


instance DIA_Kyle_HutRage(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 1;
	condition = DIA_Kyle_HutRage_Condition;
	information = DIA_Kyle_HutRage_Info;
	permanent = 1;
	important = 1;
};


func int DIA_Kyle_HutRage_Condition()
{
	if((KYLE_NO_PROBLEM != TRUE) && (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist))
	{
		return 1;
	};
};

func void DIA_Kyle_HutRage_Info()
{
	AI_Output(self,other,"DIA_Kyle_HutRage_10_00");	//������� ��� � ������� ���, ��������, �� ��������� ����� ��� ���?!
};


instance DIA_Kyle_Problem(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 2;
	condition = DIA_Kyle_Problem_Condition;
	information = DIA_Kyle_Problem_Info;
	permanent = 0;
	description = "��, � ��� ��������?";
};


func int DIA_Kyle_Problem_Condition()
{
	return 1;
};

func void DIA_Kyle_Problem_Info()
{
	AI_Output(other,self,"DIA_Kyle_Problem_15_00");	//��, � ��� ��������?
	AI_Output(self,other,"DIA_Kyle_Problem_10_01");	//������ ���� � �����, ������! ��� ���� �� ��� - ��������.
	AI_Output(self,other,"DIA_Kyle_Problem_10_02");	//��� ��� ��� ��������, ����� � ������ ���� ���!
	AI_Output(self,other,"DIA_Kyle_Problem_10_03");	//'�� ����� ��� ��� ������ � ���������', - �������� ���.
	AI_Output(self,other,"DIA_Kyle_Problem_10_04");	//�� �� ���� �� ���� �������� �� ������ ���, ��� �����, ���� � ���-���� ������� ��� �����.
	AI_Output(self,other,"DIA_Kyle_Problem_10_05");	//����� � �������� �� ����� ��������� ���� �����, � ���� ��������� ������ �����.
	AI_Output(self,other,"DIA_Kyle_Problem_10_06");	//��� ������! � �� ��������! �� ���� ����������� ���� �� ������, ��� � �� ��������!
	AI_Output(self,other,"DIA_Kyle_Problem_10_07");	//������ ��� �������� ����� ��� ���. ������ �����.
	Log_CreateTopic(CH1_KYLE_PROBLEM,LOG_MISSION);
	Log_SetTopicStatus(CH1_KYLE_PROBLEM,LOG_RUNNING);
	B_LogEntry(CH1_KYLE_PROBLEM,"���-�� �� ��������� �������� ����� � ���� �����. �����, ��� ����� ������������ � ����� ���.");
};


instance DIA_KYLE_ABOUT_PROBLEM(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 3;
	condition = dia_kyle_about_problem_condition;
	information = dia_kyle_about_problem_info;
	permanent = 1;
	description = "�� �� �������� ��������� ������ ���?";
};


func int dia_kyle_about_problem_condition()
{
	if((KYLE_NO_PROBLEM != TRUE) && Npc_KnowsInfo(hero,DIA_Kyle_Problem))
	{
		return 1;
	};
};

func void dia_kyle_about_problem_info()
{
	AI_Output(other,self,"DIA_Kyle_About_Problem_15_00");	//� �� �� �������� ��������� ������ ���?
	AI_Output(self,other,"DIA_Kyle_About_Problem_10_01");	//�� ���, ������? � ������ �������� �� ��� ����� �����.
	AI_Output(self,other,"DIA_Kyle_About_Problem_10_02");	//� ��� �������� ��������� ������, ���� � ������� ���� ������ ���.
	AI_Output(self,other,"DIA_Kyle_About_Problem_10_03");	//����� � ����� �������� �����.
};


instance DIA_KYLE_HELP_WITH_PROBLEM(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 4;
	condition = dia_kyle_help_with_problem_condition;
	information = dia_kyle_help_with_problem_info;
	permanent = 1;
	description = "� �� �� ����� ������������ � ������ �����?";
};


func int dia_kyle_help_with_problem_condition()
{
	if((KYLE_NO_PROBLEM != TRUE) && Npc_KnowsInfo(hero,DIA_Kyle_Problem))
	{
		return 1;
	};
};

func void dia_kyle_help_with_problem_info()
{
	AI_Output(other,self,"DIA_Kyle_Help_With_Problem_15_00");	//� �� �� ����� ������������ � ������ �����?
	AI_Output(self,other,"DIA_Kyle_Help_With_Problem_10_01");	//��. �� � ����������, ��� ���-�� ����� ���������� �� ���� ������...
	Info_AddChoice(dia_kyle_help_with_problem,"��... ����� �� ��� �� ���� ���� ������.",dia_kyle_help_with_problem_5);
	if(KYLE_TO_MUD != TRUE)
	{
		Info_AddChoice(dia_kyle_help_with_problem,"��� �������, ����� ����� �������, ������� ���������� � ����� ������...",dia_kyle_help_with_problem_4);
	};
	if(Npc_KnowsInfo(hero,DIA_BaalTondral_DustySuccess))
	{
		Info_AddChoice(dia_kyle_help_with_problem,"����� �������� � ������ ���������...",dia_kyle_help_with_problem_3);
	};
	Info_AddChoice(dia_kyle_help_with_problem,"����� ��������� ����� ���� ����������� �����...",dia_kyle_help_with_problem_2);
	if(Npc_KnowsInfo(hero,DIA_Guy_MyOwnHut))
	{
		Info_AddChoice(dia_kyle_help_with_problem,"����� ����� ���� ��������� ���...",dia_kyle_help_with_problem_1);
	};
};

func void dia_kyle_help_with_problem_1()
{
	AI_Output(other,self,"DIA_Kyle_Help_With_Problem_1_15_01");	//����� ����� ���� ��������� ���.
	AI_Output(self,other,"DIA_Kyle_Help_With_Problem_1_05_02");	//� ���� ��� �����. �� ������� � ���������� �� ������ � �� �����, ��� ��� ��� ����� ����...
};

func void dia_kyle_help_with_problem_2()
{
	AI_Output(other,self,"DIA_Kyle_Help_With_Problem_2_15_01");	//����� ��������� ����� ���� ����������� �����, �� ������ ���� ���.
	AI_Output(self,other,"DIA_Kyle_Help_With_Problem_2_05_02");	//���������� �������. ��������������� ������ ����� �������� ������. �� ����� ��� �������� ���.
};

func void dia_kyle_help_with_problem_3()
{
	AI_Output(other,self,"DIA_Kyle_Help_With_Problem_3_15_01");	//����� �������� � ������ ���������. ������ ��� ��� �������.
	AI_Output(self,other,"DIA_Kyle_Help_With_Problem_3_05_02");	//��� ������� ����. �����, � ����� ������������ ����.
	Log_SetTopicStatus(CH1_KYLE_PROBLEM,LOG_SUCCESS);
	B_LogEntry(CH1_KYLE_PROBLEM,"����� �������� � ��������� ��� �������� �����. ��� ��������, �������, ������.");
	KYLE_NO_PROBLEM = TRUE;
	B_GiveXP(250);
	Npc_ExchangeRoutine(self,"DUSTYAFTERSTART");
	Info_ClearChoices(dia_kyle_help_with_problem);
};

func void dia_kyle_help_with_problem_4()
{
	AI_Output(other,self,"DIA_Kyle_Help_With_Problem_4_15_01");	//��� �������, ��� ����� ����� �������, ������� ���������� � ����� ������.
	AI_Output(self,other,"DIA_Kyle_Help_With_Problem_4_05_02");	//�������� ����! ������� ��� ����������.
	AI_Output(self,other,"DIA_Kyle_Help_With_Problem_4_05_03");	//� ���� ���� ���������� ���� ���� �����������. ��� ���.
	AI_Output(self,other,"DIA_Kyle_Help_With_Problem_4_05_04");	//�����, ��������� ��� ������.
	B_LogEntry(CH1_KYLE_PROBLEM,"����� ����������� ��������� ���� ���������� ������ � �����.");
	KYLE_TO_MUD = TRUE;
	Info_ClearChoices(dia_kyle_help_with_problem);
};

func void dia_kyle_help_with_problem_5()
{
	AI_Output(other,self,"DIA_Kyle_Help_With_Problem_5_15_01");	//��... ����� �� ��� �� ���� ���� ������.
	Info_ClearChoices(dia_kyle_help_with_problem);
};


instance DIA_KYLE_NO_PROBLEM(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 1;
	condition = dia_kyle_no_problem_condition;
	information = dia_kyle_no_problem_info;
	permanent = 0;
	description = "��� ���������� ���������� ������.";
};


func int dia_kyle_no_problem_condition()
{
	if((KYLE_TO_MUD == TRUE) && (KYLE_NO_PROBLEM != TRUE) && Npc_KnowsInfo(hero,DIA_Kyle_Problem) && Npc_KnowsInfo(hero,dia_mud_house))
	{
		return 1;
	};
};

func void dia_kyle_no_problem_info()
{
	AI_Output(other,self,"DIA_Kyle_No_Problem_15_00");	//(�������) ��� ���������� ���������� ������.
	AI_Output(self,other,"DIA_Kyle_No_Problem_10_01");	//������, �� ����� ��� �����?
	AI_Output(other,self,"DIA_Kyle_No_Problem_15_01");	//��, ��� � ��� ����. � �� ��������� � ����� ����.
	AI_Output(self,other,"DIA_Kyle_No_Problem_10_02");	//�� ���� ��������! ������� ����!
	AI_Output(self,other,"DIA_Kyle_No_Problem_10_03");	//��� ������ ��� ���� ���, � ����� �� ������ ����� ������ �����. �������� ��� ������� ������� ����� �������.
	Log_SetTopicStatus(CH1_KYLE_PROBLEM,LOG_SUCCESS);
	B_LogEntry(CH1_KYLE_PROBLEM,"����� ��������� ������ � �����. � ������ �� ����� ����!");
	KYLE_NO_PROBLEM = TRUE;
	B_GiveXP(300);
	CreateInvItem(self,ItRw_Bow_Small_05);
	B_GiveInvItems(self,hero,ItRw_Bow_Small_05,1);
	Npc_ExchangeRoutine(self,"AFTERSTART");
};


instance DIA_KYLE_AFTER_NO_PROBLEM(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 1;
	condition = dia_kyle_after_no_problem_condition;
	information = dia_kyle_after_no_problem_info;
	permanent = 0;
	description = "��� ���� ����� ���?";
};


func int dia_kyle_after_no_problem_condition()
{
	if((KYLE_NO_PROBLEM == TRUE) && ((Npc_GetDistToWP(self,"OCR_OUTSIDE_HUT_13") <= 1000) || (Npc_GetDistToWP(self,"OCR_OUTSIDE_HUT_58") <= 1000)))
	{
		return 1;
	};
};

func void dia_kyle_after_no_problem_info()
{
	AI_Output(other,self,"DIA_Kyle_After_No_Problem_15_00");	//��� ���� ����� ���?
	if(Npc_KnowsInfo(hero,dia_mud_house))
	{
		AI_Output(self,other,"DIA_Kyle_After_No_Problem_10_00");	//���� ��� ������ ���������... ������ � ������ �� ����� ������ ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Kyle_After_No_Problem_10_01");	//�������� ���! ����� ������ ������� ����� �������.
	};
};

