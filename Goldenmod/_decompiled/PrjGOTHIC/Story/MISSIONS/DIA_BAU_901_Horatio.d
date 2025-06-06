
instance DIA_Horatio_EXIT(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 999;
	condition = DIA_Horatio_EXIT_Condition;
	information = DIA_Horatio_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Horatio_EXIT_Condition()
{
	return 1;
};

func void DIA_Horatio_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Horatio_Wasser(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 800;
	condition = Info_Horatio_Wasser_Condition;
	information = Info_Horatio_Wasser_Info;
	permanent = 1;
	description = "���� ������ �����. � ������ ���� ����.";
};


func int Info_Horatio_Wasser_Condition()
{
	if(((Lefty_Mission == LOG_RUNNING) || ((Lefty_Mission == LOG_SUCCESS) && Npc_HasItems(other,ItFo_Potion_Water_01))) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void Info_Horatio_Wasser_Info()
{
	AI_Output(other,self,"Info_Horatio_Wasser_15_00");	//���� ������ �����. � ������ ���� ����.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		AI_Output(self,other,"Info_Horatio_Wasser_09_01");	//�������, ������! ��� �������, � � �� ����� ���� �� ����.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt + 1;
		if(An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Horatio_Wasser_NOWATER_09_00");	//� ���� ��� ������ �� ��������. � ������� � ���������.
	};
};


var int horatio_trouble;

instance DIA_Horatio_Hello(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 1;
	condition = DIA_Horatio_Hello_Condition;
	information = DIA_Horatio_Hello_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Horatio_Hello_Condition()
{
	return 1;
};

func void DIA_Horatio_Hello_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_Horatio_Hello_09_00");	//��� �� ����� �������? ����� �������������?
	Info_ClearChoices(DIA_Horatio_Hello);
	Info_AddChoice(DIA_Horatio_Hello,"��������? � ���? � ������������?",DIA_Horatio_Hello_PissOff);
	Info_AddChoice(DIA_Horatio_Hello,"��, ����������! � ���������.",DIA_Horatio_Hello_BeCool);
};

func void DIA_Horatio_Hello_BeCool()
{
	AI_Output(other,self,"DIA_Horatio_Hello_BeCool_15_00");	//��, ����������! � ���������.
	AI_Output(self,other,"DIA_Horatio_Hello_BeCool_09_01");	//�-�. ����� �����. ������ ������� �������. ������ ���� ����� �������� ����� ������, � ������ ������, ��� ��� �������� ������ ������ ����.
	Info_ClearChoices(DIA_Horatio_Hello);
};

func void DIA_Horatio_Hello_PissOff()
{
	AI_Output(other,self,"DIA_Horatio_Hello_PissOff_15_00");	//��������? � ���? � ������������?
	AI_Output(self,other,"DIA_Horatio_Hello_PissOff_09_01");	//���� ���� � ������� � ����, ��� ��� �� ������, ��� � �� ���� �������� �� ����.
	AI_Output(self,other,"DIA_Horatio_Hello_PissOff_09_02");	//���� ������ ������������� - �����, �������!
	horatio_trouble = TRUE;
	Info_ClearChoices(DIA_Horatio_Hello);
	AI_StopProcessInfos(self);
};


instance DIA_Horatio_SORRY(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 1;
	condition = DIA_Horatio_SORRY_Condition;
	information = DIA_Horatio_SORRY_Info;
	permanent = 1;
	description = "������, � �� ����� ���� �������.";
};


func int DIA_Horatio_SORRY_Condition()
{
	if(horatio_trouble == TRUE)
	{
		return 1;
	};
};

func void DIA_Horatio_SORRY_Info()
{
	AI_Output(other,self,"DIA_Horatio_SORRY_15_00");	//������, � �� ����� ���� �������.
	AI_Output(self,other,"DIA_Horatio_SORRY_09_01");	//������ ����� ���� ������, ������!
};


instance DIA_Horatio_Story(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 1;
	condition = DIA_Horatio_Story_Condition;
	information = DIA_Horatio_Story_Info;
	permanent = 0;
	description = "��� �� ������ ������� ����� ��������?";
};


func int DIA_Horatio_Story_Condition()
{
	if((horatio_trouble == FALSE) && Npc_KnowsInfo(hero,DIA_Horatio_Hello))
	{
		return 1;
	};
};

func void DIA_Horatio_Story_Info()
{
	AI_Output(other,self,"DIA_Horatio_Story_15_00");	//��� �� ������ ������� ����� ��������?
	AI_Output(self,other,"DIA_Horatio_Story_09_01");	//�� ���� ���� �������� ��. � ������ �� ������. ����� ������ ����� �������� ����.
	AI_Output(self,other,"DIA_Horatio_Story_09_02");	//� ���� ������ �����, � ��� ��� ��� �������. � ���������� ���� ���������� �  ����� ��������� ������� - �����������, � �����.
	AI_Output(other,self,"DIA_Horatio_Story_15_03");	//��� ��� ���������?
	AI_Output(self,other,"DIA_Horatio_Story_09_04");	//������� �������� �����. � �� ����� ��� ������� - ��������, ������ ������ ������ ������.
	AI_Output(self,other,"DIA_Horatio_Story_09_05");	//����� � ��� �������� - ��� �� ���� ����� ����.
};


instance DIA_Horatio_WhyHere(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 1;
	condition = DIA_Horatio_WhyHere_Condition;
	information = DIA_Horatio_WhyHere_Info;
	permanent = 0;
	description = "������ �� ������������� � ����� ������?";
};


func int DIA_Horatio_WhyHere_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

func void DIA_Horatio_WhyHere_Info()
{
	AI_Output(other,self,"DIA_Horatio_WhyHere_15_00");	//������ �� ������������� � ����� ������?
	AI_Output(self,other,"DIA_Horatio_WhyHere_09_01");	//��� ��� � ����� ����: � ���� �� ���� ����� ������� ������, �� � � �� ��������� ��������� ���� ���� ��������� ��� �����.
	AI_Output(self,other,"DIA_Horatio_WhyHere_09_02");	//� ������ ������ � ������� �� ������� �� �����������, ���� � ����, � �������� ��������� ��������.
	AI_Output(other,self,"DIA_Horatio_WhyHere_15_03");	//��� ������� ����...
	AI_Output(self,other,"DIA_Horatio_WhyHere_09_04");	//����� ����. � ����� ������, ������ � ����� � ������� ���� ����������� �� �� �����.
};


var int horatio_StrFree;

instance DIA_Horatio_PleaseTeachSTR(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 2;
	condition = DIA_Horatio_PleaseTeachSTR_Condition;
	information = DIA_Horatio_PleaseTeachSTR_Info;
	permanent = 0;
	description = "��� ��� ����� ����� �� �������, ��� ��? �� ������ ������� ����? ";
};


func int DIA_Horatio_PleaseTeachSTR_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

func void DIA_Horatio_PleaseTeachSTR_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_15_00");	//��� ��� ����� ����� �� �������, ��� ��? �� ������ ������� ����?
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_09_01");	//���� ���� � ���� - ��� ���� ���� ����� ����?
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR);
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if(Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio))
	{
		Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"����� ���������� �� ����� � ��� �����������!",DIA_Horatio_PleaseTeachSTR_Ricelord);
	};
	Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"��� ���� ����� �������� ����!",DIA_Horatio_PleaseTeachSTR_Defend);
	Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"��� ���� ����� ������� ���� �������� ������� �������!",DIA_Horatio_PleaseTeachSTR_Attack);
	Info_AddChoice(DIA_Horatio_PleaseTeachSTR,"������� ������. � ������� �� ����...",DIA_Horatio_PleaseTeachSTR_BACK);
	Log_CreateTopic(CH1_HoratiosTeachings,LOG_MISSION);
	Log_SetTopicStatus(CH1_HoratiosTeachings,LOG_RUNNING);
	B_LogEntry(CH1_HoratiosTeachings,"�������, ������ �� ������� ����� ������ ������, ����� ������� ����, ��� �������� ����� ������� �����. �� ���� ��� �� ������� �������� �� ��� ������ - �����?");
};

