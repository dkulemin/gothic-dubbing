
instance Info_Gorn_EXIT(C_Info)
{
	npc = PC_Fighter;
	nr = 999;
	condition = Info_Gorn_EXIT_Condition;
	information = Info_Gorn_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Gorn_EXIT_Condition()
{
	return 1;
};

func void Info_Gorn_EXIT_Info()
{
	if(self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output(self,other,"Info_Gorn_EXIT_09_01");	//���������!
	}
	else
	{
		AI_Output(self,other,"Info_Gorn_EXIT_09_02");	//��������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Gorn_First(C_Info)
{
	npc = PC_Fighter;
	nr = 1;
	condition = Dia_Gorn_First_Condition;
	information = Dia_Gorn_First_Info;
	permanent = 0;
	important = 1;
};


func int Dia_Gorn_First_Condition()
{
	if(Kapitel < 3)
	{
		return 1;
	};
};

func void Dia_Gorn_First_Info()
{
	AI_Output(self,other,"DIA_Gorn_First_09_00");	//��. ����� ����.
	AI_Output(other,self,"DIA_Gorn_First_15_01");	//�� ���?
	AI_Output(self,other,"DIA_Gorn_First_09_02");	//� - ����, ������� �� ������ � �����.
};


instance DIA_Gorn_Leben(C_Info)
{
	npc = PC_Fighter;
	nr = 2;
	condition = Dia_Gorn_Leben_Condition;
	information = Dia_Gorn_Leben_Info;
	permanent = 0;
	description = "� � ��� ����������� ���� �����������?";
};


func int Dia_Gorn_Leben_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gorn_First))
	{
		return 1;
	};
};

func void Dia_Gorn_Leben_Info()
{
	AI_Output(other,self,"DIA_Gorn_Leben_15_00");	//� � ��� ����������� ���� �����������?
	AI_Output(self,other,"DIA_Gorn_Leben_09_01");	//�� �������� � ������ ������. �� ����� ������ ������ � ������� - �� ���� ���.
	AI_Output(self,other,"DIA_Gorn_Leben_09_02");	//�� �������� ����� � ��������� � ���, ����� �������� ����� �������� ��������.
	AI_Output(self,other,"DIA_Gorn_Leben_09_03");	//���� ������ ������������ � ���, ����� ���� ��� ������ ��� �� ������ �������� ������. � ��� �� �������� ����� ������ ���� � �������� ����� �� ������.
};


var int Gorn_ShrikesHut;

instance DIA_Gorn_Hut(C_Info)
{
	npc = PC_Fighter;
	nr = 3;
	condition = Dia_Gorn_Hut_Condition;
	information = Dia_Gorn_Hut_Info;
	permanent = 0;
	description = "����� ���-������ ����� ������������?";
};


func int Dia_Gorn_Hut_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gorn_First))
	{
		return 1;
	};
};

func void Dia_Gorn_Hut_Info()
{
	AI_Output(other,self,"DIA_Gorn_Hut_15_00");	//����� ���-������ ����� ������������ - ���, ����� �� �������� ������ ���������� �� ����?
	AI_Output(self,other,"DIA_Gorn_Hut_09_01");	//�� �����. �� ���� ��� �� ����������, �������� �� �������.
	AI_Output(self,other,"DIA_Gorn_Hut_09_02");	//�� ����� ��� ��������, ����� �� ������ � ������. ��� ��� ������ - �� �����������-�� �� ���.
	AI_Output(other,self,"DIA_Gorn_Hut_15_03");	//���?
	AI_Output(self,other,"DIA_Gorn_Hut_09_04");	//��, ���, ���������. �������� � ���� ����� ���������, � �� ���� �� ����� ������ �� ������ ���������� �� ��� ������� �� ������� ����.
	AI_Output(self,other,"DIA_Gorn_Hut_09_05");	//�� ����� ����, ������� �������. �� ����� ������ � �� ���������. � ����� ������ ��������� ������ ���, ��� �����������������, ����� ��� �������!
	Log_CreateTopic(CH1_ShrikesHut,LOG_MISSION);
	Log_SetTopicStatus(CH1_ShrikesHut,LOG_RUNNING);
	B_LogEntry(CH1_ShrikesHut,"������� ���� ������ ���, ��� ����� ����� ������ ��� ������. ��������� � ��������� � ������, �� ��������� �������� �� ����� ��� ������ ���������� �� ������� �� �����.");
	Gorn_ShrikesHut = LOG_RUNNING;
};


instance DIA_GORN_BDT(C_Info)
{
	npc = PC_Fighter;
	nr = 4;
	condition = dia_gorn_bdt_condition;
	information = dia_gorn_bdt_info;
	permanent = 0;
	description = "�� �� ������, ��� ��� ����� �������������?";
};


func int dia_gorn_bdt_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gorn_First) && !Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil) && (Kapitel <= 3) && (Npc_GetTrueGuild(hero) != GIL_STT) && (Npc_GetTrueGuild(hero) != GIL_GRD))
	{
		return 1;
	};
};

func void dia_gorn_bdt_info()
{
	AI_Output(other,self,"DIA_Gorn_BDT_15_00");	//�� �� ������, ��� ��� ����� �������������?
	AI_Output(self,other,"DIA_Gorn_BDT_09_00");	//��, �� ������ ���������� �� ��������.
	if(Npc_KnowsInfo(hero,org_858_quentin_guard))
	{
		AI_Output(other,self,"DIA_Gorn_BDT_15_01");	//� ���� ��������.
		AI_Output(self,other,"DIA_Gorn_BDT_09_01");	//����� �� ��� ������� ��� �����.
		QUENTIN_WORK = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Gorn_BDT_15_02");	//� ��� �����, ���� �������?
		if(GQ == TRUE)
		{
			AI_Output(self,other,"DIA_Gorn_BDT_09_02");	//�� ������� ����� ��������, �������� ����� �� ������� ������.
		}
		else
		{
			AI_Output(self,other,"DIA_Gorn_BDT_09_03");	//� ���� �� �����, ����� �� ����� C������ ������.
		};
	};
};


instance DIA_GORN_BDT_WERE(C_Info)
{
	npc = PC_Fighter;
	nr = 4;
	condition = dia_gorn_bdt_were_condition;
	information = dia_gorn_bdt_were_info;
	permanent = 0;
	description = "��� ��� � ���� ����� ��������?";
};


func int dia_gorn_bdt_were_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_bdt) && !Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil) && (GQ == TRUE) && (Kapitel <= 3) && (Npc_GetTrueGuild(hero) != GIL_STT) && (Npc_GetTrueGuild(hero) != GIL_GRD))
	{
		return 1;
	};
};

