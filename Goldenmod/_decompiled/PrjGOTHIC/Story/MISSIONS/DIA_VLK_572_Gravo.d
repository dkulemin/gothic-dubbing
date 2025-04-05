
instance DIA_Gravo_Exit(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 999;
	condition = DIA_Gravo_Exit_Condition;
	information = DIA_Gravo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Gravo_Exit_Condition()
{
	return 1;
};

func void DIA_Gravo_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gravo_Hallo(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_Hallo_Condition;
	information = DIA_Gravo_Hallo_Info;
	permanent = 0;
	description = "��� ���� ����?";
};


func int DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func void DIA_Gravo_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gravo_Hallo_15_00");	//��� ���� ����?
	AI_Output(self,other,"DIA_Gravo_Hallo_04_01");	//� ��� ��� ��� � �������� ����� ����� �� �����, ������������ �� �� ���.
	AI_Output(other,self,"DIA_Gravo_Hallo_15_02");	//�� ��� �� �� ������?
	AI_Output(self,other,"DIA_Gravo_Hallo_04_03");	//� ������� ����� ������ �� ��������.
	AI_Output(self,other,"DIA_Gravo_Hallo_04_04");	//���� �� ��������� ������ ����-������ �� ������� ����� �����, � ������, � ���������� ������� ���.
};


instance DIA_Gravo_HelpHow(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_HelpHow_Condition;
	information = DIA_Gravo_HelpHow_Info;
	permanent = 0;
	description = "�� ����, ���� ��������� ��������, �� ������� ������? �� ���?";
};


func int DIA_Gravo_HelpHow_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func void DIA_Gravo_HelpHow_Info()
{
	AI_Output(other,self,"DIA_Gravo_HelpHow_15_00");	//�� ����, ���� ��������� ��������, �� ������� ������? �� ���?
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_01");	//��, ��������, �� ���������� � �������. ������-��, ��������� � ��� ������ �� �����, �� �� ����� ����������.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_02");	//����� � ��� �������� �������: ���� �� ���� ���� ��� ������ ���, �� ������ �� ���� �����. � ��� �����.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_03");	//�� �������, �� �� ���� ��������. � ��� �� ��������� �� ��� � ������� ������. � � ���� ������ �����, � ����� ������ ����� ��������������.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_04");	//��� �������� �� ���� ��������, � ��� �� � ������� ����� ������. ����������, ������ ��� ��� ����� �� ���������, ��� ��� ���� �������� �������������.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_05");	//�� � � �������� � ���, ����� ���� ���� ������ � ������ ����...
	B_LogEntry(GE_TraderOC,"������� ����� ���������� ����������� ������. ���� � ������ � ������������ � ������, �� � ���� ��������� ��� �� �� �������.");
};

func void B_Gravo_HelpAttitude(var C_Npc prob)
{
	if(Npc_GetPermAttitude(prob,other) == ATT_ANGRY)
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_00");	//��, �� � ���� �� ������ �����.
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_01");	//���� � ���� ���� �������... � �����, �� 100 ������ ���� ����� ������ ��� ��������.
		if(Npc_HasItems(other,ItMiNugget) >= 100)
		{
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_02");	//���������, ��� � ���� ����... ���! ����� ������ �������. ������ �������, ��� ������ �����.
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_03");	//� ������ �� ������ �� ����! ���� ���� ���, ����� ������ �� ���������.
			B_GiveInvItems(hero,self,ItMiNugget,100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� ������� ���...
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//��� ����� ����, ������, �� ����� � ������ �� ����� ��� ���� �������.
		};
	}
	else if(Npc_GetPermAttitude(prob,other) == ATT_HOSTILE)
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_00");	//� �� ��������� ��� '���������'?! ����� �������, ��������! �� ��� �� ������� ���� �� �����.
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_01");	//������� ����� ������ �� ���� ������ � ����� ���� - ��� ����� �������. � ��������. ������ ��� ������� ���� �����.
		if(Npc_HasItems(other,ItMiNugget) >= 500)
		{
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_02");	//���������, ��� � ���� ����... ������, �� �� �����! � ������� 500 ������ � �������� ���� ��������.
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_03");	//� �������: ����� �� ������ �� ���� �����.
			B_GiveInvItems(hero,self,ItMiNugget,500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//� ���� ������� ���...
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//��� ����� ����, ������, �� ����� � ������ �� ����� ��� ���� �������.
		};
	}
	else
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_NoProb_04_00");	//��������� ��� ��������, � ��� � ��� ��� � �������. �� �������� �������, ������.
	};
};


instance DIA_Gravo_HelpAngryNow(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_HelpAngryNow_Condition;
	information = DIA_Gravo_HelpAngryNow_Info;
	permanent = 1;
	description = "�������, � ���� �������� ��������. �� ������ ��� ������?";
};