func void DIA_Horatio_PleaseTeachSTR_Attack()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Attack_15_00");	//��� ���� ����� ������� ���� �������� ������� �������!
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Attack_09_01");	//������ ��� ��� ��������, �� ��� ������� ����� �� ���� ��������... ���, � �� ���� ����� ���� ���� �����.
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR);
};

func void DIA_Horatio_PleaseTeachSTR_Defend()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Defend_15_00");	//��� ���� ����� �������� ����!
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Defend_09_01");	//��� ����� ����� �� ���� - ��������. ������� �� �������, ��� ����������� ������� �����, ��� ���� � ����?
};

func void DIA_Horatio_PleaseTeachSTR_BACK()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_BACK_15_00");	//������� ������. � ������� �� ����...
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR);
};

func void DIA_Horatio_PleaseTeachSTR_Ricelord()
{
	AI_Output(other,self,"DIA_Horatio_PleaseTeachSTR_Ricelord_15_00");	//����� ���������� �� ����� � ��� �����������!
	AI_Output(self,other,"DIA_Horatio_PleaseTeachSTR_Ricelord_09_01");	//�-��... �� ������ ������ �� ������ �� ���, ��� ������� ������� ���.
	horatio_StrFree = TRUE;
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR);
};


instance DIA_Horatio_ThoughtSTR(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 2;
	condition = DIA_Horatio_ThoughtSTR_Condition;
	information = DIA_Horatio_ThoughtSTR_Info;
	permanent = 1;
	description = "� ������� �� ����...";
};