func void dia_gorn_bdt_were_info()
{
	AI_Output(other,self,"DIA_Gorn_BDT_WERE_15_00");	//��� ��� � ���� ����� ��������?
	AI_Output(self,other,"DIA_Gorn_BDT_WERE_09_00");	//������ ������� ����������� ��������� ������ �����, �� ������ ����� ��� ���.
	QUENTIN_WORK = TRUE;
	AI_StopProcessInfos(self);
	B_ExchangeRoutine(Org_858_Quentin,"qd");
};


instance DIA_Gorn_HutFree(C_Info)
{
	npc = PC_Fighter;
	nr = 3;
	condition = Dia_Gorn_HutFree_Condition;
	information = Dia_Gorn_HutFree_Info;
	permanent = 0;
	description = "����� �������� � ������ ���.";
};


func int Dia_Gorn_HutFree_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Shrike_GetLost))
	{
		return 1;
	};
};

func void Dia_Gorn_HutFree_Info()
{
	AI_Output(other,self,"DIA_Gorn_HutFree_15_00");	//����� �������� � ������ ���.
	AI_Output(self,other,"DIA_Gorn_HutFree_09_01");	//������. ������ ������ ��� ������ ���, ��� ����� ������������ � ������.
	GQ = TRUE;
	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_ShrikesHut,LOG_SUCCESS);
	B_LogEntry(CH1_ShrikesHut,"���� ��������, ����� �����, ��� � ����� ������� ������ �������� ���. �����, �� ������� ������. ������, �� ������������. ���� ����� ���������� ���� ���������� � �������.");
	B_GiveXP(XP_ReportedKickedShrike);
};


instance DIA_Gorn_BecomeSLD(C_Info)
{
	npc = PC_Fighter;
	nr = 5;
	condition = Dia_Gorn_BecomeSLD_Condition;
	information = Dia_Gorn_BecomeSLD_Info;
	permanent = 0;
	description = "��� ����� �������, ����� �������������� � ������ ������?";
};


func int Dia_Gorn_BecomeSLD_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gorn_First) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void Dia_Gorn_BecomeSLD_Info()
{
	AI_Output(other,self,"DIA_Gorn_BecomeSLD_15_00");	//��� ����� ������� ��� ����, ����� �������������� � ������ ������?
	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_01");	//������ ��� �������� �� ���� � ��, �� ������ ��������� ������ ������� - �������, ����� �������.
	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_02");	//������ �����, �� ������ ����� ��� ��� ������� ����� � �� ������.
	AI_Output(self,other,"DIA_Gorn_BecomeSLD_09_03");	//���� �� �� ����������� ���������� � ������ �������, ����� ����������� �������������� � ��������� �����, ������ ��� �������� ����� ���������.
};


var int Gorn_Trade;

instance DIA_Gorn_TRADE(C_Info)
{
	npc = PC_Fighter;
	nr = 800;
	condition = Dia_Gorn_TRADE_Condition;
	information = Dia_Gorn_TRADE_Info;
	permanent = 1;
	description = DIALOG_TRADE;
	trade = 1;
};


func int Dia_Gorn_TRADE_Condition()
{
	return TRUE;
};

func void Dia_Gorn_TRADE_Info()
{
	AI_Output(other,self,"DIA_Gorn_TRADE_15_00");	//������� � ���� ����� �����?
	AI_Output(self,other,"DIA_Gorn_TRADE_09_01");	//�����. ������ ������?
};


instance DIA_Gorn_DuHehler(C_Info)
{
	npc = PC_Fighter;
	nr = 1;
	condition = Dia_Gorn_DuHehler_Condition;
	information = Dia_Gorn_DuHehler_Info;
	permanent = 0;
	description = "����� �� ���������� � ������?";
};


func int Dia_Gorn_DuHehler_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil))
	{
		return 1;
	};
};

func void Dia_Gorn_DuHehler_Info()
{
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_00");	//����� �� ���������� � ������?
	AI_Output(self,other,"DIA_Gorn_DuHehler_09_01");	//��� ������, ��� � ����������?
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_02");	//���� ��� �� ���, ������ � ���� ������� ������?
	AI_Output(self,other,"DIA_Gorn_DuHehler_09_03");	//�� ������� �� ��, ��� ��� ��� - ���� ����?
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_04");	//��� �� ��������� ���������� � �������?
	AI_Output(self,other,"DIA_Gorn_DuHehler_09_05");	//���� � ���, ���� � �� ���� �� �����. �� ��� �� ����������.
	AI_Output(other,self,"DIA_Gorn_DuHehler_15_06");	//(����������) �������.
	CreateInvItems(self,ItFoApple,21);
	B_GiveInvItems(self,other,ItFoApple,21);
	Npc_RemoveInvItems(other,ItFoApple,21);
	CreateInvItems(other,ItMw_1H_LightGuardsSword_03,1);
	CreateInvItems(other,ItFoApple,5);
	CreateInvItems(other,ItFoLoaf,5);
	CreateInvItems(other,ItFoCheese,5);
	CreateInvItems(other,ItFoBeer,5);
};


instance Info_Gorn_NCWAIT(C_Info)
{
	npc = PC_Fighter;
	nr = 1;
	condition = Info_Gorn_NCWAIT_Condition;
	information = Info_Gorn_NCWAIT_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_NCWAIT_Condition()
{
	if(Npc_GetDistToWP(self,"NC_PATH52") < 1000)
	{
		return TRUE;
	};
};

func void Info_Gorn_NCWAIT_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_NCWAIT_09_01");	//�-�, ��� ��! ��� ���� ������ �� ��������� ������ ��������� ��� � ����� ��������.
	AI_Output(self,other,"Info_Gorn_NCWAIT_09_02");	//������ ������� ��� ��������, ������� �������� ����� �� ��� �� �����.
	AI_Output(other,self,"Info_Gorn_NCWAIT_15_03");	//��, �� ��������� ��� � ��� ������ ������ � ����, ����� ����������� �� ���� ������.
};


instance Info_Gorn_MAGES(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_MAGES_Condition;
	information = Info_Gorn_MAGES_Info;
	important = 0;
	permanent = 0;
	description = "� ���� ������ �������� ��� ����� ����!";
};


func int Info_Gorn_MAGES_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_NCWAIT))
	{
		return TRUE;
	};
};