func int DIA_Gravo_HelpAngryNow_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_HelpHow))
	{
		return 1;
	};
};

func void DIA_Gravo_HelpAngryNow_Info()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_15_00");	//�������, � ���� �������� ��������. �� ������ ��� ������?
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_04_01");	//�����, ��� ��. �� ��� ������ ����� �������� - �� 100 �� 500 ������ ����.
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,DIALOG_BACK,DIA_Gravo_HelpAngryNow_BACK);
	if(THORUS_GILBERT_OC == TRUE)
	{
		Info_AddChoice(DIA_Gravo_HelpAngryNow,"����� ������ ���������� �� ����.",dia_gravo_helpangrynow_gilbert);
	};
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"� ���������� � �����.",DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"� ���������� � �������.",DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"� ���������� � �������.",DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void dia_gravo_helpangrynow_gilbert()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gilbert_15_00");	//����� ������ ���������� �� ����.
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gilbert_04_01");	//� ���� ������ ��� �������� �� 300 ������ ����.
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"��� ������� ������ ��� ����.",dia_gravo_helpangrynow_gilbert_no);
	if(Npc_HasItems(hero,ItMiNugget) >= 300)
	{
		Info_AddChoice(DIA_Gravo_HelpAngryNow,"������, ��� ����.",dia_gravo_helpangrynow_gilbert_yes);
	};
};

func void dia_gravo_helpangrynow_gilbert_yes()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gilbertt_YES_15_00");	//������, ��� ����.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_Gilbertt_YES_04_01");	//� �������� � �������.
	B_GiveInvItems(other,self,ItMiNugget,300);
	THORUS_GILBERT_OC = FALSE;
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void dia_gravo_helpangrynow_gilbert_no()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gilbert_NO_15_00");	//��� ������� ������ ��� ����.
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	var C_Npc diego;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Diego_15_00");	//� ���������� � �����.
	diego = Hlp_GetNpc(PC_Thief);
	B_Gravo_HelpAttitude(diego);
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	var C_Npc Thorus;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Thorus_15_00");	//� ���������� � �������.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	B_Gravo_HelpAttitude(Thorus);
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	var C_Npc Gomez;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gomez_15_00");	//� ���������� � �������.
	Gomez = Hlp_GetNpc(EBR_100_Gomez);
	B_Gravo_HelpAttitude(Gomez);
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};


instance DIA_Gravo_Influence(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 2;
	condition = DIA_Gravo_Influence_Condition;
	information = DIA_Gravo_Influence_Info;
	permanent = 1;
	description = "�� ������ ������� ���, ��� �� ��������� ����� ����� �������?";
};


func int DIA_Gravo_Influence_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func void DIA_Gravo_Influence_Info()
{
	AI_Output(other,self,"DIA_Gravo_Influence_15_00");	//�� ������ ������� ���, ��� �� ��������� ����� ����� �������?
	AI_Output(self,other,"DIA_Gravo_Influence_04_01");	//������ ���������� ����������� �� ������ �����, �?
	AI_Output(self,other,"DIA_Gravo_Influence_04_02");	//������� ����� ��������� - �����. �� �������� ��������, �������� � ����.
	AI_Output(self,other,"DIA_Gravo_Influence_04_03");	//������� � ���� ������� ���� ����� �� �������� �������. ����� �� ����������� ���������� ���� ���������, ��� ��� �� ���� ����� ������� ������������ ������.
	AI_Output(self,other,"DIA_Gravo_Influence_04_04");	//��� ���� ������. �� ������������� �� ������ � ��������� ���. ����� ������ ������ ���, ��� ��� �� ���� ������ �������.
	if(STT_MAIN == FALSE)
	{
		Log_CreateTopic(GE_TraderOC,LOG_NOTE);
		B_LogEntry(GE_TraderOC,"������� � ���� ������� ���������� �������� �� �������� �������.");
		STT_MAIN = TRUE;
	};
};


instance DIA_GRAVO_GILBERT(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 3;
	condition = dia_gravo_gilbert_condition;
	information = dia_gravo_gilbert_info;
	permanent = 0;
	description = "���� ������� � ���-������ ��� �������?";
};


func int dia_gravo_gilbert_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_Hallo) && (GILBERT_OC == TRUE))
	{
		return 1;
	};
};