func int DIA_Horatio_ThoughtSTR_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Horatio_PleaseTeachSTR) && (horatio_StrFree == FALSE))
	{
		return 1;
	};
};

func void DIA_Horatio_ThoughtSTR_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_15_00");	//� ����� �� ����...
	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_09_01");	//� ��� ��? �������� ���-������ �������?
	Info_ClearChoices(DIA_Horatio_ThoughtSTR);
	Info_AddChoice(DIA_Horatio_ThoughtSTR,"���.",DIA_Horatio_ThoughtSTR_NoIdea);
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if(Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio))
	{
		Info_AddChoice(DIA_Horatio_ThoughtSTR,"��. � ���� ���������� �� ����� � ��� �����������!",DIA_Horatio_ThoughtSTR_Ricelord);
	};
};

func void DIA_Horatio_ThoughtSTR_NoIdea()
{
	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_NoIdea_15_00");	//���.
	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_NoIdea_09_01");	//� ��� � ����.
	Info_ClearChoices(DIA_Horatio_ThoughtSTR);
};

func void DIA_Horatio_ThoughtSTR_Ricelord()
{
	AI_Output(other,self,"DIA_Horatio_ThoughtSTR_Ricelord_15_00");	//��. � ���� ���������� �� ����� � ��� �����������!
	AI_Output(self,other,"DIA_Horatio_ThoughtSTR_Ricelord_09_01");	//�-��... �� ������ ������ �� ������ �� ���, ��� ������� ������� ���.
	horatio_StrFree = TRUE;
	Info_ClearChoices(DIA_Horatio_ThoughtSTR);
};