func void Info_Gorn_MAGES_Info()
{
	AI_Output(other,self,"Info_Gorn_MAGES_15_01");	//� ���� ������ �������� ��� ����� ����!
	AI_Output(self,other,"Info_Gorn_MAGES_09_02");	//����� ���� ����� ���������� � ���������. �� ������� ����� ������� �����, ��� ��� �������� �� ������-�� ���������� ��� ���-�� ���.
	AI_Output(self,other,"Info_Gorn_MAGES_09_03");	//�� ��������� �� ������� ������ �� ��������� ���� � ����, ����� �� ������ �� ���� ���� ��������.
	AI_Output(other,self,"Info_Gorn_MAGES_15_04");	//�� ��������� �� ���� ��������?
	AI_Output(self,other,"Info_Gorn_MAGES_09_05");	//� - ���, �� �� ������ �������� ���������� � �������, ��������� ����.
};


instance Info_Gorn_CRONOS(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_CRONOS_Condition;
	information = Info_Gorn_CRONOS_Info;
	important = 0;
	permanent = 0;
	description = "��� ��� ������ ����� '��������� ����'?";
};


func int Info_Gorn_CRONOS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_MAGES))
	{
		return TRUE;
	};
};

func void Info_Gorn_CRONOS_Info()
{
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Gorn_CRONOS_15_01");	//��� ��� ������ ����� '��������� ����'?
	AI_Output(self,other,"Info_Gorn_CRONOS_09_01a");	//���� ������� ������, �� ������ ������� ������� ������.
	AI_Output(self,other,"Info_Gorn_CRONOS_09_02");	//������ ������ ����� � ������� ����� �������� ����.
	AI_Output(self,other,"Info_Gorn_CRONOS_09_03");	//�� ��� ��������� - �������� ������������ ���. ���� �������� ������� ��� � ���, ��� ���� �������� ������������� �����.
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	B_LogEntry(CH3_EscapePlanNC,"���� �������������� ��� ����� ����� � �������� ���� ���� �� ����� �������. ������, ��������� ����, ����� �������� ��� ��� ���������. ��� ����� ����� � ������ ������, � ������� ��� ����� ����.");
	Npc_ExchangeRoutine(self,"start");
};


instance Info_Gorn_RUINWAIT(C_Info)
{
	npc = PC_Fighter;
	nr = 2;
	condition = Info_Gorn_RUINWAIT_Condition;
	information = Info_Gorn_RUINWAIT_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_RUINWAIT_Condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_ABYSS_4") < 1000)
	{
		return 1;
	};
};

func void Info_Gorn_RUINWAIT_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINWAIT_09_01");	//������, ������! ��� ������, ���� ��� �����, � ������� �� �������� �����������.
	AI_Output(self,other,"Info_Gorn_RUINWAIT_09_02");	//��� ����� ����������� �� ����� ��������.
};


instance Info_Gorn_RUINWHAT(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINWHAT_Condition;
	information = Info_Gorn_RUINWHAT_Info;
	important = 0;
	permanent = 0;
	description = "��� �� �����������?";
};


func int Info_Gorn_RUINWHAT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func void Info_Gorn_RUINWHAT_Info()
{
	AI_Output(other,self,"Info_Gorn_RUINWHAT_15_01");	//��� �� ����� �������?
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_02");	//�-�, ������� ������� �� ����� ���� ������ �������.
	AI_Output(other,self,"Info_Gorn_RUINWHAT_15_03");	//�������?
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_04");	//��, ��� �������� �� ������� ������, �������, ������� ���, ��� �����-�� ����� ���� ������.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_05");	//�������, ��� ���� ������� �� ����, ��� �������� ������.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_06");	//�������, ��� �������� ����, ������� ������� �� ����������� ������������ � ��������.
	AI_Output(self,other,"Info_Gorn_RUINWHAT_09_07");	//������, �� ������ ������ ����� ������ ���� ����������� ���� ��������.
	if(!Npc_KnowsInfo(hero,Info_Gorn_RUINFOCUS))
	{
		AI_Output(self,other,"Info_Gorn_RUINWHAT_09_08");	//��� ������� ���� ����?
	};
};


instance Info_Gorn_RUINFOCUS(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINFOCUS_Condition;
	information = Info_Gorn_RUINFOCUS_Info;
	important = 0;
	permanent = 0;
	description = "� ��� ������.";
};


func int Info_Gorn_RUINFOCUS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func void Info_Gorn_RUINFOCUS_Info()
{
	AI_Output(other,self,"Info_Gorn_RUINFOCUS_15_01");	//� ��� ������.
	AI_Output(other,self,"Info_Gorn_RUINFOCUS_15_02");	//�� ������ ���� ���-�� �����.
	AI_Output(self,other,"Info_Gorn_RUINFOCUS_09_03");	//��� ����� ����� ���� � ������ ������� ��������� �� �� ������� ������.
};


instance Info_Gorn_RUINJOIN(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINJOIN_Condition;
	information = Info_Gorn_RUINJOIN_Info;
	important = 0;
	permanent = 0;
	description = "�� ����� �� ����� ������.";
};


func int Info_Gorn_RUINJOIN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINFOCUS) && Npc_KnowsInfo(hero,Info_Gorn_RUINWHAT))
	{
		return 1;
	};
};

func void Info_Gorn_RUINJOIN_Info()
{
	AI_Output(other,self,"Info_Gorn_RUINJOIN_15_01");	//�� ����� �� ����� ������.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_02");	//������� ����. ��� ����� �������.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_03");	//���� ����� - �� �������� ��� �������� ��������, ��, � ���������, ���� ����� ��� �������� ������.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_04");	//� ���� ������� ��� ����� ������ �� ������ ������ �������� �����.
	AI_Output(other,self,"Info_Gorn_RUINJOIN_15_05");	//��� �� ���� ������?
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_06");	//��, �� ������ ��� ����, � ���� ��������� ������. �� ����� ��������� ����� �� ������.
	AI_Output(self,other,"Info_Gorn_RUINJOIN_09_07");	//����, � ����� ������.
	Log_CreateTopic(CH3_MonasteryRuin,LOG_MISSION);
	Log_SetTopicStatus(CH3_MonasteryRuin,LOG_RUNNING);
	B_LogEntry(CH3_MonasteryRuin,"����� � �������� � ������ ���������, �� ���������� � ��������� ������. �� ���� ����� �����.");
	B_LogEntry(CH3_MonasteryRuin,"�� ��������� ������ ������. ���� ����������� � ������� ����� �������, �������� �� ������.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinAbyss");
};


instance Info_Gorn_RUINABYSS(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINABYSS_Condition;
	information = Info_Gorn_RUINABYSS_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_RUINABYSS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) && (Npc_GetDistToWP(self,"OW_ABYSS_TO_CAVE_MOVE6") < 1000))
	{
		return 1;
	};
};