func void dia_gravo_gilbert_info()
{
	AI_Output(other,self,"DIA_Gravo_Gilbert_15_00");	//���� ������� � ���-������ ��� �������?
	AI_Output(self,other,"DIA_Gravo_Gilbert_04_00");	//���. ����...
	AI_Output(other,self,"GUR_1201_CorKalom_VISION_Info_15_01");	//���������!
	AI_Output(self,other,"DIA_Gravo_Gilbert_04_01");	//�������� ��� ��� ������, ��� ���������� �� ����� ����������� � ������ �� ������.
	AI_Output(self,other,"DIA_Gravo_Gilbert_04_02");	//�� ��� ���� ����� �����. ��������� ��� ����� ��� ��������� �����.
	AI_Output(self,other,"DIA_Gravo_Gilbert_04_03");	//(�������������) � ������ ��� ���� ����������?
	AI_Output(other,self,"DIA_Gravo_Gilbert_15_02");	//� ����� ���. �� �������� � ������ �������� �� ������� ������.
	AI_Output(self,other,"DIA_Gravo_Gilbert_04_04");	//����� �� ����� ����! ��� �� ���?
	AI_Output(other,self,"DIA_Gravo_Gilbert_15_03");	//��, �� ������� ���� ���, ����� � ��� �����.
	AI_Output(self,other,"DIA_Gravo_Gilbert_04_05");	//� �����, ���� ����� ���������� �� ���� ������.
	B_LogEntry(CH1_GILBERT,"����� ����������� ��� ���������� � �������.");
};


instance DIA_GRAVO_GILBERT_ABOUT(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 3;
	condition = dia_gravo_gilbert_about_condition;
	information = dia_gravo_gilbert_about_info;
	permanent = 0;
	description = "������ ������� ������ �� ������?";
};


func int dia_gravo_gilbert_about_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_gilbert) && (GILBERT_OC == TRUE))
	{
		return 1;
	};
};

func void dia_gravo_gilbert_about_info()
{
	AI_Output(other,self,"DIA_Gravo_Gilbert_ABOUT_15_00");	//������ ������� ������ �� ������?
	AI_Output(self,other,"DIA_Gravo_Gilbert_ABOUT_04_00");	//� �� ������. �� ��������� �������� �� ����� ������ ������.
	AI_Output(self,other,"DIA_Gravo_Gilbert_ABOUT_04_01");	//������� �� �������� ����� � ��� ��������, ���� �� ��������� � ��� � ������. ��������� ��� ����� ��� ����� ���� ����.
	AI_Output(other,self,"DIA_Gravo_Gilbert_ABOUT_15_01");	//� ��� �� ���� ������� ����?
	AI_Output(self,other,"DIA_Gravo_Gilbert_ABOUT_04_02");	//�� ��� �� ������ ���������. ����� �� ������� � ������� ������ �����.
	B_LogEntry(CH1_GILBERT,"�������� ������� � �������, � ����� ������� ������.");
	AI_Output(self,other,"DIA_Gravo_Gilbert_ABOUT_04_03");	//� ������� �� ������ ���, ��� ���� � ��� �������� ��� ������.
	AI_Output(other,self,"DIA_Gravo_Gilbert_ABOUT_15_02");	//�? ��� ��� ����?
	AI_Output(self,other,"DIA_Gravo_Gilbert_ABOUT_04_04");	//���... � �� ������ ���� ����� ��������. ��� � ������. �� ������ ����, ���� ������ ������.
	B_LogEntry(CH1_GILBERT,"����� �� ������ ���, ��� ������ ������ ��������. �� ����� ����� � ���� ���� ��������� �������� �� �����������.");
};


instance DIA_GRAVO_GILBERT_THORUS(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 3;
	condition = dia_gravo_gilbert_thorus_condition;
	information = dia_gravo_gilbert_thorus_info;
	permanent = 0;
	description = "� ��������� � �������.";
};


func int dia_gravo_gilbert_thorus_condition()
{
	if(Npc_KnowsInfo(hero,info_thorus_gilbert) && (GILBERT_OC == TRUE))
	{
		return 1;
	};
};

func void dia_gravo_gilbert_thorus_info()
{
	AI_Output(other,self,"Info_Diego_ThorusSays_15_00");	//� ��������� � �������.
	AI_Output(other,self,"DIA_Gravo_Gilbert_Thorus_15_01");	//�� ������� ��� ������� ����, ������� ����� � ���� �������. ������ �� �� ������ ��� ���.
	AI_Output(self,other,"DIA_Gravo_Gilbert_Thorus_04_00");	//��, ������, �� ������� ����.
	AI_Output(other,self,"DIA_Gravo_Gilbert_Thorus_15_02");	//� �� �� ������, ��� ��� �� ����?
	AI_Output(self,other,"DIA_Gravo_Gilbert_Thorus_04_01");	//���. �������� ���������� �� ����������� �� ������� ������. ��������, ��� ������ ���� ������.
	B_LogEntry(CH1_GILBERT,"�������� ��������� �� ������� ������ ������ ������ ����������, ��� ������ ����� ������� � ������.");
};