func void DIA_Horatio_HelpSTR_LEARN_NOW()
{
	if(other.attribute[ATR_STRENGTH] <= (100 - 5))
	{
		other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 5;
		PrintScreen("���� +5",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else if(other.attribute[ATR_STRENGTH] < 100)
	{
		other.attribute[ATR_STRENGTH] = 100;
		PrintScreen("����: 100",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		PrintScreen("� ��� ������� �����",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_00");	//���� �� ������ ����� ������� ����, �� ������ �����, ��� ��� ��������. ��� ������, ���� ���� �������.
	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_01");	//����� ���������� � ���� ��� ����, �� ����� �� ��������.
	AI_Output(self,other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_02");	//��� ����� � ���� ��� ����������, ��� ������� ����. � �����, �� ������� ��� �������� ������.
	NA_GIL_SLD = TRUE;
};


instance DIA_Horatio_HelpSTR(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 2;
	condition = DIA_Horatio_HelpSTR_Condition;
	information = DIA_Horatio_HelpSTR_Info;
	permanent = 0;
	description = "� ��������� �� ����� � ��� �����������.";
};


func int DIA_Horatio_HelpSTR_Condition()
{
	if(horatio_StrFree == TRUE)
	{
		return 1;
	};
};

func void DIA_Horatio_HelpSTR_Info()
{
	AI_Output(other,self,"DIA_Horatio_HelpSTR_15_00");	//� ��������� �� ����� � ��� ����������� - �������, ���� �� �������� ���.
	AI_Output(self,other,"DIA_Horatio_HelpSTR_09_01");	//������! � ��������, ��� ������� ������ �� ������ �� ��������, �� � ������ �� ������ �� ����� ������, ��� ��������� ������ ���.
	AI_Output(other,self,"DIA_Horatio_HelpSTR_15_02");	//� ���� ��������!
	HORATIO_LORD = TRUE;
	DIA_Horatio_HelpSTR_LEARN_NOW();
	Log_SetTopicStatus(CH1_HoratiosTeachings,LOG_SUCCESS);
	B_LogEntry(CH1_HoratiosTeachings,"������� ������� ���, ��� ������������ ���� ���� � ��� � ��� ������� ����. ��������� ���� �������.");
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		Log_CreateTopic(CH1_HORATIO_OK,LOG_MISSION);
		Log_SetTopicStatus(CH1_HORATIO_OK,LOG_RUNNING);
		B_LogEntry(CH1_HORATIO_OK,"� ������ ������� ����������� � ������ � ��� ������������. ���� ������� ��� ������, ���� ��� �� ���� ����� �� �������.");
	};
};


instance DIA_Horatio_Thanks(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 2;
	condition = DIA_Horatio_Thanks_Condition;
	information = DIA_Horatio_Thanks_Info;
	permanent = 1;
	description = "������� ���� �� ������!";
};


func int DIA_Horatio_Thanks_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Horatio_HelpSTR))
	{
		return 1;
	};
};

func void DIA_Horatio_Thanks_Info()
{
	AI_Output(other,self,"DIA_Horatio_Thanks_15_00");	//������� �� ������!
	AI_Output(self,other,"DIA_Horatio_Thanks_09_01");	//��������� ��� ������ ������ �� ������������� � ����� ������.
};


instance DIA_HORATIO_LORD(C_Info)
{
	npc = BAU_901_Horatio;
	nr = 3;
	condition = dia_horatio_lord_condition;
	information = dia_horatio_lord_info;
	permanent = 0;
	description = "� ������� ��������.";
};


func int dia_horatio_lord_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Horatio_HelpSTR) && Npc_KnowsInfo(hero,dia_ricelord_horatio) && (Npc_GetTrueGuild(other) == GIL_None))
	{
		return 1;
	};
};

func void dia_horatio_lord_info()
{
	var C_Npc lord;
	var C_Npc Lefty;
	var C_Npc schlaegera;
	var C_Npc schlaegerb;
	AI_Output(other,self,"DIA_Horatio_Lord_15_00");	//� ������� ��������. ���� � ��� ������ ������ �� ����� ������� ��������.
	lord = Hlp_GetNpc(Bau_900_Ricelord);
	Lefty = Hlp_GetNpc(Org_844_Lefty);
	schlaegera = Hlp_GetNpc(Org_845_Schlaeger);
	schlaegerb = Hlp_GetNpc(Org_846_Schlaeger);
	if((Npc_IsDead(lord) == TRUE) || (Npc_IsDead(Lefty) == TRUE) || (Npc_IsDead(schlaegera) == TRUE) || (Npc_IsDead(schlaegerb) == TRUE))
	{
		AI_Output(self,other,"DIA_Horatio_Lord_09_01");	//�� � �� ������ ���� ������ �������.
		Log_SetTopicStatus(CH1_HORATIO_OK,LOG_SUCCESS);
		B_LogEntry(CH1_HORATIO_OK,"������� �� �����������, ��� � ���� ����������� �����. �� ����� �������, ��� � �������� �������.");
		B_GiveXP(50);
	}
	else
	{
		AI_Output(self,other,"DIA_Horatio_Lord_09_02");	//� ���� �� ����� ������ �����. � ����� ����, ��� ������� ���� ��� �������.
		Log_SetTopicStatus(CH1_HORATIO_OK,LOG_SUCCESS);
		B_LogEntry(CH1_HORATIO_OK,"������� �����, ��� � ������ ����� �����. � ������������� �� ������ ���� �������.");
		if(other.attribute[ATR_STRENGTH] <= (100 - 2))
		{
			other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 2;
			PrintScreen("���� +2",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		}
		else if(other.attribute[ATR_STRENGTH] < 100)
		{
			other.attribute[ATR_STRENGTH] = 100;
			PrintScreen("����: 100",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		}
		else
		{
			PrintScreen("� ��� ������� �����",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
		B_GiveXP(250);
	};
	HORATIO_LORD = FALSE;
	NA_GIL_SLD = FALSE;
};