func void Info_Gorn_RUINABYSS_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINABYSS_09_01");	//��� ��� � ������� ������. ������, ��� ������ ������������ ��� �����.
	AI_Output(self,other,"Info_Gorn_RUINABYSS_09_02");	//������ �� ���� �� ����� ������? ���� ���������, ��� ����� �� ����� ��������� ��� �� �������� ����.
	B_LogEntry(CH3_MonasteryRuin,"�� ����� �������� ������, ���������������� ��� �����. �� ������� ���� ���� ���� � ��� ������ � ������������ ��������� ���������� ��������.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinFollow");
};


instance Info_Gorn_RUINLEAVE(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINLEAVE_Condition;
	information = Info_Gorn_RUINLEAVE_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_RUINLEAVE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) && (Npc_GetDistToWP(hero,"OW_PATH_175_MEATBUG") > 15000) && !Npc_KnowsInfo(hero,Info_Gorn_RUINGATE))
	{
		return 1;
	};
};

func void Info_Gorn_RUINLEAVE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_01");	//�������, �� ������� ������� � ������������ ������.
	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_02");	//� ����� ����.
	AI_Output(self,other,"Info_Gorn_RUINLEAVE_09_03");	//���� �����������, ������ ������.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RuinWall");
	AI_StopProcessInfos(self);
};


instance Info_Gorn_RUINWALL(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINWALL_Condition;
	information = Info_Gorn_RUINWALL_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_RUINWALL_Condition()
{
	if((Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero,Info_Gorn_RUINLEAVE)) && (Npc_GetDistToWP(hero,"OW_PATH_175_GATE1") < 1000))
	{
		return 1;
	};
};

func void Info_Gorn_RUINWALL_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINWALL_09_01");	//��� ������� ������! �������, ��� ��� ������ � ������� �� ��������� ������� ��.
	AI_Output(self,other,"Info_Gorn_RUINWALL_09_02");	//������ ���� ������ ������ ������� ��� ����� ��������� �� ���������� ����.
	B_LogEntry(CH3_MonasteryRuin,"�� ����� ����� ����� ��������. ������, ��� ������� �� ������� ������.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinWall");
};


instance Info_Gorn_RUINWALLWHAT(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINWALLWHAT_Condition;
	information = Info_Gorn_RUINWALLWHAT_Info;
	important = 0;
	permanent = 1;
	description = "��� ������?";
};


func int Info_Gorn_RUINWALLWHAT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINWALL) && !Npc_KnowsInfo(hero,Info_Gorn_RUINGATE))
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINWALLWHAT_Info()
{
	AI_Output(other,self,"Info_Gorn_RUINWALLWHAT_15_01");	//��� ���������?
	AI_Output(self,other,"Info_Gorn_RUINWALLWHAT_09_02");	//����� ����� ������, ��� ����������� ����� ������.
};


instance Info_Gorn_RUINLEDGE(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINLEDGE_Condition;
	information = Info_Gorn_RUINLEDGE_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_RUINLEDGE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) && !Npc_KnowsInfo(hero,Info_Gorn_RUINSUCCESS) && (Npc_GetDistToWP(hero,"OW_MONSTER_NAVIGATE_02") < 1000))
	{
		return 1;
	};
};

func void Info_Gorn_RUINLEDGE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINLEDGE_09_01");	//������ ��� ��������, ��� ���? �� ��� ������, �� ���������.
	AI_Output(self,other,"Info_Gorn_RUINLEDGE_09_02");	//�������� �������� ������ ����.
	AI_StopProcessInfos(self);
};


instance Info_Gorn_RUINPLATFORM(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINPLATFORM_Condition;
	information = Info_Gorn_RUINPLATFORM_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_RUINPLATFORM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) && !Npc_KnowsInfo(hero,Info_Gorn_RUINSUCCESS) && (Npc_GetDistToWP(hero,"OW_PATH_176_TEMPELFOCUS4") < 300))
	{
		return 1;
	};
};

func void Info_Gorn_RUINPLATFORM_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINPLATFORM_09_01");	//������ �� �����-�� ���������.
	AI_Output(self,other,"Info_Gorn_RUINPLATFORM_09_02");	//������, ��� ��������, ������� �� �����, ����� �����.
	AI_StopProcessInfos(self);
};


instance Info_Gorn_RUINGATE(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINGATE_Condition;
	information = Info_Gorn_RUINGATE_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_RUINGATE_Condition()
{
	if((Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero,Info_Gorn_RUINLEAVE)) && MonasteryRuin_GateOpen)
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINGATE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINGATE_09_01");	//�� ���-���� ������ ��� ������! ������ ����������!
	AI_Output(other,self,"Info_Gorn_RUINGATE_15_02");	//���� ������.
	B_LogEntry(CH3_MonasteryRuin,"��� ������ ���������� � ������ ������ � ����������� � ����. ��� � ���� ���������� ����� ���� � �����.");
	B_LogEntry(CH3_MonasteryRuin,"������ ������ �������.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"RuinFollowInside");
	AI_StopProcessInfos(self);
};


instance Info_Gorn_RUINLEAVEINSIDE(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINLEAVEINSIDE_Condition;
	information = Info_Gorn_RUINLEAVEINSIDE_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_RUINLEAVEINSIDE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINGATE) && (Npc_GetDistToWP(hero,"OW_PATH_ABYSS_CROSS_6") < 1000) && !Npc_HasItems(hero,Focus_4))
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINLEAVEINSIDE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_01");	//�������, �� ������� ������� � ������������ ������.
	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_02");	//� ����� ����.
	AI_Output(self,other,"Info_Gorn_RUINLEAVEINSIDE_09_03");	//���� �����������, ������ ������.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RuinStay");
	AI_StopProcessInfos(self);
};


instance Info_Gorn_RUINSUCCESS(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINSUCCESS_Condition;
	information = Info_Gorn_RUINSUCCESS_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_RUINSUCCESS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINJOIN) && Npc_HasItems(hero,Focus_4))
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINSUCCESS_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINSUCCESS_09_01");	//�� ���-���� ����� ���� ��������!
	AI_Output(other,self,"Info_Gorn_RUINSUCCESS_15_02");	//���. � ������ ������� ��� ����� ����.
	AI_Output(self,other,"Info_Gorn_RUINSUCCESS_09_03");	//� �������� ���� �������� ��� �� �����-�� �����.
	B_LogEntry(CH3_MonasteryRuin,"� ����� ������ � ����, ������� �� �����. ���� ���� ��������� �� ����.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RuinYard");
	Wld_InsertNpc(YoungTroll,"OW_PATH_176");
};


instance Info_Gorn_RUINTROLL(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINTROLL_Condition;
	information = Info_Gorn_RUINTROLL_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_RUINTROLL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINSUCCESS) && (Npc_GetDistToWP(hero,"OW_PATH_SNAPPER04_SPAWN01") < 1000))
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINTROLL_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_01");	//�, ����!!! ��� ��� �� ����� ���?
	AI_Output(other,self,"Info_Gorn_RUINTROLL_15_02");	//������ ������� ���?
	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_03");	//������ �� ������ �� ���� ���������� �������, ������ �������� ��������!
	AI_Output(self,other,"Info_Gorn_RUINTROLL_09_04");	//��� �� ��� �� ����, ���� �� ����� �������� ������, ��� �������� ����������� � ���� ������.
	AI_StopProcessInfos(self);
	AI_DrawWeapon(self);
	AI_SetWalkMode(self,NPC_RUN);
};


instance Info_Gorn_RUINVICTORY(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RUINVICTORY_Condition;
	information = Info_Gorn_RUINVICTORY_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_RUINVICTORY_Condition()
{
	var C_Npc yTroll;
	yTroll = Hlp_GetNpc(YoungTroll);
	if(Npc_KnowsInfo(hero,Info_Gorn_RUINTROLL) && Npc_IsDead(yTroll))
	{
		return TRUE;
	};
};

func void Info_Gorn_RUINVICTORY_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_01");	//��������� ���������.
	AI_Output(other,self,"Info_Gorn_RUINVICTORY_15_02");	//��! � ��������� �� �����������, �� ���� ��� ��� ����� ���� ������� ������...
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_03");	//...����� ��� ����� �� ���������� �� ����� ��� ���������, �����?
	AI_Output(other,self,"Info_Gorn_RUINVICTORY_15_04");	//���-�� ����� ����.
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_05");	//����� ���� ���� ����������. � ��� ��������� �������� - ���� ��������� �����������.
	AI_Output(self,other,"Info_Gorn_RUINVICTORY_09_06");	//�� �����, �� ��� ����������. ��������, ���� ���!
	B_LogEntry(CH3_MonasteryRuin,"�� ������ �������, �� ���� ���������, ��� ���������� ������� ������. ��� ��� ��������, �� �� ������ ��������.");
	B_LogEntry(CH3_MonasteryRuin,"���� � ������ ���� ���������. �� ���� �� �������� �������, ��� ����� �� ����� ����������.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RuinStay");
	AI_StopProcessInfos(self);
};


instance Info_Gorn_DIEGOMILTEN(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_DIEGOMILTEN_Condition;
	information = Info_Gorn_DIEGOMILTEN_Info;
	important = 0;
	permanent = 0;
	description = "����� ������� ������ � �������� ����� � ��������!";
};


func int Info_Gorn_DIEGOMILTEN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Diego_OCFAVOR))
	{
		return TRUE;
	};
};

func void Info_Gorn_DIEGOMILTEN_Info()
{
	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_01");	//����� ������� ������ � �������� ����� � ��������!
	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_02");	//������� �������!
	AI_Output(hero,self,"Info_Gorn_DIEGOMILTEN_15_03");	//��� ����� ����������� � ����� � � ��������. ��� ��, ��� � ������.
	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_04");	//�������. � ���� ������� ��� ������ ������ ������.
	AI_Output(self,hero,"Info_Gorn_DIEGOMILTEN_09_05");	//�� ��� ����� ���� ����� �� ���. �� ���� ����� ����������!
	B_GiveXP(XP_MessageForGorn);
	if(warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE;
	}
	else
	{
		B_LogEntry(CH4_4Friends,"� ��������� ������� � ����� � ������� � �� ��������. ������ ��� ��� �� ��� ����. ��� ���� ����������, ��� ������ ������...");
		Log_SetTopicStatus(CH4_4Friends,LOG_SUCCESS);
	};
};


instance Info_Gorn_FREEMINE(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_FREEMINE_Condition;
	information = Info_Gorn_FREEMINE_Info;
	important = 0;
	permanent = 0;
	description = "��� ���������� � ��������� �����?";
};


func int Info_Gorn_FREEMINE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_AMBUSH) && !FindXardas)
	{
		return TRUE;
	};
};

func void Info_Gorn_FREEMINE_Info()
{
	AI_Output(hero,self,"Info_Gorn_FREEMINE_15_01");	//��� ���������� � ��������� �����?
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_02");	//����� ���� ��� � �������� � ������������ ����, � ������� ��������� � �����, ������� ��������� �����.
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_03");	//�� ��� � ����� ������ �����...
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_04");	//� �����, ��� ��������� ������ ���������� ���������� �� ����� � �����.
	AI_Output(hero,self,"Info_Gorn_FREEMINE_15_05");	//��� ����� ��� ������� ���������� ���������� �� ����� ����������?
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_06");	//��� ������ �� ������. ����� �� ������ ����� �� ������� ���.
	AI_Output(self,hero,"Info_Gorn_FREEMINE_09_07");	//�� �� ������: ����������� ����������� ���� ����������.
};


instance Info_Gorn_GUARDNC(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_GUARDNC_Condition;
	information = Info_Gorn_GUARDNC_Info;
	important = 0;
	permanent = 0;
	description = "��� �� ������ ����������� ������?";
};


func int Info_Gorn_GUARDNC_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_AMBUSH))
	{
		return TRUE;
	};
};

func void Info_Gorn_GUARDNC_Info()
{
	AI_Output(hero,self,"Info_Gorn_GUARDNC_15_01");	//��� �� ������ ����������� ������?
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_02");	//�������� ������������ ��� ���� ������� �������. �� ��� ����������� �����.
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_03");	//�� ��� ��� ���� �� ���������� �� �� ������ ��������, � ������������ � ������ �����.
	AI_Output(hero,self,"Info_Gorn_GUARDNC_15_04");	//�� ����������� � ����������?
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_05");	//���� ��� ���, �� ��� ����.
	AI_Output(self,hero,"Info_Gorn_GUARDNC_09_06");	//���� � ���� �����-�� �����������, ��� ������ �� ����������� � �����. � ���� ���, �� ������.
	B_Story_CordsPost();
	AI_StopProcessInfos(self);
};


instance Info_Gorn_GUARDNCRUNNING(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_GUARDNCRUNNING_Condition;
	information = Info_Gorn_GUARDNCRUNNING_Info;
	important = 0;
	permanent = 1;
	description = "��� ����?";
};


func int Info_Gorn_GUARDNCRUNNING_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_GUARDNC) && !UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func void Info_Gorn_GUARDNCRUNNING_Info()
{
	AI_Output(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01");	//��� ����?
	AI_Output(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02");	//��� ����. ��������� ����� ������ �������.
	AI_Output(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03");	//�� ��-�������� ����� ������������ �������.
};


instance Info_Gorn_POST(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_POST_Condition;
	information = Info_Gorn_POST_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_POST_Condition()
{
	if(UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func void Info_Gorn_POST_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_POST_09_01");	//�� ��� ��� �������! �� ��������� � ����������.
	AI_Output(self,hero,"Info_Gorn_POST_09_02");	//������ ��� - ��������� ��������� �����.
};


instance Info_Gorn_TAKEBACK(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_TAKEBACK_Condition;
	information = Info_Gorn_TAKEBACK_Info;
	important = 0;
	permanent = 0;
	description = "�� ���������� ��������� �� � ������� �� ������� �������?";
};


func int Info_Gorn_TAKEBACK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_POST))
	{
		return TRUE;
	};
};

func void Info_Gorn_TAKEBACK_Info()
{
	var int guild;
	AI_Output(hero,self,"Info_Gorn_TAKEBACK_15_01");	//�� ���������� ��������� �� � ������� �� ������� �������? ��� ��� ��������?
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_02");	//��������� � ��� �� �������. ���� ������ ������� ������ ������������� � �����!
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_03");	//�� �� ���������� ��������� ��� ���������. ����� ������� ������ ������ �� ������ - ��� ����� ���������.
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_04");	//�� ������ ���� �������� ���� ���-���.
	guild = Npc_GetTrueGuild(hero);
	if(guild == GIL_SLD)
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_05");	//�� ��� ������ ��� ����� ������� ��� ���� �� ������ ���������.
	}
	else if(guild == GIL_KDW)
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_06");	//�� ��� ������ ��� ����� ������� ��� ������� ���� � ���� �� ����� ����� ����.
	}
	else if(guild == GIL_ORG)
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_07");	//�� ��� ������ ��� ����� ������� ��� ���� �� ������ �����.
	}
	else
	{
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_08");	//�������� �� �� ��� �� �� ���� �� ���, �� �� ��� ������� ������ ������ � ������� ������� ���� �����������.
		AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_09");	//�� ���� ���� ���� ��������� ��� ���� �������!
	};
	AI_Output(self,hero,"Info_Gorn_TAKEBACK_09_10");	//� ����� � �����. ������ �� ������ ������� ���!
};


instance Info_Gorn_SECOND(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_SECOND_Condition;
	information = Info_Gorn_SECOND_Info;
	important = 0;
	permanent = 0;
	description = "��� ������ ���. � ������?";
};


func int Info_Gorn_SECOND_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_POST))
	{
		return TRUE;
	};
};

func void Info_Gorn_SECOND_Info()
{
	AI_Output(hero,self,"Info_Gorn_SECOND_15_01");	//��� ������ ���. � ������?
	AI_Output(self,hero,"Info_Gorn_SECOND_09_02");	//��� ������ ����� ����� ����� � ���, �� ������ ������ ������ � �����, ������� ��������������� ���� ������.
	AI_Output(self,hero,"Info_Gorn_SECOND_09_03");	//����� ���� ���� ����� �������, �������� ����� ����� � ��� ��� ���������.
	AI_Output(hero,self,"Info_Gorn_SECOND_15_04");	//�������.
};


instance Info_Gorn_WHYME(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_WHYME_Condition;
	information = Info_Gorn_WHYME_Info;
	important = 0;
	permanent = 0;
	description = "������ �� ������� ������ ����?";
};


func int Info_Gorn_WHYME_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_TAKEBACK))
	{
		return TRUE;
	};
};

func void Info_Gorn_WHYME_Info()
{
	AI_Output(hero,self,"Info_Gorn_WHYME_15_01");	//������ �� ������� ������ ����?
	AI_Output(self,hero,"Info_Gorn_WHYME_09_02");	//�� ��� �� ��� ���������, ��� ���� ������� ������������ � ��������� ���, � ����������� ���������!
	AI_Output(self,hero,"Info_Gorn_WHYME_09_03");	//������ �����, �� ������ ������ ������ � ��� ���������� �����, ��� ���-���� �� ���.
	AI_Output(self,hero,"Info_Gorn_WHYME_09_04");	//�� ����� ���� ������ ���������� � ���� ��������� ��������.
};


instance Info_Gorn_KICKBUTT(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_KICKBUTT_Condition;
	information = Info_Gorn_KICKBUTT_Info;
	important = 0;
	permanent = 0;
	description = "�����, ������ �������, �� ��� �������� ��������� ����!";
};


func int Info_Gorn_KICKBUTT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_WHYME) && !Npc_KnowsInfo(hero,Info_Gorn_MYWAY))
	{
		return TRUE;
	};
};

func void Info_Gorn_KICKBUTT_Info()
{
	AI_Output(hero,self,"Info_Gorn_KICKBUTT_15_01");	//�����, ������ ������� ����������� ������, �� ��� �������� ��������� ����!
	AI_Output(self,hero,"Info_Gorn_KICKBUTT_09_02");	//������ ������� � �� ���� � �� ������!
	AI_Output(self,hero,"Info_Gorn_KICKBUTT_09_03");	//���, ������ ���� ����. �� �� ����� ���������� � ����� � �����.
	B_Story_GornJoins();
};


instance Info_Gorn_MYWAY(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_MYWAY_Condition;
	information = Info_Gorn_MYWAY_Info;
	important = 0;
	permanent = 0;
	description = "������ �� � ���. ��� �� ��� ����� ����� ������� � �����!";
};


func int Info_Gorn_MYWAY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_WHYME) && !Npc_KnowsInfo(hero,Info_Gorn_KICKBUTT))
	{
		return TRUE;
	};
};

func void Info_Gorn_MYWAY_Info()
{
	AI_Output(hero,self,"Info_Gorn_MYWAY_15_01");	//������ �� � ���. ��� �� ��� ����� ����� ������� � �����!
	AI_Output(self,hero,"Info_Gorn_MYWAY_09_02");	//�������, ��� � ���� �� �� ���� ���� �������, �� ���-���� � ���, ��� �� ������!
	AI_Output(self,hero,"Info_Gorn_MYWAY_09_03");	//���, ������ ���� ����. �� �� ����� ���������� � ����� � �����.
	B_Story_GornJoins();
};


instance Info_Gorn_WOLF(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_WOLF_Condition;
	information = Info_Gorn_WOLF_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_WOLF_Condition()
{
	if(Gorn_JoinedForFM && (Npc_GetDistToWP(hero,"OW_PATH_076") < 500))
	{
		return TRUE;
	};
};

func void Info_Gorn_WOLF_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_WOLF_09_01");	//��, ���� �� �����!
	AI_Output(self,hero,"Info_Gorn_WOLF_09_02");	//�� ������ � ����� ����� ���������� ���� �� �����, ����.
	Info_ClearChoices(Info_Gorn_WOLF);
	Info_AddChoice(Info_Gorn_WOLF,"�� ����� ���������, � ��� ������ ���� ���� ��������.",Info_Gorn_WOLF_FM);
	Info_AddChoice(Info_Gorn_WOLF,"����� � ����� ����� � ����.",Info_Gorn_WOLF_WOLF);
	B_LogEntry(CH4_UluMulu,"���� ����� ���������� �� ���� �� ����, ��� � ����� � �����. ���� ��� �����.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM()
{
	AI_Output(hero,self,"Info_Gorn_WOLF_15_04");	//�� ����� ���������, � ��� ������ ���� ���� ��������.
	AI_Output(self,hero,"Info_Gorn_WOLF_09_05");	//��� �������!
	AI_StopProcessInfos(self);
};

func void Info_Gorn_WOLF_WOLF()
{
	AI_Output(hero,self,"Info_Gorn_WOLF_15_06");	//����� � ����� ����� � ����.
	AI_Output(self,hero,"Info_Gorn_WOLF_09_07");	//������. � ���� ����� ���� �����.
	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"GuardNC");
	AI_StopProcessInfos(self);
};


instance Info_Gorn_LEAVEFORPOST(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_LEAVEFORPOST_Condition;
	information = Info_Gorn_LEAVEFORPOST_Info;
	important = 1;
	permanent = 1;
};


func int Info_Gorn_LEAVEFORPOST_Condition()
{
	if(Gorn_JoinedForFM && (Npc_GetDistToWP(hero,"OW_PATH_074") < 2000) && (FreemineOrc_LookingUlumulu != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void Info_Gorn_LEAVEFORPOST_Info()
{
	AI_GotoNpc(self,hero);
	if(Npc_KnowsInfo(hero,Info_Gorn_WOLF))
	{
		AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_01");	//������, �� ���-���� ������ ���������� � ������!
	}
	else
	{
		AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_02");	//�� ����! �� ������ ���� � �����!
	};
	AI_Output(self,hero,"Info_Gorn_LEAVEFORPOST_09_03");	//� ���� ����� ���� � �����.
	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"GuardNC");
	AI_StopProcessInfos(self);
};


instance Info_Gorn_REJOINFORFM(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_REJOINFORFM_Condition;
	information = Info_Gorn_REJOINFORFM_Info;
	important = 0;
	permanent = 1;
	description = "������������ � �����!";
};


func int Info_Gorn_REJOINFORFM_Condition()
{
	if((Npc_KnowsInfo(hero,Info_Gorn_MYWAY) || Npc_KnowsInfo(hero,Info_Gorn_KICKBUTT)) && (Npc_GetDistToWP(hero,"OW_PATH_075_GUARD4") < 1000) && !Gorn_JoinedForFM)
	{
		return TRUE;
	};
};

func void Info_Gorn_REJOINFORFM_Info()
{
	AI_Output(hero,self,"Info_Gorn_REJOINFORFM_15_01");	//������������ � �����!
	AI_Output(self,hero,"Info_Gorn_REJOINFORFM_09_02");	//������� ����� ������ ������ ����������!
	AI_Output(self,hero,"Info_Gorn_REJOINFORFM_09_03");	//��� ������, � ����� ������!
	Gorn_JoinedForFM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FollowToFMC");
	AI_StopProcessInfos(self);
};


instance Info_Gorn_RAZOR(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_RAZOR_Condition;
	information = Info_Gorn_RAZOR_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_RAZOR_Condition()
{
	if(Gorn_JoinedForFM && (Npc_GetDistToWP(hero,"OW_PATH_3000") < 1000))
	{
		return TRUE;
	};
};

func void Info_Gorn_RAZOR_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_RAZOR_09_01");	//��������!!!
	AI_Output(self,hero,"Info_Gorn_RAZOR_09_02");	//��� �������� ������, ��� � ������, �� �� ����� ����� ����������!
	AI_Output(self,hero,"Info_Gorn_RAZOR_09_03");	//�� ������ ���������� �� ���. �� ���� ������, � �� ����� ��������� ����� �� ������.
	AI_StopProcessInfos(self);
};


instance Info_Gorn_FMCENTRANCE(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_FMCENTRANCE_Condition;
	information = Info_Gorn_FMCENTRANCE_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_FMCENTRANCE_Condition()
{
	if(Gorn_JoinedForFM && (Npc_GetDistToWP(hero,"FMC_ENTRANCE") < 1000) && (GORNHELPOK != TRUE))
	{
		return TRUE;
	};
};

func void Info_Gorn_FMCENTRANCE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_01");	//������-��, �� ������ ��� ����?
	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_02");	//��� �� ����� � �����, � � �������� ����� � �������� �� ���, ����� ����� �� ����� �����.
	AI_Output(self,hero,"Info_Gorn_FMCENTRANCE_09_03");	//� �������, ����� �� ����������.
	NA_GIL_SLD = TRUE;
	Npc_ExchangeRoutine(self,"WaitFMC");
	AI_StopProcessInfos(self);
};


instance Info_Gorn_FMGATE(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_FMGATE_Condition;
	information = Info_Gorn_FMGATE_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_FMGATE_Condition()
{
	if(Gorn_JoinedForFM && !FM_GateOpen && (Npc_GetDistToWP(hero,"FMC_FM_ENTRANCE") < 1000))
	{
		return TRUE;
	};
};

func void Info_Gorn_FMGATE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_FMGATE_09_01");	//� ������� ����� ��� � ����� ����� �� �����.
	AI_Output(hero,self,"Info_Gorn_FMGATE_15_02");	//������ ��������... �� ���� ���� ��� �������.
	AI_Output(self,hero,"Info_Gorn_FMGATE_09_03");	//������. �������� ������, � �������.
	Npc_ExchangeRoutine(self,"WaitFM");
	AI_StopProcessInfos(self);
};


instance Info_Gorn_AFTERFM(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_AFTERFM_Condition;
	information = Info_Gorn_AFTERFM_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_AFTERFM_Condition()
{
	if(FreemineOrc_LookingUlumulu)
	{
		return TRUE;
	};
};

func void Info_Gorn_AFTERFM_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_01");	//��, ������. ��� ��� ��������� ���.
	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_02");	//������� �� �� �������, ��� ���� ������ �������� ��� �������.
	AI_Output(hero,self,"Info_Gorn_AFTERFM_15_03");	//������� - ��� ��, ��� �� ���-���� ������ �� �� �����.
	AI_Output(self,hero,"Info_Gorn_AFTERFM_09_04");	//� �������� ����� � ��������, ����� ��� �� ���������.
	B_Story_LeftFM();
	Lee_freeminereport = 1;
	AI_StopProcessInfos(self);
};


instance Info_Gorn_FMWATCH(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_FMWATCH_Condition;
	information = Info_Gorn_FMWATCH_Info;
	important = 0;
	permanent = 1;
	description = "��� ����������?";
};


func int Info_Gorn_FMWATCH_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Gorn_AFTERFM))
	{
		return TRUE;
	};
};

func void Info_Gorn_FMWATCH_Info()
{
	AI_Output(hero,self,"Info_Gorn_FMWATCH_15_01");	//��� ����������?
	if(Npc_KnowsInfo(hero,sld_700_lee_gorn_help))
	{
		AI_Output(self,hero,"Info_Gorn_FMWATCH_09_05");	//�� ������� �����������. ������ ��� ��� ���������.
		if(GORNHELPOK != TRUE)
		{
			GORNHELPOK = TRUE;
			B_GiveXP(1000);
			Log_SetTopicStatus(CH4_GORNHELP,LOG_SUCCESS);
			B_LogEntry(CH4_GORNHELP,"���� ������� ������������. ������ �� ����� ���������� �� ����������� � ��� ���� ������.");
		};
	}
	else
	{
		AI_Output(self,hero,"Info_Gorn_FMWATCH_09_02");	//��� ����. ��������� ����� ������ �������.
		AI_Output(self,hero,"Info_Gorn_FMWATCH_09_03");	//�� ����� ��� �� ���������, ���� �� �� ������ ���� ������������.
		AI_Output(self,hero,"Info_Gorn_FMWATCH_09_04");	//�� � ���� � �������� ������������� ���������.
		if(GORNHELP != TRUE)
		{
			GORNHELP = TRUE;
			Log_CreateTopic(CH4_GORNHELP,LOG_MISSION);
			Log_SetTopicStatus(CH4_GORNHELP,LOG_RUNNING);
			B_LogEntry(CH4_GORNHELP,"���� �����, ����� �� ������� ��� ������������.");
		};
	};
};


instance INFO_GORN_PROHOD_WATCH(C_Info)
{
	npc = PC_Fighter;
	condition = info_gorn_prohod_watch_condition;
	information = info_gorn_prohod_watch_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_prohod_watch_condition()
{
	if(GORNHELPOK == TRUE)
	{
		return TRUE;
	};
};

func void info_gorn_prohod_watch_info()
{
	AI_Output(self,hero,"Info_Gorn_PROHOD_WATCH_09_02");	//������. �� ������ ����� ������ � �����, ����� �� ��������� ��������� ����� ����������.
	AI_Output(hero,self,"Info_Gorn_PROHOD_WATCH_15_01");	//���, ����� �?
	AI_Output(self,hero,"Info_Gorn_PROHOD_WATCH_09_03");	//� �� ���� � ��� ���� ����������?
	AI_Output(self,hero,"Info_Gorn_PROHOD_WATCH_09_04");	//��� ������.
	Log_CreateTopic(CH4_GORNPROHOD,LOG_MISSION);
	Log_SetTopicStatus(CH4_GORNPROHOD,LOG_RUNNING);
	B_LogEntry(CH4_GORNPROHOD,"���� ����� ����� ������ � �����, ����� ������������� ��������� ����� ����������.");
	Npc_ExchangeRoutine(self,"PROHOD");
};


instance INFO_GORN_PROHOD_FOUND(C_Info)
{
	npc = PC_Fighter;
	condition = info_gorn_prohod_found_condition;
	information = info_gorn_prohod_found_info;
	important = 1;
	permanent = 0;
};


func int info_gorn_prohod_found_condition()
{
	if((Hlp_StrCmp(Npc_GetNearestWP(self),"TO_FM_67") || Hlp_StrCmp(Npc_GetNearestWP(self),"TO_FM_68") || Hlp_StrCmp(Npc_GetNearestWP(self),"TO_FM_69") || Hlp_StrCmp(Npc_GetNearestWP(self),"PROHOD")) && Npc_KnowsInfo(hero,info_gorn_prohod_watch))
	{
		return TRUE;
	};
};

func void info_gorn_prohod_found_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_PROHOD_FOUND_09_02");	//������, ��� ��������� ������ ������.
	AI_Output(hero,self,"Info_Gorn_PROHOD_FOUND_15_01");	//��, ��� ����� ������ ����� ����� �����.
	AI_Output(self,hero,"Info_Gorn_PROHOD_FOUND_09_03");	//�� ������ �������� �� ���� ��.
	AI_Output(self,hero,"Info_Gorn_PROHOD_FOUND_09_04");	//� � ��� ������� ������ �����.
	AI_Output(hero,self,"Info_Gorn_PROHOD_FOUND_15_02");	//�����, � �����.
	B_GiveXP(500);
	B_LogEntry(CH4_GORNPROHOD,"�� � ������ ����� ������, �� �������� ������ ���������.");
	Npc_ExchangeRoutine(self,"ATPROHOD");
};


instance Info_Gorn_FOUNDULUMULU(C_Info)
{
	npc = PC_Fighter;
	condition = Info_Gorn_FOUNDULUMULU_Condition;
	information = Info_Gorn_FOUNDULUMULU_Info;
	important = 1;
	permanent = 0;
};


func int Info_Gorn_FOUNDULUMULU_Condition()
{
	if(FreemineOrc_LookingUlumulu == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void Info_Gorn_FOUNDULUMULU_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_01");	//�������� � ���� ���������. ������, ��� ������ ������.
	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_02");	//���� ��� ��� ��� �� �����?
	AI_Output(hero,self,"Info_Gorn_FOUNDULUMULU_15_03");	//��� ������� ���� ������. � ��� � ���� ����� � ����� �����.
	AI_Output(self,hero,"Info_Gorn_FOUNDULUMULU_09_04");	//�������, ��� ���� ������ ����... ����!
	B_Kapitelwechsel(5);
	AI_StopProcessInfos(self);
};

